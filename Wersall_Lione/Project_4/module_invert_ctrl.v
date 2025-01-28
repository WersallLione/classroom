module invert_data(
input wire FPGA_CLK    ,
input wire [3:0] data  ,
input wire en_key      ,
output reg [3:0] inv_data
);

reg f_inv;

initial begin
 f_inv = 'd0;
end

always@(posedge FPGA_CLK) begin 
    if(en_key) begin
        f_inv <= ~f_inv; 
	end else begin
	    f_inv <= f_inv;
	end
end

always@(posedge f_inv) begin 
    inv_data <= ~data; 
end

endmodule