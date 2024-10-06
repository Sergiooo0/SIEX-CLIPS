(deftemplate zona
   (slot nombre)
   (slot tipo) ;0: fría, 1: templada o 2: caliente.
   (slot personas_presentes)
   (slot temperatura (range -20 80))
   (slot humedad (range 0 100))
   (slot humo
      (type SYMBOL) 
      (allowed-values si no)
      (default no))
   (slot agua
      (type SYMBOL) 
      (allowed-values si no)
      (default no))
   (slot contenido
      (type SYMBOL) 
      (allowed-values normal sensible)
      (default sensible))
   (slot iluminacion
      (type SYMBOL) 
      (allowed-values encendida apagada)
      (default apagada))
)

;calefaccion_global un hecho directamente.

;(deftemplate sensor
;   (slot zona) 
;   (slot tipo)  ; Tipo de sensor: "temperatura" o "humedad"
;   (slot valor)   
;)
(deftemplate aire_acondicionado
   (slot zona)
   (slot encendido
      (type SYMBOL) 
      (allowed-values si no)
      (default no))
   (slot intensidad
      (default 0)))

(deftemplate ventilador
   (slot zona)
   (slot encendido
      (type SYMBOL) 
      (allowed-values si no)
      (default no))
   (slot intensidad 
      (range 0 100)
      (default 0)))

(deftemplate usuario
   (slot id)
   (slot nombre)
   (slot nivel_acceso) ;0: fría, 1: templada o 2: caliente
   (slot zona_actual) ;nombre de la zona en la que se encuentra
   )

(deftemplate rack
   (slot id)
   (slot zona)
   (slot temperatura (range -20 80))
   (slot humedad (range 0 100))
   (slot temperatura_min  (range -20 80))
   (slot temperatura_max  (range -20 80))
   (slot voltaje (range 100 300)) ; rango ideal: 210- 230
   (slot alerta_voltaje
         (type SYMBOL) 
         (allowed-values si no)
         (default no))
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

(defrule activar_alerta_electrica
   ?rack <- (rack (id ?id) (zona ?nombre_zona) (voltaje ?voltaje) (alerta_voltaje ?alerta_voltaje))
   (or 
      (test (< ?voltaje 210))
      (test (> ?voltaje 230))
   )
   (test (eq ?alerta_voltaje no))
   =>
   (printout t " rack de id " ?id " en " ?nombre_zona " con voltaje fuera de rango (" ?voltaje ")." crlf)
   (modify ?rack (alerta_voltaje si))
)

(defrule activar_alerta_electrica
   ?rack <- (rack (id ?id) (zona ?nombre_zona) (voltaje ?voltaje) (alerta_voltaje ?alerta_voltaje))
   (or 
      (test (>= ?voltaje 210))
      (test (<= ?voltaje 230))
   )
   (test (eq ?alerta_voltaje si))
   =>
   (printout t " rack de id " ?id " en " ?nombre_zona " con voltaje dentro de rango (" ?voltaje ")." crlf)
   (modify ?rack (alerta_voltaje no))
)