
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

module Andei_choto_udumal_chertila(
input wire [3:0]data,
input wire FPGA_CLK,

output wire [3:0] data0,
output reg  [3:0] data1
);

initial begin
data1 = 'd0;
end

always@(posedge FPGA_CLK) begin
    if (data == 4'b1111) begin
        data1 <= data1 + 'd1;
    end else begin
        data1 <= data1;
    end
end    
assign data0 = data;

endmodule

module Buzzer( 
input wire FPGA_CLK, // aclk!, aclk_50mhz
input wire sound_on, // sound_en , enable , en , butt, btn_negative, btn_n 
input wire [3:0] data,

output reg beep
);

reg [20:0] cnt_bzz;
reg beep_bzz;
reg switch;
reg [20:0] freq;

initial begin
cnt_bzz = 'd0;
beep_bzz = 'd0;
switch = 'd0;
freq = 'd0;
end

// add function select freq on data
always @ (data) begin 
case (data)

'd0:       freq = 'h6EF9;  // 440 Hz == 50.000.000 Hz / (113.637 /2 !) F4240
'd1:       freq = 'h62F1;
'd2:       freq = 'h5D5C;
'd3:       freq = 'h532E;
'd4:       freq = 'h4A18;
'd5:       freq = 'h45F4;
'd6:       freq = 'h3E47;
'd7:       freq = 'h377C;
'd8:       freq = 'h3172;
'd9:       freq = 'h2EA8;
'd10:      freq = 'h2992;
'd11:      freq = 'h2508;
'd12:      freq = 'h22F6;
'd13:      freq = 'h1F23;
'd14:      freq = 'h1BBE;
'd15:      freq = 'h18B7; 
default: freq = 'hF4240;

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
        switch <= switch;
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

module select_seg (
   input wire [3:0] data0,
   input wire [3:0] data1,
   input wire FPGA_CLK,

   output reg [3:0] data_seg,
   output reg [3:0] en_seg,
   output reg dt
);

reg enable_segment;
//reg [] cnt_freq_seg  ; 

initial begin
enable_segment = 'd0;
data_seg = 'd1      ;
en_seg = 'd1        ;
dt = 'd1            ;

end

always@(posedge FPGA_CLK) begin

enable_segment <= ~enable_segment; // freq segment 25 MHZ
end

always@(posedge FPGA_CLK) begin
    if(enable_segment) begin
        data_seg <= data0;
        en_seg <= 4'b1110;
        dt <= 'd1;
    end else begin
        data_seg <= data1;
        en_seg <= 4'b1101;
        dt <= 'd1;
    end
end 

endmodule

module sevenseg(

input wire [3:0] data,
input wire [3:0] en_seg,
input wire dt,

output reg [6:0] segment,
output wire [3:0] seg_enable_num,
output wire dot
);

assign seg_enable_num = en_seg;
assign dot = dt;


always @ (data) begin 
case (data)

'd0:       segment <= 7'h1;
'd1:       segment <= 7'h4F;
'd2:       segment <= 7'h12;
'd3:       segment <= 7'h6;
'd4:       segment <= 7'h4C;
'd5:       segment <= 7'h24;
'd6:       segment <= 7'h20;
'd7:       segment <= 7'hF;
'd8:       segment <= 7'h0;
'd9:       segment <= 7'h4;
'd10:      segment <= 7'h8;
'd11:      segment <= 7'h60;
'd12:      segment <= 7'h31;
'd13:      segment <= 7'h42;
'd14:      segment <= 7'h30;
'd15:      segment <= 7'h38; 
default: segment <= 7'h7E;

endcase
end
endmodule

module key_v2(
input wire KEY       ,
input wire FPGA_CLK  ,

output reg f_key_down,
output reg f_key_en1 ,
output reg f_key_up 
);
// syntch inpute wire with clk
reg [1:0] butt;
reg [23:0] key_cnt;
reg f_key_en;
reg [23:0] key_cntmax;

initial begin
butt = 'd0;
f_key_down = 'd0;
f_key_up = 'd0;
key_cnt = 'd0;
f_key_en ='d0;
f_key_en1 ='d0;
key_cntmax = 'hFFFFFF;
end

//sync input signal with clk
always@ (posedge FPGA_CLK ) begin
butt <= {butt[0], ~KEY}; // ne razlichaet registr bukvu
end
// if butt[1] = 1, key put in
// 
always@(posedge FPGA_CLK) begin
	if ( butt[1]) begin
		if(key_cnt >= key_cntmax) begin
		    key_cnt <= key_cnt;
		    f_key_en <=1'b1;
		end else begin
		    key_cnt <= key_cnt + 1'b1; 
            f_key_en <= f_key_en;
		end
	end else begin
        key_cnt<= 'd0;
		f_key_en <= 1'b0;
	end
end

always@ (posedge FPGA_CLK) begin
f_key_en1 <= f_key_en;
end

always@ (posedge FPGA_CLK) begin
    if(f_key_en > f_key_en1 ) begin
        f_key_down <= 1'b0;
        f_key_up <= 1'b1;
	end else begin
        f_key_down <= 1'b1;
        f_key_up <= 1'b0;
    end
end 


endmodule

module invert_data(
input wire FPGA_CLK    ,
input wire [3:0] data  ,
input wire en_key      ,
output reg [3:0] inv_data
);
reg [27:0] cnt3sec;
reg f_inv;


initial begin
    cnt3sec = 'd0;
    f_inv = 'd0;
end

always@(posedge FPGA_CLK) begin //time 3sec and f_inv = 1;
	if(en_key) begin
        if(cnt3sec >= 'h8F0D180) begin
            cnt3sec <= cnt3sec;
			   f_inv <= 1'b1;
		  end else begin
            cnt3sec <= cnt3sec + 'd1;
			   f_inv <= f_inv;
		end
	end else begin
    cnt3sec <= 'd0;
	f_inv <= 1'b0;
	end
end

always@(posedge f_inv) begin 
    inv_data <= ~data; 
end

endmodule

// pravilnei razdelai peremenie v raznie always po smuslu
