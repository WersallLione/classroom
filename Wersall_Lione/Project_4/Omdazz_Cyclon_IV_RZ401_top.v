module Omdazz_Cyclon_IV_RZ401_top
// #(
//     parameter LP_ENABLE_LOGIC  = 1,
//     parameter P_SELECT_WRAPPER = 0
// )
(
(*"chip_pin" = PIN_89*) input wire KEY1 /*synthesis chip_pin = "PIN_89"*/,
input wire KEY2     ,
input wire KEY3     ,
input wire KEY4     ,
input wire RESET_BUT,
input wire FPGA_CLK ,  // 50 MHz (20ns)
input wire UART_RXD ,    //RS-232 signal read 115pin 
output wire UART_TXD,  //RS-232 signal data 114pin
inout wire SCL      ,  //  I2C signal clk to thermometr
inout wire SDA      ,  // thermometr I2C signal data write or read. 
output wire LED1    ,
output wire LED2    ,
output wire LED3    ,
output wire LED4    ,

inout wire I2C_SCL  ,  //  I2C signal clk to EEPROM
inout wire I2C_SDA  ,  //  I2C signal data write or read. 
output wire beep    ,

output wire PS_CLOCK,  // interfac PS2
output wire PS_DATA ,  

output wire IR      ,   //IK Port 
      
output wire VGA_HSYNC,
output wire VGA_VSYNC,
output wire VGA_B    , // 0
output wire VGA_G    , // 0
output wire VGA_R    , // 0


//input wire  DATA_EPCS4,
//output wire ASDO_EPCS4,
//output wire nCSO_EPCS4,
//output wire DCLK_EPCS4,

output wire DIG_1,
output wire DIG_2,
output wire DIG_3,
output wire DIG_4,
output wire SEG_0,
output wire SEG_1,
output wire SEG_2,
output wire SEG_3,
output wire SEG_4,
output wire SEG_5,
output wire SEG_6,
output wire SEG_7,

output wire LCD1_RS ,
output wire LCD2_RW , 
output wire LCD3_E ,
output wire LCD4_D0 ,
output wire LCD5_D1 ,
output wire LCD6_D2 ,
output wire LCD7_D3 ,
output wire LCD8_D4 ,
output wire LCD9_D5 ,
output wire LCD10_D6,
output wire LCD11_D7,

inout wire S_DQ0,
inout wire S_DQ1,
inout wire S_DQ2,
inout wire S_DQ3,
inout wire S_DQ4,
inout wire S_DQ5,
inout wire S_DQ6,
inout wire S_DQ7,
inout wire S_DQ8,
inout wire S_DQ9,
inout wire S_DQ10,
inout wire S_DQ11,
inout wire S_DQ12,
inout wire S_DQ13,
inout wire S_DQ14,
inout wire S_DQ15,
 
inout wire S_A0,
inout wire S_A1,
inout wire S_A2,
inout wire S_A3,
inout wire S_A4,
inout wire S_A5,
inout wire S_A6,
inout wire S_A7,
inout wire S_A8,
inout wire S_A9,
inout wire S_A10,
inout wire S_A11,
	
inout wire SD_BS0,
inout wire SD_BS1,
inout wire SD_LDQM,
inout wire SD_UDQM,
	
inout wire SD_CKE,
inout wire SD_CLK,
inout wire SD_CS,
inout wire SD_RAS,
inout wire SD_CAS,
inout wire SD_WE

);

// wire w_button_on         ;
// wire w_button_reset      ;
// wire w_button_bigbadaboom;
// wire w_button_huy_n      ;
// wire w_LED_hren          ;
// wire w_LED_pohren_n      ;

// wire [7:0] w_LCD_DATA;

// assign w_button_on          = KEY1 ;
// assign w_button_reset       = KEY2 ;
// assign w_button_bigbadaboom = KEY3 ;
// assign w_button_huy_n       = ~KEY4;
// assign DIG_1                = w_LED_hren          ;
// assign DIG_2                = w_LED_pohren_n      ;

// assign {
//     LCD11_D7,
//     LCD10_D6,
//     LCD9_D5 ,
//     LCD8_D4 ,
//     LCD7_D3 ,
//     LCD6_D2 ,
//     LCD5_D1 ,
//     LCD4_D0  
// } = w_LCD_DATA;

// sonin_wrapper
// #(                                    
//     .P_ENABLE (LP_ENABLE_LOGIC)       // prisvoenie param k drugomu, delat k kajdomu  modulu
// )                                     
// sonin_wrapper_inst
// (
//     .button_on          (w_button_on         ),
//     .button_reset       (w_button_reset      ),
//     .button_bigbadaboom (w_button_bigbadaboom),
//     .button_huy_n       (w_button_huy_n      ),
//     .LED_hren           (w_LED_hren          ),
//     .LED_pohren_n       (w_LED_pohren_n      ),
//     .LCD_DATA           (w_LCD_DATA          )
// );

//SDRAM inout 
//assign I2C_SCL = (1'b0) ? (1'b1) : (1'bZ); //3state - read
//-------------------------------------------------------------------------------------------------
assign {
    UART_TXD,
    PS_CLOCK,
    PS_DATA, 
    VGA_HSYNC,
    VGA_VSYNC,
    ASDO_EPCS4,
    nCSO_EPCS4,
    DCLK_EPCS4
} = 'd0;

assign {IR,VGA_G,VGA_R} = {2{1'd1},1{1'd0}};

assign {I2C_SCL,I2C_SDA,SCL,SDA,S_DQ0,S_DQ1,S_DQ2,S_DQ3,S_DQ4,S_DQ5,S_DQ6,S_DQ7,
S_DQ8,S_DQ9,S_DQ10,S_DQ11,S_DQ12,S_DQ13,S_DQ14,S_DQ15,S_A0,S_A1,S_A2,S_A3,S_A4,
S_A5,S_A6,S_A7,S_A8,S_A9,S_A10,S_A11,SD_BS0,SD_BS1,SD_LDQM,SD_UDQM,SD_CKE,
SD_CLK,SD_CS,SD_WE,SD_RAS,SD_CAS,} = 'bZ;
 
//-------------------------------------------------------------------------------------------------

wire w_key1            ;
wire w_key2            ;
wire w_key3            ;
wire w_key4            ;
wire w_key_1or4        ;
wire w_key_direct_1or4 ;
wire w_data_low_cnt    ;
wire w_overflow_low    ;
wire w_data_high_cnt   ;
wire w_cnt_3sec        ;
wire w_low_data_inv    ;
wire w_high_data_inv   ;
wire w_data_seg        ;
wire w_en_seg          ;
wire w_dt              ;
wire [3:0] ne_data     ; 
wire [3:0]    N_o_b    ;
wire [3:0]    data0    ;
wire [3:0]    data1    ;
wire [3:0] data_seg    ;
wire [3:0]   en_seg    ;
wire             dt    ;

key_ctrl
key_add_inst
(
    .KEY             (KEY1),
    .FPGA_CLK    (FPGA_CLK),

    .f_key_down          (),
	.f_key_en1           (),
    .f_key_up      (w_key1)
);
key_ctrl
key_minus_inst
(
    .KEY             (KEY4),
    .FPGA_CLK    (FPGA_CLK),

    .f_key_down          (),
    .f_key_en1           (),
    .f_key_up      (w_key4)
);
key_ctrl
key_bzz_inst
(
    .KEY             (KEY3),
    .FPGA_CLK    (FPGA_CLK),

    .f_key_down          (),
    .f_key_en1           (),
    .f_key_up      (w_key3)
);
key_ctrl
key_inv_inst
(
    .KEY             (KEY2),
    .FPGA_CLK    (FPGA_CLK),

    .f_key_down          (),
    .f_key_en1     (w_key2),
    .f_key_up            ()
);

sensivity_key
sensivity_key_inst
(
   .FPGA_CLK        (FPGA_CLK),
   .din1              (w_key1),
   .din2              (w_key4),

   .sens_key      (w_key_1or4), 
   .dir    (w_key_direct_1or4)
);

count1_4bit_ctrl
count_low_bit_inst
(
    .f_key_add                (w_key_1or4),
    .f_key_direction   (w_key_direct_1or4),
    .FPGA_CLK                   (FPGA_CLK), 

    .f_overflow           (w_overflow_low),
    .dout                 (w_data_low_cnt)
);

count1_4bit_ctrl
count_high_bit_inst
(
    .f_key_add            (w_overflow_low),
    .f_key_direction   (w_key_direct_1or4),
    .FPGA_CLK                   (FPGA_CLK), 

    .f_overflow                         (),
    .dout                (w_data_high_cnt)
);

count_3sec_ctrl
count_3sec
(
    .FPGA_CLK                   (FPGA_CLK),
    .en_key                       (w_key2),

    .f_cnt_3sec               (w_cnt_3sec)
);

invert_ctrl
invert_low_inst
(
    .FPGA_CLK                   (FPGA_CLK), 
    .data                 (w_data_low_cnt),
    .en_key                   (w_cnt_3sec),

    .inv_data             (w_low_data_inv)
);

invert_ctrl
invert_high_inst
(
    .FPGA_CLK                   (FPGA_CLK), 
    .data                (w_data_high_cnt),
    .en_key                   (w_cnt_3sec),

    .inv_data             (w_high_data_inv)
);

assign {LED1,LED2,LED3,LED4} = ~w_low_data_inv;
//assign LED4 = ~data0[4];
//assign LED3 = ~data0[3];
//assign LED2 = ~data0[2];
//assign LED1 = ~data0[1];

sevenseg_dynamic_ctrl
sv_seg_dynamic_inst
(
    .data0                (w_low_data_inv),
    .data1               (w_high_data_inv),
    .FPGA_CLK                   (FPGA_CLK),

    .data_seg                 (w_data_seg),
    .en_seg                     (w_en_seg),
    .dt                             (w_dt)
);

sevenseg_ctrl
sevenseg_inst
(
    .data                     (w_data_seg),
    .en_seg                     (w_en_seg),
    .dt                             (w_dt),

    .segment   ({SEG_0,SEG_1,SEG_2,SEG_3,SEG_4,SEG_5,SEG_6}),
    .seg_enable_num              ({DIG_4,DIG_3,DIG_2,DIG_1}),
	.dot                                             (SEG_7)
);

buzzer_ctrl
buzzer_inst
( 
	.FPGA_CLK                   (FPGA_CLK), 
	.sound_on                     (w_key3),
    .data                 (w_low_data_inv),
    .beep                           (beep)
);

endmodule
