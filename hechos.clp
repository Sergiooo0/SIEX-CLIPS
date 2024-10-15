(deffacts zonas
   (zona (nombre "Zona A") (tipo 1) (personas_presentes 1))
   (zona (nombre "Zona B") (tipo 2) (personas_presentes 0))
   (zona (nombre "Zona C") (tipo 0) (personas_presentes 1))
   (zona (nombre "Pasillo") (tipo 0) (personas_presentes 0))
)


(deffacts salas
    (sala (nombre "Sala A") (zona "Zona A") (iluminacion encendida))
    (sala (nombre "Sala B") (zona "Zona A"))
    (sala (nombre "Sala C") (zona "Zona B"))
    (sala (nombre "Sala D") (zona "Zona C") (iluminacion encendida))
    (sala (nombre "Sala E") (zona "Pasillo"))
)

(deffacts usuarios
    (usuario (id 777) (nombre "Sergio") (nivel_acceso 1) (sala_actual "Sala A"))
    (usuario (id 111) (nombre "Santiago") (nivel_acceso 0) (sala_actual "Sala D"))
)

(deffacts aire_acondicionados
    (aire_acondicionado (zona "Zona A"))
)

(deffacts ventiladores
    (ventilador (sala "Sala C"))
)

(deffacts racks
    (rack (id 1) (sala "Sala E") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 220))
)
