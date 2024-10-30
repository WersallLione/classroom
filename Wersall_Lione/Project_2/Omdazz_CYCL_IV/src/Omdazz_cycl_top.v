module omdazz_cycl_top(
input wire KEY1,
input wire FPGA_CLK, //50MHz step 20ns
output wire LED1
);

//assign LED1 = KEY1;

wire flag;

KEYY 
KEYY_inst 
(
	.KEY1       (KEY1     ),
	.FPGA_CLK   (FPGA_CLK ),
	.flag_light (flag)
);

LEDXY 
LEDXY_inst
(
	.pwr  (flag),
	.LED1 (LED1)
);

endmodule


module KEYY(
input wire KEY1,
input wire FPGA_CLK,
output reg flag_light
);

reg [27:0] cnt;
wire f_flag_light;

initial begin

cnt = 'd0;

end

assign f_flag_light = (cnt >= 28'h00005F5E100) ? (1'b1) : (1'b0);

always @(posedge FPGA_CLK) begin 
	flag_light <= f_flag_light;
end

//always @(posedge FPGA_CLK) begin 
//	if(cnt >= 28'h00005F5E100)begin
//		flag_light <= 1'b1;
//	end
//	else begin
//		flag_light <= 1'b0;
//	end
//end

always @(posedge FPGA_CLK) begin : COUNTER_inst
	if (KEY1 == 1'b0)  begin
	    if(cnt < {28{1'b1}} )begin
				cnt <= cnt +'d1;
	    end else begin
				cnt <= cnt;
		 end
	end else begin
		cnt <= 'd0;
	end
end 

endmodule

module LEDXY(
input wire pwr,
output wire LED1
);

reg r_led;
initial begin
 r_led = 1'b1;
end

assign LED1 = r_led;

always@(posedge pwr)begin
	r_led <= ~r_led;
end

endmodule

