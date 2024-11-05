(deffacts zonas
   (zona (nombre "Zona A") (tipo 1))
   (zona (nombre "Zona B") (tipo 2))
   (zona (nombre "Zona D") (tipo 0))
)

(deffacts conexiones
    (conexion (zona1 "Zona A") (zona2 "Zona B"))
)

(deffacts salas
    (sala (nombre "Sala A1") (zona "Zona A"))
    (sala (nombre "Sala A2") (zona "Zona A"))
    (sala (nombre "Sala B1") (zona "Zona B"))
    (sala (nombre "Sala D1") (zona "Zona D"))
)

(deffacts sensores
    (sensor (sala "Sala A1") (tipo temperatura) (valor 20))
    (sensor (sala "Sala A1") (tipo humedad) (valor 20))
    
    (sensor (sala "Sala A2") (tipo temperatura) (valor 20))
    (sensor (sala "Sala A2") (tipo humedad) (valor 50))
    
    (sensor (sala "Sala B1") (tipo temperatura) (valor 0))  ;activará una regla
    (sensor (sala "Sala B1") (tipo humedad) (valor 40))     ;activará una regla
    
    (sensor (sala "Sala D1") (tipo temperatura) (valor 20))
    (sensor (sala "Sala D1") (tipo humedad) (valor 20))
)

(deffacts aire_acondicionados
    (aire_acondicionado (zona "Zona A"))
    (aire_acondicionado (zona "Zona B"))
    (aire_acondicionado (zona "Zona D"))
)

(deffacts ventiladores
    (ventilador (sala "Sala A1"))
    (ventilador (sala "Sala A2"))
    (ventilador (sala "Sala B1"))
    (ventilador (sala "Sala D1"))
)



(deffacts calefaccion
    (calefaccion_global (encendida no)))
