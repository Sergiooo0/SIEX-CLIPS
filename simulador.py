import clips
import time

# Inicializar entorno CLIPS
environment = clips.Environment()

# Cargar templates, reglas y hechos iniciales
environment.load("templates.clp")
environment.load("hechos.clp")
environment.load("rules.clp")

# Cargar hechos iniciales en memoria activa y emparejar reglas
environment.reset()

# Crear template para moverse
template_moverse = environment.find_template('accion_moverse')
zonas = ["Zona A", "Zona B", "Zona C"]

# Insertar hechos para zonas
for zona in zonas:
    fact = template_moverse.assert_fact(usuario="Sergio", zona=zona)

# Imprimir hechos iniciales de usuario
for fact in environment.facts():
    if fact.template.name == "usuario":
        print(fact)
        print(fact["id"], fact["nombre"], fact["nivel_acceso"])

# Ejecutar las activaciones de las reglas
environment.run()

# Prueba de modificación de temperaturas
template_cambiar = environment.find_template('cambiar_valor')
temperatura = 20
for _ in range(10):
    time.sleep(2)
    fact = template_cambiar.assert_fact(sala="Sala A",
                                        tipo=clips.Symbol("temperatura"),
                                        valor=temperatura)
    temperatura += 2 
    # Antes de ejecutar el ciclo de reglas, inserta el hecho "inicializar-sensores"
    environment.assert_string("(inicializar-sensores)")
    environment.run()
    print("-----------------------------")
