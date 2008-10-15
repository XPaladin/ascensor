module timeout_puertas(puertas, salida);
	input [1:0] puertas;
	output salida;

	reg salida;

	always@(puertas)
	begin
		if (puertas == 2'b01)
		begin
			#100 // ojala que salga de aca cuando cambian las puertas
			salida = 1;
		end
		else
			salida = 0;
	end
endmodule