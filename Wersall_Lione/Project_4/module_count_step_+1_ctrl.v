module count_step_+1(
input wire f_key_add   ,
input wire f_key_direct,
input wire FPGA_CLK    ,

output reg  [3:0] dout   // dout data out
);

initial begin
    dout = 'd0;
end 

always@(posedge FPGA_CLK) begin
    if(f_key_add==1'b1) begin
	    dout <= dout + 'd1;
	end else if (flag_light_2==1'b1) begin
	    dout <= dout - 'd1;
	end else begin
	    dout <= dout;      ;
	end
end

endmodule