module reaction_game_test (
    input wire clk,button,
    output reg rdyLed, cooldownLed, led0, led1, led2
);

reg [1:0] gameState = 2'b11; // 11 - cooldown, 10 ready, 01 waiting
reg [23:0] counter = 0;
reg [2:0] seconds = 0;
reg [2:0] reactionTime = 0;
reg [1:0] randomTime = 2'b01;


always @(posedge clk) begin
    counter <= counter + 1;
    if(counter == 24'd12000000) begin
        counter <= 0;
        seconds <= seconds + 1;
    end
    case (gameState)
        2'b11: begin  // cooldown
            cooldownLed <= 1;
            rdyLed <= 0;
            if (seconds >= 2) begin
                seconds <= 0;
                gameState <= 2'b01;
                {led2,led1,led0} <= 0;
            end
        end
        2'b10: begin // ready
            rdyLed <= 1;
            cooldownLed <= 0;
            if (button) begin
                counter <= 0;
                reactionTime <= seconds;
                gameState <= 2'b11;
                seconds <= 0;
                randomTime <= {randomTime[0],randomTime[1]^randomTime[0]};

            end
        end
        2'b01: begin // waiting
            cooldownLed <= 1;
            rdyLed <= 1;
            if (seconds >= randomTime) begin
                seconds <= 0;
                gameState <= 2'b10;
                {led2,led1,led0} <= reactionTime;
            end
        end
    endcase
end

endmodule