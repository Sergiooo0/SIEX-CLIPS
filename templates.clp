(deftemplate zona
   (slot nombre)
   (slot tipo) ;0: fría, 1: templada o 2: caliente.
   (slot personas_presentes (default 0))
   ;(slot temperatura (range -20 80))
   ;(slot humedad (range 0 100))
   (slot contenido
      (type SYMBOL) 
      (allowed-values normal sensible)
      (default sensible))
   (slot en_evacuacion
      (type SYMBOL) 
      (allowed-values no si)
      (default no))
)

(deftemplate conexion
   (slot zona1)    ;; the first zone
   (slot zona2)    ;; the second zone
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
   (slot humedad_min (default 20))
   (slot humedad_max (default 80))
)

(deftemplate calefaccion_global
   (slot encendida
      (type SYMBOL)
      (allowed-values si no)))

(deftemplate sensor
   (slot sala) 
   (slot tipo
      (type SYMBOL) 
      (allowed-values temperatura humedad))
   (slot valor
      (type INTEGER))
   (slot leido
      (type SYMBOL) 
      (allowed-values si no)
      (default no))
)

(deftemplate sensorZ
   (slot zona)
   (slot tipo
      (type SYMBOL) 
      (allowed-values humo agua))
   (slot valor
      (type SYMBOL) 
      (allowed-values si no)
      (default no))
   (slot leido
      (type SYMBOL) 
      (allowed-values si no)
      (default no))
)

(deftemplate cambiar_valor
   (slot sala)
   (slot tipo 
      (type SYMBOL) 
      (allowed-values temperatura humedad))
   (slot valor)
)

(deftemplate cambiar_valorZ
   (slot zona)
   (slot tipo 
      (type SYMBOL) 
      (allowed-values humo agua))
   (slot valor
      (type SYMBOL) 
      (allowed-values si no)
   )
)

(deftemplate cambiar_valor_voltaje
   (slot id)
   (slot valor)
)

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
   (slot zona)
   (slot sala)
)


(deftemplate accion_moverse_sala
   (slot usuario)
   (slot sala)
)


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
