interface apagador_solicitudes_io(input bit clk);
  logic [9:0]	o;
  logic [3:0]	e;
  logic 		t;
  logic [9:0]	s;

  clocking cb @(posedge clk);
	output o;
	output e;
	output t;
	input s;
  endclocking

  modport TB(clocking cb, output o, output e, output t);

endinterface
