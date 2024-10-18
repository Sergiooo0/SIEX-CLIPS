(defrule encender_luces
    ?salas <- (sala (nombre ?nom_sala) (iluminacion apagada))
    (usuario (sala_actual ?nom_sala))
    =>
    (printout t "Se ha encendido la luz de la sala " ?nom_sala "." crlf)
    (modify ?salas (iluminacion encendida))
)

(defrule apagar_luces
    ?salas <- (sala (nombre ?nom_sala) (iluminacion encendida))
    (not (usuario (sala_actual ?nom_sala)))
    =>
    (printout t "Se ha apagado la luz de la sala " ?nom_sala "." crlf)
    (modify ?salas (iluminacion apagada))
)