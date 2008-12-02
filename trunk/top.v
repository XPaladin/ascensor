/**
* El clock sera considerado de 100 hz
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
* Boton
*	 -01 abrir
*	 -10 cerrar
*	 -00 nada
* Puertas
*	-00 completamente cerradas
*	-01 completamente abiertas
*	-10 puertas cerrandose
*	-11 puertas abriendose
* Sensor
*	-1 sensado
*	-0 nada
* Salida_puertas
*	-01 abrir
*	-10 cerrar
*	-00 nada
* Motor
* 	-00 quieto
* 	-10 abajo
* 	-11 arriba
* 	-01 quieto
*/
/**
 * Modulo que contiene a todos los otros.
 *
 * @param in:botones         Los botones de solicitudes de pisos apretados.
 * @param in:boton_puertas   Si hay botones que controlen las puertas apretados.
 * @param in:estado_puertas  El estado de movimiento de las puertas.
 * @param in:cambio_piso     Sensor que hubo un cambio de piso.
 * @param in:sensor_puertas  Sensor de objetos entre las puertas.
 * @param in:clk             El reloj.
 * @param out:luces          El estado de las luces de los botones.
 * @param out:display        El estado de los displays de los pisos.
 * @param out:aviso          Que bocina debe sonar marcando la llegada del ascensor.
 * @param out:puertas        Lo que deben hacer las puertas.
 * @param out:motor          Lo que debe hacer el motor.
 */
module TOP (botones, boton_puertas, estado_puertas, cambio_piso, sensor_puertas, reset ,clk, luces, display, aviso, puertas, motor);
	input [9:0] botones;
	input [1:0] boton_puertas;
	input [1:0] estado_puertas;
	input cambio_piso;
	input sensor_puertas;
	input clk;
	input reset;

	output [9:0] luces;
	output [3:0] display;
	output [3:0] aviso;
	output [1:0] puertas;
	output [1:0] motor;

	//wire clk;
	wire [9:0] reg_sf;
	wire [9:0] rsol_sf;
	wire [9:0] apa_sf;
	wire [3:0] algo_ef;
	wire [3:0] rest_ef;
	wire puer_tr;
	wire time_time;
	wire [9:0] count;
	

	REGISTRADOR 			mod1 (botones, apa_sf, reg_sf);
    APAGADOR_SOLICITUDES    mod2 (rsol_sf, rest_ef, puer_tr, clk, apa_sf); 
	ALGORITMO 			 	mod3 (rsol_sf, rest_ef, cambio_piso, puer_tr, clk, algo_ef);
	TIMEOUT					mod4 (estado_puertas, clk, time_time, count);
	CONTROL_PUERTAS			mod5 (clk, rsol_sf, rest_ef, botones, boton_puertas, estado_puertas, time_time, sensor_puertas, aviso, puertas, puer_tr);
	REGISTRO_SOLICITUDES 	mod6 (reg_sf, clk, rsol_sf,reset);
	REGISTRO_ESTADO			mod7 (algo_ef, clk, rest_ef,reset);
	
	// Salida a las luces y al display
	assign luces = rsol_sf;
	assign display = rest_ef;
	assign motor = rest_ef[3:2];
endmodule
