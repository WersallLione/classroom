module select_number_of_notes_driver
#(
   parameter P_ENABLE = 0
)

( 
input wire i_global_en     , // внешнее разрешение, например с кнопки для того что бы запустить маш состояний
input wire i_enable        , // разрешение от стробирующего модуля
output integer o_volume    , // значение int объем счетчика которые будет считать стробирование
output reg [3:0] o_data   , // данные для нот
output reg [26:0] o_limit ,
output reg o_en           , // разрешение для следующего блока (например для строб)

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
 STATE_15 =  'h10;
 
 reg [4:0] state;
 initial begin
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
             state <= STATE_0 ;
        end
        else begin
             state <= STATE_15; 
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
         o_limit  <= 'h0;
         o_volume <= 'd0;
         o_data   <= 'd0;
         o_en     <= 'd0;
     end
     STATE_0 :begin
         o_limit  <= 'h7A_1200 ; // 8kk in Hex
         o_volume <= 'd25      ;
         o_data   <= 'd0101    ;
         o_en     <= 'd1       ;
     end
     STATE_1 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd24      ;
         o_data   <= 'd1111    ;
         o_en     <= 'd1       ;
     end
     STATE_2 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd22      ;
         o_data   <= 'd0010    ;
         o_en     <= 'd1       ;
     end 
     STATE_3 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd20      ;
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_4 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd20      ;
         o_data   <= 'd1110    ;
         o_en     <= 'd1       ;
     end
     STATE_5 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd20      ;
         o_data   <= 'd1101    ;
         o_en     <= 'd1       ;
     end
     STATE_6 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd21      ;
         o_data   <= 'd0001    ;
         o_en     <= 'd1       ;
     end
     STATE_7 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd22      ;
         o_data   <= 'd0000    ;
         o_en     <= 'd1       ;
     end
     STATE_8 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd23      ;
         o_data   <= 'd0111    ;
         o_en     <= 'd1       ;
     end
     STATE_9 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd22      ;
         o_data   <= 'd0110    ;
         o_en     <= 'd1       ;
     end
     STATE_10 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd21      ;
         o_data   <= 'd1110    ;
         o_en     <= 'd1       ;
     end
     STATE_11 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd22      ;
         o_data   <= 'd1001    ;
         o_en     <= 'd1       ;
     end
     STATE_12 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd20      ;
         o_data   <= 'd1011    ;
         o_en     <= 'd1       ;
     end
     STATE_13 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd23      ;
         o_data   <= 'd1100    ;
         o_en     <= 'd1       ;
     end
     STATE_14 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd22      ;
         o_data   <= 'd0100    ;
         o_en     <= 'd1       ;
     end
     STATE_15 :begin
         o_limit  <= 'h7A_1200 ;
         o_volume <= 'd21      ;
         o_data   <= 'd1111    ;
         o_en     <= 'd1       ;
     end 
     default :begin
         o_limit  <= 'h0       ;
         o_volume <= 'd0       ;
         o_data   <= 'd0       ;
         o_en     <= 'd0       ;
     end 
     endcase
 end
endmodule