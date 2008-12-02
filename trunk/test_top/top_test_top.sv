`timescale 1ns/100ps
module TOP_test_top;
  parameter simulation_cycle = 100;

  bit  SystemClock;
  top_io io(SystemClock);
  test t(io);
  
  TOP dut(
    .botones	(io.botones),
    .boton_puertas	(io.boton_puertas),
    .estado_puertas	(io.estado_puertas),
    .cambio_piso	(io.cambio_piso),
    .sensor_puertas	(io.sensor_puertas),
    .reset (io.reset),
	.clk	(io.clk),
    .luces	(io.luces),
    .display	(io.display),
    .aviso	(io.aviso),
    .puertas	(io.puertas),
    .motor	(io.motor)
  );

  initial begin
    $timeformat(-9, 1, "ns", 10);
    SystemClock = 0;
    forever begin
      #(simulation_cycle/2)
        SystemClock = ~SystemClock;
    end
  end

endmodule
