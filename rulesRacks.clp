(defrule activar_alerta_electrica
   ?rack <- (rack (id ?id) (sala ?nombre_sala) (voltaje ?voltaje) (alerta_voltaje no))
   (or 
      (test (< ?voltaje 210))
      (test (> ?voltaje 230))
   )
   =>
   (printout t "rack de id " ?id " en " ?nombre_sala " con voltaje fuera de rango (" ?voltaje ")." crlf)
   (modify ?rack (alerta_voltaje si))
)

(defrule desactivar_alerta_electrica
   ?rack <- (rack (id ?id) (sala ?nombre_sala) (voltaje ?voltaje) (alerta_voltaje si))
   (test (>= ?voltaje 210))
   (test (<= ?voltaje 230))
   =>
   (printout t "rack de id " ?id " en " ?nombre_sala " con voltaje dentro de rango (" ?voltaje ")." crlf)
   (modify ?rack (alerta_voltaje no))
)
