/**
 * Genera un timeout cuando las puertas han estado mucho tiempo abiertas.
 *
 * El timeout (cantidad de ciclos para esperar) es un valor dado.
 *
 * @param in:estado    El estado de las puertas.
 * @param in:clk       El reloj.
 * @param out:timeout  Un 1 si es que se genero un timeout o sino 0.
 */
module TIMEOUT (estado, clk, timeout, count);
	input [1:0] estado;
	input clk;
	output timeout;
	output [9:0] count;

	reg [9:0] count;
	reg timeout;
	
	always@(posedge clk)
	begin
		if (estado == 2'b01)
		begin
			count = count + 1;
		end
		else
		begin
			count = 0;
		end
		if (count >= 10) // deberia ser mas pero no se aprecia en la simulacion
			timeout = 1;
		else
			timeout = 0;

	end
endmodule
