interface algoritmo_io(input bit clk);
  logic [9:0]	s;
  logic [3:0]	estado_inicial;
  logic 		cambio_piso;
  logic 		esperar;
  logic [3:0]	estado_final;

  clocking cb @(posedge clk);
	output s;
	output estado_inicial;
	output cambio_piso;
	output esperar;
	input estado_final;
  endclocking

  modport TB(clocking cb, output s, output estado_inicial, output cambio_piso, output esperar);
endinterface
