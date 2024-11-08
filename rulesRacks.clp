(defrule modificar_valor_voltaje
   ?modificacion <- (cambiar_valor_voltaje (id ?id) (valor ?nuevo_valor))
   ?rack <- (rack (id ?id) (sala ?nombre_sala))
   =>
   (printout t "Rack de id " ?id " en " ?nombre_sala " con nuevo voltaje de " ?nuevo_valor "." crlf)
   (modify ?rack (voltaje ?nuevo_valor))
   (retract ?modificacion)
)
(defrule activar_alerta_electrica
   ?rack <- (rack (id ?id) (sala ?nombre_sala) (voltaje ?voltaje) (alerta_voltaje no))
   (or 
      (test (< ?voltaje 210))
      (test (> ?voltaje 230))
   )
   =>
   (printout t "Rack de id " ?id " en " ?nombre_sala " con voltaje fuera de rango (" ?voltaje "). Activando alerta." crlf)
   (modify ?rack (alerta_voltaje si))
)

(defrule desactivar_alerta_electrica
   ?rack <- (rack (id ?id) (sala ?nombre_sala) (voltaje ?voltaje) (alerta_voltaje si))
   (test (>= ?voltaje 210))
   (test (<= ?voltaje 230))
   =>
   (printout t "Rack de id " ?id " en " ?nombre_sala " con voltaje dentro de rango (" ?voltaje "). Desactivando alerta." crlf)
   (modify ?rack (alerta_voltaje no))
)
