//Projeto de uma ULA de 32 Bits


//Criação do módulo ULA e inicialização das variáveis
//clk -> Clock
//a e b-> entradas a e b (32 bits)
//ct1 e ct2-> entradas de controle da ULA, selecionam a operação a ser feita
// v, c, n e z -> flags da ULA
// result -> resultado da operação executada

module ula (clk, a, b, result, ct1, ct2, v, c, n, z, teste);
	input clk, ct1, ct2;
	input [31:0] a;
	input [31:0] b;
	input [1:0] teste;
	output [31:0] result, v, c, n, z;
	reg [31:0] a;
	reg [31:0] b;
	reg [31:0] result;
	reg [1:0] teste;

assign ent = ct1 & ct2;

always @ (posedge clk)

case (ent)
	2'b00: teste <= 0;
	2'b01: teste <= 1;
	2'b10: teste <= 2;
	default: teste <=3; 

endcase
endmodule 
