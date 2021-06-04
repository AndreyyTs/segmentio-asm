// Code generated by command: go run index_pair_asm.go -pkg mem -out ../mem/index_pair_amd64.s -stubs ../mem/index_pair_amd64.go. DO NOT EDIT.

#include "textflag.h"

// func indexPair1(b []byte) int
// Requires: AVX, AVX2, BMI
TEXT ·indexPair1(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	MOVQ AX, DX
	CMPQ CX, $0x00
	JLE  fail
	SUBQ $0x01, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JE   fail

generic:
	MOVB (AX), BL
	MOVB 1(AX), SI
	CMPB BL, SI
	JE   done
	ADDQ $0x01, AX
	SUBQ $0x01, CX
	CMPQ CX, $0x00
	JA   generic

fail:
	MOVQ $0xffffffffffffffff, AX
	MOVQ AX, ret+24(FP)
	RET

done:
	SUBQ DX, AX
	MOVQ AX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000101
	JB   avx2_tail128
	XORQ BX, BX
	XORQ SI, SI
	XORQ DI, DI
	XORQ R8, R8
	XORQ R9, R9
	XORQ R10, R10
	XORQ R11, R11
	XORQ R12, R12

avx2_loop256:
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   128(AX), Y8
	VMOVDQU   160(AX), Y10
	VMOVDQU   192(AX), Y12
	VMOVDQU   224(AX), Y14
	VMOVDQU   1(AX), Y1
	VMOVDQU   33(AX), Y3
	VMOVDQU   65(AX), Y5
	VMOVDQU   97(AX), Y7
	VMOVDQU   129(AX), Y9
	VMOVDQU   161(AX), Y11
	VMOVDQU   193(AX), Y13
	VMOVDQU   225(AX), Y15
	VPCMPEQB  Y0, Y1, Y1
	VPCMPEQB  Y2, Y3, Y3
	VPCMPEQB  Y4, Y5, Y5
	VPCMPEQB  Y6, Y7, Y7
	VPCMPEQB  Y8, Y9, Y9
	VPCMPEQB  Y10, Y11, Y11
	VPCMPEQB  Y12, Y13, Y13
	VPCMPEQB  Y14, Y15, Y15
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	VPMOVMSKB Y9, R9
	VPMOVMSKB Y11, R10
	VPMOVMSKB Y13, R11
	VPMOVMSKB Y15, R12
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	ORQ       DI, R13
	ORQ       R8, R13
	ORQ       R9, R13
	ORQ       R10, R13
	ORQ       R11, R13
	ORQ       R12, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000101
	JAE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0x81
	JB        avx2_tail64
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   1(AX), Y1
	VMOVDQU   33(AX), Y3
	VMOVDQU   65(AX), Y5
	VMOVDQU   97(AX), Y7
	VPCMPEQB  Y0, Y1, Y1
	VPCMPEQB  Y2, Y3, Y3
	VPCMPEQB  Y4, Y5, Y5
	VPCMPEQB  Y6, Y7, Y7
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	ORQ       DI, R13
	ORQ       R8, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x41
	JB        avx2_tail32
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   1(AX), Y1
	VMOVDQU   33(AX), Y3
	VPCMPEQB  Y0, Y1, Y1
	VPCMPEQB  Y2, Y3, Y3
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x21
	JB        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   1(AX), Y1
	VPCMPEQB  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	CMPQ      BX, $0x00
	JNE       avx2_done
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	CMPQ      CX, $0x11
	JB        avx2_tail
	VMOVDQU   (AX), X0
	VMOVDQU   1(AX), X1
	VPCMPEQB  X0, X1, X1
	VPMOVMSKB X1, BX
	CMPQ      BX, $0x00
	JNE       avx2_done
	ADDQ      $0x10, AX
	SUBQ      $0x10, CX

avx2_tail:
	VZEROUPPER
	JMP tail

avx2_done:
	VZEROUPPER
	CMPQ BX, $0x00
	JNE  avx2_done0
	CMPQ SI, $0x00
	JNE  avx2_done1
	CMPQ DI, $0x00
	JNE  avx2_done2
	CMPQ R8, $0x00
	JNE  avx2_done3
	CMPQ R9, $0x00
	JNE  avx2_done4
	CMPQ R10, $0x00
	JNE  avx2_done5
	CMPQ R11, $0x00
	JNE  avx2_done6
	CMPQ R12, $0x00
	JNE  avx2_done7

avx2_done0:
	TZCNTQ BX, BX
	ADDQ   BX, AX
	SUBQ   BX, CX
	JMP    done

avx2_done1:
	ADDQ   $0x00000020, AX
	SUBQ   $0x00000020, CX
	TZCNTQ SI, SI
	ADDQ   SI, AX
	SUBQ   SI, CX
	JMP    done

avx2_done2:
	ADDQ   $0x00000040, AX
	SUBQ   $0x00000040, CX
	TZCNTQ DI, DI
	ADDQ   DI, AX
	SUBQ   DI, CX
	JMP    done

avx2_done3:
	ADDQ   $0x00000060, AX
	SUBQ   $0x00000060, CX
	TZCNTQ R8, R8
	ADDQ   R8, AX
	SUBQ   R8, CX
	JMP    done

avx2_done4:
	ADDQ   $0x00000080, AX
	SUBQ   $0x00000080, CX
	TZCNTQ R9, R9
	ADDQ   R9, AX
	SUBQ   R9, CX
	JMP    done

avx2_done5:
	ADDQ   $0x000000a0, AX
	SUBQ   $0x000000a0, CX
	TZCNTQ R10, R10
	ADDQ   R10, AX
	SUBQ   R10, CX
	JMP    done

avx2_done6:
	ADDQ   $0x000000c0, AX
	SUBQ   $0x000000c0, CX
	TZCNTQ R11, R11
	ADDQ   R11, AX
	SUBQ   R11, CX
	JMP    done

avx2_done7:
	ADDQ   $0x000000e0, AX
	SUBQ   $0x000000e0, CX
	TZCNTQ R12, R12
	ADDQ   R12, AX
	SUBQ   R12, CX
	JMP    done

// func indexPair2(b []byte) int
// Requires: AVX, AVX2, BMI
TEXT ·indexPair2(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	MOVQ AX, DX
	CMPQ CX, $0x00
	JLE  fail
	SUBQ $0x02, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JE   fail

generic:
	MOVW (AX), BX
	MOVW 2(AX), SI
	CMPW BX, SI
	JE   done
	ADDQ $0x02, AX
	SUBQ $0x02, CX
	CMPQ CX, $0x00
	JA   generic

fail:
	MOVQ $0xffffffffffffffff, AX
	MOVQ AX, ret+24(FP)
	RET

done:
	SUBQ DX, AX
	MOVQ AX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000102
	JB   avx2_tail128
	XORQ BX, BX
	XORQ SI, SI
	XORQ DI, DI
	XORQ R8, R8
	XORQ R9, R9
	XORQ R10, R10
	XORQ R11, R11
	XORQ R12, R12

avx2_loop256:
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   128(AX), Y8
	VMOVDQU   160(AX), Y10
	VMOVDQU   192(AX), Y12
	VMOVDQU   224(AX), Y14
	VMOVDQU   2(AX), Y1
	VMOVDQU   34(AX), Y3
	VMOVDQU   66(AX), Y5
	VMOVDQU   98(AX), Y7
	VMOVDQU   130(AX), Y9
	VMOVDQU   162(AX), Y11
	VMOVDQU   194(AX), Y13
	VMOVDQU   226(AX), Y15
	VPCMPEQW  Y0, Y1, Y1
	VPCMPEQW  Y2, Y3, Y3
	VPCMPEQW  Y4, Y5, Y5
	VPCMPEQW  Y6, Y7, Y7
	VPCMPEQW  Y8, Y9, Y9
	VPCMPEQW  Y10, Y11, Y11
	VPCMPEQW  Y12, Y13, Y13
	VPCMPEQW  Y14, Y15, Y15
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	VPMOVMSKB Y9, R9
	VPMOVMSKB Y11, R10
	VPMOVMSKB Y13, R11
	VPMOVMSKB Y15, R12
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	ORQ       DI, R13
	ORQ       R8, R13
	ORQ       R9, R13
	ORQ       R10, R13
	ORQ       R11, R13
	ORQ       R12, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000102
	JAE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0x82
	JB        avx2_tail64
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   2(AX), Y1
	VMOVDQU   34(AX), Y3
	VMOVDQU   66(AX), Y5
	VMOVDQU   98(AX), Y7
	VPCMPEQW  Y0, Y1, Y1
	VPCMPEQW  Y2, Y3, Y3
	VPCMPEQW  Y4, Y5, Y5
	VPCMPEQW  Y6, Y7, Y7
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	ORQ       DI, R13
	ORQ       R8, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x42
	JB        avx2_tail32
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   2(AX), Y1
	VMOVDQU   34(AX), Y3
	VPCMPEQW  Y0, Y1, Y1
	VPCMPEQW  Y2, Y3, Y3
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x22
	JB        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   2(AX), Y1
	VPCMPEQW  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	CMPQ      BX, $0x00
	JNE       avx2_done
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	CMPQ      CX, $0x12
	JB        avx2_tail
	VMOVDQU   (AX), X0
	VMOVDQU   2(AX), X1
	VPCMPEQW  X0, X1, X1
	VPMOVMSKB X1, BX
	CMPQ      BX, $0x00
	JNE       avx2_done
	ADDQ      $0x10, AX
	SUBQ      $0x10, CX

avx2_tail:
	VZEROUPPER
	JMP tail

avx2_done:
	VZEROUPPER
	CMPQ BX, $0x00
	JNE  avx2_done0
	CMPQ SI, $0x00
	JNE  avx2_done1
	CMPQ DI, $0x00
	JNE  avx2_done2
	CMPQ R8, $0x00
	JNE  avx2_done3
	CMPQ R9, $0x00
	JNE  avx2_done4
	CMPQ R10, $0x00
	JNE  avx2_done5
	CMPQ R11, $0x00
	JNE  avx2_done6
	CMPQ R12, $0x00
	JNE  avx2_done7

avx2_done0:
	TZCNTQ BX, BX
	ADDQ   BX, AX
	SUBQ   BX, CX
	JMP    done

avx2_done1:
	ADDQ   $0x00000020, AX
	SUBQ   $0x00000020, CX
	TZCNTQ SI, SI
	ADDQ   SI, AX
	SUBQ   SI, CX
	JMP    done

avx2_done2:
	ADDQ   $0x00000040, AX
	SUBQ   $0x00000040, CX
	TZCNTQ DI, DI
	ADDQ   DI, AX
	SUBQ   DI, CX
	JMP    done

avx2_done3:
	ADDQ   $0x00000060, AX
	SUBQ   $0x00000060, CX
	TZCNTQ R8, R8
	ADDQ   R8, AX
	SUBQ   R8, CX
	JMP    done

avx2_done4:
	ADDQ   $0x00000080, AX
	SUBQ   $0x00000080, CX
	TZCNTQ R9, R9
	ADDQ   R9, AX
	SUBQ   R9, CX
	JMP    done

avx2_done5:
	ADDQ   $0x000000a0, AX
	SUBQ   $0x000000a0, CX
	TZCNTQ R10, R10
	ADDQ   R10, AX
	SUBQ   R10, CX
	JMP    done

avx2_done6:
	ADDQ   $0x000000c0, AX
	SUBQ   $0x000000c0, CX
	TZCNTQ R11, R11
	ADDQ   R11, AX
	SUBQ   R11, CX
	JMP    done

avx2_done7:
	ADDQ   $0x000000e0, AX
	SUBQ   $0x000000e0, CX
	TZCNTQ R12, R12
	ADDQ   R12, AX
	SUBQ   R12, CX
	JMP    done

// func indexPair4(b []byte) int
// Requires: AVX, AVX2, BMI
TEXT ·indexPair4(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	MOVQ AX, DX
	CMPQ CX, $0x00
	JLE  fail
	SUBQ $0x04, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JE   fail

generic:
	MOVL (AX), BX
	MOVL 4(AX), SI
	CMPL BX, SI
	JE   done
	ADDQ $0x04, AX
	SUBQ $0x04, CX
	CMPQ CX, $0x00
	JA   generic

fail:
	MOVQ $0xffffffffffffffff, AX
	MOVQ AX, ret+24(FP)
	RET

done:
	SUBQ DX, AX
	MOVQ AX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000104
	JB   avx2_tail128
	XORQ BX, BX
	XORQ SI, SI
	XORQ DI, DI
	XORQ R8, R8
	XORQ R9, R9
	XORQ R10, R10
	XORQ R11, R11
	XORQ R12, R12

avx2_loop256:
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   128(AX), Y8
	VMOVDQU   160(AX), Y10
	VMOVDQU   192(AX), Y12
	VMOVDQU   224(AX), Y14
	VMOVDQU   4(AX), Y1
	VMOVDQU   36(AX), Y3
	VMOVDQU   68(AX), Y5
	VMOVDQU   100(AX), Y7
	VMOVDQU   132(AX), Y9
	VMOVDQU   164(AX), Y11
	VMOVDQU   196(AX), Y13
	VMOVDQU   228(AX), Y15
	VPCMPEQD  Y0, Y1, Y1
	VPCMPEQD  Y2, Y3, Y3
	VPCMPEQD  Y4, Y5, Y5
	VPCMPEQD  Y6, Y7, Y7
	VPCMPEQD  Y8, Y9, Y9
	VPCMPEQD  Y10, Y11, Y11
	VPCMPEQD  Y12, Y13, Y13
	VPCMPEQD  Y14, Y15, Y15
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	VPMOVMSKB Y9, R9
	VPMOVMSKB Y11, R10
	VPMOVMSKB Y13, R11
	VPMOVMSKB Y15, R12
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	ORQ       DI, R13
	ORQ       R8, R13
	ORQ       R9, R13
	ORQ       R10, R13
	ORQ       R11, R13
	ORQ       R12, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000104
	JAE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0x84
	JB        avx2_tail64
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   4(AX), Y1
	VMOVDQU   36(AX), Y3
	VMOVDQU   68(AX), Y5
	VMOVDQU   100(AX), Y7
	VPCMPEQD  Y0, Y1, Y1
	VPCMPEQD  Y2, Y3, Y3
	VPCMPEQD  Y4, Y5, Y5
	VPCMPEQD  Y6, Y7, Y7
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	ORQ       DI, R13
	ORQ       R8, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x44
	JB        avx2_tail32
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   4(AX), Y1
	VMOVDQU   36(AX), Y3
	VPCMPEQD  Y0, Y1, Y1
	VPCMPEQD  Y2, Y3, Y3
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x24
	JB        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   4(AX), Y1
	VPCMPEQD  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	CMPQ      BX, $0x00
	JNE       avx2_done
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	CMPQ      CX, $0x14
	JB        avx2_tail
	VMOVDQU   (AX), X0
	VMOVDQU   4(AX), X1
	VPCMPEQD  X0, X1, X1
	VPMOVMSKB X1, BX
	CMPQ      BX, $0x00
	JNE       avx2_done
	ADDQ      $0x10, AX
	SUBQ      $0x10, CX

avx2_tail:
	VZEROUPPER
	JMP tail

avx2_done:
	VZEROUPPER
	CMPQ BX, $0x00
	JNE  avx2_done0
	CMPQ SI, $0x00
	JNE  avx2_done1
	CMPQ DI, $0x00
	JNE  avx2_done2
	CMPQ R8, $0x00
	JNE  avx2_done3
	CMPQ R9, $0x00
	JNE  avx2_done4
	CMPQ R10, $0x00
	JNE  avx2_done5
	CMPQ R11, $0x00
	JNE  avx2_done6
	CMPQ R12, $0x00
	JNE  avx2_done7

avx2_done0:
	TZCNTQ BX, BX
	ADDQ   BX, AX
	SUBQ   BX, CX
	JMP    done

avx2_done1:
	ADDQ   $0x00000020, AX
	SUBQ   $0x00000020, CX
	TZCNTQ SI, SI
	ADDQ   SI, AX
	SUBQ   SI, CX
	JMP    done

avx2_done2:
	ADDQ   $0x00000040, AX
	SUBQ   $0x00000040, CX
	TZCNTQ DI, DI
	ADDQ   DI, AX
	SUBQ   DI, CX
	JMP    done

avx2_done3:
	ADDQ   $0x00000060, AX
	SUBQ   $0x00000060, CX
	TZCNTQ R8, R8
	ADDQ   R8, AX
	SUBQ   R8, CX
	JMP    done

avx2_done4:
	ADDQ   $0x00000080, AX
	SUBQ   $0x00000080, CX
	TZCNTQ R9, R9
	ADDQ   R9, AX
	SUBQ   R9, CX
	JMP    done

avx2_done5:
	ADDQ   $0x000000a0, AX
	SUBQ   $0x000000a0, CX
	TZCNTQ R10, R10
	ADDQ   R10, AX
	SUBQ   R10, CX
	JMP    done

avx2_done6:
	ADDQ   $0x000000c0, AX
	SUBQ   $0x000000c0, CX
	TZCNTQ R11, R11
	ADDQ   R11, AX
	SUBQ   R11, CX
	JMP    done

avx2_done7:
	ADDQ   $0x000000e0, AX
	SUBQ   $0x000000e0, CX
	TZCNTQ R12, R12
	ADDQ   R12, AX
	SUBQ   R12, CX
	JMP    done

// func indexPair8(b []byte) int
// Requires: AVX, AVX2, BMI
TEXT ·indexPair8(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	MOVQ AX, DX
	CMPQ CX, $0x00
	JLE  fail
	SUBQ $0x08, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JE   fail

generic:
	MOVQ (AX), BX
	MOVQ 8(AX), SI
	CMPQ BX, SI
	JE   done
	ADDQ $0x08, AX
	SUBQ $0x08, CX
	CMPQ CX, $0x00
	JA   generic

fail:
	MOVQ $0xffffffffffffffff, AX
	MOVQ AX, ret+24(FP)
	RET

done:
	SUBQ DX, AX
	MOVQ AX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000108
	JB   avx2_tail128
	XORQ BX, BX
	XORQ SI, SI
	XORQ DI, DI
	XORQ R8, R8
	XORQ R9, R9
	XORQ R10, R10
	XORQ R11, R11
	XORQ R12, R12

avx2_loop256:
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   128(AX), Y8
	VMOVDQU   160(AX), Y10
	VMOVDQU   192(AX), Y12
	VMOVDQU   224(AX), Y14
	VMOVDQU   8(AX), Y1
	VMOVDQU   40(AX), Y3
	VMOVDQU   72(AX), Y5
	VMOVDQU   104(AX), Y7
	VMOVDQU   136(AX), Y9
	VMOVDQU   168(AX), Y11
	VMOVDQU   200(AX), Y13
	VMOVDQU   232(AX), Y15
	VPCMPEQQ  Y0, Y1, Y1
	VPCMPEQQ  Y2, Y3, Y3
	VPCMPEQQ  Y4, Y5, Y5
	VPCMPEQQ  Y6, Y7, Y7
	VPCMPEQQ  Y8, Y9, Y9
	VPCMPEQQ  Y10, Y11, Y11
	VPCMPEQQ  Y12, Y13, Y13
	VPCMPEQQ  Y14, Y15, Y15
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	VPMOVMSKB Y9, R9
	VPMOVMSKB Y11, R10
	VPMOVMSKB Y13, R11
	VPMOVMSKB Y15, R12
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	ORQ       DI, R13
	ORQ       R8, R13
	ORQ       R9, R13
	ORQ       R10, R13
	ORQ       R11, R13
	ORQ       R12, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000108
	JAE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0x88
	JB        avx2_tail64
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   8(AX), Y1
	VMOVDQU   40(AX), Y3
	VMOVDQU   72(AX), Y5
	VMOVDQU   104(AX), Y7
	VPCMPEQQ  Y0, Y1, Y1
	VPCMPEQQ  Y2, Y3, Y3
	VPCMPEQQ  Y4, Y5, Y5
	VPCMPEQQ  Y6, Y7, Y7
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	ORQ       DI, R13
	ORQ       R8, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x48
	JB        avx2_tail32
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   8(AX), Y1
	VMOVDQU   40(AX), Y3
	VPCMPEQQ  Y0, Y1, Y1
	VPCMPEQQ  Y2, Y3, Y3
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x28
	JB        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   8(AX), Y1
	VPCMPEQQ  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	CMPQ      BX, $0x00
	JNE       avx2_done
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	CMPQ      CX, $0x18
	JB        avx2_tail
	VMOVDQU   (AX), X0
	VMOVDQU   8(AX), X1
	VPCMPEQQ  X0, X1, X1
	VPMOVMSKB X1, BX
	CMPQ      BX, $0x00
	JNE       avx2_done
	ADDQ      $0x10, AX
	SUBQ      $0x10, CX

avx2_tail:
	VZEROUPPER
	JMP tail

avx2_done:
	VZEROUPPER
	CMPQ BX, $0x00
	JNE  avx2_done0
	CMPQ SI, $0x00
	JNE  avx2_done1
	CMPQ DI, $0x00
	JNE  avx2_done2
	CMPQ R8, $0x00
	JNE  avx2_done3
	CMPQ R9, $0x00
	JNE  avx2_done4
	CMPQ R10, $0x00
	JNE  avx2_done5
	CMPQ R11, $0x00
	JNE  avx2_done6
	CMPQ R12, $0x00
	JNE  avx2_done7

avx2_done0:
	TZCNTQ BX, BX
	ADDQ   BX, AX
	SUBQ   BX, CX
	JMP    done

avx2_done1:
	ADDQ   $0x00000020, AX
	SUBQ   $0x00000020, CX
	TZCNTQ SI, SI
	ADDQ   SI, AX
	SUBQ   SI, CX
	JMP    done

avx2_done2:
	ADDQ   $0x00000040, AX
	SUBQ   $0x00000040, CX
	TZCNTQ DI, DI
	ADDQ   DI, AX
	SUBQ   DI, CX
	JMP    done

avx2_done3:
	ADDQ   $0x00000060, AX
	SUBQ   $0x00000060, CX
	TZCNTQ R8, R8
	ADDQ   R8, AX
	SUBQ   R8, CX
	JMP    done

avx2_done4:
	ADDQ   $0x00000080, AX
	SUBQ   $0x00000080, CX
	TZCNTQ R9, R9
	ADDQ   R9, AX
	SUBQ   R9, CX
	JMP    done

avx2_done5:
	ADDQ   $0x000000a0, AX
	SUBQ   $0x000000a0, CX
	TZCNTQ R10, R10
	ADDQ   R10, AX
	SUBQ   R10, CX
	JMP    done

avx2_done6:
	ADDQ   $0x000000c0, AX
	SUBQ   $0x000000c0, CX
	TZCNTQ R11, R11
	ADDQ   R11, AX
	SUBQ   R11, CX
	JMP    done

avx2_done7:
	ADDQ   $0x000000e0, AX
	SUBQ   $0x000000e0, CX
	TZCNTQ R12, R12
	ADDQ   R12, AX
	SUBQ   R12, CX
	JMP    done

// func indexPair16(b []byte) int
// Requires: AVX, AVX2, BMI, SSE2, SSE4.1
TEXT ·indexPair16(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	MOVQ AX, DX
	CMPQ CX, $0x00
	JLE  fail
	SUBQ $0x10, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JE   fail

generic:
	MOVOU    (AX), X0
	MOVOU    16(AX), X1
	PCMPEQQ  X0, X1
	PMOVMSKB X1, BX
	CMPL     BX, $0x0000ffff
	JE       done
	ADDQ     $0x10, AX
	SUBQ     $0x10, CX
	CMPQ     CX, $0x00
	JA       generic

fail:
	MOVQ $0xffffffffffffffff, AX
	MOVQ AX, ret+24(FP)
	RET

done:
	SUBQ DX, AX
	MOVQ AX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000110
	JB   avx2_tail128
	XORQ BX, BX
	XORQ SI, SI
	XORQ DI, DI
	XORQ R8, R8
	XORQ R9, R9
	XORQ R10, R10
	XORQ R11, R11
	XORQ R12, R12

avx2_loop256:
	VMOVDQU    (AX), Y0
	VMOVDQU    32(AX), Y2
	VMOVDQU    64(AX), Y4
	VMOVDQU    96(AX), Y6
	VMOVDQU    128(AX), Y8
	VMOVDQU    160(AX), Y10
	VMOVDQU    192(AX), Y12
	VMOVDQU    224(AX), Y14
	VPERM2I128 $0x21, Y2, Y0, Y1
	VPERM2I128 $0x21, Y4, Y2, Y3
	VPERM2I128 $0x21, Y6, Y4, Y5
	VPERM2I128 $0x21, Y8, Y6, Y7
	VPERM2I128 $0x21, Y10, Y8, Y9
	VPERM2I128 $0x21, Y12, Y10, Y11
	VPERM2I128 $0x21, Y14, Y12, Y13
	VMOVDQU    240(AX), Y15
	VPCMPEQQ   Y0, Y1, Y1
	VPCMPEQQ   Y2, Y3, Y3
	VPCMPEQQ   Y4, Y5, Y5
	VPCMPEQQ   Y6, Y7, Y7
	VPCMPEQQ   Y8, Y9, Y9
	VPCMPEQQ   Y10, Y11, Y11
	VPCMPEQQ   Y12, Y13, Y13
	VPCMPEQQ   Y14, Y15, Y15
	VPERMQ     $0xb1, Y1, Y0
	VPAND      Y1, Y0, Y0
	VPMOVMSKB  Y0, BX
	VPERMQ     $0xb1, Y3, Y2
	VPAND      Y3, Y2, Y2
	VPMOVMSKB  Y2, SI
	VPERMQ     $0xb1, Y5, Y4
	VPAND      Y5, Y4, Y4
	VPMOVMSKB  Y4, DI
	VPERMQ     $0xb1, Y7, Y6
	VPAND      Y7, Y6, Y6
	VPMOVMSKB  Y6, R8
	VPERMQ     $0xb1, Y9, Y8
	VPAND      Y9, Y8, Y8
	VPMOVMSKB  Y8, R9
	VPERMQ     $0xb1, Y11, Y10
	VPAND      Y11, Y10, Y10
	VPMOVMSKB  Y10, R10
	VPERMQ     $0xb1, Y13, Y12
	VPAND      Y13, Y12, Y12
	VPMOVMSKB  Y12, R11
	VPERMQ     $0xb1, Y15, Y14
	VPAND      Y15, Y14, Y14
	VPMOVMSKB  Y14, R12
	XORQ       R13, R13
	ORQ        BX, R13
	ORQ        SI, R13
	ORQ        DI, R13
	ORQ        R8, R13
	ORQ        R9, R13
	ORQ        R10, R13
	ORQ        R11, R13
	ORQ        R12, R13
	CMPQ       R13, $0x00
	JNE        avx2_done
	ADDQ       $0x00000100, AX
	SUBQ       $0x00000100, CX
	CMPQ       CX, $0x00000110
	JAE        avx2_loop256

avx2_tail128:
	CMPQ       CX, $0x90
	JB         avx2_tail64
	VMOVDQU    (AX), Y0
	VMOVDQU    32(AX), Y2
	VMOVDQU    64(AX), Y4
	VMOVDQU    96(AX), Y6
	VPERM2I128 $0x21, Y2, Y0, Y1
	VPERM2I128 $0x21, Y4, Y2, Y3
	VPERM2I128 $0x21, Y6, Y4, Y5
	VMOVDQU    112(AX), Y7
	VPCMPEQQ   Y0, Y1, Y1
	VPCMPEQQ   Y2, Y3, Y3
	VPCMPEQQ   Y4, Y5, Y5
	VPCMPEQQ   Y6, Y7, Y7
	VPERMQ     $0xb1, Y1, Y0
	VPAND      Y1, Y0, Y0
	VPMOVMSKB  Y0, BX
	VPERMQ     $0xb1, Y3, Y2
	VPAND      Y3, Y2, Y2
	VPMOVMSKB  Y2, SI
	VPERMQ     $0xb1, Y5, Y4
	VPAND      Y5, Y4, Y4
	VPMOVMSKB  Y4, DI
	VPERMQ     $0xb1, Y7, Y6
	VPAND      Y7, Y6, Y6
	VPMOVMSKB  Y6, R8
	XORQ       R13, R13
	ORQ        BX, R13
	ORQ        SI, R13
	ORQ        DI, R13
	ORQ        R8, R13
	CMPQ       R13, $0x00
	JNE        avx2_done
	ADDQ       $0x00000080, AX
	SUBQ       $0x00000080, CX

avx2_tail64:
	CMPQ       CX, $0x50
	JB         avx2_tail32
	VMOVDQU    (AX), Y0
	VMOVDQU    32(AX), Y2
	VPERM2I128 $0x21, Y2, Y0, Y1
	VMOVDQU    48(AX), Y3
	VPCMPEQQ   Y0, Y1, Y1
	VPCMPEQQ   Y2, Y3, Y3
	VPERMQ     $0xb1, Y1, Y0
	VPAND      Y1, Y0, Y0
	VPMOVMSKB  Y0, BX
	VPERMQ     $0xb1, Y3, Y2
	VPAND      Y3, Y2, Y2
	VPMOVMSKB  Y2, SI
	XORQ       R13, R13
	ORQ        BX, R13
	ORQ        SI, R13
	CMPQ       R13, $0x00
	JNE        avx2_done
	ADDQ       $0x00000040, AX
	SUBQ       $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x30
	JB        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   16(AX), Y1
	VPCMPEQQ  Y0, Y1, Y1
	VPERMQ    $0xb1, Y1, Y0
	VPAND     Y1, Y0, Y0
	VPMOVMSKB Y0, BX
	CMPQ      BX, $0x00
	JNE       avx2_done
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	VZEROUPPER
	JMP tail

avx2_done:
	VZEROUPPER
	CMPQ BX, $0x00
	JNE  avx2_done0
	CMPQ SI, $0x00
	JNE  avx2_done1
	CMPQ DI, $0x00
	JNE  avx2_done2
	CMPQ R8, $0x00
	JNE  avx2_done3
	CMPQ R9, $0x00
	JNE  avx2_done4
	CMPQ R10, $0x00
	JNE  avx2_done5
	CMPQ R11, $0x00
	JNE  avx2_done6
	CMPQ R12, $0x00
	JNE  avx2_done7

avx2_done0:
	TZCNTQ BX, BX
	ADDQ   BX, AX
	SUBQ   BX, CX
	JMP    done

avx2_done1:
	ADDQ   $0x00000020, AX
	SUBQ   $0x00000020, CX
	TZCNTQ SI, SI
	ADDQ   SI, AX
	SUBQ   SI, CX
	JMP    done

avx2_done2:
	ADDQ   $0x00000040, AX
	SUBQ   $0x00000040, CX
	TZCNTQ DI, DI
	ADDQ   DI, AX
	SUBQ   DI, CX
	JMP    done

avx2_done3:
	ADDQ   $0x00000060, AX
	SUBQ   $0x00000060, CX
	TZCNTQ R8, R8
	ADDQ   R8, AX
	SUBQ   R8, CX
	JMP    done

avx2_done4:
	ADDQ   $0x00000080, AX
	SUBQ   $0x00000080, CX
	TZCNTQ R9, R9
	ADDQ   R9, AX
	SUBQ   R9, CX
	JMP    done

avx2_done5:
	ADDQ   $0x000000a0, AX
	SUBQ   $0x000000a0, CX
	TZCNTQ R10, R10
	ADDQ   R10, AX
	SUBQ   R10, CX
	JMP    done

avx2_done6:
	ADDQ   $0x000000c0, AX
	SUBQ   $0x000000c0, CX
	TZCNTQ R11, R11
	ADDQ   R11, AX
	SUBQ   R11, CX
	JMP    done

avx2_done7:
	ADDQ   $0x000000e0, AX
	SUBQ   $0x000000e0, CX
	TZCNTQ R12, R12
	ADDQ   R12, AX
	SUBQ   R12, CX
	JMP    done

// func indexPair32(b []byte) int
// Requires: AVX, AVX2, BMI, CMOV, SSE2, SSE4.1
TEXT ·indexPair32(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	MOVQ AX, DX
	CMPQ CX, $0x00
	JLE  fail
	SUBQ $0x20, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JE   fail

generic:
	MOVOU    (AX), X0
	MOVOU    16(AX), X1
	MOVOU    32(AX), X2
	MOVOU    48(AX), X3
	PCMPEQQ  X0, X2
	PCMPEQQ  X1, X3
	PMOVMSKB X2, BX
	PMOVMSKB X3, SI
	ANDL     SI, BX
	CMPL     BX, $0x0000ffff
	JE       done
	ADDQ     $0x20, AX
	SUBQ     $0x20, CX
	CMPQ     CX, $0x00
	JA       generic

fail:
	MOVQ $0xffffffffffffffff, AX
	MOVQ AX, ret+24(FP)
	RET

done:
	SUBQ DX, AX
	MOVQ AX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000120
	JB   avx2_tail128
	XORQ BX, BX
	XORQ SI, SI
	XORQ DI, DI
	XORQ R8, R8
	XORQ R9, R9
	XORQ R10, R10
	XORQ R11, R11
	XORQ R12, R12

avx2_loop256:
	XORQ      R13, R13
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y5
	VMOVDQU   128(AX), Y7
	VMOVDQU   160(AX), Y8
	VMOVDQU   192(AX), Y9
	VMOVDQU   224(AX), Y10
	VMOVDQU   256(AX), Y11
	VPCMPEQQ  Y0, Y2, Y1
	VPCMPEQQ  Y2, Y4, Y3
	VPCMPEQQ  Y4, Y5, Y0
	VPCMPEQQ  Y5, Y7, Y6
	VPCMPEQQ  Y7, Y8, Y2
	VPCMPEQQ  Y8, Y9, Y4
	VPCMPEQQ  Y9, Y10, Y5
	VPCMPEQQ  Y10, Y11, Y11
	VPMOVMSKB Y1, BX
	CMPL      BX, $0xffffffff
	CMOVLNE   R13, BX
	VPMOVMSKB Y3, SI
	CMPL      SI, $0xffffffff
	CMOVLNE   R13, SI
	VPMOVMSKB Y0, DI
	CMPL      DI, $0xffffffff
	CMOVLNE   R13, DI
	VPMOVMSKB Y6, R8
	CMPL      R8, $0xffffffff
	CMOVLNE   R13, R8
	VPMOVMSKB Y2, R9
	CMPL      R9, $0xffffffff
	CMOVLNE   R13, R9
	VPMOVMSKB Y4, R10
	CMPL      R10, $0xffffffff
	CMOVLNE   R13, R10
	VPMOVMSKB Y5, R11
	CMPL      R11, $0xffffffff
	CMOVLNE   R13, R11
	VPMOVMSKB Y11, R12
	CMPL      R12, $0xffffffff
	CMOVLNE   R13, R12
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	ORQ       DI, R13
	ORQ       R8, R13
	ORQ       R9, R13
	ORQ       R10, R13
	ORQ       R11, R13
	ORQ       R12, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000120
	JAE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0xa0
	JB        avx2_tail64
	XORQ      R13, R13
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y5
	VMOVDQU   128(AX), Y6
	VPCMPEQQ  Y0, Y2, Y1
	VPCMPEQQ  Y2, Y4, Y3
	VPCMPEQQ  Y4, Y5, Y0
	VPCMPEQQ  Y5, Y6, Y6
	VPMOVMSKB Y1, BX
	CMPL      BX, $0xffffffff
	CMOVLNE   R13, BX
	VPMOVMSKB Y3, SI
	CMPL      SI, $0xffffffff
	CMOVLNE   R13, SI
	VPMOVMSKB Y0, DI
	CMPL      DI, $0xffffffff
	CMOVLNE   R13, DI
	VPMOVMSKB Y6, R8
	CMPL      R8, $0xffffffff
	CMOVLNE   R13, R8
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	ORQ       DI, R13
	ORQ       R8, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x60
	JB        avx2_tail32
	XORQ      R13, R13
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y3
	VPCMPEQQ  Y0, Y2, Y1
	VPCMPEQQ  Y2, Y3, Y3
	VPMOVMSKB Y1, BX
	CMPL      BX, $0xffffffff
	CMOVLNE   R13, BX
	VPMOVMSKB Y3, SI
	CMPL      SI, $0xffffffff
	CMOVLNE   R13, SI
	XORQ      R13, R13
	ORQ       BX, R13
	ORQ       SI, R13
	CMPQ      R13, $0x00
	JNE       avx2_done
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x40
	JB        avx2_tail16
	XORQ      R13, R13
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y1
	VPCMPEQQ  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	CMPL      BX, $0xffffffff
	CMOVLNE   R13, BX
	CMPQ      BX, $0x00
	JNE       avx2_done
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	VZEROUPPER
	JMP tail

avx2_done:
	VZEROUPPER
	CMPQ BX, $0x00
	JNE  avx2_done0
	CMPQ SI, $0x00
	JNE  avx2_done1
	CMPQ DI, $0x00
	JNE  avx2_done2
	CMPQ R8, $0x00
	JNE  avx2_done3
	CMPQ R9, $0x00
	JNE  avx2_done4
	CMPQ R10, $0x00
	JNE  avx2_done5
	CMPQ R11, $0x00
	JNE  avx2_done6
	CMPQ R12, $0x00
	JNE  avx2_done7

avx2_done0:
	TZCNTQ BX, BX
	ADDQ   BX, AX
	SUBQ   BX, CX
	JMP    done

avx2_done1:
	ADDQ   $0x00000020, AX
	SUBQ   $0x00000020, CX
	TZCNTQ SI, SI
	ADDQ   SI, AX
	SUBQ   SI, CX
	JMP    done

avx2_done2:
	ADDQ   $0x00000040, AX
	SUBQ   $0x00000040, CX
	TZCNTQ DI, DI
	ADDQ   DI, AX
	SUBQ   DI, CX
	JMP    done

avx2_done3:
	ADDQ   $0x00000060, AX
	SUBQ   $0x00000060, CX
	TZCNTQ R8, R8
	ADDQ   R8, AX
	SUBQ   R8, CX
	JMP    done

avx2_done4:
	ADDQ   $0x00000080, AX
	SUBQ   $0x00000080, CX
	TZCNTQ R9, R9
	ADDQ   R9, AX
	SUBQ   R9, CX
	JMP    done

avx2_done5:
	ADDQ   $0x000000a0, AX
	SUBQ   $0x000000a0, CX
	TZCNTQ R10, R10
	ADDQ   R10, AX
	SUBQ   R10, CX
	JMP    done

avx2_done6:
	ADDQ   $0x000000c0, AX
	SUBQ   $0x000000c0, CX
	TZCNTQ R11, R11
	ADDQ   R11, AX
	SUBQ   R11, CX
	JMP    done

avx2_done7:
	ADDQ   $0x000000e0, AX
	SUBQ   $0x000000e0, CX
	TZCNTQ R12, R12
	ADDQ   R12, AX
	SUBQ   R12, CX
	JMP    done
