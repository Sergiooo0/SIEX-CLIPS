(deffacts zonas
   (zona (nombre "Zona A") (tipo 1) (personas_presentes 1))
   (zona (nombre "Zona B") (tipo 2) (personas_presentes 0))
   (zona (nombre "Zona C") (tipo 0) (personas_presentes 1))
   (zona (nombre "Zona D") (tipo 0) (personas_presentes 0))
   (zona (nombre "Pasillo") (tipo 0) (personas_presentes 0) (contenido normal))
)

(deffacts conexiones
    (conexion (zona1 "Pasillo") (zona2 "Zona A"))
    (conexion (zona1 "Pasillo") (zona2 "Zona B"))
    (conexion (zona1 "Pasillo") (zona2 "Zona C"))
    (conexion (zona1 "Pasillo") (zona2 "Zona D"))
    (conexion (zona1 "Zona A") (zona2 "Zona B"))
)

(deffacts salas
    (sala (nombre "Sala A1") (zona "Zona A") (iluminacion encendida))
    (sala (nombre "Sala A2") (zona "Zona A"))
    (sala (nombre "Sala B1") (zona "Zona B"))
    (sala (nombre "Sala C1") (zona "Zona C") (iluminacion encendida))
    (sala (nombre "Sala D1") (zona "Zona D") (iluminacion encendida))
    (sala (nombre "Sala P1") (zona "Pasillo"))
)

(deffacts usuarios
    (usuario (id 777) (nombre "Sergio") (nivel_acceso 1) (sala_actual "Sala A1"))
    (usuario (id 111) (nombre "Santiago") (nivel_acceso 0) (sala_actual "Sala C1"))
)

(deffacts sensores
    (sensor (sala "Sala A1") (tipo temperatura) (valor 20))
    (sensor (sala "Sala A1") (tipo humedad) (valor 20))
    (sensor (sala "Sala A1") (tipo agua) (valor no))
    (sensor (sala "Sala A1") (tipo humo) (valor no))
    
    (sensor (sala "Sala A2") (tipo temperatura) (valor 20))
    (sensor (sala "Sala A2") (tipo humedad) (valor 20))
    (sensor (sala "Sala A2") (tipo agua) (valor no))
    (sensor (sala "Sala A2") (tipo humo) (valor no))
    
    (sensor (sala "Sala B1") (tipo temperatura) (valor 0))  ;activará una regla
    (sensor (sala "Sala B1") (tipo humedad) (valor 40))     ;activará una regla
    (sensor (sala "Sala B1") (tipo agua) (valor no))
    (sensor (sala "Sala B1") (tipo humo) (valor no))
    
    (sensor (sala "Sala C1") (tipo temperatura) (valor 20))
    (sensor (sala "Sala C1") (tipo humedad) (valor 20))
    (sensor (sala "Sala C1") (tipo agua) (valor no))
    (sensor (sala "Sala C1") (tipo humo) (valor si))    ;activará una regla
    
    (sensor (sala "Sala D1") (tipo temperatura) (valor 20))
    (sensor (sala "Sala D1") (tipo humedad) (valor 20))
    (sensor (sala "Sala D1") (tipo agua) (valor si))      ;activará una regla
    (sensor (sala "Sala D1") (tipo humo) (valor no))
    
    (sensor (sala "Sala P1") (tipo temperatura) (valor 20))
    (sensor (sala "Sala P1") (tipo humedad) (valor 20))
    (sensor (sala "Sala P1") (tipo agua) (valor no))
    (sensor (sala "Sala P1") (tipo humo) (valor no))
)

(deffacts aire_acondicionados
    (aire_acondicionado (zona "Zona A"))
    (aire_acondicionado (zona "Zona B"))
    (aire_acondicionado (zona "Zona C"))
    (aire_acondicionado (zona "Zona D"))
)

(deffacts ventiladores
    (ventilador (sala "Sala A1"))
    (ventilador (sala "Sala A2"))
    (ventilador (sala "Sala B1"))
    (ventilador (sala "Sala C1"))
    (ventilador (sala "Sala D1"))
    (ventilador (sala "Sala P1"))
)

(deffacts racks
    (rack (id 1) (sala "Sala A1") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 220))
    (rack (id 2) (sala "Sala A2") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 220))
    (rack (id 3) (sala "Sala B1") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 220))
    (rack (id 4) (sala "Sala C1") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 220))
    (rack (id 5) (sala "Sala D1") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 220))
    (rack (id 6) (sala "Sala P1") (temperatura 20) (humedad 20) (temperatura_min 0) (temperatura_max 30) (voltaje 220))
)

(deffacts calefaccion
    (calefaccion_global (encendida no)))
