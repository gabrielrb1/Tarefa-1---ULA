module ula_tb;
reg clk;
reg [1:0] op;
reg [1:0] a;
reg [1:0] b;
wire [1:0] result;

ula U0(
.clk (clk),
.op (op),
.result (result),
.a (a),
.b (b)
);

initial begin
	clk = 0;
	op <= 2'b01;
	a <= 2'b10;
	b <= 2'b10;
	
end

always

	#5 clk = !clk;
		

endmodule

