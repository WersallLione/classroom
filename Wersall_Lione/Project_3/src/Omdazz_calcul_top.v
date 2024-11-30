module Omdazz_calcul_top(
input wire KEY1     ,
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

//SDRAM inout 
//assign I2C_SCL = (1'b0) ? (1'b1) : (1'bZ); //3state - read

assign {UART_TXD,PS_CLOCK,PS_DATA,VGA_HSYNC,VGA_VSYNC,ASDO_EPCS4,
nCSO_EPCS4,DCLK_EPCS4,DIG_2,DIG_3,DIG_4} = 'd0;
assign {IR,VGA_G,VGA_R,} = {13{1'b0}};
assign {I2C_SCL,I2C_SDA,SCL,SDA,S_DQ0,S_DQ1,S_DQ2,S_DQ3,S_DQ4,S_DQ5,S_DQ6,S_DQ7,
S_DQ8,S_DQ9,S_DQ10,S_DQ11,S_DQ12,S_DQ13,S_DQ14,S_DQ15,S_A0,S_A1,S_A2,S_A3,S_A4,
S_A5,S_A6,S_A7,S_A8,S_A9,S_A10,S_A11,SD_BS0,SD_BS1,SD_LDQM,SD_UDQM,SD_CKE,
SD_CLK,SD_CS,SD_WE,SD_RAS,SD_CAS,} = 1'bZ;
//------------------------------------------------------------------

wire flag1      ;
wire flag4      ;
wire flag3      ;
wire [3:0] pwrr ; 
wire [3:0] N_o_b;

KEY_ADD 
KEY_ADD_inst 
(
	.KEY1       (KEY1     ),
	.FPGA_CLK   (FPGA_CLK ),
	.flag_light_1   (flag1)
);

KEY_ADD 
KEY_MINUS_inst 
(
	.KEY1       (KEY4     ),
	.FPGA_CLK   (FPGA_CLK ),
	.flag_light_1   (flag4)
);

KEY_ADD
KEY_BUZZ_inst
(
	.KEY1       (KEY3     ),
	.FPGA_CLK   (FPGA_CLK ),
	.flag_light_1   (flag3)
);

Buzzer
Buzzer_440Hz_inst
( 
	.FPGA_CLK          (FPGA_CLK ), 
	.sound_on              (flag3),
    .beep                   (beep),
	
);

CALCUL
CALCUL_inst
(
   .flag_light_1           (flag1),
   .flag_light_2           (flag4),
   .FPGA_CLK           (FPGA_CLK ),
   .Num_of_bit             (N_o_b)
);

assign {LED1,LED2,LED3,LED4} = ~N_o_b;
//assign LED4 = ~N_o_b[4];
//assign LED3 = ~N_o_b[3];
//assign LED2 = ~N_o_b[2];
//assign LED1 = ~N_o_b[1];

sevenseg
sevenseg_inst(
    .data   (N_o_b),
    .segment  (SEG_0,SEG_1,SEG_3,SEG_4,SEG_5,SEG_6,SEG_7),
    .seg_enable  (DIG_1)
);





endmodule

module KEY_ADD( //schitaem 1 sec i knopka najata togda flag_1 ----->1
input wire KEY1         ,
input wire FPGA_CLK     ,

output wire f_flag_light_1,
output reg flag_light_1
);

reg [27:0] cnt1    ;
//wire f_flag_light_1;
reg flag_key       ;
reg flag_key_z     ;

initial begin
cnt1 = 'd1;
flag_key = 'd0;
flag_key_z = 'd0;
flag_light_1 = 'd0;
end

assign f_flag_light_1 = (cnt1 >= 28'h2FAF080) ? (1'b1) : (1'b0); // 2FAF080 - 1 sec, kogda cnt dohodit do 1 sec flag podnimaetcia v odin

always @(posedge FPGA_CLK) begin 
	if(flag_key > flag_key_z)begin
		flag_light_1 <= 1'b1;
	end 
	else begin
		flag_light_1 <= 1'b0;
	end
end

always @(posedge FPGA_CLK) begin 
	flag_key_z <= flag_key;
end

always @(posedge FPGA_CLK) begin 
    if (KEY1==1'b0) begin
        if (f_flag_light_1)begin
	       cnt1     <= cnt1;
		    flag_key <= 1'b1  ;
	     end 
		  else begin //cnt = 0, f_flag_light_1 = 0;
		  cnt1     <= cnt1 + 1'd1;
		    flag_key <= 1'b0;
                  
	     end
	 end 
	 else begin // key1 = 1,toest' key otjata
		cnt1     <= 'd0  ; 
		flag_key <= 1'b0 ;            
    end
end

endmodule

module CALCUL(
input wire flag_light_1,
input wire flag_light_2,
input wire FPGA_CLK    ,

output reg  [3:0] Num_of_bit
);

initial begin
    Num_of_bit = 'd0;
end 

always@(posedge FPGA_CLK) begin
     if(flag_light_1==1'b1) begin
	     Num_of_bit <= Num_of_bit + 'd1;
	 end 
	 else if (flag_light_2==1'b1) begin
	     Num_of_bit <= Num_of_bit - 'd1;
	 end else begin
	     Num_of_bit <= Num_of_bit      ;
	 end
end

endmodule

module Buzzer( 
input wire FPGA_CLK, // aclk!, aclk_50mhz
input wire sound_on, // sound_en , enable , en , butt, btn_negative, btn_n 
output reg beep,

);

reg [20:0] cnt_bzz;
reg beep_bzz;
reg switch;

initial begin
cnt_bzz = 'd0;
beep_bzz = 'd0;
switch = 'd0;
end


always @(posedge FPGA_CLK) begin
    if(switch == 1'b1) begin
	    beep <= beep_bzz;
	end else begin
        beep <= 'b0;
	end

end
always @(posedge FPGA_CLK) begin
    if(sound_on == 1'b1) begin
	    switch <= ~switch;
	end else begin
        switch <= switch;
	end

end

always @(posedge FPGA_CLK) begin
    if (cnt_bzz >= ('hF4240))begin // 440 Hz = 50.000.000 Hz / (113.637 /2 !!!!!)
        beep_bzz <= ~ beep_bzz;
        cnt_bzz <= 'd0;
    end else begin
	    beep_bzz <= beep_bzz;
		cnt_bzz <= cnt_bzz + 'd1;
    end
end
endmodule

module sevenseg(
input wire data[3:0],

output reg segment [6:0],
output wire seg_enable
);

assign seg_enable = 1'b1;

always @ (data) begin 
case (data)

0: segment = 7'h70;
1: segment = 7'h30;
2: segment = 7'h6D;
3: segment = 7'h79;
4: segment = 7'h33;
5: segment = 7'h5B;
6: segment = 7'h5F;
7: segment = 7'h70;
8: segment = 7'h7F;
9: segment = 7'h7B;
10: segment = 7'h77;
11: segment = 7'h1F;
12: segment = 7'h4E;
13: segment = 7'h3D;
14: segment = 7'h4E;
15: segment = 7'h47;

endcase
end

endmodule
/*
module key_v2(
input wire KEY2         ,
input wire FPGA_CLK     ,

output reg flag_key_on
);


endmodule

module invert_data(
input wire data,
input wire en_key,

outpute wire 'data
);


endmodule
*/

// pravilnei razdelai peremenie v raznie always po smuslu
