//go:build purego
// +build purego

package utf8

// Validate is a more precise version of Valid that also indicates whether the
// input was valid ASCII.
func Validate(p []byte) Validation {
	return validate(p)
}
