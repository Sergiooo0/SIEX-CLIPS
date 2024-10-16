(deffacts zonas
    (zona (nombre "Zona A") (tipo 1) (personas_presentes 2))
    (zona (nombre "Zona B") (tipo 2) (personas_presentes 0))
    (zona (nombre "Zona C") (tipo 0) (personas_presentes 1))
    (zona (nombre "Pasillo1") (tipo 0) (personas_presentes 3))
    (zona (nombre "Pasillo2") (tipo 0) (personas_presentes 1))
    (zona (nombre "Zona D") (tipo 1) (personas_presentes 1))
)


(deffacts salas
    (sala (nombre "Sala A") (zona "Zona A"))
    (sala (nombre "Sala B") (zona "Zona A"))
    (sala (nombre "Sala C") (zona "Zona B"))
    (sala (nombre "Sala D") (zona "Zona C"))
    (sala (nombre "Sala E") (zona "Pasillo1"))
    (sala (nombre "Sala F") (zona "Pasillo2"))
    (sala (nombre "Sala G") (zona "Zona A"))
    (sala (nombre "Sala H") (zona "Zona D"))
    (sala (nombre "Sala I") (zona "Zona D"))
    (sala (nombre "Sala J") (zona "Zona B"))
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
    (usuario (id 777) (nombre "Sergio") (nivel_acceso 1) (sala_actual "Sala A"))
    (usuario (id 111) (nombre "Santiago") (nivel_acceso 0) (sala_actual "Sala D"))
    (usuario (id 222) (nombre "Juan") (nivel_acceso 0) (sala_actual "Sala F"))
    (usuario (id 333) (nombre "Pedro") (nivel_acceso 2) (sala_actual "Sala G"))
    (usuario (id 444) (nombre "Luis") (nivel_acceso 1) (sala_actual "Sala E"))
    (usuario (id 555) (nombre "Carlos") (nivel_acceso 0) (sala_actual "Sala E"))
    (usuario (id 666) (nombre "Andres") (nivel_acceso 2) (sala_actual "Sala E"))
    (usuario (id 888) (nombre "Javier") (nivel_acceso 1) (sala_actual "Sala H"))
)


(deffacts acciones
    (accion_moverse_sala (usuario "Sergio") (sala "Sala B"))
    (accion_moverse_sala (usuario "Santiago") (sala "Sala C"))
    (accion_moverse_sala (usuario "Juan") (sala "Sala D"))
    (accion_moverse_sala (usuario "Pedro") (sala "Sala A"))
    (accion_moverse_sala (usuario "Luis") (sala "Sala C"))
    (accion_moverse_sala (usuario "Carlos") (sala "Sala F"))
    (accion_moverse_sala (usuario "Andres") (sala "Sala D"))
    (accion_moverse_sala (usuario "Javier") (sala "Sala D"))
)