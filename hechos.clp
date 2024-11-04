(deffacts zonas
    (zona (nombre "Pasillo 0") (tipo 0) (contenido normal))
    (zona (nombre "Baños Planta Baja") (tipo 0) (contenido normal))
    (zona (nombre "Baños Primer Piso") (tipo 0) (contenido normal))
    (zona (nombre "Baños Segundo Piso") (tipo 0) (contenido normal))
    (zona (nombre "Escalera Principal") (tipo 0) (contenido normal))
    (zona (nombre "Pasillo 1") (tipo 0) (contenido normal))
    (zona (nombre "Pasillo 2") (tipo 0) (contenido normal))
    (zona (nombre "Escalera Secundaria") (tipo 1) (contenido normal))
    (zona (nombre "Pasillo -1") (tipo 1) (contenido normal))
    (zona (nombre "Zona Pública") (tipo 0) (contenido normal))
    (zona (nombre "Zona Recreativa") (tipo 0) (contenido normal))
    (zona (nombre "Despachos") (tipo 1) (contenido normal))
    (zona (nombre "Limpieza") (tipo 1) (contenido normal))
    (zona (nombre "Redes") (tipo 1))
    (zona (nombre "Potencia") (tipo 2))
    (zona (nombre "Servidores 1") (tipo 1))
    (zona (nombre "Servidores 2") (tipo 1))
    (zona (nombre "Alerta") (tipo 1))
    (zona (nombre "Almacenamiento") (tipo 2))
    (zona (nombre "Experimental") (tipo 2))
)

(deffacts conexiones
    (conexion (zona1 "Escalera Principal") (zona2 "Pasillo 0"))
    (conexion (zona1 "Escalera Principal") (zona2 "Pasillo 1"))
    (conexion (zona1 "Escalera Principal") (zona2 "Pasillo 2"))

    (conexion (zona1 "Escalera Secundaria") (zona2 "Pasillo -1"))
    (conexion (zona1 "Escalera Secundaria") (zona2 "Pasillo 0"))
    (conexion (zona1 "Escalera Secundaria") (zona2 "Pasillo 1"))
    (conexion (zona1 "Escalera Secundaria") (zona2 "Pasillo 2"))

    (conexion (zona1 "Pasillo 0") (zona2 "Baños Planta Baja"))
    (conexion (zona1 "Pasillo 0") (zona2 "Zona Pública"))
    (conexion (zona1 "Pasillo 0") (zona2 "Zona Recreativa"))
    (conexion (zona1 "Pasillo 0") (zona2 "Limpieza"))
    (conexion (zona1 "Pasillo 0") (zona2 "Zona de Servidores 1"))
    (conexion (zona1 "Pasillo 0") (zona2 "Experimental"))

    (conexion (zona1 "Pasillo 1") (zona2 "Baños Primer Piso"))
    (conexion (zona1 "Pasillo 1") (zona2 "Redes"))
    (conexion (zona1 "Pasillo 1") (zona2 "Servidores 2"))

    (conexion (zona1 "Pasillo 2") (zona2 "Baños Segundo Piso"))
    (conexion (zona1 "Pasillo 2") (zona2 "Despachos"))

    (conexion (zona1 "Pasillo -1") (zona2 "Potencia"))
    (conexion (zona1 "Pasillo -1") (zona2 "Alerta"))
    (conexion (zona1 "Pasillo -1") (zona2 "Almacenamiento"))

)

(deffacts salas
    (sala (nombre "Vestíbulo") (zona "Pasillo 0"))
    (sala (nombre "Pasillo") (zona "Pasillo 0"))
    (sala (nombre "Pasillo") (zona "Pasillo 1"))
    (sala (nombre "Pasillo") (zona "Pasillo 2"))
    (sala (nombre "Pasillo") (zona "Pasillo -1"))
    (sala (nombre "Baño minusválidos") (zona "Baños Planta Baja"))
    (sala (nombre "Baño mujeres") (zona "Baños Planta Baja"))
    (sala (nombre "Baño hombres") (zona "Baños Planta Baja"))
    (sala (nombre "Baño mujeres") (zona "Baños Primer Piso"))
    (sala (nombre "Baño hombres") (zona "Baños Primer Piso"))
    (sala (nombre "Baño mujeres") (zona "Baños Segundo Piso"))
    (sala (nombre "Baño hombres") (zona "Baños Segundo Piso"))
    (sala (nombre "Rellano 0") (zona "Escalera Principal"))
    (sala (nombre "Rellano 1") (zona "Escalera Principal"))
    (sala (nombre "Rellano 2") (zona "Escalera Principal"))
    (sala (nombre "Rellano -1") (zona "Escalera Secundaria"))
    (sala (nombre "Rellano 0") (zona "Escalera Secundaria"))
    (sala (nombre "Rellano 1") (zona "Escalera Secundaria"))
    (sala (nombre "Rellano 2") (zona "Escalera Secundaria"))
    (sala (nombre "Sala de reuniones") (zona "Zona Pública"))
    (sala (nombre "Sala de conferencias") (zona "Zona Pública"))
    (sala (nombre "Museo") (zona "Zona Pública"))
    (sala (nombre "Cocina") (zona "Zona Recreativa"))
    (sala (nombre "Billar") (zona "Zona Recreativa"))
    (sala (nombre "Dance Dance Revolution") (zona "Zona Recreativa"))
    (sala (nombre "Despacho del Director") (zona "Despachos"))
    (sala (nombre "Despachos 1") (zona "Despachos"))
    (sala (nombre "Despachos 2") (zona "Despachos"))
    (sala (nombre "Armario de limpieza") (zona "Limpieza"))
    (sala (nombre "Router") (zona "Redes"))
    (sala (nombre "Switch") (zona "Redes"))
    (sala (nombre "Firewall") (zona "Redes"))
    (sala (nombre "Generador geotérmico") (zona "Potencia"))
    (sala (nombre "Generador de reserva") (zona "Potencia"))
    (sala (nombre "Reactor Nuclear") (zona "Potencia"))
    (sala (nombre "Cuarto de climatización") (zona "Zona de Servidores 1"))
    (sala (nombre "Fila 1") (zona "Zona de Servidores 1"))
    (sala (nombre "Fila 2") (zona "Zona de Servidores 1"))
    (sala (nombre "Cuarto de climatización") (zona "Servidores 2"))
    (sala (nombre "Fila 1") (zona "Servidores 2"))
    (sala (nombre "Fila 2") (zona "Servidores 2"))
    (sala (nombre "Sala de control") (zona "Alerta"))
    (sala (nombre "Sistema de extinción por agua") (zona "Alerta"))
    (sala (nombre "Sistema de extinción por gas") (zona "Alerta"))
    (sala (nombre "Cinta magnética") (zona "Almacenamiento"))
    (sala (nombre "Disco duro") (zona "Almacenamiento"))
    (sala (nombre "Ordenador cuántico") (zona "Experimental"))
    (sala (nombre "Interfaces Neuronales") (zona "Experimental"))
    (sala (nombre "Realidad Virtual") (zona "Experimental"))
)

(deffacts usuarios
    (usuario (id 777) (nombre "Sergio") (nivel_acceso 1) (sala_actual "Generador geotérmico"))
    (usuario (id 111) (nombre "Santiago") (nivel_acceso 0) (sala_actual "Ordenador cuántico"))
    (usuario (id 222) (nombre "Juan") (nivel_acceso 0) (sala_actual "Pasillo"))
    (usuario (id 333) (nombre "Pedro") (nivel_acceso 2) (sala_actual "Despachos 2"))
    (usuario (id 444) (nombre "Luis") (nivel_acceso 1) (sala_actual "Pasillo"))
    (usuario (id 555) (nombre "Carlos") (nivel_acceso 0) (sala_actual "Sala de conferencias"))
    (usuario (id 666) (nombre "Andres") (nivel_acceso 2) (sala_actual "Sala de conferencias"))
    (usuario (id 888) (nombre "Javier") (nivel_acceso 1) (sala_actual "Pasillo"))
)

(deffacts sensores
   (sensor (sala "Vestíbulo") (tipo temperatura) (valor 20))
   (sensor (sala "Vestíbulo") (tipo humedad) (valor 20))
   
   (sensor (sala "Pasillo") (tipo temperatura) (valor 20))
   (sensor (sala "Pasillo") (tipo humedad) (valor 20))
   
   (sensor (sala "Baño minusválidos") (tipo temperatura) (valor 20))
   (sensor (sala "Baño minusválidos") (tipo humedad) (valor 20))
   
   (sensor (sala "Baño mujeres") (tipo temperatura) (valor 20))
   (sensor (sala "Baño mujeres") (tipo humedad) (valor 20))
   
   (sensor (sala "Baño hombres") (tipo temperatura) (valor 20))
   (sensor (sala "Baño hombres") (tipo humedad) (valor 20))
   
   (sensor (sala "Baño mujeres") (tipo temperatura) (valor 20))
   (sensor (sala "Baño mujeres") (tipo humedad) (valor 20))
   
   (sensor (sala "Baño hombres") (tipo temperatura) (valor 20))
   (sensor (sala "Baño hombres") (tipo humedad) (valor 20))
   
   (sensor (sala "Rellano 0") (tipo temperatura) (valor 20))
   (sensor (sala "Rellano 0") (tipo humedad) (valor 20))
   
   (sensor (sala "Rellano 1") (tipo temperatura) (valor 20))
   (sensor (sala "Rellano 1") (tipo humedad) (valor 20))
   
   (sensor (sala "Rellano 2") (tipo temperatura) (valor 20))
   (sensor (sala "Rellano 2") (tipo humedad) (valor 20))
   
   (sensor (sala "Rellano -1") (tipo temperatura) (valor 20))
   (sensor (sala "Rellano -1") (tipo humedad) (valor 20))
   
   (sensor (sala "Sala de reuniones") (tipo temperatura) (valor 20))
   (sensor (sala "Sala de reuniones") (tipo humedad) (valor 20))
   
   (sensor (sala "Sala de conferencias") (tipo temperatura) (valor 20))
   (sensor (sala "Sala de conferencias") (tipo humedad) (valor 20))
   
   (sensor (sala "Museo") (tipo temperatura) (valor 20))
   (sensor (sala "Museo") (tipo humedad) (valor 20))
   
   (sensor (sala "Cocina") (tipo temperatura) (valor 20))
   (sensor (sala "Cocina") (tipo humedad) (valor 20))
   
   (sensor (sala "Billar") (tipo temperatura) (valor 20))
   (sensor (sala "Billar") (tipo humedad) (valor 20))
   
   (sensor (sala "Dance Dance Revolution") (tipo temperatura) (valor 20))
   (sensor (sala "Dance Dance Revolution") (tipo humedad) (valor 20))
   
   (sensor (sala "Despacho del Director") (tipo temperatura) (valor 20))
   (sensor (sala "Despacho del Director") (tipo humedad) (valor 20))
   
   (sensor (sala "Despachos 1") (tipo temperatura) (valor 20))
   (sensor (sala "Despachos 1") (tipo humedad) (valor 20))
   
   (sensor (sala "Despachos 2") (tipo temperatura) (valor 20))
   (sensor (sala "Despachos 2") (tipo humedad) (valor 20))
   
   (sensor (sala "Armario de limpieza") (tipo temperatura) (valor 20))
   (sensor (sala "Armario de limpieza") (tipo humedad) (valor 20))
   
   (sensor (sala "Router") (tipo temperatura) (valor 20))
   (sensor (sala "Router") (tipo humedad) (valor 20))
   
   (sensor (sala "Switch") (tipo temperatura) (valor 20))
   (sensor (sala "Switch") (tipo humedad) (valor 20))
   
   (sensor (sala "Firewall") (tipo temperatura) (valor 20))
   (sensor (sala "Firewall") (tipo humedad) (valor 20))
   
   (sensor (sala "Generador geotérmico") (tipo temperatura) (valor 20))
   (sensor (sala "Generador geotérmico") (tipo humedad) (valor 20))
   
   (sensor (sala "Generador de reserva") (tipo temperatura) (valor 20))
   (sensor (sala "Generador de reserva") (tipo humedad) (valor 20))
   
   (sensor (sala "Reactor Nuclear") (tipo temperatura) (valor 20))
   (sensor (sala "Reactor Nuclear") (tipo humedad) (valor 20))
   
   (sensor (sala "Cuarto de climatización") (tipo temperatura) (valor 20))
   (sensor (sala "Cuarto de climatización") (tipo humedad) (valor 20))
   
   (sensor (sala "Fila 1") (tipo temperatura) (valor 20))
   (sensor (sala "Fila 1") (tipo humedad) (valor 20))
   
   (sensor (sala "Fila 2") (tipo temperatura) (valor 20))
   (sensor (sala "Fila 2") (tipo humedad) (valor 20))
   
   (sensor (sala "Sala de control") (tipo temperatura) (valor 20))
   (sensor (sala "Sala de control") (tipo humedad) (valor 20))
   
   (sensor (sala "Sistema de extinción por agua") (tipo temperatura) (valor 20))
   (sensor (sala "Sistema de extinción por agua") (tipo humedad) (valor 20))
   
   (sensor (sala "Sistema de extinción por gas") (tipo temperatura) (valor 20))
   (sensor (sala "Sistema de extinción por gas") (tipo humedad) (valor 20))
   
   (sensor (sala "Cinta magnética") (tipo temperatura) (valor 20))
   (sensor (sala "Cinta magnética") (tipo humedad) (valor 20))
   
   (sensor (sala "Disco duro") (tipo temperatura) (valor 20))
   (sensor (sala "Disco duro") (tipo humedad) (valor 20))
   
   (sensor (sala "Ordenador cuántico") (tipo temperatura) (valor 20))
   (sensor (sala "Ordenador cuántico") (tipo humedad) (valor 20))
   
   (sensor (sala "Interfaces Neuronales") (tipo temperatura) (valor 20))
   (sensor (sala "Interfaces Neuronales") (tipo humedad) (valor 20))
   
   (sensor (sala "Realidad Virtual") (tipo temperatura) (valor 20))
   (sensor (sala "Realidad Virtual") (tipo humedad) (valor 20))
)

(deffacts sensores_zona
   (sensorZ (zona "Pasillo 0") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Pasillo 0") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Baños Planta Baja") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Baños Planta Baja") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Baños Primer Piso") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Baños Primer Piso") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Baños Segundo Piso") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Baños Segundo Piso") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Escalera Principal") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Escalera Principal") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Pasillo 1") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Pasillo 1") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Pasillo 2") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Pasillo 2") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Escalera Secundaria") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Escalera Secundaria") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Pasillo -1") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Pasillo -1") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Zona Pública") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Zona Pública") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Zona Recreativa") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Zona Recreativa") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Despachos") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Despachos") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Limpieza") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Limpieza") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Redes") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Redes") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Potencia") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Potencia") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Servidores 1") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Servidores 1") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Servidores 2") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Servidores 2") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Alerta") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Alerta") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Almacenamiento") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Almacenamiento") (tipo agua) (valor no) (leido no))

   (sensorZ (zona "Experimental") (tipo humo) (valor no) (leido no))
   (sensorZ (zona "Experimental") (tipo agua) (valor no) (leido no))
)




(deffacts ventiladores
   (ventilador (sala "Vestíbulo"))
   (ventilador (sala "Pasillo"))
   (ventilador (sala "Baño minusválidos"))
   (ventilador (sala "Baño mujeres"))
   (ventilador (sala "Baño hombres"))
   (ventilador (sala "Sala de reuniones"))
   (ventilador (sala "Cocina"))
   (ventilador (sala "Despacho del Director"))
   (ventilador (sala "Sala de conferencias"))
   (ventilador (sala "Museo"))
   (ventilador (sala "Billar"))
   (ventilador (sala "Dance Dance Revolution"))
   (ventilador (sala "Despachos 1"))
   (ventilador (sala "Despachos 2"))
   (ventilador (sala "Armario de limpieza"))
   (ventilador (sala "Router"))
   (ventilador (sala "Switch"))
   (ventilador (sala "Firewall"))
   (ventilador (sala "Generador geotérmico"))
   (ventilador (sala "Generador de reserva"))
   (ventilador (sala "Reactor Nuclear"))
   (ventilador (sala "Cuarto de climatización"))
   (ventilador (sala "Fila 1"))
   (ventilador (sala "Fila 2"))
   (ventilador (sala "Sala de control"))
   (ventilador (sala "Sistema de extinción por agua"))
   (ventilador (sala "Sistema de extinción por gas"))
   (ventilador (sala "Cinta magnética"))
   (ventilador (sala "Disco duro"))
   (ventilador (sala "Ordenador cuántico"))
   (ventilador (sala "Interfaces Neuronales"))
   (ventilador (sala "Realidad Virtual"))
)


(deffacts aire_acondicionados
   (aire_acondicionado (zona "Zona Pública"))
   (aire_acondicionado (zona "Zona Recreativa"))
   (aire_acondicionado (zona "Despachos"))
   (aire_acondicionado (zona "Redes"))
   (aire_acondicionado (zona "Potencia"))
   (aire_acondicionado (zona "Servidores 1"))
   (aire_acondicionado (zona "Servidores 2"))
   (aire_acondicionado (zona "Alerta"))
   (aire_acondicionado (zona "Almacenamiento"))
   (aire_acondicionado (zona "Experimental"))
)


(deffacts racks
   (rack (id 1) (sala "Router") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 220))
   (rack (id 2) (sala "Switch") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 230))
   (rack (id 3) (sala "Firewall") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 215))
   (rack (id 4) (sala "Fila 1") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 225))
   (rack (id 5) (sala "Fila 1") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 210))
   (rack (id 6) (sala "Fila 2") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 220))
   (rack (id 7) (sala "Fila 2") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 230))
   (rack (id 8) (sala "Disco duro") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 212))
   (rack (id 9) (sala "Disco duro") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 218))
)


(deffacts calefaccion
   (calefaccion_global (encendida no))
)