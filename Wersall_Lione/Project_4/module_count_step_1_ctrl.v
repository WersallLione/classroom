module CALCUL(
input wire flag_light_1,
input wire flag_light_2,
input wire FPGA_CLK    ,

output reg  [3:0] Num_of_bit
);

initial begin
    Num_of_bit = 'd0;
end 

always@(posedge FPGA_CLK) begin
     if(flag_light_1==1'b1) begin
	     Num_of_bit <= Num_of_bit + 'd1;
	 end 
	 else if (flag_light_2==1'b1) begin
	     Num_of_bit <= Num_of_bit - 'd1;
	 end else begin
	     Num_of_bit <= Num_of_bit      ;
	 end
end

endmodule