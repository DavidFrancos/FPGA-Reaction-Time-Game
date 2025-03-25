`timescale 1ns/1ps

module reaction_game_tb;


reg clk = 0;
reg button = 0;
wire rdyLed,cooldownLed,led0,led1,led2;

reaction_game dut (
    .clk(clk),
    .button(button),
    .cooldownLed(cooldownLed),
    .rdyLed(rdyLed),
    .led0(led0),
    .led1(led1),
    .led2(led2)
);

always #41.66 clk = ~clk;

initial begin
    $dumpfile("reaction_game_tb.vcd");  
    $dumpvars(0, reaction_game_tb);

    clk = 0;

    #1000000000;  

end

endmodule