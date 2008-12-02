interface control_puertas_io(input bit clk);
  logic [9:0]	pisos;
  logic [3:0]	estado;
  logic [1:0]	boton;
  logic [9:0]	botones;
  logic [1:0]	puertas;
  logic 		timeout;
  logic 		sensor;
  logic [3:0]	aviso;
  logic [1:0]	salida_puertas;
  logic 		trabajando;

  clocking cb @(posedge clk);
	output pisos;
	output estado;
	output boton;
	output botones;
	output puertas;
	output timeout;
	output sensor;
	input aviso;
	input salida_puertas;
	input trabajando;
  endclocking

  modport TB(clocking cb, output pisos, output estado, output boton, output botones, output puertas, output timeout, output sensor);
endinterface
