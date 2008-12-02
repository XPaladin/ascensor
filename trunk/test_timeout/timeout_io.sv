interface timeout_io(input bit clock);
  logic [1:0]	estado;
  logic 		timeout;
  logic [9:0]	count;

  clocking cb @(posedge clock);
	output estado;
	input timeout;
	input count;
  endclocking

  modport TB(clocking cb, output estado);

endinterface
