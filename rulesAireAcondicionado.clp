(defrule encender_aire_acondicionado
   (sala (nombre ?nombre) (zona ?zona) (temperatura_max ?maxima) (temperatura_min ?minima))
   ?sensor <- (sensor (sala ?nombre) (tipo temperatura) (valor ?temperatura) (leido no))
   (not (zona (nombre ?zona) (en_evacuacion si)))
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
   (printout t "La nueva intensidad es: " (+ ?intensidad 1) crlf)
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
   (printout t "La nueva intensidad es: " (- ?intensidad 1) crlf)
   (modify ?sensor (leido si))
)