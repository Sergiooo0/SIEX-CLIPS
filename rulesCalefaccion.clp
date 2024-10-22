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

