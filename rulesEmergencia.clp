(defrule detecta_agua
   ?sensor <- (sensor (sala ?nombre) (tipo agua) (valor si) (leido no))
   =>
   (printout t "Alerta por inundacion en: " ?nombre "." crlf)
   (modify ?sensor (valor no) (leido si)))

(defrule activar_agua
   ?sensor <- (sensor (sala ?nombre) (tipo humo) (valor si) (leido no))
   (sala (nombre ?nombre) (zona ?nombre_zona))
   (not (zona (nombre ?nombre_zona) (contenido sensible)))
   =>
   (printout t "Alerta por incendio: " ?nombre_zona ". Activando extincion por agua." crlf)
   (modify ?sensor (valor no) (leido si)))

(defrule activar_evacuacion
   ?sensor <- (sensor (sala ?nombre) (tipo humo) (valor si) (leido no))
   (sala (nombre ?nombre) (zona ?nombre_zona))
   ?zona <- (zona (nombre ?nombre_zona) (contenido sensible) (en_evacuacion no))
   =>
   (printout t "Alerta por incendio: " ?nombre_zona ". No se pudo activar extincion por agua, contenido sensible" crlf)
   (printout t "EVACUEN: " ?nombre_zona "!" crlf)
   (modify ?sensor (leido si))
   (modify ?zona (en_evacuacion si)))

(defrule activar_gas
   ?sensor <- (sensor (sala ?nombre) (tipo humo) (valor si))
   (sala (nombre ?nombre) (zona ?nombre_zona))
   ?zona <- (zona (nombre ?nombre_zona) (contenido sensible) (personas_presentes 0) (en_evacuacion si))
   =>
   (printout t "Activando extincion por gas en: " ?nombre_zona "." crlf)
   (modify ?sensor (valor no))
   (modify ?zona (en_evacuacion no)))

(defrule no_activar_gas
   ?sensor <- (sensor (sala ?nombre) (tipo humo) (valor si) (leido no))
   (sala (nombre ?nombre) (zona ?nombre_zona))
   (zona (nombre ?nombre_zona) (contenido sensible) (personas_presentes ?numero) (en_evacuacion si))
   (not (test (eq ?numero 0)))
   =>
   (printout t "Hay gente en " ?nombre_zona ". Por favor, EVACUEN!" crlf)
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
   (sala (nombre ?nombre))
   ?sensor <- (sensor (sala ?nombre) (tipo humo) (valor si))
   ?ventilador <- (ventilador (sala ?nombre) (encendido si))
   =>
   (printout t "Incendio en " ?nombre "." crlf)
   (printout t "Se va a apagar el ventilador en " ?nombre "." crlf)
   (modify ?ventilador (encendido no) (intensidad 0))
)

(defrule apagar_aire_acondicionado_por_incendio
   (sala (nombre ?nombre) (zona ?zona))
   ?sensor <- (sensor (sala ?nombre) (tipo humo) (valor si))
   ?aire_acondicionado <- (aire_acondicionado (zona ?zona) (encendido si))
   =>
   (printout t "Incendio en " ?nombre "." crlf)
   (printout t "Se va a apagar el aire acondicionado en " ?zona "." crlf)
   (modify ?aire_acondicionado (encendido no) (intensidad 0))
)
