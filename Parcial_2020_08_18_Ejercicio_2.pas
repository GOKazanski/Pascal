{	Gabriel Omar Kazanski
	gokazanski@gmail.com

2- Se desean registrar los pacientes atendidos en un día por 3 médicos que trabajan en un consultorio privado, de
cada médico se lee apellido y nombre y especialidad. Los pacientes se procesan por médico, de cada uno se lee
apellido y nombre, diagnóstico, obra social y edad.
Se pide:
	A. Determinar y mostrar la cantidad de pacientes por médico, mayores de 90 años que se atendieron. Mostrar
	además apellido y nombre del médico que atendió más pacientes con esta característica y el porcentaje que
	representa en el total.
	B. Indicar si los tres médicos pertenecen a la misma especialidad.
	C. Calcular la cantidad de pacientes en el consultorio que no poseen obra social.
D. Determinar el promedio de edad de los pacientes que se atendieron con la médica Virginia Estévez. En
caso de que la profesional no atienda en el consultorio emita un mensaje que así lo indique.
	E. Calcular el promedio de pacientes atendidos por médico.	
	}
	
program Parcial_2020_08_18_Ejercicio_2;
uses crt;

Var
	i, edad_paciente : byte;

	contador_paciente_doctor, contador_paciente_doctor_90, medico_mas_pacientes, sin_obra_social, total_pacientes, total_pacientes_sin_obra, total_pacientes_90, Sumatoria_edad, promedio_del_buscado: integer;

	NomyApellido_medico, especialidad, NomyApellido_paciente, diagnostico, aux_medico_mas_paciente, aux_especialidad : string;

	obra_social : char;

	aux_espec, aux_medico_buscado : boolean;


BEGIN
medico_mas_pacientes:=0;
aux_especialidad:='';
aux_espec:=false;
total_pacientes:=0;
total_pacientes_sin_obra:=0;
total_pacientes_90:=0;
aux_medico_buscado:=false;

	for i:=1 TO 3 DO
	begin
	contador_paciente_doctor:=0;
	contador_paciente_doctor_90:=0;
	sin_obra_social:=0;
	Sumatoria_edad:=0;
	
		writeln ('Ingrese el Nombre y Apellido del Doctor');
		Readln (NomyApellido_medico);
		NomyApellido_medico:= upcase(NomyApellido_medico);
		
		writeln ('Ingrese la Especialidad del Doctor');
		Readln (especialidad);
		especialidad:= upcase(especialidad);
			
			if aux_especialidad = especialidad then // Compara cada especialidad
				aux_espec:=true
			else
				aux_espec:=false;
		
		writeln('Ingrese el Nombre y Apellido del Paciente');
		readln(NomyApellido_paciente);
		NomyApellido_paciente:=Upcase (NomyApellido_paciente);
	
		While NomyApellido_paciente <>'' do
			Begin
				inc (contador_paciente_doctor);
				
				writeln('Ingrese el diagnostico del Paciente');
				Readln(diagnostico);
				diagnostico:=Upcase (diagnostico);
				
				writeln('Ingrese si posee Obra Social el Paciente (S/N)');
				Readln(obra_social);
				obra_social:=Upcase (obra_social);
				if obra_social='N' then
					inc (sin_obra_social);
					
				writeln('Ingrese la edad del Paciente');
				Readln(edad_paciente);
				Sumatoria_edad:= Sumatoria_edad + edad_paciente;
				
				if edad_paciente > 90 then
					inc (contador_paciente_doctor_90);
				
				Writeln('Ingrese el Nombre y Apellido del Paciente');	
				Readln(NomyApellido_paciente);
				NomyApellido_paciente:=Upcase (NomyApellido_paciente);
				
			End; // finaliza ciclo de paciente
			
		if NomyApellido_medico = 'VIRGINIA ESTEVEZ' then
			begin
				aux_medico_buscado:=true;
				promedio_del_buscado:= Sumatoria_edad/contador_paciente_doctor;
			end;		
		
		total_pacientes_90:= total_pacientes_90 + contador_paciente_doctor_90; // El total de pacientes de mayores a 90 anios
		total_pacientes:= total_pacientes + contador_paciente_doctor; // El total de todos los pacientes
		total_pacientes_sin_obra:=total_pacientes_sin_obra + sin_obra_social; // El total de pacientes sin obra social
		
		
		
		if medico_mas_pacientes < contador_paciente_doctor then
			begin
				medico_mas_pacientes:= contador_paciente_doctor_90;
				aux_medico_mas_paciente:=NomyApellido_medico;
			end;
			
		// Resumen por medico
		
		writeln ('El doctor: ',NomyApellido_medico);
		writeln ('Atendio a un total de: ',contador_paciente_doctor,' pacientes.') ; // Respuesta A
		writeln ('Atendio a un total de: ',contador_paciente_doctor_90,' pacientes mayores a 90 anios.') ; // Respuesta A
		writeln ('El porcentaje que representa los mayores de 90 anios es: ',contador_paciente_doctor_90*100/contador_paciente_doctor:2:0, '%' ); // Respuesta A
		writeln ('El total de pacientes sin Obra Social: ',sin_obra_social); // Respuesta C
		
	End;
	
	// Resumen final
	
	writeln ('La cantidad de pacientes sin obra social es: ',total_pacientes_sin_obra ); // Respuesta C
	
	writeln ('El promedio de pacientes atendidos por profesional es de: ', total_pacientes/3:20); // Respuesta E
	
	writeln ('El profesional que atendio mayor cantidad de pacientes mayores a 90: ',aux_medico_mas_paciente ); 
	writeln ('Fueron: ', medico_mas_pacientes, 'pacientes, que representan el: ',medico_mas_pacientes*100/total_pacientes_90:2:0 ,'% del total'); // respuesta A
	
	if aux_espec=false then // Respuesta B
		writeln ('Los doctores no poseen la misma especialidad')
	else
		writeln ('Los doctores poseen la misma especialidad');
		
	if aux_medico_buscado then
		begin 
			writeln ('La Doctora VIRGINIA ESTEVEZ atendio en el consultorio');
			writeln ('El promedio de edad es: ', promedio_del_buscado);
		end
	else	
		writeln ('La Doctora VIRGINIA ESTEVEZ no atendio en el consultorio');	
		
END.
