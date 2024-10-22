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
   (printout t "Todos los sensores preparados para ser leidos." crlf)
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

(defrule encender_calefaccion_global
   ?calefaccion <- (calefaccion_global (encendida no))
   (not 
      (and 
         (sala (nombre ?sala1) (temperatura_max ?maxima))
         (sensor (sala ?sala1) (tipo temperatura) (valor ?temperatura1))
         (test (> ?temperatura1 ?maxima))
      )
   )
   (sala (nombre ?sala2) (temperatura_min ?minima))
   (sensor (sala ?sala2) (tipo temperatura) (valor ?temperatura2))
   (test (< ?temperatura2 ?minima))
   =>
   (printout t "No hay lugar con temperatura superior a la maxima y " ?sala2 " por debajo de rango ideal (" ?temperatura2 ")." crlf)
   (printout t "Se va a encender la calefaccion global." crlf)
   (modify ?calefaccion (encendida si)))

(defrule apagar_calefaccion_global1
   ?calefaccion <- (calefaccion_global (encendida si))
   (sala (nombre ?sala) (temperatura_max ?maxima))
   (sensor (sala ?sala) (tipo temperatura) (valor ?temperatura))
   (test (> ?temperatura ?maxima))
   =>
   (printout t ?sala " con temperatura superior a la maxima. Se va a apagar la calefaccion global." crlf)
   (modify ?calefaccion (encendida no)))

(defrule apagar_calefaccion_global2
   ?calefaccion <- (calefaccion_global (encendida si))
   (not 
      (and 
         (sala (nombre ?sala) (temperatura_min ?minima))
         (sensor (sala ?sala) (tipo temperatura) (valor ?temperatura))
         (test (< ?temperatura ?minima))
      )
   )
   =>
   (printout t "No hay sala por debajo del rango ideal. Se va a apagar la calefaccion." crlf)
   (modify ?calefaccion (encendida no)))

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

(defrule apagar_aire_acondicionado_por_incendio
   (sala (nombre ?nombre) (zona ?zona))
   ?sensor <- (sensor (sala ?nombre) (tipo humo) (valor si))
   ?aire_acondicionado <- (aire_acondicionado (zona ?zona) (encendido si))
   =>
   (printout t "Incendio en " ?nombre "." crlf)
   (printout t "Se va a apagar el aire acondicionado en " ?zona "." crlf)
   (modify ?aire_acondicionado (encendido no) (intensidad 0))
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

(defrule encender_ventilador
   (sala (nombre ?nombre) (humedad_max ?maxima))
   ?sensor <- (sensor (sala ?nombre) (tipo humedad) (valor ?humedad) (leido no))
   ?ventilador <- (ventilador (sala ?nombre) (encendido no))
   (not (sensor (sala ?nombre) (tipo humo) (valor si))) 
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

(defrule apagar_ventilador_por_incendio
   (sala (nombre ?nombre))
   ?sensor <- (sensor (sala ?nombre) (tipo humo) (valor si))
   ?ventilador <- (ventilador (sala ?nombre) (encendido si))
   =>
   (printout t "Incendio en " ?nombre "." crlf)
   (printout t "Se va a apagar el ventilador en " ?nombre "." crlf)
   (modify ?ventilador (encendido no) (intensidad 0))
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