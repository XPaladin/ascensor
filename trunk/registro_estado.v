/**
 * Registro para almacenar el estado del ascensor.
 *
 * @param in:D    La entrada de la informacion.
 * @param in:clk  La entrada del reloj.
 * @param out:Q   La salida de la informacion almacenada.
 */
module REGISTRO_ESTADO (D, clk, Q, reset);
	input [3:0] D;
	input clk;
	input reset;
	output [3:0] Q;

	reg [3:0] Q;

	always@(posedge clk)
		if(reset)
			Q = 0;
		else
			Q = D;
endmodule
