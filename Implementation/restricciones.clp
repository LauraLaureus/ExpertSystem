(deffunction intersect (?set ?sett) 
   (bind ?r (create$)) 
   (foreach ?e ?set 
        (if (and (member$ ?e ?sett)  (member$ ?e ?r)) 
             then (bind ?r (create$ ?r ?e)))) 
 (return ?r))

(defrule h
    (averia (tipo ?t))
    (tecnico (especialidad ?t))
    =>
    (printout t ?t crlf)
)