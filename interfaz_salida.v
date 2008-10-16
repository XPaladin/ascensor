/**
 * Prende y apaga las luces, y le envia el piso y direccion a los displays.
 *
 * @param in:pisos     Solicitud de los pisos en el ciclo actual.
 * @param in:estado    El estado actual.
 * @param out:luces    El estado de las luces de todos los botones.
 * @param out:display  La informacion para los displays:
 * 		- [3:2] piso
 * 		- [1:0] { 11: subiendo, 10: bajando, 0x: nada }
 */
module INTERFAZ_SALIDA (pisos, estado, luces, display);
	input [9:0] pisos;
	input [3:0] estado;
	output [9:0] luces;
	output [3:0] display;

	reg [9:0] luces;
	reg [3:0] display;

	always@(pisos or estado)
	begin
		luces = pisos;
		display[3:2] = estado;
		if (~|pisos && !estado[3])
			display[0] = 0;
		else
			display[0] = 1;
		display[1] = estado[2];
	end
endmodule
