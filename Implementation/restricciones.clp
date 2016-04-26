


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
(test ( = ?id 0))
(averia (id ?a)(tipo ?especialidad &:(not(member ?especialidad $?especialidades))))
(averia (id ?b)(tipo ?especialidad &:(not(member ?especialidad $?especialidades))))
(averia (id ?c)(tipo ?especialidad &:(not(member ?especialidad $?especialidades))))
(averia (id ?d)(tipo ?especialidad &:(not(member ?especialidad $?especialidades))))
(averia (id ?e)(tipo ?especialidad &:(not(member ?especialidad $?especialidades))))
(averia (id ?f)(tipo ?especialidad &:(not(member ?especialidad $?especialidades))))
(averia (id ?g)(tipo ?especialidad &:(not(member ?especialidad $?especialidades))))
(averia (id ?h)(tipo ?especialidad &:(not(member ?especialidad $?especialidades))))
=>
(modify ?fffff (eliminado 1))
(assert (vuelta-atras)))