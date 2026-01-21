module omdazz_cyclon_iv_devoard_top
(
    (*chip_pin = "88" *) input  wire KEY1      , //
    (*chip_pin = "89" *) input  wire KEY2      , //
    (*chip_pin = "90" *) input  wire KEY3      , //
    (*chip_pin = "91" *) input  wire KEY4      , //
    (*chip_pin = "25" *) input  wire RESET_BTN , //
    (*chip_pin = "23" *) input  wire FPGA_CLK  , // 50 MHz (20ns)
    (*chip_pin = "115"*) input  wire UART_RXD  , //
    (*chip_pin = "114"*) output wire UART_TXD  , //
    (*chip_pin = "112"*) inout  wire SCL       , //
    (*chip_pin = "113"*) inout  wire SDA       , //
    (*chip_pin = "84" *) output wire LED1      , //
    (*chip_pin = "85" *) output wire LED2      , //
    (*chip_pin = "86" *) output wire LED3      , //
    (*chip_pin = "87" *) output wire LED4      , //
    (*chip_pin = "99" *) inout  wire I2C_SCL   , //
    (*chip_pin = "98" *) inout  wire I2C_SDA   , // 
    (*chip_pin = "110"*) output wire BEEP      , //
    (*chip_pin = "119"*) inout  wire PS_CLOCK  , //
    (*chip_pin = "120"*) inout  wire PS_DATA   , //
    (*chip_pin = "100"*) input  wire IR        , // 
    (*chip_pin = "101"*) output wire VGA_HSYNC , //
    (*chip_pin = "103"*) output wire VGA_VSYNC , //
    (*chip_pin = "104"*) output wire VGA_B     , //
    (*chip_pin = "105"*) output wire VGA_G     , //
    (*chip_pin = "106"*) output wire VGA_R     , //
    (*chip_pin = "133"*) output wire DIG_1     , //
    (*chip_pin = "135"*) output wire DIG_2     , //
    (*chip_pin = "136"*) output wire DIG_3     , //
    (*chip_pin = "137"*) output wire DIG_4     , //
    (*chip_pin = "128"*) output wire SEG_0     , //
    (*chip_pin = "121"*) output wire SEG_1     , //
    (*chip_pin = "125"*) output wire SEG_2     , //
    (*chip_pin = "129"*) output wire SEG_3     , //
    (*chip_pin = "132"*) output wire SEG_4     , //
    (*chip_pin = "126"*) output wire SEG_5     , //
    (*chip_pin = "124"*) output wire SEG_6     , //
    (*chip_pin = "127"*) output wire SEG_7     , //
    (*chip_pin = "141"*) output wire LCD_RS    , //LCD1
    (*chip_pin = "138"*) output wire LCD_RW    , //LCD2
    (*chip_pin = "143"*) output wire LCD_E     , //LCD3
    (*chip_pin = "142"*) output wire LCD_D0    , //LCD4
    (*chip_pin = "1"  *) output wire LCD_D1    , //LCD5
    (*chip_pin = "144"*) output wire LCD_D2    , //LCD6
    (*chip_pin = "3"  *) output wire LCD_D3    , //LCD7
    (*chip_pin = "2"  *) output wire LCD_D4    , //LCD8
    (*chip_pin = "10" *) output wire LCD_D5    , //LCD9
    (*chip_pin = "7"  *) output wire LCD_D6    , //LCD10
    (*chip_pin = "11" *) output wire LCD_D7    , //LCD11
    (*chip_pin = "28" *) inout  wire S_DQ0     , //
    (*chip_pin = "30" *) inout  wire S_DQ1     , //
    (*chip_pin = "31" *) inout  wire S_DQ2     , //
    (*chip_pin = "32" *) inout  wire S_DQ3     , //
    (*chip_pin = "33" *) inout  wire S_DQ4     , //
    (*chip_pin = "34" *) inout  wire S_DQ5     , //
    (*chip_pin = "38" *) inout  wire S_DQ6     , //
    (*chip_pin = "39" *) inout  wire S_DQ7     , //
    (*chip_pin = "54" *) inout  wire S_DQ8     , //
    (*chip_pin = "53" *) inout  wire S_DQ9     , //
    (*chip_pin = "52" *) inout  wire S_DQ10    , //
    (*chip_pin = "51" *) inout  wire S_DQ11    , //
    (*chip_pin = "50" *) inout  wire S_DQ12    , //
    (*chip_pin = "49" *) inout  wire S_DQ13    , //
    (*chip_pin = "46" *) inout  wire S_DQ14    , //
    (*chip_pin = "44" *) inout  wire S_DQ15    , //
    (*chip_pin = "76" *) inout  wire S_A0      , //
    (*chip_pin = "77" *) inout  wire S_A1      , //
    (*chip_pin = "80" *) inout  wire S_A2      , //
    (*chip_pin = "83" *) inout  wire S_A3      , //
    (*chip_pin = "68" *) inout  wire S_A4      , //
    (*chip_pin = "67" *) inout  wire S_A5      , //
    (*chip_pin = "66" *) inout  wire S_A6      , //
    (*chip_pin = "65" *) inout  wire S_A7      , //
    (*chip_pin = "64" *) inout  wire S_A8      , //
    (*chip_pin = "60" *) inout  wire S_A9      , //
    (*chip_pin = "75" *) inout  wire S_A10     , //
    (*chip_pin = "59" *) inout  wire S_A11     , //
    (*chip_pin = "73" *) inout  wire SD_BS0    , //
    (*chip_pin = "74" *) inout  wire SD_BS1    , //
    (*chip_pin = "42" *) inout  wire SD_LDQM   , //
    (*chip_pin = "55" *) inout  wire SD_UDQM   , //
    (*chip_pin = "58" *) inout  wire SD_CKE    , //
    (*chip_pin = "43" *) inout  wire SD_CLK    , //
    (*chip_pin = "72" *) inout  wire SD_CS     , //
    (*chip_pin = "71" *) inout  wire SD_RAS    , //
    (*chip_pin = "70" *) inout  wire SD_CAS    , //
    (*chip_pin = "69" *) inout  wire SD_WE     , //

    (*chip_pin = "24" *) input  wire PIN_24    , //
    (*chip_pin = "111"*) output wire PIN_111     //
);

wire en     ;
wire reset  ;
wire aresetn;
wire aclk   ;

assign en      = 1'b1     ;
assign reset   = 1'b0     ;
assign aresetn = RESET_BTN;
assign aclk    = FPGA_CLK ;

wire [7:0] w_note;
wire w_busser;

assign w_note = (KEY1 == 1'b0) ? 
                (8'd60) : 
                (
                    (KEY2 == 1'b0) ? 
                    (8'd62) :
                    (
                        (KEY3 == 1'b0) ? 
                        (8'd64) :
                        (
                            (KEY4 == 1'b0) ? 
                            (8'd65) :
                            (8'd00)
                        )
                    )
                );


assign BEEP = RESET_BTN;

assign LED1 = KEY1;
assign LED2 = KEY2;
assign LED3 = KEY3;
assign LED4 = KEY4;

assign PIN_111 = w_busser;

assign UART_TXD = UART_RXD;

assign VGA_HSYNC = 1'b0;
assign VGA_VSYNC = 1'b0;
assign VGA_B     = 1'b0;
assign VGA_G     = 1'b0;
assign VGA_R     = 1'b0;

assign DIG_1 = 1'b1;
assign DIG_2 = 1'b1;
assign DIG_3 = 1'b1;
assign DIG_4 = 1'b1;
assign SEG_0 = 1'b1;
assign SEG_1 = 1'b1;
assign SEG_2 = 1'b1;
assign SEG_3 = 1'b1;
assign SEG_4 = 1'b1;
assign SEG_5 = 1'b1;
assign SEG_6 = 1'b1;
assign SEG_7 = 1'b1;

assign LCD_RS = 1'b0;
assign LCD_RW = 1'b0;
assign LCD_E  = 1'b0;
assign LCD_D0 = 1'b0;
assign LCD_D1 = 1'b0;
assign LCD_D2 = 1'b0;
assign LCD_D3 = 1'b0;
assign LCD_D4 = 1'b0;
assign LCD_D5 = 1'b0;
assign LCD_D6 = 1'b0;
assign LCD_D7 = 1'b0;

assign S_DQ0   = 1'bZ;
assign S_DQ1   = 1'bZ;
assign S_DQ2   = 1'bZ;
assign S_DQ3   = 1'bZ;
assign S_DQ4   = 1'bZ;
assign S_DQ5   = 1'bZ;
assign S_DQ6   = 1'bZ;
assign S_DQ7   = 1'bZ;
assign S_DQ8   = 1'bZ;
assign S_DQ9   = 1'bZ;
assign S_DQ10  = 1'bZ;
assign S_DQ11  = 1'bZ;
assign S_DQ12  = 1'bZ;
assign S_DQ13  = 1'bZ;
assign S_DQ14  = 1'bZ;
assign S_DQ15  = 1'bZ;
assign S_A0    = 1'bZ;
assign S_A1    = 1'bZ;
assign S_A2    = 1'bZ;
assign S_A3    = 1'bZ;
assign S_A4    = 1'bZ;
assign S_A5    = 1'bZ;
assign S_A6    = 1'bZ;
assign S_A7    = 1'bZ;
assign S_A8    = 1'bZ;
assign S_A9    = 1'bZ;
assign S_A10   = 1'bZ;
assign S_A11   = 1'bZ;
assign SD_BS0  = 1'bZ;
assign SD_BS1  = 1'bZ;
assign SD_LDQM = 1'bZ;
assign SD_UDQM = 1'bZ;
assign SD_CKE  = 1'bZ;
assign SD_CLK  = 1'bZ;
assign SD_CS   = 1'bZ;
assign SD_RAS  = 1'bZ;
assign SD_CAS  = 1'bZ;
assign SD_WE   = 1'bZ;

Flash_loader
Flash_loader_inst 
(
	.noe_in(1'b1)  // noe_in.noe
);

midi
#(
    .P_HOL (1'b0)
)
midi_inst
(
    .note_select (w_note  ),
    .o_busser    (w_busser),
    .en          (en      ),
    .reset       (reset   ),
    .aresetn     (aresetn ),
    .aclk        (aclk    ) 
);

endmodule
