


;;;;
;;;; reglas restricciones
;;;;

;;;;R0 no pueden haber dos elementos iguales en la solucion
(defrule test-restriccion0
(declare (salience 200))
(fase avance)
(not (vuelta-atras))
(solucion $?inicio ?ele $?medio ?ele)
?f <- (elementos
(elemento ?ele)
(posicion ?b&:(= ?b (+ 2 (length$ $?medio) (length$ $?inicio)))))
=>
(modify ?f (eliminado 1))
(assert (vuelta-atras)))


;;;;R1 todas las reparaciones de un tecnico pertenecen a una de las especialidades del tecnico
(defrule test-restriccion1
    (declare (salience 200))
    (fase avance)
    (not (vuelta-atras))
    (solucion $?inicio ?a ?b ?c ?d ?e ?f ?g ?h $?final)
    ?fffff <- (elementos (elemento ?a))
    (tecnico (id ?id) (especialidad $?especialidades))
    (test(= (mod (length$ ?inicio) 8) 0))
    (test ( = ?id (/ (length$ ?inicio) 8)))
    (averia (id ?a)(tipo ?especialidad &:(not(member$ ?especialidad $?especialidades))))
    (averia (id ?b)(tipo ?especialidad1 &:(not(member$ ?especialidad1 $?especialidades))))
    (averia (id ?c)(tipo ?especialidad2 &:(not(member$ ?especialidad2 $?especialidades))))
    (averia (id ?d)(tipo ?especialidad3 &:(not(member$ ?especialidad3 $?especialidades))))
    (averia (id ?e)(tipo ?especialidad4 &:(not(member$ ?especialidad4 $?especialidades))))
    (averia (id ?f)(tipo ?especialidad5 &:(not(member$ ?especialidad5 $?especialidades))))
    (averia (id ?g)(tipo ?especialidad6 &:(not(member$ ?especialidad6 $?especialidades))))
    (averia (id ?h)(tipo ?especialidad7 &:(not(member$ ?especialidad7 $?especialidades))))
=>
    (modify ?fffff (eliminado 1))
    (assert (vuelta-atras))
)


;    (declare (salience 3002))
(defrule obtenerMejorSolucion
    (fase-prioridad)
    (ConjuntoDeSoluciones (solucion $?inicio ?final))
    ?f <-(ConjuntoDeSoluciones (solucion $?inicio2 ?final2))
    (test (> ?final2 ?final))
    =>
    (retract ?f)
)

(defrule cambiaFase
    (declare (salience -1))
    ?q <-(fase-prioridad)
    =>
    (retract ?q)
    (assert (fase-ordena))
)

(defrule bubleSort
    (fase-ordena)
    ?s <- (ConjuntoDeSoluciones (solucion $?i $?in ?a ?b $?fi $?f ?final))
    (averia (id ?a) (prioridad ?p1))
    (averia (id ?b) (prioridad ?p2))
	(test(= (mod (length$ ?i) 8) 0))
    (test(= (mod (length$ ?f) 8) 0))
	(test(= (+ (length$ ?in) (length$ ?a) (length$ ?b) (length$ ?fi)) 8))
    (test (> ?p1 ?p2))
    =>
	(retract ?s)
    (assert (ConjuntoDeSoluciones (solucion $?i $?in ?b ?a $?fi $?f ?final)))

)



(defrule cambiaFase2
    (declare (salience -1))
    ?q <-(fase-ordena)
    =>
    (retract ?q)
    (assert (fase-imprimir))
)

(defrule imprimirMejorSolucion
    (fase-imprimir)
    (ConjuntoDeSoluciones (solucion $?inicio ?final))
    ;(test (<> ?*imprimirSolucion* 3 ))
    =>
    (printout t ?inicio crlf)
    ;(bind ?*imprimirSolucion* (+ 1 ?*imprimirSolucion*))
)
