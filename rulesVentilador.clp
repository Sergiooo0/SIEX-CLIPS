(defrule encender_ventilador
   (sala (nombre ?nombre) (humedad_max ?maxima) (zona ?nombre_zona))
   ?sensor <- (sensor (sala ?nombre) (tipo humedad) (valor ?humedad) (leido no))
   ?ventilador <- (ventilador (sala ?nombre) (encendido no))
   (not (sensorZ (zona ?nombre_zona) (tipo humo) (valor si)))
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
   (printout t "La nueva intensidad es: " (+ ?intensidad 20) crlf)
   (modify ?sensor (leido si))
)
