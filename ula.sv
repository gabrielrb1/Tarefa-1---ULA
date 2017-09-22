//Projeto de uma ULA de 32 Bits
//Cria��o do m�dulo ULA e inicializa��o das vari�veis
//clk -> Clock
//a e b-> entradas a e b (32 bits)
//op-> entrada de controle da ULA, seleciona a opera��o a ser feita
// v, c, n e z -> flags da ULA
// result -> resultado da opera��o executada

module ula (clk, a, b, result, op, v, c, n, z); //Declara��o das vari�veis
	input clk;
	input [1:0] op;
	input [1:0] a;
	input [1:0] b;
	output [1:0] result;
	output v, c, n, z;
	reg [1:0] a;
	reg [1:0] b;
	reg [1:0] result;


always @ (posedge clk)

case (op)                           //Sele��o da opera��o desejada
	2'b00: result <= a + b;
	2'b01: result <= a - b;
	2'b10: result <= a & b;
	default: result <= a | b; 

endcase


endmodule 
