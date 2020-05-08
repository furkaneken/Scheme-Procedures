(define sequence? (lambda (inSeq) (if(list? inSeq)(if (null? inSeq) #t (if (symbol? (car inSeq)) (if(< 1 (string-length (symbol->string(car inSeq)))) #f (if (null? (car inSeq)) #t (sequence? (cdr inSeq)))) #f )) #f))) 

(define (reverseme lis)(if (null? lis)'()(append (reverseme (cdr lis))(list (car lis)))))


(define same-sequence? (lambda (inSeq1 inSeq2) (if(and (sequence? inSeq1) (sequence? inSeq2)) (if(equal? inSeq1 inSeq2) #t #f) (error "this is an error"))))


(define reverse-sequence (lambda(inSeq) (if(sequence? inSeq) (reverseme inSeq) (error "this is an reverse(me) error"))))



(define palindrome?(lambda (inSeq)(equal? inSeq (reverseme inSeq))))



(define (member? inSym inSeq)(if(and (symbol? inSym) (sequence? inSeq))(if (null? inSeq) #f (if (equal? inSym (car inSeq)) #t (member? inSym (cdr inSeq)))) (error "this is an member error zuhaahahhaha")))

(define del(lambda (inSym inSeq)(cond((equal? inSym (car inSeq)) (cdr inSeq))(else (cons (car inSeq) (del inSym (cdr inSeq)))))))


(define remove-member(lambda (inSym inSeq) (if(and (sequence? inSeq) (symbol? inSym) (member? inSym inSeq)) (del inSym inSeq) (error "this is an remove-member error"))))





(define leftorightcheck? (lambda (inSeq1 inSeq2) (if(null? inSeq1) #t (if(member? (car inSeq1) inSeq2) (leftorightcheck? (cdr inSeq1) (remove-member (car inSeq1) inSeq2))  #f  ))))

(define rightoleftcheck? (lambda (inSeq1 inSeq2) (if(null? inSeq2) #t (if(member? (car inSeq2) inSeq1) (rightoleftcheck?  (remove-member (car inSeq2)inSeq1) (cdr inSeq2))  #f  ))))


(define anagram? (lambda (inSeq1 inSeq2) (if(and (and(sequence? inSeq1)(sequence? inSeq2)) (equal? (length inSeq1)(length inSeq2))) (if(and (leftorightcheck? inSeq1 inSeq2)(rightoleftcheck? inSeq1 inSeq2))#t #f)  (error "this is an anagram error")) ) )  

          
(define anapoli? (lambda (inSeq1 inSeq2) (if(and (sequence? inSeq1)(sequence? inSeq2)) (if(and (palindrome? inSeq2) (anagram? inSeq1 inSeq2)) #t #f ) (error "this is an anapoli error") )))      
