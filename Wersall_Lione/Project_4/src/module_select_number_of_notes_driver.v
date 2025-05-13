module select_number_of_notes_driver
#(
   parameter P_ENABLE = 0
)

( 
input wire i_global_en     , // внешнее разрешение, например с кнопки для того что бы запустить маш состояний
input wire i_enable        , // разрешение от стробирующего модуля
output reg [3:0] o_data    , // данные для нот
output reg [26:0] o_limit  ,
output reg o_en            , // разрешение для следующего блока (например для строб)

input wire aclk
);

 localparam [4:0]
 STATE_RST = 'h0,
 STATE_0 =   'h1,
 STATE_1 =   'h2,
 STATE_2 =   'h3,
 STATE_3 =   'h4,
 STATE_4 =   'h5,
 STATE_5 =   'h6,
 STATE_6 =   'h7,
 STATE_7 =   'h8,
 STATE_8 =   'h9,
 STATE_9 =   'hA,
 STATE_10 =  'hB,
 STATE_11 =  'hC,
 STATE_12 =  'hD,
 STATE_13 =  'hE,
 STATE_14 =  'hF,
 STATE_15 =  'h10,
 STATE_16 =  'h11,
 STATE_17 =  'h12,
 STATE_18 =  'h13,
 STATE_19 =  'h14,
 STATE_20 =  'h15,
 STATE_21 =  'h16,
 STATE_22 =  'h17,
 STATE_23 =  'h18,
 STATE_24 =  'h19,
 STATE_25 =  'h1A,
 STATE_26 =  'h1B,
 STATE_27 =  'h1C,
 STATE_28 =  'h1D,
 STATE_29 =  'h1E,
 STATE_30 =  'h1F;
 reg [4:0] state;
 initial begin
     o_data = 'd0;
     o_limit = 'd0;
     o_en = 'd0;
     state <= STATE_RST;
 end


 always @(posedge aclk) begin :state_inst
     case (state)
     STATE_RST :begin
        if(i_global_en) begin
             state <= STATE_0;
        end
        else begin
             state <= STATE_RST;
        end
     end
     STATE_0 :begin
        if (i_enable) begin
             state <= STATE_1;
        end
        else begin
             state <= STATE_0; 
        end      
     end
    STATE_1 :begin
        if (i_enable) begin
             state <= STATE_2;
        end
        else begin
             state <= STATE_1; 
        end      
     end
     STATE_2 :begin
        if (i_enable) begin
             state <= STATE_3;
        end
        else begin
             state <= STATE_2; 
        end      
     end
     STATE_3 :begin
        if (i_enable) begin
             state <= STATE_4;
        end
        else begin
             state <= STATE_3; 
        end      
     end
     STATE_4 :begin
        if (i_enable) begin
             state <= STATE_5;
        end
        else begin
             state <= STATE_4; 
        end      
     end
     STATE_5 :begin
        if (i_enable) begin
             state <= STATE_6;
        end
        else begin
             state <= STATE_5; 
        end      
     end
     STATE_6 :begin
        if (i_enable) begin
             state <= STATE_7;
        end
        else begin
             state <= STATE_6; 
        end      
     end
     STATE_7 :begin
        if (i_enable) begin
             state <= STATE_8;
        end
        else begin
             state <= STATE_7; 
        end      
     end
     STATE_8 :begin
        if (i_enable) begin
             state <= STATE_9;
        end
        else begin
             state <= STATE_8; 
        end      
     end
     STATE_9 :begin
        if (i_enable) begin
             state <= STATE_10;
        end
        else begin
             state <= STATE_9; 
        end      
     end
     STATE_10 :begin
        if (i_enable) begin
             state <= STATE_11;
        end
        else begin
             state <= STATE_10; 
        end      
     end
     STATE_11 :begin
        if (i_enable) begin
             state <= STATE_12;
        end
        else begin
             state <= STATE_11; 
        end      
     end
     STATE_12 :begin
        if (i_enable) begin
             state <= STATE_13;
        end
        else begin
             state <= STATE_12; 
        end      
     end
     STATE_13 :begin
        if (i_enable) begin
             state <= STATE_14;
        end
        else begin
             state <= STATE_13; 
        end      
     end
     STATE_14 :begin
        if (i_enable) begin
             state <= STATE_15;
        end
        else begin
             state <= STATE_14; 
        end      
     end
     STATE_15 :begin
        if (i_enable) begin
             state <= STATE_16 ;
        end
        else begin
             state <= STATE_15; 
        end      
     end 
     STATE_16 :begin
          if (i_enable) begin
               state <= STATE_17 ;
          end
          else begin
               state <= STATE_16; 
          end      
       end 
     STATE_17 :begin
          if (i_enable) begin
               state <= STATE_18 ;
          end
          else begin
               state <= STATE_17; 
          end      
       end 
     STATE_18 :begin
          if (i_enable) begin
               state <= STATE_19 ;
          end
          else begin
               state <= STATE_18; 
          end      
       end 
     STATE_19 :begin
          if (i_enable) begin
               state <= STATE_20 ;
          end
          else begin
               state <= STATE_19; 
          end      
       end 
     STATE_20 :begin
          if (i_enable) begin
               state <= STATE_21 ;
          end
          else begin
               state <= STATE_20; 
          end      
       end 
     STATE_21 :begin
          if (i_enable) begin
               state <= STATE_22 ;
          end
          else begin
               state <= STATE_21; 
          end      
       end 
     STATE_22 :begin
          if (i_enable) begin
               state <= STATE_23 ;
          end
          else begin
               state <= STATE_22; 
          end      
       end 
     STATE_23 :begin
          if (i_enable) begin
               state <= STATE_24;
          end
          else begin
               state <= STATE_23; 
          end      
       end 
     STATE_24 :begin
          if (i_enable) begin
               state <= STATE_25 ;
          end
          else begin
               state <= STATE_24; 
          end      
       end 
     STATE_25 :begin
          if (i_enable) begin
               state <= STATE_26 ;
          end
          else begin
               state <= STATE_25; 
          end      
       end 
     STATE_26 :begin
          if (i_enable) begin
               state <= STATE_27 ;
          end
          else begin
               state <= STATE_26; 
          end      
       end 
     STATE_27 :begin
          if (i_enable) begin
               state <= STATE_28 ;
          end
          else begin
               state <= STATE_27; 
          end      
       end 
     STATE_28 :begin
          if (i_enable) begin
               state <= STATE_29;
          end
          else begin
               state <= STATE_28; 
          end      
       end 
     STATE_29 :begin
          if (i_enable) begin
               state <= STATE_30 ;
          end
          else begin
               state <= STATE_29; 
          end      
       end 
     STATE_30 :begin
          if (i_enable) begin
               state <= STATE_0 ;
          end
          else begin
               state <= STATE_30; 
          end      
       end      
     default :begin
         state <= STATE_0;
         end 
     endcase
 end

 always @(posedge aclk) begin :_inst
     case (state)
     STATE_RST :begin
         o_limit<= 'h17D_7840; // 25kk in Hex
         o_data   <= 'd0     ;
         o_en     <= 'd0     ;
     end
     STATE_0 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0001    ;
         o_en     <= 'd1       ;
     end
     STATE_1 :begin 
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_2 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1000    ;
         o_en     <= 'd1       ;
     end 
     STATE_3 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0111    ;
         o_en     <= 'd1       ;
     end
     STATE_4 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_5 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1100    ;
         o_en     <= 'd1       ;
     end
     STATE_6 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1010    ;
         o_en     <= 'd1       ;
     end
     STATE_7 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0111    ;
         o_en     <= 'd1       ;
     end
     STATE_8 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_9 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1000    ;
         o_en     <= 'd1       ;
     end
     STATE_10 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0111    ;
         o_en     <= 'd1       ;
     end
     STATE_11 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0100    ;
         o_en     <= 'd1       ;
     end
     STATE_12 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_13 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0001    ;
         o_en     <= 'd1       ;
     end
     STATE_14 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1100    ;
         o_en     <= 'd1       ;
     end
     STATE_15 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_16 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1000    ;
         o_en     <= 'd1       ;
      end
      STATE_17 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0111    ;
         o_en     <= 'd1       ;
      end
      STATE_18 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
      end
      STATE_19 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1100    ;
         o_en     <= 'd1       ;
      end
      STATE_20 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1111    ;
         o_en     <= 'd1       ;
      end
      STATE_21 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1110    ;
         o_en     <= 'd1       ;
      end
      STATE_22 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1101    ;
         o_en     <= 'd1       ;
      end
      STATE_23 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1001    ;
         o_en     <= 'd1       ;
      end
      STATE_24 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1101    ;
         o_en     <= 'd1       ;
      end
      STATE_25 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1100    ;
         o_en     <= 'd1       ;
      end
      STATE_26 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1011    ;
         o_en     <= 'd1       ;
      end
      STATE_27 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0000    ;
         o_en     <= 'd1       ;
      end
      STATE_28 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1000    ;
         o_en     <= 'd1       ;
      end
      STATE_29 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0100    ;
         o_en     <= 'd1       ;
      end
      STATE_30 :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd1000    ;
         o_en     <= 'd1       ;
      end                
     default :begin
         o_limit<= 'h17D_7840  ; 
         o_data   <= 'd0       ;
         o_en     <= 'd0       ;
     end 
     endcase
 end
endmodule