/**
 * Genera un timeout cuando las puertas han estado mucho tiempo abiertas.
 *
 * El timeout (cantidad de ciclos para esperar) es un valor dado.
 *
 * @param in:estado    El estado de las puertas.
 * @param in:clk       El reloj.
 * @param out:timeout  Un 1 si es que se genero un timeout o sino 0.
 */
module TIMEOUT (estado, clk, timeout);
	input [1:0] estado;
	input clk;
	output timeout;

	reg timeout;

	always@(estado)
	begin
		if (estado == 2'b01)
		begin
			//#100 // ojala que salga de aca cuando cambian las puertas
			timeout = 1;
		end
		else
			timeout = 0;
	end
endmodule
