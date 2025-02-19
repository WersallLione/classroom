module module_sensivity_key(
input wire FPGA_CLK    ,
input wire din1        ,
input wire din2,       ,

output reg sens_key    , // signal put the butt
output reg dir           // signal direction key
);
wire [1:0] sens;

initial begin 
sens = 'd0;
dir = 'd0;
end

assign sens[0] = din1;
assign sens[1] = din2;

always@ (posedge FPGA_CLK) begin
    if(sens[0]) begin 
        sens_key <= 'd1;
        dir <= 'd1;
    end else 
    if(sens[1]) begin
        sens_key <= 'd1;
        dir <= 'd0;
    end else begin
        sens_key <= 'd0;
        dir <= 'd0;
    end 
end

endmodule