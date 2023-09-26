`timescale 1ns / 1ps
//���ڼ���ʱ��̫�������ѿ������������ﲻ��չʾ����
module Smart_responder_tb;
    reg clk,rst_n;
    reg [3:0]btn;
    
    wire [3:0] an;
    wire [7:0] seg_code;
    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        btn = 4'd0;
        #10 rst_n = 1'b1;
//        #10 rst_n = 1'b0;
        //�������˰��°�ť������ʱ�䲻ͬ
        #10 btn = 4'd1; 
        #10 btn = 4'd3;
        #10 btn = 4'd0;
        
        #50 rst_n = 1'b0;
        #10 rst_n = 1'b1;
        //�������˰��°�ť������ʱ�䲻ͬ
        #10 btn = 4'd2;
        #10 btn = 4'd6;
        #10 btn = 4'd0;        
    end
    always #5 clk <= ~clk;

    Smart_responder Smart_responder(
        .clk( clk ),
        .rst_n( rst_n ),
        .btn( btn ),
        .an( an ),
        .seg_code( seg_code )
    );
endmodule
