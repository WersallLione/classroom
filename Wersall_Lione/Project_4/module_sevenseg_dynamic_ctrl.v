module select_seg (
   input wire [3:0] data0,
   input wire [3:0] data1,
   input wire FPGA_CLK,

   output reg [3:0] data_seg,
   output reg [3:0] en_seg,
   output reg dt
);

wire w_FPGA_CLK;
assign w_FPGA_CLK = FPGA_CLK;

wire w_mux2_dout;

reg enable_segment;
reg [23:0] cnt_freq_seg  ; 

initial begin
enable_segment = 'd0;
cnt_freq_seg = 'd0  ;
data_seg = 'd1      ;
en_seg = 'd1        ;
dt = 'd1            ;

end

always@(posedge FPGA_CLK) begin // how to use another module??? use module_count_3sec_ctrl
    if(cnt_freq_seg >= 'h98_9680) begin // 50M == 1sec. 50M/5=10M ----> (0.2sec),'h98_9680 == 10M. 
        cnt_freq_seg <= 'd0; 
        enable_segment <= ~enable_segment; // freq segment 10MHz
    end else begin
        cnt_freq_seg <= cnt_freq_seg + 1'd1;
        enable_segment <= enable_segment;
    end
end

always@(posedge FPGA_CLK) begin
    if(enable_segment) begin
        data_seg <= data0;
        en_seg <= 4'b1110;
        dt <= 'd1;
    end else begin
        data_seg <= data1  ;
        en_seg   <= 4'b1101;
        dt       <= 'd1    ;
    end
end 

mux2
ghsdhdgh
(
    .FPGA_CLK    (w_FPGA_CLK),
    .en_key      (dghdjkd),
    .din1        (fgsfgsg),
    .din2        (),

    .dout        (w_mux2_dout)
);

endmodule