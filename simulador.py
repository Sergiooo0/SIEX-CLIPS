import clips

# Inicializar entorno CLIPS
environment = clips.Environment()

# Cargar templates, reglas y hechos iniciales
environment.load("templates.clp")
environment.load("hechos.clp")
environment.load("rules.clp")

# Cargar hechos iniciales en memoria activa y emparejar reglas
environment.reset()

template_moverse = environment.find_template('accion_moverse')
zonas = ["Zona A", "Zona B", "Zona C"]

for zona in zonas:
    fact = template_moverse.assert_fact(usuario = "Sergio",
                                        zona = zona)
    

for fact in environment.facts():
    if fact.template.name == "usuario":
        print(fact)
        print(fact["id"], fact["nombre"], fact["nivel_acceso"])
# Ejecutar las activaciones de la reglas
environment.run()
