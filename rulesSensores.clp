(defrule inicializar_sensores
   (declare (salience 100))
   (inicializar-sensores)
   ?sensor <- (sensor (sala ?sala) (tipo ?tipo) (leido si))
   =>
   (modify ?sensor (leido no))
   ;(printout t "Sensor de tipo " ?tipo " en la " ?sala " inicializado con leido = no." crlf)
)

(defrule inicializar_sensoresZ
   (declare (salience 100))
   (inicializar-sensores)
   ?sensor <- (sensorZ (zona ?zona) (tipo ?tipo) (leido si))
   =>
   (modify ?sensor (leido no))
   ;(printout t "Sensor de tipo " ?tipo " en la " ?zona " inicializado con leido = no." crlf)
)

(defrule fin_inicializar
   (declare (salience 100))
   ?inicializar <- (inicializar-sensores)
   (not (sensor (leido si)))
   (not (sensorZ (leido si)))
   =>
   (printout t "Todos los sensores preparados para ser leidos." crlf)
   (retract ?inicializar)
)

(defrule modificar_sensor
   ?modificacion <- (cambiar_valor (sala ?sala) (tipo ?tipo) (valor ?valor))
   ?sensor <- (sensor (sala ?sala) (tipo ?tipo))
   =>
   (printout t "El sensor de " ?tipo " en " ?sala " tiene un nuevo valor de: " ?valor "." crlf)
   (modify ?sensor (valor ?valor))
   (retract ?modificacion)
)

(defrule modificar_sensorZ
   ?modificacion <- (cambiar_valorZ (zona ?zona) (tipo ?tipo) (valor ?valor))
   ?sensor <- (sensorZ (zona ?zona) (tipo ?tipo))
   =>
   (printout t "El sensor de " ?tipo " en " ?zona " tiene un nuevo valor de: " ?valor "." crlf)
   (modify ?sensor (valor ?valor))
   (retract ?modificacion)
)