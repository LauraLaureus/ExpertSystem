(deftemplate herramienta
    (slot name)
    (multislot especialidad) 
)


(deftemplate material
    (slot name)
    (multislot especialidad) 
)


(deftemplate tecnico
    (slot name)
    (multislot especialidad 
	(allowed-values fontaneria electricidad albanileria inmobiliaria piscinero jardineria))
)

(deftemplate averia
    (multislot tecnico)
    (multislot material)
    (multislot herramienta)
    (slot name)
    (slot tipo)
    (slot prioridad)
    (slot estimacion)
    (slot comienzo)
)

(deffacts averias
    (averia
        (name cambiar_bombillo)
        (tipo electricidad)
        (prioridad 3)
        (estimacion 1)
    )
	(averia
        (name arreglar_tajertero)
        (tipo electricidad)
        (prioridad 1)
        (estimacion 1)
    )
	(averia
        (name arreglar_enchufes)
        (tipo electricidad)
        (prioridad 3)
        (estimacion 1)
    )
	(averia
        (name arreglar_motores)
        (tipo electricidad)
        (prioridad 1)
        (estimacion 3)
    )
	(averia
        (name arreglar_cuadro_de_luz)
        (tipo electricidad)
        (prioridad 2)
        (estimacion 3)
    )
	(averia
        (name arreglar_termo)
        (tipo fontaneria)
        (prioridad 1)
        (estimacion 3)
    )
	(averia
        (name cambiar_tuberia)
        (tipo fontaneria)
        (prioridad 3)
        (estimacion 1)
    )
	(averia
        (name arreglar_motor)
        (tipo fontaneria)
        (prioridad 1)
        (estimacion 4)
    )
	(averia
        (name cambiar_plaqueta)
        (tipo albanileria)
        (prioridad 2)
        (estimacion 4)
    )
	(averia
        (name levantar_muro)
        (tipo albanileria)
        (prioridad 4)
        (estimacion 3)
    )
	(averia
        (name pintar)
        (tipo albanileria)
        (prioridad 5)
        (estimacion 5)
    )
	(averia
        (name arreglar_techo)
        (tipo albanileria)
        (prioridad 3)
        (estimacion 4)
    )
	(averia
        (name lijar_puerta)
        (tipo inmobiliaria)
        (prioridad 3)
        (estimacion 2)
    )
	(averia
        (name cambiar_electrodomesticos)
        (tipo inmobiliaria)
        (prioridad 4)
        (estimacion 1)
    )
	(averia
        (name cambiar_banera)
        (tipo inmobiliaria)
        (prioridad 2)
        (estimacion 1)
    )
	(averia
        (name regar_flores)
        (tipo jardineria)
        (prioridad 2)
        (estimacion 2)
    )
	(averia
        (name limpiar_alrededores)
        (tipo jardineria)
        (prioridad 3)
        (estimacion 3)
    )
	(averia
        (name limpiar_suelos_alrededores)
        (tipo piscinero)
        (prioridad 2)
        (estimacion 1)
    )
	(averia
        (name limpiar_piscina)
        (tipo piscinero)
        (prioridad 1)
        (estimacion 2)
    )
)

(deffacts personal
    (tecnico
        (name Antonio)    
        (especialidad fontaneria electricidad albanileria)
    )
	(tecnico
		(name Pepe)
		(especialidad fontaneria electricidad albanileria inmobiliaria)
	)
	(tecnico
		(name Mohamed)
		(especialidad piscinero fontaneria)
	)
	(tecnico
		(name Carmelo)
		(especialidad inmobiliaria fontaneria albanileria)
	)
	(tecnico
		(name Aitor)
		(especialidad electricidad fontaneria)
	)
	(tecnico
		(name Yidna)
		(especialidad piscinero fontaneria)
	)
	(tecnico
		(name Jaime)
		(especialidad fontaneria inmobiliaria)
	)
	(tecnico
		(name Juan)
		(especialidad piscinero jardineria)
	)
	(tecnico
		(name Jose)
		(especialidad piscinero jardineria)
	)
)
(deffacts materiales
	(material
		(name uno)
		(especialidad)
	)
)
(deffacts herramientas
	(herramienta
		(name uno)
		(especialidad)
	)
)