
(deftemplate tecnico
    (slot name)
    (multislot especialidad (allowed-values fontaneria electricidad albanileria inmobiliaria piscinero jardineria) )
    (slot id )

)

(deftemplate averia

    (slot name)
    (slot tipo)
    (slot prioridad)
    (slot id (allowed-values a b c d e f g h i j k l m n o p q r s t u v w x y z))
)


(deffacts averias
    (averia
        (name cambiar_bombillo)
        (tipo electricidad)
        (prioridad 3)
        (id  a)
    )
	(averia
        (name arreglar_tajertero)
        (tipo electricidad)
        (prioridad 1)
        (id b)
    )
	(averia
        (name arreglar_enchufes)
        (tipo electricidad)
        (prioridad 3)
        (id c)
    )
	(averia
        (name arreglar_motores)
        (tipo electricidad)
        (prioridad 1)
        (id d)
    )
	(averia
        (name arreglar_cuadro_de_luz)
        (tipo electricidad)
        (prioridad 2)
        (id e)
    )
	(averia
        (name arreglar_termo)
        (tipo fontaneria)
        (prioridad 1)
        (id f)
    )
	(averia
        (name cambiar_tuberia)
        (tipo fontaneria)
        (prioridad 3)
        (id g)
    )
	(averia
        (name arreglar_motor)
        (tipo fontaneria)
        (prioridad 1)
        (id h)
    )
	(averia
        (name cambiar_plaqueta)
        (tipo albanileria)
        (prioridad 2)
        (id i)
    )
	(averia
        (name levantar_muro)
        (tipo albanileria)
        (prioridad 4)
        (id j)
    )
	(averia
        (name pintar)
        (tipo albanileria)
        (prioridad 5)
        (id k)
    )
	(averia
        (name arreglar_techo)
        (tipo albanileria)
        (prioridad 3)
        (id l)
    )
	(averia
        (name lijar_puerta)
        (tipo inmobiliaria)
        (prioridad 3)
        (id m)
    )
	(averia
        (name cambiar_electrodomesticos)
        (tipo inmobiliaria)
        (prioridad 4)
        (id n)
    )
	(averia
        (name cambiar_banera)
        (tipo inmobiliaria)
        (prioridad 2)
        (id o)
    )
	(averia
        (name regar_flores)
        (tipo electricidad)
        (prioridad 2)
        (id p)
    )
	(averia
        (name limpiar_alrededores)
        (tipo jardineria)
        (prioridad 3)
        (id q)
    )
	(averia
        (name limpiar_suelos_alrededores)
        (tipo piscinero)
        (prioridad 2)
        (id r)
    )
	(averia
        (name limpiar_piscina)
        (tipo piscinero)
        (prioridad 1)
        (id s)
    )
)


(deffacts personal
   	(tecnico
		(name Pepe)
        (id 0)
		(especialidad fontaneria electricidad albanileria inmobiliaria)
	)
    (tecnico
		(name Carmelo)
        (id 1)
		(especialidad fontaneria electricidad albanileria inmobiliaria)
	)
)