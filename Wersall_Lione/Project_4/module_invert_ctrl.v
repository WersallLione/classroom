module invert_data(
input wire FPGA_CLK    ,
input wire [3:0] data  ,
input wire en_key      ,
output reg [3:0] inv_data
);
reg [27:0] cnt3sec;
reg f_inv;


initial begin
    cnt3sec = 'd0;
    f_inv = 'd0;
end

always@(posedge FPGA_CLK) begin //time 3sec and f_inv = 1;
	if(en_key) begin
        if(cnt3sec >= 'h8F0D180) begin
            cnt3sec <= cnt3sec;
			   f_inv <= 1'b1;
		  end else begin
            cnt3sec <= cnt3sec + 'd1;
			   f_inv <= f_inv;
		end
	end else begin
    cnt3sec <= 'd0;
	f_inv <= 1'b0;
	end
end

always@(posedge f_inv) begin 
    inv_data <= ~data; 
end

endmodule