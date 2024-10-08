(deffacts usuarios
    (usuario (id 777) (nombre Sergio) (nivel_acceso 2) (zona_actual "Zona A"))
)

(deffacts zonas
   (zona (nombre "Zona A") (tipo 1) (personas_presentes 1) (temperatura 15) (humedad 20))
   (zona (nombre "Pasillo") (tipo 0) (personas_presentes 0) (temperatura 15) (humedad 20))
)

(deffacts aire_acondicionados
    (aire_acondicionado (zona "Zona A"))
)

(deffacts ventiladores
    (ventilador (zona "Zona A"))
)

(deffacts racks
    (rack (id 1) (zona "Zona A") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 220))
)