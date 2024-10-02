(deftemplate zona
   (slot nombre)
   (slot tipo) ;0: fría, 1: templada o 2: caliente.
   (slot personas_presentes)
   (slot temperatura (range -20 80))
   (slot humedad (range 0 100)))

(deftemplate usuario
   (slot id)
   (slot nombre)
   (slot nivel_acceso) ;0: fría, 1: templada o 2: caliente
   (slot zona_actual) ;nombre de la zona en la que se encuentra
   )

(defrule salir_permitido
   ?usuario <- (usuario (id ?id) (nombre ?nom_user) (nivel_acceso ?nivel_acceso) (zona_actual ?ubi))
   (zona (nombre ?nom_zona) (tipo ?tipo))
   (test (>= ?nivel_acceso ?tipo))
   (test (eq ?ubi ?nom_zona))
   =>
   (printout t ?nom_user " de id " ?id " ha salido de " ?ubi "." crlf)
   (modify ?usuario (zona_actual "pasillo")) 
)

(defrule salir_denegado
   ?usuario <- (usuario (id ?id) (nombre ?nom_user) (nivel_acceso ?nivel_acceso) (zona_actual ?ubi))
   (zona (nombre ?nom_zona) (tipo ?tipo))
   (test (< ?nivel_acceso ?tipo))
   (test (eq ?ubi ?nom_zona))
   =>
   (printout t ?nom_user " de id " ?id " no ha podido salir de " ?ubi "." crlf)
)