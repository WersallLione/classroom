module Top(
input wire [7:0] A,
input wire B,
output wire C
);

wire [8:0] D;

assign D = (A + B);
assign C = (D > 'd15) ? ('b1) : ('b0);


endmodule
