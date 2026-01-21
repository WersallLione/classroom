module buzzer_ctrl
// #(
//     parameter P_ACTAVA = 0
// )
( 
input wire FPGA_CLK, // aclk!, aclk_50mhz
input wire sound_on, // sound_en , enable , en , butt, btn_negative, btn_n 
input wire [3:0] data,

output reg beep
);
// localparam LP_ACTAVA_DELTA = 'h1;

// localparam [15:0]
//     LP_DO  = P_ACTAVA                       ,

//     LP_RE  = P_ACTAVA + (LP_ACTAVA_DELTA *1),
//     LP_MI  = P_ACTAVA + (LP_ACTAVA_DELTA *2),

//     LP_FA  = LP_MI +LP_ACTAVA_DELTA         ,
//     LP_SOL = LP_FA +LP_ACTAVA_DELTA         ,
//     LP_LA  = LP_FA +LP_ACTAVA_DELTA         ;


reg [20:0] cnt_bzz;
reg beep_bzz      ;
reg switch        ;
reg [21:0] freq   ;

initial begin
 cnt_bzz =  'd0;
 beep_bzz = 'd0;
 switch =   'd0;
 freq =     'd0;
end

// add function select freq on data
always @ (data) begin 
case (data)
// 440 Hz == 50.000.000 Hz / (113.637 /2 !) 'hDDF2
 'd0:       freq = 'hFFFF; // 
 'd1:       freq = 'hC5AF; // CI 1
 'd2:       freq = 'hBAB9; // DO 2
 'd3:       freq = 'hA65D; // RE 2
 'd4:       freq = 'h9D00; // RE # 2
 'd5:       freq = 'h9430; // MI 2
 'd6:       freq = 'h8BE9; // FA 2 
 'd7:       freq = 'h83F8; // FA # 2
 'd8:       freq = 'h7C90; // SOL 2 
 'd9:       freq = 'h7584; // SOL # 2
 'd10:      freq = 'h6EF9; // LYA 2
 'd11:      freq = 'h68C8; // LYA # 2
 'd12:      freq = 'h62D8; // CI 2
 'd13:      freq = 'h5D45; // DO 3
 'd14:      freq = 'h580E; // DO # 3 
 'd15:      freq = 'h531C; // RE 3 
 default:freq = 'h3F_FFFF; // off buzzer, freq > cnt_bzz/
 endcase
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
        switch <=  switch;
	end
end

always @(posedge FPGA_CLK) begin
    if (cnt_bzz >= freq)begin 
        beep_bzz <= ~ beep_bzz;
        cnt_bzz <= 'd0;
    end else begin
	    beep_bzz <= beep_bzz;
		cnt_bzz <= cnt_bzz + 'd1;
    end
end
endmodule