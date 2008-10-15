/**
* Almacena el estado (apretado o no) de los 10 botones para solicitar pisos.
* @param botones Arreglo con 1 si es que un boton esta apretado.
* @param anterior El estado de los botones apretados en el estado anterior.
* @param final El estado de los botones para el estado actual.
* El arreglo de botones contiene la siguiente informacion:
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
*/
module REGISTRADOR (botones, anterior, actual);
	input [9:0] botones, anterior;
	output [9:0] actual;

	assign actual = botones | anterior;
endmodule