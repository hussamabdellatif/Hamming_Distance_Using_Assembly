#Demo (comment)
#Filename: Hamming Distance



  .data
  first: .asciiz "input first num:"
  second: .asciiz "input second num:"
  third: .asciiz "Answer : "
  fourth: .asciiz " --          "



  .text

main2:
          li $v0, 4
          la $a0, first
          syscall

          li $v0, 5
          syscall

          #this is the first value
          move $s0, $v0

          li $v0, 4
          la $a0, second
          syscall

          li $v0,5
          syscall

          #second value
          move $s1, $v0

          li $s7, 0

          #s0 has the first value
          #$s1 has the second value

          li $s2, 10
          div $s0, $s2
          mfhi $s3
          mflo $s4
          div $s1, $s2
          mfhi $s5
          mflo $s6
          bne $s3, $s5, addone

secondbit:
          bne $s4, $s6, addtwo
          addi $a0, $s7, 0
          li $v0, 1
          syscall
          j main2

addone:
          addi $s7, $s7, 1
          j secondbit

addtwo:
          li $v0, 4
          la $a0, third
          syscall
         
          addi $a0, $s7, 1
          li $v0, 1
          syscall
          
          li $v0, 4
          la $a0, fourth
          syscall
          j main2






      #exit program
        li  $v0, 10
        syscall
