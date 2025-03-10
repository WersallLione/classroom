module count_3sec_ctrl
#(
	parameter P_LIMIT_CNT    = 'h8F0_D180,
	parameter P_CAPACITY_CNT = 28,
	parameter P_SHORT_OR_LONG = 1
)
// if P_SHORT_OR_LONG == 1, count limit P_LIMIT_CNT, save value cnt3sec and f_cnt == 1
// if P_SHORT_OR_LONG == 0, count limit P_CAPACITY_CNT, always cnt++ if cnt >= P_LIMIT_CNT f_cnt == ~f_cnt

(
    input wire FPGA_CLK,
    input wire en_key,

    output reg f_cnt_3sec
);

reg [P_CAPACITY_CNT -1:0] cnt3sec; 

initial begin
 cnt3sec = 'd0;
 f_cnt_3sec = 'd0;
end 

generate
	if(P_SHORT_OR_LONG == 1)begin		
		always@(posedge FPGA_CLK) begin  // how work cnt
			if(en_key) begin
				if (cnt3sec >= P_LIMIT_CNT) begin
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
		always@(posedge FPGA_CLK) begin //time 3sec and f_inv = 1;
			if(en_key) begin
				if (cnt3sec >= P_LIMIT_CNT) begin
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
		always@(posedge FPGA_CLK) begin  // how work cnt
			if(en_key) begin
				if (cnt3sec >= P_LIMIT_CNT) begin
					cnt3sec <= 'd0; //----------------
				end
				else begin
					cnt3sec <= cnt3sec + 'd1;//-----------------
				end
			end 
			else begin
				cnt3sec <= 'd0;
			end
		end		
		always@(posedge FPGA_CLK) begin //time 3sec and f_inv = 1;
			if(en_key) begin
				if (cnt3sec >= P_LIMIT_CNT) begin
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
 	end
 	else begin		
 		always@(posedge FPGA_CLK) begin  // how work cnt
			if(en_key) begin
				if (cnt3sec >= P_LIMIT_CNT) begin
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
		always@(posedge FPGA_CLK) begin //time 3sec and f_inv = 1;
			if(en_key) begin
				if (cnt3sec >= P_LIMIT_CNT) begin
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
//			if (cnt3sec >= P_LIMIT_CNT) begin
//			    f_cnt_3sec <= 1'b1;
//			end
//			else begin
//			    f_cnt_3sec <= 1'b0;
//			end
//		end
//		else begin // P_SHORT_OR_LONG == 0
//			if (cnt3sec >= P_LIMIT_CNT) begin
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