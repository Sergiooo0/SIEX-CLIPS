(deffacts zonas
    (zona (nombre "Zona A") (tipo 1) (personas_presentes 0))
    (zona (nombre "Zona B") (tipo 0) (personas_presentes 1))
    (zona (nombre "Zona C") (tipo 1) (personas_presentes 0))
)


(deffacts salas
    (sala (nombre "Sala A1") (zona "Zona A"))
    (sala (nombre "Sala A2") (zona "Zona A"))
    (sala (nombre "Sala B1") (zona "Zona B"))
    (sala (nombre "Sala B2") (zona "Zona B"))
    (sala (nombre "Sala C1") (zona "Zona C"))
    (sala (nombre "Sala C2") (zona "Zona C"))
)


(deffacts conexiones
    (conexion (zona1 "Zona A") (zona2 "Zona B"))
    (conexion (zona1 "Zona B") (zona2 "Zona C"))
    (conexion (zona1 "Zona C") (zona2 "Zona B"))
    (conexion (zona1 "Zona B") (zona2 "Zona A"))
)


(deffacts usuarios
    (usuario (id 1891) (nombre "Shi Yousan") (nivel_acceso 0) (sala_actual "Sala B1"))
)

(deffacts sensores
    (sensor (sala "Sala A1") (tipo agua) (valor no))
    (sensor (sala "Sala A1") (tipo humo) (valor no))
    (sensor (sala "Sala A2") (tipo agua) (valor no))
    (sensor (sala "Sala A2") (tipo humo) (valor no))
    (sensor (sala "Sala B1") (tipo agua) (valor no))
    (sensor (sala "Sala B1") (tipo humo) (valor no))
    (sensor (sala "Sala B2") (tipo agua) (valor no))
    (sensor (sala "Sala B2") (tipo humo) (valor no))
    (sensor (sala "Sala C1") (tipo agua) (valor no))
    (sensor (sala "Sala C1") (tipo humo) (valor no))
    (sensor (sala "Sala C2") (tipo agua) (valor no))
    (sensor (sala "Sala C2") (tipo humo) (valor no))
)