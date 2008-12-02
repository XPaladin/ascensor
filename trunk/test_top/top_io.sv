interface top_io(input bit clk);
  logic [9:0]	botones;
  logic [1:0]	boton_puertas;
  logic [1:0]	estado_puertas;
  logic 		cambio_piso;
  logic 		sensor_puertas;
  logic 		reset;
  logic [9:0]	luces;
  logic [3:0]	display;
  logic [3:0]	aviso;
  logic [1:0]	puertas;
  logic [1:0]	motor;

  clocking cb @(posedge clk);
    output botones;
    output boton_puertas;
	output estado_puertas;
	output cambio_piso;
	output sensor_puertas;
	output reset;
	input luces;
	input display;
	input aviso;
	input puertas;
	input motor;
  endclocking

  modport TB(clocking cb, output botones, output boton_puertas, output estado_puertas, output cambio_piso, output sensor_puertas, output reset);

endinterface
