module count1_4bit_ctrl(
input wire f_key_add      ,
input wire f_key_direction,
input wire FPGA_CLK       , 

output reg f_overflow     ,
output reg  [3:0] dout
);

initial begin
 dout = 'd0;
 f_overflow = 'd0;
end 

always@ (posedge FPGA_CLK) begin
    if(f_key_add) begin
	    if(f_key_direction) begin
			dout <= dout + 1'd1;
		end else begin
            dout <= dout - 1'd1;
		end
    end else begin 
	     dout <= dout          ;
	 end
end

always@ (posedge FPGA_CLK) begin
    if(f_key_add) begin
	    if(f_key_direction) begin
			if(dout == 4'b1111) begin
			   f_overflow <= 1'b1;
			end else begin
               f_overflow <= f_overflow;
			end	
		end else begin
           if(dout == 4'b0000) begin
			   f_overflow <= 1'b0;
			end else begin
               f_overflow <= f_overflow;
			end	
		end
    end else begin 
	    f_overflow <= f_overflow;
	end
end

endmodule