// Code generated by command: go run sums_asm.go -pkg slices -out ../slices/sums_amd64.s -stubs ../slices/sums_amd64.go. DO NOT EDIT.

//go:build !purego || amd64

package slices

// Sum uint64s using avx2 instructions, results stored in x
func sumUint64(x []uint64, y []uint64)

// Sum uint32s using avx2 instructions, results stored in x
func sumUint32(x []uint32, y []uint32)

// Sum uint16s using avx2 instructions, results stored in x
func sumUint16(x []uint16, y []uint16)

// Sum uint8s using avx2 instructions, results stored in x
func sumUint8(x []uint8, y []uint8)