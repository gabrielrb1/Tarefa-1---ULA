//Testbench para o c�digo "ula.sv"
//Declara��o de vari�veis
//Cria��o de um vetor "teste" para recebimento do arquivo de teste

module ula_tb; 
reg clk;
reg [1:0] op;
reg [31:0] a;
reg [31:0] b;
wire [31:0] result;
logic [7:0] teste [3:0]; //Defini��o do tamannho do arquivo de teste
reg i; //Defini��o da vari�vel "i" para percorrer o vetor de teste
reg [31:0] t_res; //Vari�vel criada para receber o resultado esperado, proveniente do arquivo aberto


ula U0(
.clk (clk),
.op (op),
.result (result),
.a (a),
.b (b)
);


//Leitura do arquivo de teste e armazenamento no vetor "teste"
//Inicializa��o das vari�veis de varredura err
initial begin
	clk = 0;
	$readmemb("Teste.txt", teste);
	
end

// Gera��o do clock
always begin

	#5 clk = !clk;
end


//Ap�s a subida positiva do clock, o programa aguarda um 1 passo e l� os valores contidos no vetor teste
//ajustando-o de acordo com as vari�veis informadas
always @ (posedge clk) begin
	#1;
	{a, b, op, t_res} = teste[i];

	//Aguarda mais um passo, para garantir que o vetor do arquivo tenha sido devidamente lido
	//Verifica ent�o se houve algum erro entre a sa�da esperada e a calculada
	#1
	if (result !==t_res) begin
		$display ("Erro para entradas: %b e %b", a,b);
		$display ("Saida esperada: %b; Saida obtida: %b", t_res, result);
	end 
	i = i + 1;
	
	//Determina um valor m�ximo para o �ndice i, limitando a quantidade de linhas a serem lidas
	//no arquivo teste
	
	if (i==4) begin
		$finish;
	end	

end


//Imprime os resultados na tela para acompanhamento dos resultados
initial begin
	$display("a\tb\top\trestult\ti");
	$monitor("\t%b\t%b,\t%b,\t%b,\t%d",a,b,op,t_res,i);
end


endmodule

