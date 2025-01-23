module select_seg (
   input wire [3:0] data0,
   input wire [3:0] data1,
   input wire FPGA_CLK,

   output reg [3:0] data_seg,
   output reg [3:0] en_seg,
   output reg dt
);

reg enable_segment;
//reg [] cnt_freq_seg  ; 

initial begin
enable_segment = 'd0;
data_seg = 'd1      ;
en_seg = 'd1        ;
dt = 'd1            ;

end

always@(posedge FPGA_CLK) begin

enable_segment <= ~enable_segment; // freq segment 25 MHZ
end

always@(posedge FPGA_CLK) begin
    if(enable_segment) begin
        data_seg <= data0;
        en_seg <= 4'b1110;
        dt <= 'd1;
    end else begin
        data_seg <= data1;
        en_seg <= 4'b1101;
        dt <= 'd1;
    end
end 

endmodule