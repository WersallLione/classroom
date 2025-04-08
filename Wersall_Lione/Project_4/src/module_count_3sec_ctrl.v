module count_3sec_ctrl
#(
	//parameter P_LIMIT_CNT    = 'h8F0_D180,
	parameter P_CAPACITY_CNT = 28,
	parameter P_SHORT_OR_LONG = 1
)
// if P_SHORT_OR_LONG == 1, cnt++, if cnt = 'd1 cnt stop end if P_LIMIT_CNT to  f_cnt = 1 
// if P_SHORT_OR_LONG == 0, 

(
	input wire [P_CAPACITY_CNT -1:00] i_limit_cnt,
    input wire FPGA_CLK,
    input wire en_key,

    output reg f_cnt_cycl_end,
    output reg f_cnt_3sec
);

reg [P_CAPACITY_CNT -1:0] cnt3sec; 
reg f_cnt_3sec0;

initial begin
 cnt3sec = 'd0;
 f_cnt_3sec0 = 'd0;
 f_cnt_cycl_end = 'd0;
 f_cnt_3sec = 'd0;
end 

generate
	if(P_SHORT_OR_LONG == 1)begin		
		always@(posedge FPGA_CLK) begin  // пока нажата кнопка считает до переполнения и останавливается
			if(en_key) begin
				if (cnt3sec == 'd1) begin
					cnt3sec <= cnt3sec;
				end
				else begin
					cnt3sec <= cnt3sec + 'd1;
				end
			end 
			else begin
				cnt3sec <= 'd0;
			end
		end
		always@(posedge FPGA_CLK) begin //по достижении лимита выставляет флаг
			if(en_key) begin
				if (cnt3sec == limit_cnt) begin
					f_cnt_3sec <= 1'b1;
				end
				else begin
					f_cnt_3sec <= 1'd0;
				end
			end 
			else begin
				f_cnt_3sec <= 1'b0;	
			end
		end
	end
	else if(P_SHORT_OR_LONG == 0)begin		
		always@(posedge FPGA_CLK) begin  // пока нажата кнопка всегда считает +1
			if(en_key) begin
				cnt3sec <= cnt3sec + 'd1;
			end 
			else begin
				cnt3sec <= 'd0;
			end
		end		
		always@(posedge FPGA_CLK) begin // при достижение лимита инвертирует сигнал флага, а при переполнении инвертирует еще раз. 
			if(en_key) begin
				if (cnt3sec == limit_cnt) begin
					f_cnt_3sec <= ~f_cnt_3sec;
				end
				else 
				if (cnt3sec == 'd1) begin
					f_cnt_3sec <= ~f_cnt_3sec;
				end
				else begin
					f_cnt_3sec <= f_cnt_3sec;			
				end
			end 
			else begin
				f_cnt_3sec <= 1'b0;	
			end
		end
        always@ (posedge FPGA_CLK) begin
	         f_cnt_3sec0 <= f_cnt_3sec;
        end
        always@ (posedge FPGA_CLK) begin // поднимает флаг когда заканчивается стробирующий импульс
             if(f_cnt_3sec0 > f_cnt_3sec) begin
             f_cnt_cycl_end <= 1'b1;
	        end 
	         else begin
             f_cnt_cycl_end <= 1'b0;
	        end
        end 
 	end
 	else begin		
 		always@(posedge FPGA_CLK) begin  // при всех других работает как P_SHORT_OR_LONG = 1
			if(en_key) begin
				if (cnt3sec >= limit_cnt) begin
					cnt3sec <= cnt3sec;
				end
				else begin
					cnt3sec <= cnt3sec + 'd1;
				end
			end 
			else begin
				cnt3sec <= 'd0;
			end
		end
		always@(posedge FPGA_CLK) begin 
			if(en_key) begin
				if (cnt3sec >= limit_cnt) begin
					f_cnt_3sec <= 1'b1;
				end
				else begin
					f_cnt_3sec <= 1'd0;
				end
			end 
			else begin
				f_cnt_3sec <= 1'b0;	
			end
		end
 	end
 endgenerate


//always@(posedge FPGA_CLK) begin 
//	if(en_key) begin
//		if(P_SHORT_OR_LONG) begin
//			if (cnt3sec >= limit_cnt) begin
//			    f_cnt_3sec <= 1'b1;
//			end
//			else begin
//			    f_cnt_3sec <= 1'b0;
//			end
//		end
//		else begin // P_SHORT_OR_LONG == 0
//			if (cnt3sec >= limit_cnt) begin
//			    f_cnt_3sec <= ~f_cnt_3sec;
//			end
//			else begin
//			    f_cnt_3sec <= f_cnt_3sec;			
//			end
//		end
//	end 
//	else begin
//	    f_cnt_3sec <= 'b0;	
//	end
//end
//
//
endmodule