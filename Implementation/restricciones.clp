(defrule h
    ?p <- (tecnico (name ?n)(especialidad $?i ?t $?d))
	?f <- (averia (tipo ?t))
    =>
    (modify ?f (tecnico ?n))
	(retract ?p)
)