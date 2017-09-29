//Testbench para o código "ula.sv"
//Declaração de variáveis
//Criação de um vetor "teste" para recebimento do arquivo de teste

module ula_tb; 
reg clk;
reg [1:0] op;
reg [1:0] a;
reg [1:0] b;
wire [1:0] result;
reg [7:0] teste [100:0];
reg i; //Definição da variável "i" para percorrer o vetor de teste
reg [1:0] t_res; //Variável criada para receber o resultado esperado, proveniente do arquivo aberto


ula U0(
.clk (clk),
.op (op),
.result (result),
.a (a),
.b (b)
);


//Leitura do arquivo de teste e armazenamento no vetor "teste"
//Inicialização das variáveis de varredura err
initial begin
	clk = 0;
	$readmemb("C:\intelFPGA_pro\17.0\Projeto1\Teste.txt", teste);
	i = 0;
	
end

// Geração do clock
always begin

	#5 clk = !clk;
end


//Após a subida positiva do clock, o programa aguarda um 1 passo e lê os valores contidos no vetor teste
//ajustando-o de acordo com as variáveis informadas
always @ (posedge clk) begin
	#1;
	{a, b, op, t_res} = teste[i];
	
end
	
always @ (negedge clk) begin
	if (result !==t_res) begin
		$display ("Erro para entradas: %b", a,b);
		$display ("Saida esperada: %b; Saida obtida: %b", t_res, result);
	end 
	i = i+1;
	if (i==8) begin
		$finish;
	end

end

initial begin
	$display("a\tb\top\trestult\ti");
	$monitor("%b,\t%b,\t%b,\t%b,\t%b,\t%d",$time,a,b,op,t_res,i);
end


endmodule

