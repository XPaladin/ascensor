/**
* Prende y apaga las luces, y le envia el piso y direccion a los displays.
* @param solicitudes Solicitud de los pisos en el ciclo actual.
* @param estado El estado actual.
* @param luces El estado de las luces de todos los botones.
* @param display_num El numero de los displays.
* @param display_dir La direccion del ascensor:
*	~: nada
*	2: subiendo
*	3: bajando
*/
module INTERFAZ_DE_SALIDA (solicitudes, estado, luces, display_num, display_dir);
	input [9:0] solicitudes;
	input [3:0] estado;
	output [9:0] luces;
	output [1:0] display_num;
	output [1:0] display_dir;

	reg [9:0] luces;
	reg [1:0] display_num;
	reg [1:0] display_dir;

	always@(solicitudes or estado)
	begin
		luces = solicitudes;
		display_num[0] = estado[0];
		display_num[1] = estado[1];
		if (~|solicitudes && !estado[3])
			display_dir[0] = 0;
		else
			display_dir[0] = 1;
		display_dir[1] = estado[2];
	end
endmodule