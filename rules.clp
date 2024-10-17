(defrule inicializar_sensores
   (declare (salience 100))
   ?inicializar <- (inicializar-sensores)
   ?sensor <- (sensor (sala ?sala) (tipo ?tipo) (leido si))
   =>
   (modify ?sensor (leido no))
   (printout t "Sensor de tipo " ?tipo " en la " ?sala " inicializado con leido = no." crlf)
)

(defrule fin_inicializar
   (declare (salience 100))
   ?inicializar <- (inicializar-sensores)
   (not (sensor (leido si)))
   =>
   (printout t "Ultimo sensor." crlf)
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

(defrule encender_aire_acondicionado
   (sala (nombre ?nombre) (zona ?zona) (temperatura_max ?maxima) (temperatura_min ?minima))
   ?sensor <- (sensor (sala ?nombre) (tipo temperatura) (valor ?temperatura) (leido no))
   ?aire_acondicionado <- (aire_acondicionado (zona ?zona) (encendido no))
   (or 
      (test (< ?temperatura ?minima))
      (test (> ?temperatura ?maxima))
   )
   =>
   (printout t ?nombre " con temperatura fuera de rango ideal (" ?temperatura ")." crlf)
   (printout t "Se va a encender el aire acondicionado en " ?zona "." crlf)
   (modify ?aire_acondicionado (encendido si) (intensidad 20))
   (modify ?sensor (leido si))
)

(defrule apagar_aire_acondicionado
   (sala (nombre ?nombre) (zona ?zona) (temperatura_max ?maxima) (temperatura_min ?minima))
   ?sensor <- (sensor (sala ?nombre) (tipo temperatura) (valor ?temperatura) (leido no))
   ?aire_acondicionado <- (aire_acondicionado (zona ?zona) (encendido si))
   (test (>= ?temperatura ?minima))
   (test (<= ?temperatura ?maxima))
   =>
   (printout t ?nombre " con temperatura en rango ideal (" ?temperatura ")." crlf)
   (printout t "Se va a apagar el aire acondicionado en " ?zona "." crlf)
   (modify ?aire_acondicionado (encendido no) (intensidad 0))
   (modify ?sensor (leido si))
)

(defrule mas_aire_acondicionado
   (sala (nombre ?nombre) (zona ?zona) (temperatura_max ?maxima) (temperatura_min ?minima))
   ?sensor <- (sensor (sala ?nombre) (tipo temperatura) (valor ?temperatura) (leido no))
   ?aire_acondicionado <- (aire_acondicionado (zona ?zona) (encendido si) (intensidad ?intensidad))
   (test (< ?temperatura ?minima))
   (test (< ?intensidad ?maxima))
   =>
   (printout t "Aumentando intensidad del aire acondicionado en " ?nombre ", " ?zona "." crlf)
   (modify ?aire_acondicionado (intensidad (+ ?intensidad 1)))
   (modify ?sensor (leido si))
)

(defrule menos_aire_acondicionado
   (sala (nombre ?nombre) (zona ?zona) (temperatura_max ?maxima) (temperatura_min ?minima))
   ?sensor <- (sensor (sala ?nombre) (tipo temperatura) (valor ?temperatura) (leido no))
   ?aire_acondicionado <- (aire_acondicionado (zona ?zona) (encendido si) (intensidad ?intensidad))
   (test (> ?temperatura ?maxima))
   (test (> ?intensidad ?minima))
   =>
   (printout t "Disminuyendo temperatura del aire acondicionado en " ?nombre ", " ?zona "." crlf)
   (modify ?aire_acondicionado (intensidad (- ?intensidad 1)))
   (modify ?sensor (leido si))
)

(defrule encender_ventilador
   (sala (nombre ?nombre) (humedad_max ?maxima))
   ?sensor <- (sensor (sala ?nombre) (tipo humedad) (valor ?humedad) (leido no))
   ?ventilador <- (ventilador (sala ?nombre) (encendido no)) 
   (test (> ?humedad ?maxima))
   =>
   (printout t ?nombre " con humedad fuera de rango ideal (" ?humedad ")." crlf)
   (printout t "Se va a encender el ventilador en " ?nombre "." crlf)
   (modify ?ventilador (encendido si) (intensidad 20))
   (modify ?sensor (leido si))
)

(defrule apagar_ventilador
   (sala (nombre ?nombre) (humedad_max ?maxima) (humedad_min ?minima))
   ?sensor <- (sensor (sala ?nombre) (tipo humedad) (valor ?humedad) (leido no))
   ?ventilador <- (ventilador (sala ?nombre) (encendido si))
   (test (<= ?humedad ?maxima))
   =>
   (printout t ?nombre " con humedad en rango ideal (" ?humedad ")." crlf)
   (printout t "Se va a apagar el ventilador en " ?nombre "." crlf)
   (modify ?ventilador (encendido no) (intensidad 0))
   (modify ?sensor (leido si))
)

(defrule mas_ventilador
   (sala (nombre ?nombre) (humedad_max ?maxima) (temperatura_min ?tem_minima))
   ?sensor <- (sensor (sala ?nombre) (tipo humedad) (valor ?humedad) (leido no))
   (sensor (sala ?nombre) (tipo temperatura) (valor ?temperatura))
   ?ventilador <- (ventilador (sala ?nombre) (encendido si) (intensidad ?intensidad))
   (test (> ?humedad ?maxima))
   (test (> ?temperatura ?tem_minima))
   (test (< ?intensidad 100))
   =>
   (printout t "Aumentando intensidad del ventilador en " ?nombre "." crlf)
   (modify ?ventilador (intensidad (+ ?intensidad 20)))
   (modify ?sensor (leido si))
)
