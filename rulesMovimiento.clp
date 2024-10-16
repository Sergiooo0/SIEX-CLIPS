(defrule create-bidirectional-conexion
    (declare (salience 100)) ; High priority for this rule
    (conexion (zona1 ?z1) (zona2 ?z2))
    (not (conexion (zona1 ?z2) (zona2 ?z1)))
    =>
    ;; Assert the reverse connection
    (assert (conexion (zona1 ?z2) (zona2 ?z1)))
    (printout t "Created reverse connection between " ?z2 " and " ?z1 crlf)
)

(defrule moverse_en_zona
    (accion_moverse_sala (usuario ?nom_user) (sala ?nom_sala))
    ?usuario <- (usuario (id ?id) (nombre ?nom_user) (sala_actual ?sala_actual))
    (test (neq ?nom_sala ?sala_actual)) ; Que no sea la misma sala
    (sala (nombre ?nom_sala) (zona ?zona))
    (sala (nombre ?sala_actual) (zona ?zona2))
    (test (eq ?zona ?zona2))
    =>
    (printout t ?nom_user " de id " ?id " se ha movido a " ?nom_sala 
    " desde " ?sala_actual " sin salir de " ?zona "." crlf)
    (modify ?usuario (sala_actual ?nom_sala))
)


(defrule moverse_fuera_de_zona
    ?accion_moverse_sala <- (accion_moverse_sala (usuario ?nom_user) (sala ?nom_sala))
    ?usuario <- (usuario (id ?id) (nombre ?nom_user) (sala_actual ?sala_actual))
    (sala (nombre ?nom_sala) (zona ?zona))
    (sala (nombre ?sala_actual) (zona ?zona2))
    (test (neq ?zona ?zona2))
    =>
    (printout t ?nom_user " de id " ?id " se quiere mover a " ?nom_sala 
    " que está en " ?zona " desde " ?sala_actual " que está en " ?zona2 "." crlf)
    (retract ?accion_moverse_sala)
    (assert (accion_moverse (usuario ?nom_user) (zona ?zona) (sala ?nom_sala)))
)


(defrule no_hay_conexion
    (declare (salience 30))
    ?accion_moverse <- (accion_moverse (usuario ?nom_user) (zona ?nom_zona))
    (usuario (id ?id) (nombre ?nom_user) (sala_actual ?sala_actual))
    (sala (nombre ?sala_actual) (zona ?zona_actual))
    (not (conexion (zona1 ?zona_actual) (zona2 ?nom_zona)))
    =>
    (printout t ?nom_user " de id " ?id " no ha podido acceder a " ?nom_zona 
        " porque no hay conexión desde " ?zona_actual "." crlf)
    (retract ?accion_moverse)
)


(defrule acceso_denegado
    (declare (salience 20))
    ?accion_moverse <- (accion_moverse (usuario ?nom_user) (zona ?nom_zona))
    ?usuario <- (usuario (id ?id) (nombre ?nom_user) (nivel_acceso ?nivel_acceso))
    (zona (nombre ?nom_zona) (tipo ?tipo))
    (test (< ?nivel_acceso ?tipo))
    =>
    (printout t ?nom_user " de id " ?id " no ha podido acceder a " ?nom_zona " por motivos de seguridad." crlf)
    (retract ?accion_moverse)
)


(defrule acceso_permitido
    (declare (salience 10))
    ?accion_moverse <- (accion_moverse (usuario ?nom_user) (zona ?nom_zonaF) (sala ?nom_salaF))
    ?usuario <- (usuario (id ?id) (nombre ?nom_user) (nivel_acceso ?nivel_acceso) (sala_actual ?nom_salaI))
    ?zonaF <- (zona (nombre ?nom_zonaF) (tipo ?tipo) (personas_presentes ?personasF))
    (sala (nombre ?nom_salaI) (zona ?nom_zonaI))
    ?zonaI <- (zona (nombre ?nom_zonaI) (personas_presentes ?personasI))
    (test (>= ?nivel_acceso ?tipo))
    =>
    (printout t ?nom_user " de id " ?id " ha accedido a " ?nom_zonaF 
    " desde la zona " ?nom_zonaI "." crlf)
    (modify ?usuario (sala_actual ?nom_salaF))
    (modify ?zonaI (personas_presentes (- ?personasI 1)))
    (modify ?zonaF (personas_presentes (+ ?personasF 1)))
    (retract ?accion_moverse) 
)
