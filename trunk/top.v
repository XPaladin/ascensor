/**
* El estado de los botones se codifica en un arreglo de la siguiente forma:
*	0: piso 1 arriba
*	1: piso 2 abajo
*	2: piso 2 arriba
*	3: piso 3 abajo
*	4: piso 3 arriba
* 	5: piso 4 abajo
*	6: piso 1 ascensor
*	7: piso 2 ascensor
* 	8: piso 3 ascensor
*	9: piso 4 ascensor
* Los estados se codifican de la siguiente manera:
*	0: bit 1 del piso actual
*	1: bit 2 del piso actual
*	2: direccion en la que va (1 arriba, 0 abajo)
*	3: si se esta moviendo o no (1 si, 0 no)
*/
module TOP (botones, cambio_piso, boton_abrir_cerrar, sensor_puertas, puertas_abiertas, luces, display_num, display_dir, aviso, puertas, motor)
	input [9:0] botones;
	input [1:0] boton_abrir_cerrar;
	input [1:0] puertas_abiertas;
	input cambio_piso, sensor_puertas;
	output [9:0] luces;
	output [1:0] display_num;
	output [1:0] display_dir;
	output [3:0] aviso;
	output [1:0] puertas;
	output [1:0] motor;
	
	REGISTRADOR registrador ()
endmodule