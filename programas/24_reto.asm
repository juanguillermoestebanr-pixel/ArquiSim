.data
ARR:    .word 5, -3, 8, -1, 0, -7, 2, -4
RES:    .word 0

.text
main:   la   $a0, ARR
        li   $a1, 8
        jal  CONTAR
        la   $t0, RES
        sw   $v0, 0($t0)
        add  $t1, $zero, $zero
        li   $t3, 1
PINTAR: beq  $t1, $v0, FIN
        sb   $t3, 0x400($t1)
        addi $t1, $t1, 1
        j    PINTAR

CONTAR: add  $v0, $zero, $zero
        add  $t0, $zero, $zero
LOOP:   beq  $t0, $a1, RET
        sll  $t1, $t0, 2
        add  $t1, $t1, $a0
        lw   $t2, 0($t1)
        slt  $t3, $t2, $zero
        add  $v0, $v0, $t3
        addi $t0, $t0, 1
        j    LOOP
RET:    jr   $ra
FIN:
