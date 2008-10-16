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
/**
 * Modulo que contiene a todos los otros.
 *
 * @param in:botones         Los botones de solicitudes de pisos apretados.
 * @param in:boton_puertas   Si hay botones que controlen las puertas apretados.
 * @param in:estado_puertas  El estado de movimiento de las puertas.
 * @param in:cambio_piso     Sensor que hubo un cambio de piso.
 * @param in:sensor_puertas  Sensor de objetos entre las puertas.
 * @param out:luces          El estado de las luces de los botones.
 * @param out:display        El estado de los displays de los pisos.
 * @param out:aviso          Que bocina debe sonar marcando la llegada del ascensor.
 * @param out:puertas        Lo que deben hacer las puertas.
 * @param out:motor          Lo que debe hacer el motor.
 */
module TOP (botones, boton_puertas, estado_puertas, cambio_piso, sensor_puertas, luces, display, aviso, puertas, motor)
	input [9:0] botones;
	input [1:0] boton_puertas;
	input [1:0] estado_puertas;
	input sensor_piso;
	input sensor_puertas;
	output [9:0] luces;
	output [3:0] display;
	output [3:0] aviso;
	output [1:0] puertas;
	output [1:0] motor;

	wire Q, R, S, T, U, V, W;

	/*
	TODO los registros y el clock
	REGISTRADOR registrador (botones, Q, R);
	ALGORITMO algoritmo (R, S, cambio_piso, T, Q, U, motor);
	INTERFAZ_SALIDA interfaz_salida (R, 
	*/
endmodule
