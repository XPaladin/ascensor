/**
 * Actualiza el estado de los botones dado los botones.
 *
 * Actualiza el estado (apretado o no) de los 10 botones para solicitar pisos
 * dado los botones que estan siendo apretados actualmente y el estado de los
 * botones en el ciclo anterior, asi se mantiene en el tiempo aquellas
 * solicitudes que aun no han sido atendidas.
 *
 * @param in:botones              Arreglo con 1 si es que un boton esta apretado.
 * @param in:solicitudes_inicial  El estado de los botones del ciclo anterior.
 * @param out:solicitudes_final   El estado de los botones actualizado.
 */
module REGISTRADOR (botones, solicitudes_inicial, solicitudes_final);
	input [9:0] botones;
	input [9:0] solicitudes_inicial;
	output [9:0] solicitudes_final;

	assign solicitudes_final = botones | solicitudes_inicial;
endmodule
