module count1_4bit_ctrl(
input wire f_key_add      ,
input wire f_key_direction,
input wire FPGA_CLK       , 

output reg f_overflow     ,
//output reg f_direct_over  ,
output reg  [3:0] dout
);

initial begin
 dout = 'd0;
 f_overflow = 'd0;
 //f_direct_over = 'd0;
end 

//wire w_dout_or;
//wire w_dout_and;
//assign w_dout_or = |dout;
//assign w_dout_and = &dout;

//wire wire_1;
//assign wire_1 = (dout == 4'b1111);

always@ (posedge FPGA_CLK) begin
    if(f_key_add) begin  // po idei eto enable
	    if(f_key_direction) begin
			if(dout == 4'b1111) begin
			   f_overflow <= 1'b1;
//			   f_direct_over <= 1'd1;
			   dout <= dout + 1'd1;
			end else begin
               f_overflow <= 1'b0;
//			   f_direct_over <= f_direct_over;
			   dout <= dout + 1'd1;
			end	
		end 
		else begin
			if(dout == 4'b0000) begin
			   f_overflow <= 1'b1;
//			   f_direct_over <= 1'd0;
			   dout <= dout - 1'd1;
		    end else begin
				f_overflow <= 1'b0;
	//			f_direct_over <= f_direct_over;
				dout <= dout - 1'd1;	
		    end
        end 
	end 
	else begin
	    f_overflow <= 'd0;
//		f_direct_over <= f_direct_over;
		dout <= dout;
	end
    
end

endmodule