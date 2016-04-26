


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


;;;;R1
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


;;;