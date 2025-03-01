module invert_ctrl(
input wire FPGA_CLK    ,
input wire [3:0] data  ,
input wire en_key      ,
output wire [3:0] inv_data
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

assign inv_data = (f_inv) ? (data) : (~data);
 

endmodule