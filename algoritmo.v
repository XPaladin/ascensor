/**
 * Es la maquina de estados con el algoritmo de atencion a solicitudes.
 *
 * El algoritmo va dando instrucciones a los distintos componentes para ir
 * atendiendo a los pisos solicitados. Actualiza el estado de la maquina de
 * estados y el estado de los botones solicitados (desactibando los
 * atendidos).
 *
 * @param in:solicitudes_inicial  El estado de las solicitudes de los pisos.
 * @param in:estado_inicial       El estado actual del ascensor.
 * @param in:cambio_piso          Si hubo un cambio de piso.
 * @param in:esperar              Si hay que esperar porque las puertas estan abiertas.
 * @param in:clk                  El reloj.
 * @param out:estado_final        El estado del ascensor luego de ejecutar el algoritmo.
 * @param out:motor               La instruccion al motor.
 */
module ALGORITMO (solicitudes_inicial, estado_inicial, cambio_piso, esperar, clk, estado_final, motor);
	input [9:0] solicitudes_inicial;
	input [3:0] estado_inicial;
	input cambio_piso;
	input esperar;
	input clk;
	output [3:0] estado_final;
	output [1:0] motor;
	
	reg piso_actual;
	
	always@(posedge clk)
	begin
		piso_actual=estado_inicial[1];
		i
		if(piso_actual==cambio_piso)//no he cambiado de piso
		begin
			
		end
	end
endmodule
