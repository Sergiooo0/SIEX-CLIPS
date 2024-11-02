(defrule inicializar_sensores
   (declare (salience 100))
   ?inicializar <- (inicializar-sensores)
   ?sensor <- (sensor (sala ?sala) (tipo ?tipo) (leido si))
   =>
   (modify ?sensor (leido no))
   ;(printout t "Sensor de tipo " ?tipo " en la " ?sala " inicializado con leido = no." crlf)
)

(defrule fin_inicializar
   (declare (salience 100))
   ?inicializar <- (inicializar-sensores)
   (not (sensor (leido si)))
   =>
   (printout t "Todos los sensores preparados para ser leidos." crlf)
   (retract ?inicializar)
)

(defrule modificar_sensor
   ?modificacion <- (cambiar_valor (sala ?sala) (tipo ?tipo) (valor ?valor))
   ?sensor <- (sensor (sala ?sala) (tipo ?tipo))
   =>
   (printout t "El sensor de " ?tipo " en " ?sala " es de " ?valor "." crlf)
   (modify ?sensor (valor ?valor))
   (retract ?modificacion)
)