/**
 * Registro para almacenar el estado del ascensor.
 *
 * @param in:D    La entrada de la informacion.
 * @param in:clk  La entrada del reloj.
 * @param out:Q   La salida de la informacion almacenada.
 */
module REGISTRO_ESTADO (D, clk, Q);
	input [3:0] D;
	input clk;
	output [3:0] Q;

	reg [3:0] Q;

	always@(posedge clk)
		Q = D;
endmodule
