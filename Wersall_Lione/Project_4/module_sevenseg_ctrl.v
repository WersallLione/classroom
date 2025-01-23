module sevenseg(

input wire [3:0] data,
input wire [3:0] en_seg,
input wire dt,

output reg [6:0] segment,
output wire [3:0] seg_enable_num,
output wire dot
);

assign seg_enable_num = en_seg;
assign dot = dt;


always @ (data) begin 
case (data)

'd0:       segment <= 7'h1;
'd1:       segment <= 7'h4F;
'd2:       segment <= 7'h12;
'd3:       segment <= 7'h6;
'd4:       segment <= 7'h4C;
'd5:       segment <= 7'h24;
'd6:       segment <= 7'h20;
'd7:       segment <= 7'hF;
'd8:       segment <= 7'h0;
'd9:       segment <= 7'h4;
'd10:      segment <= 7'h8;
'd11:      segment <= 7'h60;
'd12:      segment <= 7'h31;
'd13:      segment <= 7'h42;
'd14:      segment <= 7'h30;
'd15:      segment <= 7'h38; 
default: segment <= 7'h7E;

endcase
end
endmodule