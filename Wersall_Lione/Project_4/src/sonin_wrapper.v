module omdazz_wrapper
#(
    parameter P_ENABLE = 0
)
(
    input  wire button_on          ,
    input  wire button_reset       ,
    input  wire button_bigbadaboom ,
    input  wire button_huy_n       ,
    output wire LED_hren           ,
    output wire LED_pohren_n        ,

    output wire [7:0] LCD_DATA,
);

wire w_button_on         ;
wire w_button_reset      ;
wire w_button_bigbadaboom;
wire w_button_huy_n      ;
wire w_LED_hren          ;
wire w_LED_pohren_n      ;

wire [7:0] w_LCD_DATA;

assign w_button_on          = button_on         ;
assign w_button_reset       = button_reset      ;
assign w_button_bigbadaboom = button_bigbadaboom;
assign w_button_huy_n       = button_huy_n      ;
assign LED_hren             = w_LED_hren        ;
assign LED_pohren_n         = w_LED_pohren_n    ;

assign LCD_DATA = w_LCD_DATA;
    

generate
    if(P_SELECT_WRAPPER == 0)begin
        omdazz_wrapper_gkfjg // p.Enable po umolchaniu kak v module 
        omdazz_wrapper_inst0               
        (
            .button_on          (w_button_on         ),
            .button_reset       (w_button_reset      ),
            .button_bigbadaboom (w_button_bigbadaboom),
            .button_huy_n       (w_button_huy_n      ),
            .LED_hren           (w_LED_hren          ),
            .LED_pohren_n       (w_LED_pohren_n      ),
            .LCD_DATA           (w_LCD_DATA          )
        );
    end
    else if(P_SELECT_WRAPPER == 1)begin
        omdazz_wrapper_gkfjg
        #(                                    
            .P_ENABLE (LP_ENABLE_LOGIC)       // prisvoenie param k drugomu, delat k kajdomu  modulu
        )                                     
        omdazz_wrapper_inst0               
        (
            .button_on          (w_button_on         ),
            .button_reset       (w_button_reset      ),
            .button_bigbadaboom (w_button_bigbadaboom),
            .button_huy_n       (w_button_huy_n      ),
            .LED_hren           (w_LED_hren          ),
            .LED_pohren_n       (w_LED_pohren_n      ),
            .LCD_DATA           (w_LCD_DATA          )
        );
    end
    else begin
        omdazz_wrapper.P_ENABLE = LP_ENABLE_LOGIC;  // vustavliayt parametr dlya vseh moduley omdazz_wrapper dalee

        omdazz_wrapper
        omdazz_wrapper_inst1               
        (
            .button_on          (w_button_on         ),
            .button_reset       (w_button_reset      ),
            .button_bigbadaboom (w_button_bigbadaboom),
            .button_huy_n       (w_button_huy_n      ),
            .LED_hren           (w_LED_hren          ),
            .LED_pohren_n       (w_LED_pohren_n      ),
            .LCD_DATA           (w_LCD_DATA          )
        );

        omdazz_wrapper
        omdazz_wrapper_inst2               
        (
            .button_on          (w_button_on         ),
            .button_reset       (w_button_reset      ),
            .button_bigbadaboom (w_button_bigbadaboom),
            .button_huy_n       (w_button_huy_n      ),
            .LED_hren           (w_LED_hren          ),
            .LED_pohren_n       (w_LED_pohren_n      ),
            .LCD_DATA           (w_LCD_DATA          )
        );
    end
endgenerate



wire [7:0] w_DATA_0;
wire [0:7] w_DATA_1;
    
assign w_DATA_0 = 'h5;
assign w_DATA_1[0] = w_DATA_0[7];
assign w_DATA_1[1] = w_DATA_0[6];
assign w_DATA_1[2] = w_DATA_0[5];
assign w_DATA_1[3] = w_DATA_0[4];
assign w_DATA_1[4] = w_DATA_0[3];
assign w_DATA_1[5] = w_DATA_0[2];
assign w_DATA_1[6] = w_DATA_0[1];
assign w_DATA_1[7] = w_DATA_0[0];

localparam LP_LENGTH = 256;

wire [LP_LENGTH -1:0] w_DATA_2;
wire [0:LP_LENGTH -1] w_DATA_3;

genvar i;
generate
    if(LP_ENABLE_LOGIC == 1)begin
        for (i = 0; i < LP_LENGTH; i = i+1) begin
            assign w_DATA_2[i] = w_DATA_3[256-1-i];
        end
    end
endgenerate


endmodule
