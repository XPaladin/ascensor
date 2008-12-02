`timescale 1ns/100ps
module REGISTRADOR_test_top;
  parameter simulation_cycle = 100;

  bit  SystemClock;

  registrador_io top_io(SystemClock);
  test t(top_io);

  REGISTRADOR dut(
    .botones	(top_io.botones),
    .solicitudes_inicial	(top_io.solicitudes_inicial),
    .solicitudes_final	(top_io.solicitudes_final)
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
