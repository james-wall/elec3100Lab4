;====================== WALL, James =========================
;================== STUDENT ID: 20363290 ====================
;=============== COMP 3211 CODING ASSIGNMENT=================
;============================================================
;======================= PART 1 =============================

;=============================================================
;---------------------------------
;Variables:
;'list' - input list to be iterated through
;'operation' - operation to operate on each element in the list
;
;This function iterates through a list and calls an operation on each
;element in the list
;---------------------------------

(define (list-each operation list)
    (cond ((null? list) ;if the list passed in is null, then the function returns #f
        (operation #f))
    (else
        (operation (car list))
        (list-each operation (cdr list))
    ))
)
;============================================================
;============================================================
;---------------------------------
;Variables:
;'myList' - input list that contains the letters to be permuted
;
;This function contains the actual permutation sort of the code. 
;We first check to see if the list is null. If it is, then we have 
;reached the base case and we return a permutated list to be added 
;to our larger list. If it is not, then we swap some indices, 
;recursively call the function, starting with one index higher than before.
;---------------------------------

(define (permuteSort myList)     
	(cond ((null? myList) '()) 
	(
	  (null? (cdr myList)) 
	    (list myList)
	)
	(else
		(let splice ((empty '()) (first (car myList)) (rest (cdr myList)))      
		  (append (map (lambda (result) (cons first result)) (permuteSort (append empty rest)))
		      (if (null? rest) '()       
		        (splice (cons first empty) (car rest) (cdr rest))
		       )
		  )
		)
	))
)
;============================================================
;============================================================
;---------------------------------
;Variables:
;'list' - input list that contains the letters to be permuted
;
;This function first calls the 'permuteSort' function, which returns a list of lists. 
;Each individual list contains a list of letters that are a permutation of the 
;original input list 'list'. In order for the output to match the specifications, 
;we iterate through each of the inner lists and print them out. When we reach the 
;end of the parent list, we print "#f", as specified in the problem write-up
;---------------------------------

(define (permute list)  
	(let ((myList (permuteSort list))) 
		(list-each (
			lambda (x)
				(display x)
                (newline))
            myList)
    )
)
;============================================================

;======================== PART 2 ===========================

;============================================================
;---------------------------------
;Variables:
;'element' - the element that we are checking to see if it is in the list or not
;'list' - the list that we are checking over
;
;This function checks to see if a given element is in a given list.
;We use this to check if an individual permutation is in the defined dictionary in
;the 'anagram' function
;---------------------------------

(define (doesListContainThis? element list)
	(cond(
	    	(null? list) #f
	    )
		((eqv? element (car list)) #t)
	    (else (doesListContainThis? element (cdr list)))
    ))

;============================================================
;============================================================
;---------------------------------
;Variables:
;'myDict' - the input Dictionary that contains all valid 'words'
;'list' - the list that we are creating permutations of and then 
;seeing if it's permutations are in the dictionary
;
;This function is the main function of Part 2. We call permuteSort (as described in part 1), and
;then concatenate the elements each of the child lists returned into words. We then compare these words to each
;entry of the dictionary to check if it is a valid word. If the word is valid (as defined by the dictionary), then
;we print it out using 'display'. If it is not valid, we do nothing. If we reach the end of the permutations, then 
;the function returns '#f', which we then print out.
;
;Empty input lists return only '#f'.
;Input lists whose permutations contain no valid words return only "#f"
;---------------------------------

(define (anagram myDict list)  
	(let ((myList (permuteSort list))) 
		(list-each (
			lambda (a)	
				(if (equal? a '#f)
       				(begin
       					(display a)
       					(newline)
       				)
       				(begin
						(define word (string->symbol (apply string-append (map symbol->string a))))
		    			(if (doesListContainThis? word myDict) (begin (display a)(newline))
		    			)
       				)
       			)			
    		)
            myList)
    )
)