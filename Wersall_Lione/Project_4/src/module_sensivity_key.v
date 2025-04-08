module sensivity_key(
input wire i_data1        ,
input wire i_data2        ,

output reg o_enable       , // signal put the butt
output reg o_overflow     ,          // signal direction key
output reg o_underflow    ,

input wire aclk           ,
input wire aresetn
);

wire [1:0] sens;

initial begin 
o_overflow = 'd0;
o_underflow = 'd0;
end

assign sens[0] = i_data1;
assign sens[1] = i_data2;

always@ (posedge aclk) begin
//    case (sens)
//        : 
//        default: 
//    endcase
    if(sens[0]) begin 
        o_enable <= 'd1;
        o_overflow <= 'd1;
        o_underflow <= 'd0;
    end else 
    if(sens[1]) begin
        o_enable <= 'd1;
        o_overflow <= 'd0;
        o_underflow <= 'd1;
    end else
    begin
        o_enable <= 'd0;
        o_overflow <= 'd0;
        o_underflow <= 'd0;
    end 
end

endmodule