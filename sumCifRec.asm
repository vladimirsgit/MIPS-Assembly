#Functie recursiva ce returneaza in $v0, suma cifrelor unui word dat ca parametru, III.12):


.data
	promptMessage: .asciiz "Introdu un numar sa afli suma cifrelor sale: "
	resultMessage: .asciiz "\nSuma este:  "
	theNumber: .word 0
	theAnswer: .word 0
	
.text
	.globl main
	main:
		
		# Read the number from the user.
		li $v0, 4
		la $a0, promptMessage #arata mesajul
		syscall
		
		li $v0, 5 #user input
		syscall 
		
		sw $v0, theNumber #introducem ce se afla in $v0, in theNumber
		
		#Call the sumcifRec function
		lw $a0, theNumber
		jal sumcifRec
		sw $v0, theAnswer
		
		#Display the results
		li $v0, 4
		la $a0, resultMessage
		syscall
		
		li $v0, 1
		lw $a0, theAnswer
		syscall
		
		#Tell the OS that this is the end of the program
		li $v0, 10
		syscall
		
		

#sumcifRec function
.globl sumcifRec
	sumcifRec:
		subu $sp, $sp, 8
		sw $ra, ($sp)
		sw $s0, 4($sp)
		
		#Base case
		li $v0, 0
		beq $a0, 0, sumDone #daca nr este 0, returneaza  si du te la factorialDone
		
		
		#sumcifRec(theNumber / 10)
		move $s0, $a0 #ce contine a0 il trecem in s0
		
		
		div $a0, $a0, 10 #a0 trb sa devina a0/10
		mfhi $s0 #aducem in s0, a0%10
		jal sumcifRec #cheama din nou functia , acum cu a0 fiind impartit la 10
		
		#aici ajunge la finalul recursiei
		add $v0, $s0, $v0 #adaugam toate valorile pe care le aveam in stack
		
		sumDone:
			lw $ra, ($sp)
			lw $s0, 4($sp)
			addu $sp, $sp, 8
			
			jr $ra
		
		


		
		
		
		
		
		
		
		
		
		
		
