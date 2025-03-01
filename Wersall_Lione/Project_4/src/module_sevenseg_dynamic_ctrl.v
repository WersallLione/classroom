module sevenseg_dynamic_ctrl (
   input wire [3:0] data0,
   input wire [3:0] data1,
   input wire FPGA_CLK,

   output reg [3:0] data_seg,
   output reg [3:0] en_seg,
   output reg dt
);

// wire w_FPGA_CLK;
// assign w_FPGA_CLK = FPGA_CLK;

// wire w_mux2_dout;

reg enable_segment;
reg [23:0] cnt_freq_seg  ; 

initial begin
enable_segment = 'd0;
cnt_freq_seg = 'd0  ;
data_seg = 'd1      ;
en_seg = 'd1        ;
dt = 'd1            ;

end

always@(posedge FPGA_CLK) begin 
    if(cnt_freq_seg >= 'h98_9680) begin // 50M == 1sec. 50M/5=10M ----> (0.2sec),'h98_9680 == 10M. 4C 4B40 == 5M (0.1 sec)
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

// localparam [2:0]
// STATE_0 = 'h0,
// STATE_1 = 'h1,
// STATE_2 = 'h2;

// reg [2:0] FSM;
// initial begin
//     FMS <= STATE_RST;
// end

/// FSM <= en_seg;

// always @(posedge aclk) begin :FSM_inst
//     case (FSM)
//     STATE_RST :begin
//         FSM <= STATE_0;
//     end
//     STATE_0 :begin
//         if(f_prev)begin
//             FSM <= STATE_2;
//         end
//         else if(f_next)begin
//             FSM <= STATE_1;
//         end
//         else begin
//             FSM <= STATE_0;
//         end
//     end
//     STATE_1 :begin
//         if(f_prev)begin
//             FSM <= STATE_0;
//         end
//         else if(f_next)begin
//             FSM <= STATE_2;
//         end
//         else if(f_err)begin
//             FSM <= STATE_1;
//         end
//         else 
//         else begin
//             FSM <= STATE_1;
//         end
//     end
//     'h2 :begin
//         if(f_prev)begin
//             FSM <= STATE_1;
//         end
//         else if(f_next)begin
//             FSM <= STATE_0;
//         end
//         else begin
//             FSM <= STATE_2;
//         end
//     end 
//     default :begin
//         FSM <= STATE_0;
//     end 
//     endcase
// end


// always @(posedge aclk) begin :FLAGS_inst
//     case (FSM)
//     STATE_RST :begin
//         f_prev <= 1'b0;
//         f_next <= 1'b0;
//     end
//     STATE_0 :begin
//         if(key_0  == 1'b1)begin
//             f_prev <= 1'b1;
//             f_next <= 1'b0;
//         end
//         else if(key_1 == 1'b1)begin
//             f_prev <= 1'b0;
//             f_next <= 1'b1;
//         end
//         else begin
//             f_prev <= 1'b0;
//             f_next <= 1'b0;
//         end
//     end
//     STATE_1 :begin
//         if(key_0  == 1'b1)begin
//             f_prev <= 1'b1;
//             f_next <= 1'b0;
//         end
//         else if(key_1 == 1'b1)begin
//             f_prev <= 1'b0;
//             f_next <= 1'b1;
//         end
//         else begin
//             f_prev <= 1'b0;
//             f_next <= 1'b0;
//         end
//     end
//     STATE_2 :begin
//         if(key_0  == 1'b1)begin
//             f_prev <= 1'b1;
//             f_next <= 1'b0;
//         end
//         else if(key_1 == 1'b1)begin
//             f_prev <= 1'b0;
//             f_next <= 1'b1;
//         end
//         else begin
//             f_prev <= 1'b0;
//             f_next <= 1'b0;
//         end
//     end 
//     default :begin
//         f_prev <= 1'b0;
//         f_next <= 1'b0;
//     end 
//     endcase
// end

// always @(posedge aclk) begin :ctrl_inst
//     case (FSM)
//     STATE_RST :begin
//         r_en <= 1'b0;
//     end
//     STATE_0 :begin
//         r_en <= 1'b0;
//     end
//     STATE_1 :begin
//         r_en <= 1'b0;
//     end
//     STATE_2 :begin
//         r_en <= 1'b1;
//     end 
//     default :begin
//         r_en <= 1'b0;
//     end 
//     endcase
// end

endmodule