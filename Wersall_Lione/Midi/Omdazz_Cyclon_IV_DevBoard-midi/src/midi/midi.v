module midi
#(
    parameter P_HOL = 1'b0
)
(
    input  wire [7:0] note_select,
    output reg        o_busser   ,

    input  wire       en         ,
    input  wire       reset      ,
    input  wire       aresetn    ,
    input  wire       aclk        
);

`include "./midi_note_include.v"

initial begin
    o_busser = ~P_HOL;
end

reg [31:00] counter      ;
reg [31:00] r_counter_end;

initial begin
    counter       = 'd0;
    r_counter_end = 'd0;
end

wire [31:00] w_counter_end;

assign w_counter_end = r_counter_end >> 1;

always @(posedge aclk, negedge aresetn) begin : r_counter_end_inst
    if(!aresetn)begin
        r_counter_end <= 'd0;
    end
    else if(en)begin
        if(reset)begin
            r_counter_end <= 'd0;
        end
        else begin
            case (note_select)
            8'd12   :begin
                r_counter_end <= TONE_12 ;
            end 
            8'd13   :begin
                r_counter_end <= TONE_13 ;
            end 
            8'd14   :begin
                r_counter_end <= TONE_14 ;
            end 
            8'd15   :begin
                r_counter_end <= TONE_15 ;
            end 
            8'd16   :begin
                r_counter_end <= TONE_16 ;
            end 
            8'd17   :begin
                r_counter_end <= TONE_17 ;
            end 
            8'd18   :begin
                r_counter_end <= TONE_18 ;
            end 
            8'd19   :begin
                r_counter_end <= TONE_19 ;
            end 
            8'd20   :begin
                r_counter_end <= TONE_20 ;
            end 
            8'd21   :begin
                r_counter_end <= TONE_21 ;
            end 
            8'd22   :begin
                r_counter_end <= TONE_22 ;
            end 
            8'd23   :begin
                r_counter_end <= TONE_23 ;
            end 
            8'd24   :begin
                r_counter_end <= TONE_24 ;
            end 
            8'd25   :begin
                r_counter_end <= TONE_25 ;
            end 
            8'd26   :begin
                r_counter_end <= TONE_26 ;
            end 
            8'd27   :begin
                r_counter_end <= TONE_27 ;
            end 
            8'd28   :begin
                r_counter_end <= TONE_28 ;
            end 
            8'd29   :begin
                r_counter_end <= TONE_29 ;
            end 
            8'd30   :begin
                r_counter_end <= TONE_30 ;
            end 
            8'd31   :begin
                r_counter_end <= TONE_31 ;
            end 
            8'd32   :begin
                r_counter_end <= TONE_32 ;
            end 
            8'd33   :begin
                r_counter_end <= TONE_33 ;
            end 
            8'd34   :begin
                r_counter_end <= TONE_34 ;
            end 
            8'd35   :begin
                r_counter_end <= TONE_35 ;
            end 
            8'd36   :begin
                r_counter_end <= TONE_36 ;
            end 
            8'd37   :begin
                r_counter_end <= TONE_37 ;
            end 
            8'd38   :begin
                r_counter_end <= TONE_38 ;
            end 
            8'd39   :begin
                r_counter_end <= TONE_39 ;
            end 
            8'd40   :begin
                r_counter_end <= TONE_40 ;
            end 
            8'd41   :begin
                r_counter_end <= TONE_41 ;
            end 
            8'd42   :begin
                r_counter_end <= TONE_42 ;
            end 
            8'd43   :begin
                r_counter_end <= TONE_43 ;
            end 
            8'd44   :begin
                r_counter_end <= TONE_44 ;
            end 
            8'd45   :begin
                r_counter_end <= TONE_45 ;
            end 
            8'd46   :begin
                r_counter_end <= TONE_46 ;
            end 
            8'd47   :begin
                r_counter_end <= TONE_47 ;
            end 
            8'd48   :begin
                r_counter_end <= TONE_48 ;
            end 
            8'd49   :begin
                r_counter_end <= TONE_49 ;
            end 
            8'd50   :begin
                r_counter_end <= TONE_50 ;
            end 
            8'd51   :begin
                r_counter_end <= TONE_51 ;
            end 
            8'd52   :begin
                r_counter_end <= TONE_52 ;
            end 
            8'd53   :begin
                r_counter_end <= TONE_53 ;
            end 
            8'd54   :begin
                r_counter_end <= TONE_54 ;
            end 
            8'd55   :begin
                r_counter_end <= TONE_55 ;
            end 
            8'd56   :begin
                r_counter_end <= TONE_56 ;
            end 
            8'd57   :begin
                r_counter_end <= TONE_57 ;
            end 
            8'd58   :begin
                r_counter_end <= TONE_58 ;
            end 
            8'd59   :begin
                r_counter_end <= TONE_59 ;
            end 
            8'd60   :begin
                r_counter_end <= TONE_60 ;
            end 
            8'd61   :begin
                r_counter_end <= TONE_61 ;
            end 
            8'd62   :begin
                r_counter_end <= TONE_62 ;
            end 
            8'd63   :begin
                r_counter_end <= TONE_63 ;
            end 
            8'd64   :begin
                r_counter_end <= TONE_64 ;
            end 
            8'd65   :begin
                r_counter_end <= TONE_65 ;
            end 
            8'd66   :begin
                r_counter_end <= TONE_66 ;
            end 
            8'd67   :begin
                r_counter_end <= TONE_67 ;
            end 
            8'd68   :begin
                r_counter_end <= TONE_68 ;
            end 
            8'd69   :begin
                r_counter_end <= TONE_69 ;
            end 
            8'd70   :begin
                r_counter_end <= TONE_70 ;
            end 
            8'd71   :begin
                r_counter_end <= TONE_71 ;
            end 
            8'd72   :begin
                r_counter_end <= TONE_72 ;
            end 
            8'd73   :begin
                r_counter_end <= TONE_73 ;
            end 
            8'd74   :begin
                r_counter_end <= TONE_74 ;
            end 
            8'd75   :begin
                r_counter_end <= TONE_75 ;
            end 
            8'd76   :begin
                r_counter_end <= TONE_76 ;
            end 
            8'd77   :begin
                r_counter_end <= TONE_77 ;
            end 
            8'd78   :begin
                r_counter_end <= TONE_78 ;
            end 
            8'd79   :begin
                r_counter_end <= TONE_79 ;
            end 
            8'd80   :begin
                r_counter_end <= TONE_80 ;
            end 
            8'd81   :begin
                r_counter_end <= TONE_81 ;
            end 
            8'd82   :begin
                r_counter_end <= TONE_82 ;
            end 
            8'd83   :begin
                r_counter_end <= TONE_83 ;
            end 
            8'd84   :begin
                r_counter_end <= TONE_84 ;
            end 
            8'd85   :begin
                r_counter_end <= TONE_85 ;
            end 
            8'd86   :begin
                r_counter_end <= TONE_86 ;
            end 
            8'd87   :begin
                r_counter_end <= TONE_87 ;
            end 
            8'd88   :begin
                r_counter_end <= TONE_88 ;
            end 
            8'd89   :begin
                r_counter_end <= TONE_89 ;
            end 
            8'd90   :begin
                r_counter_end <= TONE_90 ;
            end 
            8'd91   :begin
                r_counter_end <= TONE_91 ;
            end 
            8'd92   :begin
                r_counter_end <= TONE_92 ;
            end 
            8'd93   :begin
                r_counter_end <= TONE_93 ;
            end 
            8'd94   :begin
                r_counter_end <= TONE_94 ;
            end 
            8'd95   :begin
                r_counter_end <= TONE_95 ;
            end 
            8'd96   :begin
                r_counter_end <= TONE_96 ;
            end 
            8'd97   :begin
                r_counter_end <= TONE_97 ;
            end 
            8'd98   :begin
                r_counter_end <= TONE_98 ;
            end 
            8'd99   :begin
                r_counter_end <= TONE_99 ;
            end 
            8'd100  :begin
                r_counter_end <= TONE_100;
            end 
            8'd101  :begin
                r_counter_end <= TONE_101;
            end 
            8'd102  :begin
                r_counter_end <= TONE_102;
            end 
            8'd103  :begin
                r_counter_end <= TONE_103;
            end 
            8'd104  :begin
                r_counter_end <= TONE_104;
            end 
            8'd105  :begin
                r_counter_end <= TONE_105;
            end 
            8'd106  :begin
                r_counter_end <= TONE_106;
            end 
            8'd107  :begin
                r_counter_end <= TONE_107;
            end 
            8'd108  :begin
                r_counter_end <= TONE_108;
            end 
            8'd109  :begin
                r_counter_end <= TONE_109;
            end 
            8'd110  :begin
                r_counter_end <= TONE_110;
            end 
            8'd111  :begin
                r_counter_end <= TONE_111;
            end 
            8'd112  :begin
                r_counter_end <= TONE_112;
            end 
            8'd113  :begin
                r_counter_end <= TONE_113;
            end 
            8'd114  :begin
                r_counter_end <= TONE_114;
            end 
            8'd115  :begin
                r_counter_end <= TONE_115;
            end 
            8'd116  :begin
                r_counter_end <= TONE_116;
            end 
            8'd117  :begin
                r_counter_end <= TONE_117;
            end 
            8'd118  :begin
                r_counter_end <= TONE_118;
            end 
            8'd119  :begin
                r_counter_end <= TONE_119;
            end 
            8'd120  :begin
                r_counter_end <= TONE_120;
            end 
            8'd121  :begin
                r_counter_end <= TONE_121;
            end 
            8'd122  :begin
                r_counter_end <= TONE_122;
            end 
            8'd123  :begin
                r_counter_end <= TONE_123;
            end 
            8'd124  :begin
                r_counter_end <= TONE_124;
            end 
            8'd125  :begin
                r_counter_end <= TONE_125;
            end 
            8'd126  :begin
                r_counter_end <= TONE_126;
            end 
            8'd127  :begin
                r_counter_end <= TONE_127;
            end 
            8'd128  :begin
                r_counter_end <= TONE_128;
            end 
            8'd129  :begin
                r_counter_end <= TONE_129;
            end 
            8'd130  :begin
                r_counter_end <= TONE_130;
            end 
            8'd131  :begin
                r_counter_end <= TONE_131;
            end 
            default :begin
                r_counter_end <= 32'd0;
            end 
            endcase
        end
    end
    else begin
        r_counter_end <= r_counter_end;
    end
end

always @(posedge aclk, negedge aresetn) begin : counter_inst
    if(!aresetn)begin
        counter <= 32'd0;
    end
    else if(en)begin
        if(reset | (r_counter_end == 32'd0))begin
            counter <= 32'd0;
        end
        else if(counter >= w_counter_end)begin
            counter <= 32'd0;
        end
        else begin
            counter <= counter + 32'd1;
        end
    end
    else begin
        counter <= counter;
    end
end

always @(posedge aclk, negedge aresetn) begin : o_busser_inst
    if(!aresetn)begin
        o_busser <= ~P_HOL;
    end
    else if(en)begin
        if(reset | (r_counter_end == 32'd0))begin
            o_busser <= ~P_HOL;
        end
        else if(counter >= w_counter_end)begin
            o_busser <= ~o_busser;
        end
        else begin
            o_busser <= o_busser;
        end
    end
    else begin
        o_busser <= o_busser;
    end
end
    
endmodule
