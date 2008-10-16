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

	/*always@(solicitudes or estado)
	begin
		luces = solicitudes;
		display_num[0] = estado[0];
		display_num[1] = estado[1];
		if (~|solicitudes && !estado[3])
			display_dir[0] = 0;
		else
			display_dir[0] = 1;
		display_dir[1] = estado[2];
	end*/
endmodule
