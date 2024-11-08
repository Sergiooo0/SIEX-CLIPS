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
    (zona (nombre "Zona Pública") (tipo 0) (contenido normal) (personas_presentes 2))
    (zona (nombre "Zona Recreativa") (tipo 0) (contenido normal))
    (zona (nombre "Despachos") (tipo 1) (contenido normal) (personas_presentes 1))
    (zona (nombre "Limpieza") (tipo 1) (contenido normal))
    (zona (nombre "Redes") (tipo 1) (personas_presentes 2))
    (zona (nombre "Potencia") (tipo 2) (personas_presentes 2))
    (zona (nombre "Servidores 1") (tipo 1))
    (zona (nombre "Servidores 2") (tipo 1))
    (zona (nombre "Gestión de Crisis") (tipo 1))
    (zona (nombre "Almacenamiento") (tipo 2))
    (zona (nombre "Experimental") (tipo 2) (personas_presentes 2))
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
    (conexion (zona1 "Pasillo -1") (zona2 "Gestión de Crisis"))
    (conexion (zona1 "Pasillo -1") (zona2 "Almacenamiento"))

)

(deffacts salas
    (sala (nombre "Vestíbulo") (zona "Pasillo 0"))
    (sala (nombre "Pasillo 0") (zona "Pasillo 0"))
    (sala (nombre "Pasillo 1") (zona "Pasillo 1"))
    (sala (nombre "Pasillo 2") (zona "Pasillo 2"))
    (sala (nombre "Pasillo -1") (zona "Pasillo -1"))
    (sala (nombre "Baño minusválidos") (zona "Baños Planta Baja"))
    (sala (nombre "Baño mujeres 0") (zona "Baños Planta Baja"))
    (sala (nombre "Baño hombres 0") (zona "Baños Planta Baja"))
    (sala (nombre "Baño mujeres 1") (zona "Baños Primer Piso"))
    (sala (nombre "Baño hombres 1") (zona "Baños Primer Piso"))
    (sala (nombre "Baño mujeres 2") (zona "Baños Segundo Piso"))
    (sala (nombre "Baño hombres 2") (zona "Baños Segundo Piso"))
    (sala (nombre "Rellano 0") (zona "Escalera Principal"))
    (sala (nombre "Rellano 1") (zona "Escalera Principal"))
    (sala (nombre "Rellano 2") (zona "Escalera Principal"))
    (sala (nombre "Rellano -1") (zona "Escalera Secundaria"))
    (sala (nombre "Rellano 0S") (zona "Escalera Secundaria"))
    (sala (nombre "Rellano 1S") (zona "Escalera Secundaria"))
    (sala (nombre "Rellano 2S") (zona "Escalera Secundaria"))
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
    (sala (nombre "Cuarto de climatización 1") (zona "Zona de Servidores 1"))
    (sala (nombre "Fila 1") (zona "Zona de Servidores 1") (temperatura_min 27) (temperatura_max 29) (humedad_min 40) (humedad_max 50))
    (sala (nombre "Fila 2") (zona "Zona de Servidores 1") (temperatura_min 27) (temperatura_max 29) (humedad_min 40) (humedad_max 50))
    (sala (nombre "Cuarto de climatización 2") (zona "Servidores 2"))
    (sala (nombre "Fila 2.1") (zona "Servidores 2") (temperatura_min 27) (temperatura_max 29) (humedad_min 40) (humedad_max 50))
    (sala (nombre "Fila 2.2") (zona "Servidores 2") (temperatura_min 27) (temperatura_max 29) (humedad_min 40) (humedad_max 50))
    (sala (nombre "Sala de control") (zona "Gestión de Crisis"))
    (sala (nombre "Sistema de extinción por agua") (zona "Gestión de Crisis"))
    (sala (nombre "Sistema de extinción por gas") (zona "Gestión de Crisis"))
    (sala (nombre "Cinta magnética") (zona "Almacenamiento"))
    (sala (nombre "Disco duro") (zona "Almacenamiento"))
    (sala (nombre "Ordenador cuántico") (zona "Experimental") (temperatura_min -20) (temperatura_max -10))
    (sala (nombre "Interfaces Neuronales") (zona "Experimental"))
    (sala (nombre "Realidad Virtual") (zona "Experimental"))
)

(deffacts usuarios
    (usuario (id 777) (nombre "Sergio") (nivel_acceso 1) (sala_actual "Generador geotérmico"))
    (usuario (id 111) (nombre "Santiago") (nivel_acceso 0) (sala_actual "Ordenador cuántico"))
    (usuario (id 222) (nombre "Juan") (nivel_acceso 0) (sala_actual "Reactor Nuclear"))
    (usuario (id 333) (nombre "Pedro") (nivel_acceso 2) (sala_actual "Despachos 2"))
    (usuario (id 444) (nombre "Luis") (nivel_acceso 1) (sala_actual "Router"))
    (usuario (id 555) (nombre "Carlos") (nivel_acceso 0) (sala_actual "Sala de conferencias"))
    (usuario (id 666) (nombre "Andres") (nivel_acceso 2) (sala_actual "Sala de conferencias"))
    (usuario (id 888) (nombre "Javier") (nivel_acceso 1) (sala_actual "Switch"))
)

(deffacts sensores
   (sensor (sala "Vestíbulo") (tipo temperatura) (valor 20))
   
   (sensor (sala "Baño minusválidos") (tipo temperatura) (valor 20))
   
   (sensor (sala "Baño mujeres 0") (tipo temperatura) (valor 20))
   
   (sensor (sala "Baño hombres 0") (tipo temperatura) (valor 20))
   
   (sensor (sala "Baño mujeres 1") (tipo temperatura) (valor 20))
   
   (sensor (sala "Baño hombres 1") (tipo temperatura) (valor 20))
   
   (sensor (sala "Rellano 0") (tipo temperatura) (valor 20))
   
   (sensor (sala "Rellano 1") (tipo temperatura) (valor 20))
   
   (sensor (sala "Rellano 2") (tipo temperatura) (valor 20))
   
   (sensor (sala "Sala de reuniones") (tipo temperatura) (valor 20))
   
   (sensor (sala "Sala de conferencias") (tipo temperatura) (valor 20))
   
   (sensor (sala "Museo") (tipo temperatura) (valor 20))
   (sensor (sala "Museo") (tipo humedad) (valor 20))
   
   (sensor (sala "Cocina") (tipo temperatura) (valor 20))
   
   (sensor (sala "Billar") (tipo temperatura) (valor 20))
   
   (sensor (sala "Dance Dance Revolution") (tipo temperatura) (valor 20))
   
   (sensor (sala "Despacho del Director") (tipo temperatura) (valor 20))
   
   (sensor (sala "Despachos 1") (tipo temperatura) (valor 20))
      
   (sensor (sala "Armario de limpieza") (tipo temperatura) (valor 20))
   
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
   
   (sensor (sala "Cuarto de climatización 1") (tipo temperatura) (valor 20))
   (sensor (sala "Cuarto de climatización 1") (tipo humedad) (valor 20))

   (sensor (sala "Cuarto de climatización 2") (tipo temperatura) (valor 20))
   (sensor (sala "Cuarto de climatización 2") (tipo humedad) (valor 20))
   
   (sensor (sala "Fila 1") (tipo temperatura) (valor 20))
   (sensor (sala "Fila 1") (tipo humedad) (valor 20))
   
   (sensor (sala "Fila 2") (tipo temperatura) (valor 20))
   (sensor (sala "Fila 2") (tipo humedad) (valor 20))

   (sensor (sala "Fila 2.1") (tipo temperatura) (valor 20))
   (sensor (sala "Fila 2.1") (tipo humedad) (valor 20))

   (sensor (sala "Fila 2.2") (tipo temperatura) (valor 20))
   (sensor (sala "Fila 2.2") (tipo humedad) (valor 20))
   
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

(deffacts ventiladores
   (ventilador (sala "Vestíbulo"))
   (ventilador (sala "Sala de reuniones"))
   (ventilador (sala "Cocina"))
   (ventilador (sala "Despacho del Director"))
   (ventilador (sala "Sala de conferencias"))
   (ventilador (sala "Museo"))
   (ventilador (sala "Billar"))
   (ventilador (sala "Dance Dance Revolution"))
   (ventilador (sala "Armario de limpieza"))
   (ventilador (sala "Router"))
   (ventilador (sala "Switch"))
   (ventilador (sala "Firewall"))
   (ventilador (sala "Generador geotérmico"))
   (ventilador (sala "Generador de reserva"))
   (ventilador (sala "Reactor Nuclear"))
   (ventilador (sala "Cuarto de climatización 1"))
   (ventilador (sala "Cuarto de climatización 2"))
   (ventilador (sala "Fila 1"))
   (ventilador (sala "Fila 2"))
   (ventilador (sala "Fila 2.1"))
   (ventilador (sala "Fila 2.2"))
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
   (aire_acondicionado (zona "Gestión de Crisis"))
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
   (rack (id 10) (sala "Fila 2.1") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 220))
   (rack (id 11) (sala "Fila 2.1") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 225))
   (rack (id 12) (sala "Fila 2.2") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 220))
   (rack (id 13) (sala "Fila 2.2") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 230))
)


(deffacts calefaccion
   (calefaccion_global (encendida no))
)