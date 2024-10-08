(deffacts usuarios
    (usuario (id 777) (nombre "Sergio") (nivel_acceso 1) (zona_actual "Zona C"))
    (usuario (id 111) (nombre "Santiago") (nivel_acceso 0) (zona_actual "Zona B"))
)

(deffacts zonas
   (zona (nombre "Zona A") (tipo 1) (personas_presentes 1) (temperatura 15) (humedad 20))
   (zona (nombre "Pasillo") (tipo 0) (personas_presentes 0) (temperatura 15) (humedad 20))
   (zona (nombre "Zona B") (tipo 2) (personas_presentes 0) (temperatura 15) (humedad 20))
   (zona (nombre "Zona C") (tipo 0) (personas_presentes 0) (temperatura 15) (humedad 20))
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
