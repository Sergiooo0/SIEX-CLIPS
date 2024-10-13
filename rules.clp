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
   (or 
      (test (>= ?voltaje 210))
      (test (<= ?voltaje 230))
   )
   =>
   (printout t " rack de id " ?id " en " ?nombre_zona " con voltaje dentro de rango (" ?voltaje ")." crlf)
   (modify ?rack (alerta_voltaje no))
)