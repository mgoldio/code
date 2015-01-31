; Subroutine to determine whether or not the ASCII char in R0 is alphabetical or not.
; Will overwrite R0 to 1 if value is alphabetical or 0 if it is not. R7 will also be overwritten,
; This method can be called via JSR IS_ALPHA when R0 is set to the char you wish to check.
; Subroutine by Michael Goldstein. Source available at https://github.com/mgold95/code/tree/master/ece220/subroutines/is_alpha.asm
; Source available under Apache 2.0 License.
IS_ALPHA						    ; subroutine to check if R0 is alphabetical; sets cc to p if it is, z or n otherwise
    ST R3, SAVE_R3			; store R3 so it can be restored afterwards
    LD R3, NAT				  ; load additive inverse of @ into R3
    ADD R3, R3, R0			; R3 = R0 - @
    BRnz ISALPHARET			; if char <= @, it isn't alphabetical
    LD R3, NCBR				  ; load additive inverse of { into R3
    ADD R3, R3, R0			; R3 = R0 - {
    BRzp ISALPHARET			; if char >= {, it isn't alphabetical
    LD R3, NSQBR			  ; load additive inverse of [ into R3
    ADD R3, R3, R0			; R3 = R0 - [
    BRn ISALPHATRUE			; if char > @ and < [, it is alphabetical
    LD R3, NBTICK			  ; load additive inverse of ` into R3
    ADD R3, R3, R0			; R3 = R0 - `
    BRp ISALPHATRUE			; is char > ` and < {, it is alphabetical
    AND R0, R0, #0      ; clear R0 to set it to 0
    BRnzp ISALPHARET		; otherwise, it is not alphabetical
  ISALPHATRUE
    AND R0, R0, #0      ; clear R0
    ADD R0, R0, #1      ; R0 = 1
  ISALPHARET
    LD R3, SAVE_R3			; restore value of R3
    ADD R0, R0, #0			; add 0 to R0 to set condition codes
    RET						      ; return

NAT		.FILL xFFC0				; additive inverse for at ascii char
NSQBR	.FILL xFFA5				; additive inverse for sq bracket ascii char
NBTICK	.FILL xFFA0			; additive inverse for backtick ascii char
NCBR	.FILL xFF85				; additive inverse for curly bracket ascii char
SAVE_R3 .BLKW 1         ; reserve a word to restore R3
