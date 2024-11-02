(deffacts zonas
    (zona (nombre "Zona A") (tipo 1) (personas_presentes 2))
    (zona (nombre "Zona B") (tipo 2) (personas_presentes 0))
    (zona (nombre "Zona C") (tipo 0) (personas_presentes 1))
    (zona (nombre "Pasillo1") (tipo 0) (personas_presentes 3))
    (zona (nombre "Pasillo2") (tipo 0) (personas_presentes 1))
    (zona (nombre "Zona D") (tipo 1) (personas_presentes 1))
)


(deffacts salas
    (sala (nombre "Sala A1") (zona "Zona A"))
    (sala (nombre "Sala A2") (zona "Zona A"))
    (sala (nombre "Sala B1") (zona "Zona B"))
    (sala (nombre "Sala C1") (zona "Zona C"))
    (sala (nombre "Sala P1") (zona "Pasillo1"))
    (sala (nombre "Sala P2") (zona "Pasillo2"))
    (sala (nombre "Sala A3") (zona "Zona A"))
    (sala (nombre "Sala D1") (zona "Zona D"))
    (sala (nombre "Sala D2") (zona "Zona D"))
    (sala (nombre "Sala B2") (zona "Zona B"))
)


(deffacts conexiones
    (conexion (zona1 "Zona A") (zona2 "Pasillo1"))
    (conexion (zona1 "Zona B") (zona2 "Pasillo1"))
    (conexion (zona1 "Zona C") (zona2 "Pasillo1"))
    (conexion (zona1 "Zona C") (zona2 "Zona A"))
    (conexion (zona1 "Zona D") (zona2 "Pasillo2"))
    (conexion (zona1 "Pasillo1") (zona2 "Pasillo2"))
)


(deffacts usuarios
    (usuario (id 777) (nombre "Sergio") (nivel_acceso 1) (sala_actual "Sala A1"))
    (usuario (id 111) (nombre "Santiago") (nivel_acceso 0) (sala_actual "Sala C1"))
    (usuario (id 222) (nombre "Juan") (nivel_acceso 0) (sala_actual "Sala P2"))
    (usuario (id 333) (nombre "Pedro") (nivel_acceso 2) (sala_actual "Sala A3"))
    (usuario (id 444) (nombre "Luis") (nivel_acceso 1) (sala_actual "Sala P1"))
    (usuario (id 555) (nombre "Carlos") (nivel_acceso 0) (sala_actual "Sala P1"))
    (usuario (id 666) (nombre "Andres") (nivel_acceso 2) (sala_actual "Sala P1"))
    (usuario (id 888) (nombre "Javier") (nivel_acceso 1) (sala_actual "Sala D1"))
)


(deffacts acciones
    (accion_moverse_sala (usuario "Sergio") (sala "Sala A2"))
    (accion_moverse_sala (usuario "Santiago") (sala "Sala B1"))
    (accion_moverse_sala (usuario "Juan") (sala "Sala C1"))
    (accion_moverse_sala (usuario "Pedro") (sala "Sala A1"))
    (accion_moverse_sala (usuario "Luis") (sala "Sala B1"))
    (accion_moverse_sala (usuario "Carlos") (sala "Sala P2"))
    (accion_moverse_sala (usuario "Andres") (sala "Sala C1"))
    (accion_moverse_sala (usuario "Javier") (sala "Sala C1"))
)