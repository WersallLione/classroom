module buzzer( 
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