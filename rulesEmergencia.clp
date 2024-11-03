(defrule crearSensorHumo
   (declare (salience 100))
   (zona (nombre ?nombre_zona))
   (not (sensorZ (zona ?nombre_zona) (tipo humo)))
   =>
   (assert (sensorZ (zona ?nombre_zona) (tipo humo)))
   (printout t "Created the smoke detector for " ?nombre_zona "." crlf)
)

(defrule crearSensorAgua
   (declare (salience 100))
   (zona (nombre ?nombre_zona))
   (not (sensorZ (zona ?nombre_zona) (tipo agua)))
   =>
   (assert (sensorZ (zona ?nombre_zona) (tipo agua)))
   (printout t "Created the inundation detector for " ?nombre_zona "." crlf)
)

(defrule detecta_agua
   ?sensor <- (sensorZ (zona ?nombre) (tipo agua) (valor si) (leido no))
   =>
   (printout t "Alerta por inundacion en: " ?nombre "." crlf)
   (modify ?sensor (valor no) (leido si))
)

(defrule activar_agua
   ?sensor <- (sensorZ (zona ?nombre) (tipo humo) (valor si) (leido no))
   (not (zona (nombre ?nombre) (contenido sensible)))
   =>
   (printout t "Alerta por incendio: " ?nombre ". Activando extincion por agua." crlf)
   (modify ?sensor (valor no) (leido si)))

(defrule activar_evacuacion
   ?sensor <- (sensorZ (zona ?nombre) (tipo humo) (valor si) (leido no))
   ?zona <- (zona (nombre ?nombre) (contenido sensible) (en_evacuacion no))
   =>
   (printout t "Alerta por incendio: " ?nombre ". No se pudo activar extincion por agua, contenido sensible" crlf)
   (printout t "EVACUEN: " ?nombre "!" crlf)
   (modify ?sensor (leido si))
   (modify ?zona (en_evacuacion si)))

(defrule activar_gas
   ?sensor <- (sensorZ (zona ?nombre) (tipo humo) (valor si))
   ?zona <- (zona (nombre ?nombre) (contenido sensible) (personas_presentes 0) (en_evacuacion si))
   =>
   (printout t "Activando extincion por gas en: " ?nombre "." crlf)
   (modify ?sensor (valor no))
   (modify ?zona (en_evacuacion no)))

(defrule no_activar_gas
   ?sensor <- (sensorZ (zona ?nombre) (tipo humo) (valor si) (leido no))
   (zona (nombre ?nombre) (contenido sensible) (personas_presentes ?numero) (en_evacuacion si))
   (not (test (eq ?numero 0)))
   =>
   (printout t "Hay " ?numero " personas en " ?nombre ". Por favor, EVACUEN!" crlf)
   (modify ?sensor (leido si))
   )

(defrule evacuar_zona
    ;; Ignores security level
    (declare (salience 90))
    ?zonaI <- (zona (nombre ?nom_zonaI) (en_evacuacion si) (personas_presentes ?personasI))
    ?usuario <- (usuario (id ?id) (nombre ?nom_user) (sala_actual ?nom_salaI))
    (sala (nombre ?nom_salaI) (zona ?nom_zonaI))
    (conexion (zona1 ?nom_zonaI) (zona2 ?nom_zonaF))
    ?zonaF <- (zona (nombre ?nom_zonaF) (personas_presentes ?personasF))
    (sala (nombre ?nom_salaF) (zona ?nom_zonaF))
    =>
    (printout t ?nom_user " de id " ?id " ha salido de " ?nom_salaI
    " contenida en " ?nom_zonaI " por alerta de evacuación. Se ha movido a "
    ?nom_salaF " contenida en " ?nom_zonaF "." crlf)
    (modify ?usuario (sala_actual ?nom_salaF))
    (modify ?zonaI (personas_presentes (- ?personasI 1)))
    (modify ?zonaF (personas_presentes (+ ?personasF 1)))
)

(defrule apagar_ventilador_por_incendio
   ?sensor <- (sensorZ (zona ?nombre) (tipo humo) (valor si))
   (sala (nombre ?nombre_sala) (zona ?nombre))
   ?ventilador <- (ventilador (sala ?nombre_sala) (encendido si))
   =>
   (printout t "Incendio en " ?nombre "." crlf)
   (printout t "Se va a apagar el ventilador en " ?nombre_sala "." crlf)
   (modify ?ventilador (encendido no) (intensidad 0))
)

(defrule apagar_aire_acondicionado_por_incendio
   ?sensor <- (sensorZ (zona ?nombre) (tipo humo) (valor si))
   ?aire_acondicionado <- (aire_acondicionado (zona ?nombre) (encendido si))
   =>
   (printout t "Incendio en " ?nombre "." crlf)
   (printout t "Se va a apagar el aire acondicionado en " ?nombre "." crlf)
   (modify ?aire_acondicionado (encendido no) (intensidad 0))
)
