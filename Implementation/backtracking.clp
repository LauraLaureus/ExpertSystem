(deffacts datos
; numero de variables del problema
(estructura 16)

; dominios para cada variable
(dominio 1 a b c d e f g h i j k l m n o p)
(dominio 2 a b c d e f g h i j k l m n o p)
(dominio 3 a b c d e f g h i j k l m n o p)
(dominio 4 a b c d e f g h i j k l m n o p)
(dominio 5 a b c d e f g h i j k l m n o p)
(dominio 6 a b c d e f g h i j k l m n o p)
(dominio 7 a b c d e f g h i j k l m n o p)
(dominio 8 a b c d e f g h i j k l m n o p)
(dominio 9 a b c d e f g h i j k l m n o p)
(dominio 10 a b c d e f g h i j k l m n o p)
(dominio 11 a b c d e f g h i j k l m n o p)
(dominio 12 a b c d e f g h i j k l m n o p)
(dominio 13 a b c d e f g h i j k l m n o p)
(dominio 14 a b c d e f g h i j k l m n o p)
(dominio 15 a b c d e f g h i j k l m n o p)
(dominio 16 a b c d e f g h i j k l m n o p)

;solucion
(solucion))

;(deffacts informacion-control
;	(secuencia-fases avances restricciones))

; contador de soluciones encontradas
(defglobal ?*nsol* = 0)
(defglobal ?*imprimirSolucion* = 0)

(deftemplate elementos
(slot posicion
(default 0)
(type INTEGER))
(slot elemento
(default ?DERIVE)
(type SYMBOL))
(slot eliminado
(default 0)
(type INTEGER)))

;;;;
;;;; reglas
;;;;

(defrule inicio
(declare (salience 10000))
=>
(assert (fase inicializacion)))

;;;; reglas inicializacion
(defrule genera-elemento-dominio
(fase inicializacion)
(dominio ?pos $? ?ele $?)
=>
(assert (elementos
(posicion ?pos)
(elemento ?ele)
(eliminado 0))))

(defrule cambio-fase
(declare (salience -10))
?f <- (fase inicializacion)
=>
(retract ?f)
(assert (fase avance)))


;;;; reglas avance
(defrule avanza
(declare (salience 100))
(fase avance)
?f <- (solucion $?a)
; quedan elementos para añadir en la siguiente posicion de la solucion (no han sido eliminados)
(elementos
(elemento ?ele) ;buscamos un elemento
(posicion ?b&:(= ?b (+ 1 (length$ ?a)))) ; del dominio siguiente
(eliminado 0)) ; que este disponible
=>
(retract ?f)
(assert (solucion $?a ?ele)))

; detecta que tenemos un dominio saturado.
(defrule detecta-dominio-saturado
(declare (salience 300))
(fase avance)
(solucion $?sol)
(elementos
(posicion ?b&:(= ?b (+ 1 (length$ ?sol))))) ; se corresponde con el siguiente dominio
(not (elementos
(posicion ?b)
(eliminado 0))) ; que no tenga disponibles
=>
(assert (vuelta-atras)))

; regla que comprueba si se ha alcanzado una solución
(defrule detecta-solucion
(declare (salience 100))
(fase avance)
?f <- (solucion $?a ?b)
(estructura ?n&:(= (- ?n 1) (length$ ?a)))
?h <- (elementos
(elemento ?b)
(posicion ?pos&:(= ?pos (+ 1 (length$ ?a))))
)
(solucion ?s1 ?s2 ?s3 ?s4 ?s5 ?s6 ?s7 ?s8 ?s9 ?s10 ?s11 ?s12 ?s13 ?s14 ?s15 ?s16)
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
(bind ?*nsol* (+ 1 ?*nsol*))
(bind ?tPrioridad (+ ?p1 ?p2 ?p3 ?p4 ?p5 ?p6 ?p7 ?p8 ?p9 ?p10 ?p11 ?p12 ?p13 ?p14 ?p15 ?p16))
(printout t "Solucion " ?*nsol* (create$ $?a ?b) crlf crlf)
;(printout t "Trabajador llamado Pepe arregla las siguientes averias: " ?name1 " " ?name2 " " ?name3 " " ?name4 " " ?name5 " " ?name6 " " ?name7 " " ?name8 crlf crlf)
;(printout t "Trabajador llamado Carmelo arregla las siguientes averias: " ?name9 " " ?name10 " " ?name11 " " ?name12 " " ?name13 " " ?name14 " " ?name15 " " ?name16 crlf crlf)
(modify ?h (eliminado 1))
(assert (solucion $?a))
(assert (ConjuntoDeSoluciones $?a ?b ?tPrioridad))
(retract ?f))
;La aplicación acaba cuando se detecta que tenemos el dominio 1 saturado
(defrule fin
(declare (salience 3000))
?f <- (fase avance)
(not (elementos
(posicion 1)
(eliminado 0))) ; que no tenga disponibles
=>
(retract ?f)
(printout t "Fin: " ?*nsol* crlf))

; Anula el ultimo valor  de la solución y libera la condición de vuelta-atrás
(defrule fin-vuelta-atras
(declare (salience 350))
(fase avance)
?f <- (vuelta-atras)
?g <- (solucion $?inicio ?a)
?h <- (elementos
(posicion ?b&:(= ?b (+ 1 (length$ ?inicio))))
(elemento ?a))
=>
(modify ?h (eliminado 1))
(assert (solucion ?inicio))
(retract ?f ?g))

; restaura valores de dominios
(defrule restaura-nivel
(declare (salience 400))
(fase avance)
(vuelta-atras)
(solucion $?s)
?f <- (elementos
(posicion ?b&:(= ?b (+ 1 (length$ ?s))))
(eliminado 1))
=>
(modify ?f (eliminado 0)))

(defrule numeroMaximosDeSoluciones
(declare (salience 101))
?fa <- (fase avance)
?f <- (elementos
	  (elemento ?ele)) 
(test (= ?*nsol* 10 ))
=>
 (modify ?f (eliminado 1))
 (assert (fase-prioridad))
 (retract ?fa)
)

