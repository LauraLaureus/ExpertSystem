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
    (multislot especialidad) 
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
        (name bombillo_fundio)
        (tipo electrico)
        (prioridad 3)
        (estimacion 1)
    )
)

(deffacts personal
    (tecnico
        (name Aitor)    
        (especialidad electrico)
    )

)