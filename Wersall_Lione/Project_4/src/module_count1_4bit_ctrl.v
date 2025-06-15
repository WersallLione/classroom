module count1_4bit_ctrl
#(
    parameter P_CAPACITY_1b4_CNT = 4
)
(
input wire enable       ,
input wire direct       ,
input wire i_preoverflow   ,
input wire i_preunderflow  ,

output wire o_preoverflow   ,
output wire o_preunderflow  ,
output reg [(P_CAPACITY_1b4_CNT-1) : 00] o_data ,

input wire aclk         ,
input wire aresetn
);

initial begin
 o_data = 'd0;
//  o_preoverflow = 'd0;
//  o_preunderflow = 'd0;
end 

//--------o_data------------------ {P_CAPACITY_1b4_CNT{1'b1}}

always@(posedge aclk, negedge aresetn) begin
    if(!aresetn) begin 
        o_data <= {P_CAPACITY_1b4_CNT{1'b0}};
    end 
    else begin
        if(direct) begin 
            if(enable & i_preoverflow) begin
                o_data <= o_data + 1'b1;
            end
            else begin
                o_data <= o_data;
            end
        end
        else begin
            if(enable & i_preunderflow) begin
                o_data <= o_data - 1'b1;
            end
            else begin
                o_data <= o_data;
            end
        end
    end
end

//--------------overflow----------------
assign o_preoverflow = (o_data ==({P_CAPACITY_1b4_CNT{1'b1}})) ? (1'b1):(1'b0); //- 1'b1}
assign o_preunderflow = (o_data ==({P_CAPACITY_1b4_CNT{1'b0}})) ? (1'b1):(1'b0); //+ 1'b1}


//wire w_dout_or;
//wire w_dout_and;
//assign w_dout_or = |dout;
//assign w_dout_and = &dout;

//wire wire_1;
//assign wire_1 = (dout == 4'b1111);
//-----------------------------------------------
// надо подумать как все таки сделать параллельное подключение и preoverflow и preunderflow.

// always@ (posedge aclk) begin
//     if(enable) begin  
// 	    if(i_overflow) begin
// 			 o_data <= o_data + 1'd1;
// 		end 
// 		else 
// 		if(i_underflow) begin
// 			 o_data <= o_data - 1'd1;	
// 		end
// 	    else begin
// 		 o_data <= o_data;
// 	    end
// 	end    
//     else begin 
//          o_data <= o_data;
//     end
// end

// always@ (posedge aclk) begin
//     if(enable) begin  
// 	    if(i_overflow) begin
// 			if(o_data == 4'b1111) begin
// 			     o_overflow <=  1'b1;
// 			     o_underflow <= 1'b0;
// 			end else begin
//                  o_overflow <= 1'b0;
// 			     o_underflow <= 1'b0;
// 			end	
// 		end 
// 		else 
// 		if(i_underflow) begin
// 			if(o_data == 4'b0000) begin
// 			     o_overflow <= 1'b0;
// 			     o_underflow <= 1'b1;
// 		    end else begin
// 			     o_overflow <= 1'b0;
// 			     o_underflow <= 1'b0;
// 		    end
//         end 
// 	end 
// 	else begin
// 	     o_overflow <= 'd0;
// 		 o_underflow <= 'd0;
// 	end
    
// end

endmodule