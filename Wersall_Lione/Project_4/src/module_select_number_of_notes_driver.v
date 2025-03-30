module select_number_of_notes_driver
#(

)
( 
input wire enable,
input wire in_time,
output wire volume,
output data,

input wire FPGA_CLK
);

 localparam [3:0]
 STATE_0 =   'h0,
 STATE_1 =   'h1,
 STATE_2 =   'h2;
 STATE_3 =   'h3;
 STATE_4 =   'h4;
 STATE_5 =   'h5;
 STATE_6 =   'h6;
 STATE_7 =   'h7;
 STATE_8 =   'h8;
 STATE_9 =   'h9;
 STATE_10 = 'h10;
 STATE_11 = 'h11;
 STATE_12 = 'h12;
 STATE_13 = 'h13;
 STATE_14 = 'h14;
 STATE_15 = 'h15;
 
 reg [3:0] FSM;
 initial begin
     FMS <= STATE_RST;
 end


 always @(posedge FPGA_CLK) begin :FSM_inst
     case (FSM)
     STATE_RST :begin
         FSM <= STATE_0;
     end
     STATE_0 :begin
         if(f_prev)begin
             FSM <= STATE_2;
         end
         else if(f_next)begin
             FSM <= STATE_1;
         end
         else begin
             FSM <= STATE_0;
         end
     end
     STATE_1 :begin
         if(f_prev)begin
             FSM <= STATE_0;
         end
         else if(f_next)begin
             FSM <= STATE_2;
         end
         else if(f_err)begin
             FSM <= STATE_1;
         end
         else 
         else begin
             FSM <= STATE_1;
         end
     end
     STATE_2 :begin
         if(f_prev)begin
             FSM <= STATE_1;
         end
         else if(f_next)begin
             FSM <= STATE_0;
         end
         else begin
             FSM <= STATE_2;
         end
     end 
     default :begin
         FSM <= STATE_0;
     end 
     endcase
 end

 always @(posedge FPGA_CLK) begin :FLAGS_inst
     case (FSM)
     STATE_RST :begin
         f_prev <= 1'b0;
         f_next <= 1'b0;
     end
     STATE_0 :begin
         if(key_0  == 1'b1)begin
             f_prev <= 1'b1;
             f_next <= 1'b0;
         end
         else if(key_1 == 1'b1)begin
             f_prev <= 1'b0;
             f_next <= 1'b1;
         end
         else begin
             f_prev <= 1'b0;
             f_next <= 1'b0;
         end
     end
     STATE_1 :begin
         if(key_0  == 1'b1)begin
             f_prev <= 1'b1;
             f_next <= 1'b0;
         end
         else if(key_1 == 1'b1)begin
             f_prev <= 1'b0;
             f_next <= 1'b1;
         end
         else begin
             f_prev <= 1'b0;
             f_next <= 1'b0;
         end
     end
     STATE_2 :begin
         if(key_0  == 1'b1)begin
             f_prev <= 1'b1;
             f_next <= 1'b0;
         end
         else if(key_1 == 1'b1)begin
             f_prev <= 1'b0;
             f_next <= 1'b1;
         end
         else begin
             f_prev <= 1'b0;
             f_next <= 1'b0;
         end
     end 
     default :begin
         f_prev <= 1'b0;
         f_next <= 1'b0;
     end 
     endcase
 end

 always @(posedge FPGA_CLK) begin :ctrl_inst
     case (FSM)
     STATE_RST :begin
         r_en <= 1'b0;
     end
     STATE_0 :begin
         r_en <= 1'b0;
     end
     STATE_1 :begin
         r_en <= 1'b0;
     end
     STATE_2 :begin
         r_en <= 1'b1;
     end 
     default :begin
         r_en <= 1'b0;
     end 
     endcase
 end
endmodule