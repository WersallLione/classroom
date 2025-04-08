module count1_4bit_ctrl(
input wire enable      ,
input wire i_overflow   ,
input wire i_underflow  ,

output reg o_overflow   ,
output reg o_underflow  ,
output reg  [3:0] o_data

input wire aclk       ,
input wire aresetn
);

initial begin
 o_data = 'd0;
 o_overflow = 'd0;
 o_underflow = 'd0;
end 

//wire w_dout_or;
//wire w_dout_and;
//assign w_dout_or = |dout;
//assign w_dout_and = &dout;

//wire wire_1;
//assign wire_1 = (dout == 4'b1111);

always@ (posedge aclk) begin
    if(enable) begin  // po idei eto enable
	    if(i_overflow) begin
			 o_data <= o_data + 1'd1;
		end 
		else 
		if(i_underflow) begin
			 o_data <= o_data - 1'd1;	
		end
	    else begin
		 o_data <= o_data;
	    end
	end    
    else begin 
         o_data <= o_data;
    end
end

always@ (posedge aclk) begin
    if(enable) begin  // po idei eto enable
	    if(i_overflow) begin
			if(o_data == 4'b1111) begin
			     o_overflow <= 1'b1;
			     o_underflow <= 1'b0;
			end else begin
                 o_overflow <= 1'b0;
			     o_underflow <= 1'b0;
			end	
		end 
		else 
		if(i_underflow) begin
			if(o_data == 4'b0000) begin
			     o_overflow <= 1'b0;
			     o_underflow <= 1'b1;
		    end else begin
			     o_overflow <= 1'b0;
			     o_underflow <= 1'b0;
		    end
        end 
	end 
	else begin
	     o_overflow <= 'd0;
		 o_underflow <= 'd0;
	end
    
end

endmodule