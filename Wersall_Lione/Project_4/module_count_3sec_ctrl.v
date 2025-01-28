module count_3sec_ctrl(
    input wire FPGA_CLK,
    input wire en_key,

    output reg f_cnt_3sec
);

reg [27:0] cnt3sec;

initial begin
 cnt3sec = 'd0;
 f_cnt_3sec = 'd0;
end

always@(posedge FPGA_CLK) begin //time 3sec and f_inv = 1;
	if(en_key) begin
        if(cnt3sec >= 'h8F0_D180) begin
            cnt3sec <= cnt3sec;
			f_cnt_3sec <= 1'b1;
		end else begin
            cnt3sec <= cnt3sec + 'd1;
			f_cnt_3sec <= f_cnt_3sec;
		end
	end else begin
    cnt3sec <= 'd0;
	f_cnt_3sec <= 1'b0;
	end
end

endmodule