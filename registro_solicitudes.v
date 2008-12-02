/**
 * Registro para almacenar el estado de las solicitudes.
 *
 * @param in:D    La entrada de la informacion.
 * @param in:clk  La entrada del reloj.
 * @param out:Q   La salida de la informacion almacenada.
 */
module REGISTRO_SOLICITUDES (D, clk, Q, reset);
	input [9:0] D;
	input clk;
	input reset;
	output [9:0] Q;

	reg [9:0] Q;

	always@(posedge clk)
		if(reset)
			Q = 0;
		else 
			Q = D;
endmodule
