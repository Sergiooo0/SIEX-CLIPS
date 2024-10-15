(deftemplate zona
   (slot nombre)
   (slot tipo) ;0: fría, 1: templada o 2: caliente.
   (slot personas_presentes (default 0))
   ;(slot temperatura (range -20 80))
   ;(slot humedad (range 0 100))
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
)

(deftemplate sala
   (slot nombre)
   (slot zona)
   (slot iluminacion
      (type SYMBOL) 
      (allowed-values encendida apagada)
      (default apagada)
   )
   (slot temperatura_min (default 10))
   (slot temperatura_max (default 25))
   (slot humedad_min (default 0))
   (slot humedad_max (default 30))
)

;calefaccion_global un hecho directamente.

(deftemplate sensor
   (slot sala) 
   (slot tipo
      (type SYMBOL) 
      (allowed-values temperatura humedad))  ; Tipo de sensor: temperatura o humedad
   (slot valor)   
)

(deftemplate accion 
   (slot tipo
      (allowed-values encender_aire_acondicionado apagar_aire_acondicionado))
   (slot zona))

(deftemplate aire_acondicionado
   (slot zona)
   (slot encendido
      (type SYMBOL) 
      (allowed-values si no)
      (default no))
   (slot intensidad
      (default 0)))

(deftemplate ventilador
   (slot sala)
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
   (slot sala_actual) ;nombre de la sala en la que se encuentra
   )

(deftemplate accion_moverse
   (slot usuario)
   (slot zona))

(deftemplate rack
   (slot id)
   (slot sala)
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
