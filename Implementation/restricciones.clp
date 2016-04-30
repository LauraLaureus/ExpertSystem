


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
    ?f <- (fase-imprimir)
    (ConjuntoDeSoluciones (solucion ?s1 ?s2 ?s3 ?s4 ?s5 ?s6 ?s7 ?s8 ?s9 ?s10 ?s11 ?s12 ?s13 ?s14 ?s15 ?s16 ?final))
    (averia (name ?name1) (id ?s1)(prioridad ?p1))
    (averia (name ?name2) (id ?s2)(prioridad ?p2))
    (averia (name ?name3) (id ?s3)(prioridad ?p3))
    (averia (name ?name4) (id ?s4)(prioridad ?p4))
    (averia (name ?name5) (id ?s5)(prioridad ?p5))
    (averia (name ?name6) (id ?s6)(prioridad ?p6))
    (averia (name ?name7) (id ?s7)(prioridad ?p7))
    (averia (name ?name8) (id ?s8)(prioridad ?p8))
    (averia (name ?name9) (id ?s9)(prioridad ?p9))
    (averia (name ?name10) (id ?s10)(prioridad ?p10))
    (averia (name ?name11) (id ?s11)(prioridad ?p11))
    (averia (name ?name12) (id ?s12)(prioridad ?p12))
    (averia (name ?name13) (id ?s13)(prioridad ?p13))
    (averia (name ?name14) (id ?s14)(prioridad ?p14))
    (averia (name ?name15) (id ?s15)(prioridad ?p15))
    (averia (name ?name16) (id ?s16)(prioridad ?p16))
    =>


    (printout t "Solucion ordenada : " ?s1 ?s2 ?s3 ?s4 ?s5 ?s6 ?s7 ?s8 ?s9 ?s10 ?s11 ?s12 ?s13 ?s14 ?s15 ?s16 crlf)
    (printout t "Trabajador llamado Pepe arregla las siguientes averias: " ?name1 " " ?name2 " " ?name3 " " ?name4 " " ?name5 " " ?name6 " " ?name7 " " ?name8 crlf crlf)
    (printout t "Trabajador llamado Carmelo arregla las siguientes averias: " ?name9 " " ?name10 " " ?name11 " " ?name12 " " ?name13 " " ?name14 " " ?name15 " " ?name16 crlf crlf)
    (retract ?f)
)
