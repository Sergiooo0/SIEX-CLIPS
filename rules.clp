(defrule acceso_permitido
   ?accion_moverse <- (accion_moverse (usuario ?nom_user) (zona ?nom_zona))
   ?usuario <- (usuario (id ?id) (nombre ?nom_user) (nivel_acceso ?nivel_acceso))
   (zona (nombre ?nom_zona) (tipo ?tipo))
   (test (>= ?nivel_acceso ?tipo))
   =>
   (printout t ?nom_user " de id " ?id " ha accedido a " ?nom_zona "." crlf)
   (modify ?usuario (zona_actual ?nom_zona))
   (retract ?accion_moverse) 
)

(defrule acceso_denegado
   ?accion_moverse <- (accion_moverse (usuario ?nom_user) (zona ?nom_zona))
   ?usuario <- (usuario (id ?id) (nombre ?nom_user) (nivel_acceso ?nivel_acceso))
   (zona (nombre ?nom_zona) (tipo ?tipo))
   (test (< ?nivel_acceso ?tipo))
   =>
   (printout t ?nom_user " de id " ?id " no ha podido acceder a " ?nom_zona "." crlf)
   (retract ?accion_moverse)
)

(defrule activar_alerta_electrica
   ?rack <- (rack (id ?id) (zona ?nombre_zona) (voltaje ?voltaje) (alerta_voltaje no))
   (or 
      (test (< ?voltaje 210))
      (test (> ?voltaje 230))
   )
   =>
   (printout t " rack de id " ?id " en " ?nombre_zona " con voltaje fuera de rango (" ?voltaje ")." crlf)
   (modify ?rack (alerta_voltaje si))
)

(defrule desactivar_alerta_electrica
   ?rack <- (rack (id ?id) (zona ?nombre_zona) (voltaje ?voltaje) (alerta_voltaje si))
   (test (>= ?voltaje 210))
   (test (<= ?voltaje 230))
   =>
   (printout t " rack de id " ?id " en " ?nombre_zona " con voltaje dentro de rango (" ?voltaje ")." crlf)
   (modify ?rack (alerta_voltaje no))
)

(defrule encender_aire_acondicionado
   (zona (nombre ?nombre) (temperatura_max ?maxima) (temperatura_min ?minima))
   ?sensor <- (sensor (zona ?nombre) (tipo temperatura) (valor ?temperatura))
   ?aire_acondicionado <- (aire_acondicionado (zona ?nombre) (encendido no))
   (or 
      (test (< ?temperatura ?minima))
      (test (> ?temperatura ?maxima))
   )
   =>
   (printout t ?nombre " con temperatura fuera de rango ideal (" ?temperatura ")." crlf)
   (printout t  "Se va a encender el aire aconcionado en " ?nombre "." crlf)
   (modify ?aire_acondicionado (encendido si) (intensidad 20))
   (retract ?sensor))

(defrule apagar_aire_acondicionado
   (zona (nombre ?nombre) (temperatura_max ?maxima) (temperatura_min ?minima))
   ?sensor <-(sensor (zona ?nombre) (tipo temperatura) (valor ?temperatura))
   ?aire_acondicionado <- (aire_acondicionado (zona ?nombre) (encendido si))
   (test (>= ?temperatura ?minima))
   (test (<= ?temperatura ?maxima))
   =>
   (printout t ?nombre " con temperatura en rango ideal (" ?temperatura ")." crlf)
   (printout t  "Se va a apagar el aire aconcionado en " ?nombre "." crlf)
   (modify ?aire_acondicionado (encendido no) (intensidad 0))
   (retract ?sensor))

(defrule mas_aire_acondicionado
   (zona (nombre ?nombre) (temperatura_max ?maxima) (temperatura_min ?minima))
   ?sensor <- (sensor (zona ?nombre) (tipo temperatura) (valor ?temperatura))
   ?aire_acondicionado <- (aire_acondicionado (zona ?nombre) (encendido si) (intensidad ?intensidad))
   (test (< ?temperatura ?minima))
   (test (< ?intensidad ?maxima))
   =>
   (printout t "Aumentando intensidad del aire acondicionado en " ?nombre "." crlf)
   (modify ?aire_acondicionado (intensidad (+ ?intensidad 1)))
   (retract ?sensor))

(defrule menos_aire_acondicionado
   (zona (nombre ?nombre) (temperatura_max ?maxima) (temperatura_min ?minima))
   ?sensor <- (sensor (zona ?nombre) (tipo temperatura) (valor ?temperatura))
   ?aire_acondicionado <- (aire_acondicionado (zona ?nombre) (encendido si) (intensidad ?intensidad))
   (test (> ?temperatura ?maxima))
   (test (> ?intensidad ?minima))
   =>
   (printout t "Disminuyendo intensidad del aire acondicionado en " ?nombre "." crlf)
   (modify ?aire_acondicionado (intensidad (- ?intensidad 1)))
   (retract ?sensor))

(defrule encender_ventilador
   (zona (nombre ?nombre) (humedad_max ?maxima))
   ?sensor <- (sensor (zona ?nombre) (tipo humedad) (valor ?humedad))
   ?ventilador <- (ventilador (zona ?nombre) (encendido no)) 
   (test (> ?humedad ?maxima))
   =>
   (printout t ?nombre " con humedad fuera de rango ideal (" ?humedad ")." crlf)
   (printout t  "Se va a encender el ventilador en " ?nombre "." crlf)
   (modify ?ventilador (encendido si) (intensidad 20))
   (retract ?sensor))

(defrule apagar_ventilador
   (zona (nombre ?nombre) (humedad_max ?maxima) (humedad_min ?minima))
   ?sensor <- (sensor (zona ?nombre) (tipo humedad) (valor ?humedad))
   ?ventilador <- (ventilador (zona ?nombre) (encendido si))
   (test (<= ?humedad ?maxima))
   =>
   (printout t ?nombre " con humedad en rango ideal (" ?humedad ")." crlf)
   (printout t  "Se va a apagar el ventilador en " ?nombre "." crlf)
   (modify ?ventilador (encendido no) (intensidad 0))
   (retract ?sensor))

(defrule mas_ventilador
   (zona (nombre ?nombre) (temperatura ?temperatura) (humedad_max ?maxima) (temperatura_min ?tem_minima))
   ?sensor <- (sensor (zona ?nombre) (tipo humedad) (valor ?humedad))
   ?ventilador <- (ventilador (zona ?nombre) (encendido si) (intensidad ?intensidad))
   (test (> ?humedad ?maxima))
   (test (> ?temperatura ?tem_minima))
   (test (< ?intensidad 100))
   =>
   (printout t "Aumentando intensidad del ventilador en " ?nombre "." crlf)
   (modify ?ventilador (intensidad (+ ?intensidad 20)))
   (retract ?sensor))
