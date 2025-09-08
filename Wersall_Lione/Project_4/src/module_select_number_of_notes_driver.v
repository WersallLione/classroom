module select_number_of_notes_driver
#(
   parameter P_ENABLE = 0
)

( 
input wire i_global_en     , // внешнее разрешение, например с кнопки для того что бы запустить маш состояний
input wire i_enable        , // разрешение от стробирующего модуля
output reg [3:0] o_data    , // данные для нот
output reg [26:0] o_limit  ,
output reg [6:0] cnt_state , // счетчик для отслеживания последовательности нот
output reg o_en            , // разрешение для следующего блока (например для строб)

input wire aclk
);

 localparam [6:0]
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
 STATE_30 =  'h1F,
 STATE_31 =  'h20,
 STATE_32 =  'h21,
 STATE_33 =  'h22,
 STATE_34 =  'h23,
 STATE_35 =  'h24,
 STATE_36 =  'h25,
 STATE_37 =  'h26,
 STATE_38 =  'h27,
 STATE_39 =  'h28,
 STATE_40 =  'h29,
 STATE_41 =  'h2A,
 STATE_42 =  'h2B,
 STATE_43 =  'h2C,
 STATE_44 =  'h2D,
 STATE_45 =  'h2E,
 STATE_46 =  'h2F,
 STATE_47 =  'h30,
 STATE_48 =  'h31,
 STATE_49 =  'h32,
 STATE_40 =  'h33,
 STATE_51 =  'h34,
 STATE_52 =  'h35,
 STATE_53 =  'h36,
 STATE_54 =  'h37,
 STATE_55 =  'h38,
 STATE_56 =  'h39,
 STATE_57 =  'h3A,
 STATE_58 =  'h3B,
 STATE_59 =  'h3C,
 STATE_60 =  'h3D,
 STATE_61 =  'h3E,
 STATE_62 =  'h3F,
 STATE_63 =  'h40;

 reg [6:0] state;
 initial begin
     o_data = 'd0;
     o_limit = 'd0;
     o_en = 'd0;
     state <= STATE_RST;
     cnt_state <= 'd0;
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
               state <= STATE_31 ;
          end
          else begin
               state <= STATE_30; 
          end      
       end
     STATE_31 :begin
          if (i_enable) begin
               state <= STATE_32 ;
          end
          else begin
               state <= STATE_31; 
          end      
       end 
     STATE_32 :begin
          if (i_enable) begin
               state <= STATE_33 ;
          end
          else begin
               state <= STATE_32; 
          end      
       end 
     STATE_33 :begin
          if (i_enable) begin
               state <= STATE_34 ;
          end
          else begin
               state <= STATE_33; 
          end      
       end 
     STATE_34 :begin
          if (i_enable) begin
               state <= STATE_35 ;
          end
          else begin
               state <= STATE_34; 
          end      
       end 
     STATE_35 :begin
          if (i_enable) begin
               state <= STATE_36 ;
          end
          else begin
               state <= STATE_35; 
          end      
       end 
     STATE_36 :begin
          if (i_enable) begin
               state <= STATE_37 ;
          end
          else begin
               state <= STATE_36; 
          end      
       end 
     STATE_37 :begin
          if (i_enable) begin
               state <= STATE_38 ;
          end
          else begin
               state <= STATE_37; 
          end      
       end 
     STATE_38 :begin
          if (i_enable) begin
               state <= STATE_39 ;
          end
          else begin
               state <= STATE_38; 
          end      
       end 
     STATE_39 :begin
          if (i_enable) begin
               state <= STATE_40 ;
          end
          else begin
               state <= STATE_39; 
          end      
       end 
     STATE_40 :begin
          if (i_enable) begin
               state <= STATE_41 ;
          end
          else begin
               state <= STATE_40; 
          end      
       end 
     STATE_41 :begin
          if (i_enable) begin
               state <= STATE_42 ;
          end
          else begin
               state <= STATE_41; 
          end      
       end 
     STATE_42 :begin
          if (i_enable) begin
               state <= STATE_43 ;
          end
          else begin
               state <= STATE_42; 
          end      
       end 
     STATE_43 :begin
          if (i_enable) begin
               state <= STATE_44 ;
          end
          else begin
               state <= STATE_43; 
          end      
       end 
     STATE_44 :begin
          if (i_enable) begin
               state <= STATE_45 ;
          end
          else begin
               state <= STATE_44; 
          end      
       end 
     STATE_45 :begin
          if (i_enable) begin
               state <= STATE_46 ;
          end
          else begin
               state <= STATE_45; 
          end      
       end 
     STATE_46 :begin
          if (i_enable) begin
               state <= STATE_47 ;
          end
          else begin
               state <= STATE_46; 
          end      
       end 
     STATE_47 :begin
          if (i_enable) begin
               state <= STATE_48 ;
          end
          else begin
               state <= STATE_47; 
          end      
       end 
     STATE_48 :begin
          if (i_enable) begin
               state <= STATE_49 ;
          end
          else begin
               state <= STATE_48; 
          end      
       end 
     STATE_49 :begin
          if (i_enable) begin
               state <= STATE_50;
          end
          else begin
               state <= STATE_49; 
          end      
       end 
     STATE_50 :begin
          if (i_enable) begin
               state <= STATE_51;
          end
          else begin
               state <= STATE_50; 
          end      
       end 
     STATE_51 :begin
          if (i_enable) begin
               state <= STATE_52;
          end
          else begin
               state <= STATE_51; 
          end      
       end 
     STATE_52 :begin
          if (i_enable) begin
               state <= STATE_53;
          end
          else begin
               state <= STATE_52; 
          end      
       end 
     STATE_53 :begin
          if (i_enable) begin
               state <= STATE_54;
          end
          else begin
               state <= STATE_53; 
          end      
       end 
     STATE_54 :begin
          if (i_enable) begin
               state <= STATE_55;
          end
          else begin
               state <= STATE_54; 
          end      
       end 
     STATE_55 :begin
          if (i_enable) begin
               state <= STATE_56;
          end
          else begin
               state <= STATE_55; 
          end      
       end 
     STATE_56 :begin
          if (i_enable) begin
               state <= STATE_57;
          end
          else begin
               state <= STATE_56; 
          end      
       end 
     STATE_57 :begin
          if (i_enable) begin
               state <= STATE_58;
          end
          else begin
               state <= STATE_57; 
          end      
       end 
     STATE_58 :begin
          if (i_enable) begin
               state <= STATE_59 ;
          end
          else begin
               state <= STATE_58; 
          end      
       end 
     STATE_59 :begin
          if (i_enable) begin
               state <= STATE_60 ;
          end
          else begin
               state <= STATE_59; 
          end      
       end 
     STATE_60 :begin
          if (i_enable) begin
               state <= STATE_61 ;
          end
          else begin
               state <= STATE_60; 
          end      
       end 
     STATE_61 :begin
          if (i_enable) begin
               state <= STATE_62 ;
          end
          else begin
               state <= STATE_61; 
          end      
       end 
     STATE_62 :begin
          if (i_enable) begin
               state <= STATE_63 ;
          end
          else begin
               state <= STATE_62; 
          end      
       end 
     STATE_63 :begin
          if (i_enable) begin
               state <= STATE_0 ;
          end
          else begin
               state <= STATE_63; 
          end      
       end         
     default :begin
         state <= STATE_0;
         end 
     endcase
 end
  
 always @(posedge aclk) begin :_inst       // 2-0010  3-0011  5-0101  6-0110  8-1000     h17D_7840 - 0.5 sec     h2FA_F080 - 1 sec     h5F5_E100 - 2 sec    hBEB_C200 - 4 sec
     case (state)
     STATE_RST :begin
         o_limit <= 'h17D_7840 ; // 25kk in Hex
         o_data   <=  'd0      ;
         o_en     <=  'd0      ;
     end
     STATE_0 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_1 :begin 
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_2 :begin
         o_limit<= 'h5F5_E100  ; // MI-MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end 
     STATE_3 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_4 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_5 :begin
         o_limit<= 'h5F5_E100  ; // MI-MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_6 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_7 :begin
         o_limit<= 'h2FA_F080  ; // SOL
         o_data   <= 'd1000    ;
         o_en     <= 'd1       ;
     end
     STATE_8 :begin
         o_limit<= 'h2FA_F080  ; // DO
         o_data   <= 'd0010    ;
         o_en     <= 'd1       ;
     end
     STATE_9 :begin
         o_limit<= 'h2FA_F080  ; // RE
         o_data   <= 'd0011    ;
         o_en     <= 'd1       ;
     end
     STATE_10 :begin
         o_limit<= 'hBEB_C200  ; // MI-MI-MI-MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_11 :begin
         o_limit<= 'h2FA_F080  ; // FA
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_12 :begin
         o_limit<= 'h2FA_F080  ; // FA
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_13 :begin
         o_limit<= 'h2FA_F080  ; // FA
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_14 :begin
         o_limit<= 'h2FA_F080  ; // FA
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_15 :begin
         o_limit<= 'h2FA_F080  ; // FA
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_16 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_17 :begin
         o_limit<= 'h5F5_E100  ; // MI-MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_18 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_19 :begin
         o_limit<= 'h2FA_F080  ; // RE
         o_data   <= 'd0011    ;
         o_en     <= 'd1       ;
     end
     STATE_20 :begin
         o_limit<= 'h2FA_F080  ; // RE
         o_data   <= 'd0011    ;
         o_en     <= 'd1       ;
     end
     STATE_21 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_22 :begin
         o_limit<= 'h5F5_E100  ; // RE-RE
         o_data   <= 'd0011    ;
         o_en     <= 'd1       ;
     end
     STATE_23 :begin
         o_limit<= 'h5F5_E100  ; // SOL-SOL
         o_data   <= 'd1000    ;
         o_en     <= 'd1       ;
     end
     STATE_24 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_25 :begin 
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_26 :begin
         o_limit<= 'h5F5_E100  ; // MI-MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end 
     STATE_27 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_28 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_29 :begin
         o_limit<= 'h5F5_E100  ; // MI-MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_30 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_31 :begin
         o_limit<= 'h2FA_F080  ; // SOL
         o_data   <= 'd1000    ;
         o_en     <= 'd1       ;
     end
     STATE_32 :begin
         o_limit<= 'h2FA_F080  ; // DO
         o_data   <= 'd0010    ;
         o_en     <= 'd1       ;
     end
     STATE_33 :begin
         o_limit<= 'h2FA_F080  ; // RE
         o_data   <= 'd0011    ;
         o_en     <= 'd1       ;
     end
     STATE_34 :begin
         o_limit<= 'hBEB_C200  ; // MI-MI-MI-MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_35 :begin
         o_limit<= 'h2FA_F080  ; // FA
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_36 :begin
         o_limit<= 'h2FA_F080  ; // FA
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_37 :begin
         o_limit<= 'h2FA_F080  ; // FA
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_38 :begin
         o_limit<= 'h2FA_F080  ; // FA
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_39 :begin
         o_limit<= 'h2FA_F080  ; // FA
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_40 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_41 :begin
         o_limit<= 'h5F5_E100  ; // MI-MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_42 :begin
         o_limit<= 'h2FA_F080  ; // SOL
         o_data   <= 'd1000    ;
         o_en     <= 'd1       ;
     end
     STATE_43 :begin
         o_limit<= 'h2FA_F080  ; // SOL
         o_data   <= 'd1000    ;
         o_en     <= 'd1       ;
     end
     STATE_44 :begin
         o_limit<= 'h2FA_F080  ; // FA
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_45 :begin
         o_limit<= 'h2FA_F080  ; // RE
         o_data   <= 'd0011    ;
         o_en     <= 'd1       ;
     end
     STATE_46 :begin
         o_limit<= 'hBEB_C200  ; // MI-MI-MI-MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_47 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_48 :begin 
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_49 :begin
         o_limit<= 'h5F5_E100  ; // MI-MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end 
     STATE_50 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_51 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_52 :begin
         o_limit<= 'h5F5_E100  ; // MI-MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_53 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_54 :begin
         o_limit<= 'h2FA_F080  ; // SOL
         o_data   <= 'd1000    ;
         o_en     <= 'd1       ;
     end
     STATE_55 :begin
         o_limit<= 'h2FA_F080  ; // DO
         o_data   <= 'd0010    ;
         o_en     <= 'd1       ;
     end
     STATE_56 :begin
         o_limit<= 'h2FA_F080  ; // RE
         o_data   <= 'd0011    ;
         o_en     <= 'd1       ;
     end
     STATE_57 :begin
         o_limit<= 'hBEB_C200  ; // MI-MI-MI-MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
      end 
     STATE_58 :begin
         o_limit<= 'h5F5_E100  ; // MI-MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_59 :begin
         o_limit<= 'h2FA_F080  ; // MI
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_60 :begin
         o_limit<= 'h2FA_F080  ; // SOL
         o_data   <= 'd1000    ;
         o_en     <= 'd1       ;
     end
     STATE_61 :begin
         o_limit<= 'h2FA_F080  ; // DO
         o_data   <= 'd0010    ;
         o_en     <= 'd1       ;
     end
     STATE_62 :begin
         o_limit<= 'h2FA_F080  ; // RE
         o_data   <= 'd0011    ;
         o_en     <= 'd1       ;
     end
     STATE_63 :begin
         o_limit<= 'hBEB_C200  ; // MI-MI-MI-MI
         o_data   <= 'd0101    ;
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