; Subroutine that outputs the 2s compliment additive inverse of R0.
; Will overwrite R0 with its additive inverse. R7 will also be overwritten,
; This method can be called via JSR NEGATE when R0 is set to the char you wish to check.
; Subroutine by Michael Goldstein. Source available at https://github.com/mgold95/code/tree/master/ece220/subroutines/negate.asm
; Source available under Apache 2.0 License.
NEGATE
		NOT R0, R0				; Invert R0s bits
		ADD R0, R0, #1			; Increment R0 to get the negation
		RET						; Return
