module key_v2(
input wire KEY       ,
input wire FPGA_CLK  ,

output reg f_key_down,
output reg f_key_en1 ,
output reg f_key_up 
);
// syntch inpute wire with clk
reg [1:0] butt;
reg [23:0] key_cnt;
reg f_key_en;
reg [23:0] key_cntmax;

initial begin
butt = 'd0;
f_key_down = 'd0;
f_key_up = 'd0;
key_cnt = 'd0;
f_key_en ='d0;
f_key_en1 ='d0;
key_cntmax = 'hFFFFFF;
end

//sync input signal with clk
always@ (posedge FPGA_CLK ) begin
butt <= {butt[0], ~KEY}; // ne razlichaet registr bukvu
end
// if butt[1] = 1, key put in
// 
always@(posedge FPGA_CLK) begin
	if ( butt[1]) begin
		if(key_cnt >= key_cntmax) begin
		    key_cnt <= key_cnt;
		    f_key_en <=1'b1;
		end else begin
		    key_cnt <= key_cnt + 1'b1; 
            f_key_en <= f_key_en;
		end
	end else begin
        key_cnt<= 'd0;
		f_key_en <= 1'b0;
	end
end

always@ (posedge FPGA_CLK) begin
f_key_en1 <= f_key_en;
end

always@ (posedge FPGA_CLK) begin
    if(f_key_en > f_key_en1 ) begin
        f_key_down <= 1'b0;
        f_key_up <= 1'b1;
	end else begin
        f_key_down <= 1'b1;
        f_key_up <= 1'b0;
    end
end 


endmodule