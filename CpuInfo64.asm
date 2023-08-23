_TEXT	SEGMENT


cpu_id_supported PROC
	
	push rbx         ; save rbx for the caller
	pushfq           ; push rflags on the stack
	pop rax          ; pop them into rax
	mov rbx, rax     ; save to rbx for restoring afterwards
	xor rax, 200000h ; toggle bit 21
	push rax         ; push the toggled rflags
	popfq            ; pop them back into rflags
	pushfq           ; push rflags
	pop rax          ; pop them back into rax
	cmp rax, rbx     ; see if bit 21 was reset
	jz not_supported
	
	mov eax, 1
	jmp exit
	
not_supported:
	xor eax, eax

exit:
	pop rbx
	ret
cpu_id_supported ENDP


cpu_processor_features_edx PROC

	call cpu_id_supported
	cmp eax, 0
	je exit
	
	push rbx
	
	mov eax, 1
	cpuid
	mov eax, edx

	pop rbx

exit:
	ret
cpu_processor_features_edx ENDP


cpu_processor_features_ecx PROC

	call cpu_id_supported
	cmp eax, 0
	je exit
	
	push rbx
	
	mov eax, 1
	cpuid
	mov eax, ecx

	pop rbx

exit:
	ret
cpu_processor_features_ecx ENDP


cpu_processor_features_ebx PROC

	call cpu_id_supported
	cmp eax, 0
	je exit
	
	push rbx
	
	mov eax, 1
	cpuid
	mov eax, ebx

	pop rbx

exit:
	ret
cpu_processor_features_ebx ENDP


cpu_processor_features_eax PROC

	call cpu_id_supported
	cmp eax, 0
	je exit
	
	push rbx
	
	mov eax, 1
	cpuid

	pop rbx

exit:
	ret
cpu_processor_features_eax ENDP


cpu_brand_part0 PROC
	
	push rbx

	call cpu_id_supported
	cmp eax, 0
	je exit

	mov eax, 80000000h
	cpuid
	cmp eax, 80000004h
	jnge not_supported

	mov eax, 80000002h
	cpuid

	xchg rbx, rax
	shl rax, 32
	shl rbx, 32
	shr rbx, 32
	or  rax, rbx

	jmp exit

not_supported:
	xor rax, rax
	
exit:
	pop rbx
	ret

cpu_brand_part0 ENDP


cpu_brand_part1 PROC
	
	push rbx

	call cpu_id_supported
	cmp eax, 0
	je exit

	mov eax, 80000000h
	cpuid
	cmp eax, 80000004h
	jnge not_supported

	mov eax, 80000002h
	cpuid

	mov rax, rdx
	shl rax, 32
	shl rcx, 32
	shr rcx, 32
	or  rax, rcx

	jmp exit
	

not_supported:
	xor eax, eax
	
exit:
	pop rbx
	ret

cpu_brand_part1 ENDP


cpu_brand_part2 PROC
	
	push rbx

	call cpu_id_supported
	cmp eax, 0
	je exit

	mov eax, 80000000h
	cpuid
	cmp eax, 80000004h
	jnge not_supported

	mov eax, 80000003h
	cpuid

	xchg rbx, rax
	shl rax, 32
	shl rbx, 32
	shr rbx, 32
	or  rax, rbx

	jmp exit
	

not_supported:
	xor eax, eax
	
exit:
	pop rbx
	ret

cpu_brand_part2 ENDP


cpu_brand_part3 PROC
	
	push rbx

	call cpu_id_supported
	cmp eax, 0
	je exit

	mov eax, 80000000h
	cpuid
	cmp eax, 80000004h
	jnge not_supported

	mov eax, 80000003h
	cpuid

	mov rax, rdx
	shl rax, 32
	shl rcx, 32
	shr rcx, 32
	or  rax, rcx

	jmp exit
	

not_supported:
	xor eax, eax
	
exit:
	pop rbx
	ret

cpu_brand_part3 ENDP


cpu_brand_part4 PROC
	
	push rbx

	call cpu_id_supported
	cmp eax, 0
	je exit

	mov eax, 80000000h
	cpuid
	cmp eax, 80000004h
	jnge not_supported

	mov eax, 80000004h
	cpuid

	xchg rbx, rax
	shl rax, 32
	shl rbx, 32
	shr rbx, 32
	or  rax, rbx

	jmp exit
	

not_supported:
	xor eax, eax
	
exit:
	pop rbx
	ret

cpu_brand_part4 ENDP


cpu_brand_part5 PROC
	
	push rbx

	call cpu_id_supported
	cmp eax, 0
	je exit

	mov eax, 80000000h
	cpuid
	cmp eax, 80000004h
	jnge not_supported

	mov eax, 80000004h
	cpuid

	mov rax, rdx
	shl rax, 32
	shl rcx, 32
	shr rcx, 32
	or  rax, rcx

	jmp exit
	

not_supported:
	xor eax, eax
	
exit:
	pop rbx
	ret

cpu_brand_part5 ENDP


cpu_avx PROC

	call cpu_id_supported
	cmp eax, 0
	je exit
	
	push rbx
	
	mov eax, 1
	cpuid
	shr ecx, 28
	and ecx, 1
	mov eax, ecx

	pop rbx

exit:
	ret
cpu_avx ENDP


cpu_avx2 PROC

	call cpu_id_supported
	cmp eax, 0
	je exit
	
	push rbx

	xor rbx, rbx
	
	mov eax, 7
	cpuid
	shr ebx, 5
	and ebx, 1
	mov eax, ebx

	pop rbx

exit:
	ret
cpu_avx2 ENDP


cpu_mmx PROC

	call cpu_id_supported
	cmp eax, 0
	je exit
	
	push rbx
	
	mov eax, 1
	cpuid
	shr edx, 23
	and edx, 1
	mov eax, edx

	pop rbx

exit:
	ret
cpu_mmx ENDP


cpu_sse PROC

	call cpu_id_supported
	cmp eax, 0
	je exit
	
	push rbx
	
	mov eax, 1
	cpuid
	shr edx, 25
	and edx, 1
	mov eax, edx

	pop rbx

exit:
	ret
cpu_sse ENDP


cpu_sse2 PROC

	call cpu_id_supported
	cmp eax, 0
	je exit

	push rbx

	mov eax, 1
	cpuid
	shr edx, 26
	and edx, 1
	mov eax, edx

	pop rbx

exit:
	ret
cpu_sse2 ENDP


cpu_sse3 PROC

	call cpu_id_supported
	cmp eax, 0
	je exit
	
	push rbx

	mov eax, 1
	cpuid
	and ecx, 1
	mov eax, ecx

	pop rbx

exit:
	ret
cpu_sse3 ENDP


cpu_ssse3 PROC

	call cpu_id_supported
	cmp eax, 0
	je exit
	
	push rbx

	mov eax, 1
	cpuid
	shr ecx, 9
	and ecx, 1
	mov eax, ecx

	pop rbx

exit:
	ret
cpu_ssse3 ENDP


cpu_sse41 PROC

	call cpu_id_supported
	cmp eax, 0
	je exit
	
	push rbx

	mov eax, 1
	cpuid
	shr ecx, 19
	and ecx, 1
	mov eax, ecx

	pop rbx

exit:
	ret
cpu_sse41 ENDP


cpu_sse42 PROC

	call cpu_id_supported
	cmp eax, 0
	je exit
	
	push rbx

	mov eax, 1
	cpuid
	shr ecx, 20
	and ecx, 1
	mov eax, ecx

	pop rbx

exit:
	ret
cpu_sse42 ENDP


cpu_logical_processor_count PROC

	call cpu_id_supported
	cmp eax, 0
	je exit

	call cpu_hyperthreading
	cmp eax, 0
	je exit

	push rbx

	mov eax, 1
	cpuid
	and ebx, 00FF0000h
	mov eax, ebx
	shr eax, 16

	pop rbx

exit:
	ret
cpu_logical_processor_count ENDP


cpu_hyperthreading PROC

	call cpu_id_supported
	cmp eax, 0
	je exit
	
	push rbx
	
	mov eax, 1
	cpuid
	shr edx, 28
	and edx, 1
	mov eax, edx

	pop rbx

exit:
	ret
cpu_hyperthreading ENDP


_TEXT	ENDS
END