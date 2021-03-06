; Small C HuC6280 (v0.2, 08/Nov/97)
;
; Taken to HuC (22/Feb/00)
;
;
; This file generated by HuC (v3.21, 2005/04/09, Denki release)
; on Fri Oct 19 19:25:02 2018
;

HUC	= 1

	.include "startup.asm"
	.data
	.bank DATA_BANK

	.code

; cd_read_sector(void) - references char rec_h, char rec_m, char rec_l, char * target_data
_cd_read_sector:
    lda _rec_h       ; disc sector address (LBA address)
    sta <_cl
    lda _rec_m
    sta <_ch
    lda _rec_l
    sta <_dl
    lda #1           ; data read address type (LOCAL)
    sta <_dh
    lda #HIGH(_target_data)    ; memory address
    sta <_bh
    lda #LOW(_target_data)
    sta <_bl
    lda #1           ; number of units
    sta <_al         ; record length - in sectors for this read type
    call cd_read
    rts
	.proc _add_3digit
	__pushw
	__addmi	-8,__stack
	__ldw_s	10
	__addwi	2
	__ldb_p
	__andwi	255
	__stw_s	6
	__ldw_s	8
	__addwi	2
	__ldb_p
	__andwi	255
	__stw_s	4
	__ldw_s	6
	__addw_s	4
	__stw_s	2
	__pushw
	__ldwi	8
	  jsr	asr
	__stw_s	0
	__ldwi	_result
	__addwi	2
	__pushw
	__ldw_s	4
	__andwi	255
	__stbps
	__ldw_s	10
	__addwi	1
	__ldb_p
	__andwi	255
	__stw_s	6
	__ldw_s	8
	__addwi	1
	__ldb_p
	__andwi	255
	__stw_s	4
	__ldw_s	6
	__addw_s	4
	__addw_s	0
	__stw_s	2
	__pushw
	__ldwi	8
	  jsr	asr
	__stw_s	0
	__ldwi	_result
	__addwi	1
	__pushw
	__ldw_s	4
	__andwi	255
	__stbps
	__ldw_s	10
	__ldb_p
	__andwi	255
	__stw_s	6
	__ldw_s	8
	__ldb_p
	__andwi	255
	__stw_s	4
	__ldw_s	6
	__addw_s	4
	__addw_s	0
	__stw_s	2
	__ldwi	_result
	__pushw
	__ldw_s	4
	__andwi	255
	__stbps
LL1:

	__addmi	12,__stack
	  rts
	.endp

	.proc _sub_3digit
	__pushw
	__addmi	-8,__stack
	__ldw_s	10
	__addwi	2
	__ldb_p
	__andwi	255
	__stw_s	6
	__ldw_s	8
	__addwi	2
	__ldb_p
	__andwi	255
	__stw_s	4
	__ldw_s	6
	__pushw
	__ldw_s	6
	__subws
	__stw_s	2
	__pushw
	__ldwi	8
	  jsr	asr
	__andwi	1
	__stw_s	0
	__ldwi	_result
	__addwi	2
	__pushw
	__ldw_s	4
	__andwi	255
	__stbps
	__ldw_s	10
	__addwi	1
	__ldb_p
	__andwi	255
	__stw_s	6
	__ldw_s	8
	__addwi	1
	__ldb_p
	__andwi	255
	__stw_s	4
	__ldw_s	6
	__pushw
	__ldw_s	6
	__subws
	__pushw
	__ldw_s	2
	__subws
	__stw_s	2
	__pushw
	__ldwi	8
	  jsr	asr
	__andwi	1
	__stw_s	0
	__ldwi	_result
	__addwi	1
	__pushw
	__ldw_s	4
	__andwi	255
	__stbps
	__ldw_s	10
	__ldb_p
	__andwi	255
	__stw_s	6
	__ldw_s	8
	__ldb_p
	__andwi	255
	__stw_s	4
	__ldw_s	6
	__pushw
	__ldw_s	6
	__subws
	__pushw
	__ldw_s	2
	__subws
	__stw_s	2
	__ldwi	_result
	__pushw
	__ldw_s	4
	__andwi	255
	__stbps
LL2:

	__addmi	12,__stack
	  rts
	.endp

	.proc _show_startpos
	__ldwi	_start_pos
	__ldb_p
	__phw	4,4
	__ldwi	2
	__phb	2
	__ldwi	14
	__phb	1
	__ldwi	5
	  call	_put_hex.4
	__ldwi	_start_pos
	__addwi	1
	__ldb_p
	__phw	4,4
	__ldwi	2
	__phb	2
	__ldwi	16
	__phb	1
	__ldwi	5
	  call	_put_hex.4
	__ldwi	_start_pos
	__addwi	2
	__ldb_p
	__phw	4,4
	__ldwi	2
	__phb	2
	__ldwi	18
	__phb	1
	__ldwi	5
	  call	_put_hex.4
LL3:

	  rts
	.endp

	.proc _show_offset
	__ldwi	_offset
	__ldb_p
	__phw	4,4
	__ldwi	2
	__phb	2
	__ldwi	14
	__phb	1
	__ldwi	7
	  call	_put_hex.4
	__ldwi	_offset
	__addwi	1
	__ldb_p
	__phw	4,4
	__ldwi	2
	__phb	2
	__ldwi	16
	__phb	1
	__ldwi	7
	  call	_put_hex.4
	__ldwi	_offset
	__addwi	2
	__ldb_p
	__phw	4,4
	__ldwi	2
	__phb	2
	__ldwi	18
	__phb	1
	__ldwi	7
	  call	_put_hex.4
LL4:

	  rts
	.endp

	.proc _show_target
	__ldwi	_target
	__ldb_p
	__phw	4,4
	__ldwi	2
	__phb	2
	__ldwi	14
	__phb	1
	__ldwi	9
	  call	_put_hex.4
	__ldwi	_target
	__addwi	1
	__ldb_p
	__phw	4,4
	__ldwi	2
	__phb	2
	__ldwi	16
	__phb	1
	__ldwi	9
	  call	_put_hex.4
	__ldwi	_target
	__addwi	2
	__ldb_p
	__phw	4,4
	__ldwi	2
	__phb	2
	__ldwi	18
	__phb	1
	__ldwi	9
	  call	_put_hex.4
LL5:

	  rts
	.endp

	.proc _limit_startpos
	__ldwi	_result
	__ldb_p
	__stw	<__temp
	__ldwi	0
	  jsr	ltzp
	__lbne	LL8
	__ldwi	_result
	__ldb_p
	__stw	<__temp
	__ldwi	128
	  jsr	gezp
LL8:

	__boolw
	__tstw
	__lbeq	LL7
	__ldwi	_result
	__pushw
	__ldwi	0
	__stbps
	__ldwi	_result
	__addwi	1
	__pushw
	__ldwi	0
	__stbps
	__ldwi	_result
	__addwi	2
	__pushw
	__ldwi	0
	__stbps
LL7:

	__ldwi	_result
	__ldb_p
	__stw	<__temp
	__ldwi	4
	  jsr	gtzp
	__lbeq	LL9
	__ldwi	_result
	__pushw
	__ldwi	4
	__stbps
	__ldwi	_result
	__addwi	1
	__pushw
	__ldwi	255
	__stbps
	__ldwi	_result
	__addwi	2
	__pushw
	__ldwi	255
	__stbps
LL9:

LL6:

	  rts
	.endp

	.proc _limit_offset
	__ldwi	_result
	__ldb_p
	__stw	<__temp
	__ldwi	0
	  jsr	ltzp
	__lbne	LL12
	__ldwi	_result
	__ldb_p
	__stw	<__temp
	__ldwi	128
	  jsr	gezp
LL12:

	__boolw
	__tstw
	__lbeq	LL11
	__ldwi	_result
	__pushw
	__ldwi	0
	__stbps
	__ldwi	_result
	__addwi	1
	__pushw
	__ldwi	0
	__stbps
	__ldwi	_result
	__addwi	2
	__pushw
	__ldwi	0
	__stbps
LL11:

LL10:

	  rts
	.endp

	.proc _fix_offset
	__ldb	_direction
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL14
	__ldwi	_start_pos
	__pushw
	__ldwi	_offset
	  call	_add_3digit
	__ldwi	_result
	__ldb_p
	__stw	<__temp
	__ldwi	4
	  jsr	gtzp
	__lbeq	LL15
	__ldwi	_target
	__pushw
	__ldwi	4
	__stbps
	__ldwi	_target
	__addwi	1
	__pushw
	__ldwi	255
	__stbps
	__ldwi	_target
	__addwi	2
	__pushw
	__ldwi	255
	__stbps
	__ldwi	_target
	__pushw
	__ldwi	_start_pos
	  call	_sub_3digit
	__ldwi	_offset
	__pushw
	__ldwi	_result
	__ldb_p
	__stbps
	__ldwi	_offset
	__addwi	1
	__pushw
	__ldwi	_result
	__addwi	1
	__ldb_p
	__stbps
	__ldwi	_offset
	__addwi	2
	__pushw
	__ldwi	_result
	__addwi	2
	__ldb_p
	__stbps
	__ldwi	_start_pos
	__pushw
	__ldwi	_offset
	  call	_add_3digit
LL15:

	__lbra	LL16
LL14:

	__ldb	_direction
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL17
	__ldwi	_offset
	__ldb_p
	__pushw
	__ldwi	_start_pos
	__ldb_p
	  jsr	gt
	__lbne	LL19
	__ldwi	_offset
	__ldb_p
	__pushw
	__ldwi	_start_pos
	__ldb_p
	  jsr	eq
	__lbeq	LL20
	__ldwi	_offset
	__addwi	1
	__ldb_p
	__pushw
	__ldwi	_start_pos
	__addwi	1
	__ldb_p
	  jsr	gt
LL20:

	__boolw
LL19:

	__boolw
	__tstw
	__lbne	LL21
	__ldwi	_offset
	__ldb_p
	__pushw
	__ldwi	_start_pos
	__ldb_p
	  jsr	eq
	__lbeq	LL22
	__ldwi	_offset
	__addwi	1
	__ldb_p
	__pushw
	__ldwi	_start_pos
	__addwi	1
	__ldb_p
	  jsr	eq
LL22:

	__boolw
	__tstw
	__lbeq	LL23
	__ldwi	_offset
	__addwi	2
	__ldb_p
	__pushw
	__ldwi	_start_pos
	__addwi	2
	__ldb_p
	  jsr	gt
LL23:

	__boolw
LL21:

	__boolw
	__tstw
	__lbeq	LL18
	__ldwi	_offset
	__pushw
	__ldwi	_start_pos
	__ldb_p
	__stbps
	__ldwi	_offset
	__addwi	1
	__pushw
	__ldwi	_start_pos
	__addwi	1
	__ldb_p
	__stbps
	__ldwi	_offset
	__addwi	2
	__pushw
	__ldwi	_start_pos
	__addwi	2
	__ldb_p
	__stbps
LL18:

	__ldwi	_start_pos
	__pushw
	__ldwi	_offset
	  call	_sub_3digit
LL17:

LL16:

	__ldwi	_target
	__pushw
	__ldwi	_result
	__ldb_p
	__stbps
	__ldwi	_target
	__addwi	1
	__pushw
	__ldwi	_result
	__addwi	1
	__ldb_p
	__stbps
	__ldwi	_target
	__addwi	2
	__pushw
	__ldwi	_result
	__addwi	2
	__ldb_p
	__stbps
LL13:

	  rts
	.endp

	.proc _clear_index
	__ldwi	LL0+0
	__phw	3,3
	__ldwi	14
	__phb	1
	__ldwi	6
	  call	_put_string.3
	__ldwi	LL0+7
	__phw	3,3
	__ldwi	14
	__phb	1
	__ldwi	8
	  call	_put_string.3
	__ldwi	LL0+14
	__phw	3,3
	__ldwi	2
	__phb	1
	__ldwi	3
	  call	_put_string.3
	__ldwi	LL0+18
	__phw	3,3
	__ldwi	26
	__phb	1
	__ldwi	3
	  call	_put_string.3
LL24:

	  rts
	.endp

	.proc _put_index
	__ldb	_direction
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL26
	__ldwi	LL0+22
	__phw	3,3
	__ldwi	14
	__phb	1
	__ldwi	3
	  call	_put_string.3
	__lbra	LL27
LL26:

	__ldwi	LL0+31
	__phw	3,3
	__ldwi	14
	__phb	1
	__ldwi	3
	  call	_put_string.3
LL27:

	__ldb	_adjust
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL28
	__ldwi	LL0+40
	__phw	3,3
	__ldwi	2
	__phb	1
	__ldwi	3
	  call	_put_string.3
	__ldwi	LL0+44
	__phw	3,3
	__ldwi	26
	__phb	1
	__ldwi	3
	  call	_put_string.3
	__lbra	LL29
LL28:

	__ldb	_adjust
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL30
	__ldwi	LL0+48
	__phw	3,3
	__ldwi	14
	__phb	1
	__ldwi	6
	  call	_put_string.3
	__ldwi	LL0+55
	__phw	3,3
	__ldwi	14
	__pushw
	__ldb	_edit_pos
	__addws
	__phb	1
	__ldwi	6
	  call	_put_string.3
	__lbra	LL31
LL30:

	__ldb	_adjust
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL32
	__ldwi	LL0+57
	__phw	3,3
	__ldwi	14
	__phb	1
	__ldwi	8
	  call	_put_string.3
	__ldwi	LL0+64
	__phw	3,3
	__ldwi	14
	__pushw
	__ldb	_edit_pos
	__addws
	__phb	1
	__ldwi	8
	  call	_put_string.3
LL32:

LL31:

LL29:

LL25:

	  rts
	.endp

	.proc _main
	__ldwi	0
	__stw	_color_reg
	__ldwi	0
	__stw	_color_data
	__ldwi	1
	__stw	_color_reg
	__ldwi	511
	__stw	_color_data
	__ldwi	0
	  stx	_i
LL34:

	__ldb	_i
	__stw	<__temp
	__ldwi	3
	  jsr	ltzp
	__lbne	LL36
	__lbra	LL37
LL35:

	__ldb	_i
	__addwi	1
	  stx	_i
	__subwi	1
	__lbra	LL34
LL36:

	__ldwi	_start_pos
	__pushw
	__ldb	_i
	__addws
	__pushw
	__ldwi	0
	__stbps
	__ldwi	_offset
	__pushw
	__ldb	_i
	__addws
	__pushw
	__ldwi	0
	__stbps
	__ldwi	_target
	__pushw
	__ldb	_i
	__addws
	__pushw
	__ldwi	0
	__stbps
	__lbra	LL35
LL37:

	__ldwi	0
	  stx	_edit_pos
	__ldwi	1
	  stx	_adjust
	__ldwi	0
	  stx	_direction
	__ldwi	LL0+66
	__phw	3,3
	__ldwi	10
	__phb	1
	__ldwi	1
	  call	_put_string.3
	__ldwi	LL0+81
	__phw	3,3
	__ldwi	2
	__phb	1
	__ldwi	3
	  call	_put_string.3
	__ldwi	LL0+94
	__phw	3,3
	__ldwi	2
	__phb	1
	__ldwi	5
	  call	_put_string.3
	__ldwi	LL0+107
	__phw	3,3
	__ldwi	2
	__phb	1
	__ldwi	7
	  call	_put_string.3
	__ldwi	LL0+120
	__phw	3,3
	__ldwi	2
	__phb	1
	__ldwi	9
	  call	_put_string.3
	  call	_show_startpos
	  call	_show_offset
	  call	_show_target
	__ldwi	LL0+133
	__phw	3,3
	__ldwi	2
	__phb	1
	__ldwi	24
	  call	_put_string.3
	__ldwi	LL0+162
	__phw	3,3
	__ldwi	2
	__phb	1
	__ldwi	26
	  call	_put_string.3
LL38:

	__ldwi	1
	__tstw
	__lbeq	LL39
	  call	_put_index
	__ldwi	0
	  call	_joytrg
	  stx	_pad
	__ldb	_adjust
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL40
	__ldb	_pad
	__andwi	240
	__tstw
	__lbeq	LL41
	__ldb	_direction
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL42
	__ldwi	1
	  stx	_direction
	  call	_put_index
	  call	_fix_offset
	  call	_show_offset
	  call	_show_target
	__lbra	LL43
LL42:

	__ldwi	0
	  stx	_direction
	  call	_put_index
	  call	_fix_offset
	  call	_show_offset
	  call	_show_target
LL43:

LL41:

	__ldb	_pad
	__andwi	2
	__tstw
	__lbeq	LL44
	__ldwi	1
	  stx	_adjust
	  call	_clear_index
	  call	_put_index
LL44:

	__lbra	LL45
LL40:

	__ldb	_adjust
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbne	LL47
	__ldb	_adjust
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
LL47:

	__boolw
	__tstw
	__lbeq	LL46
	__ldb	_pad
	__andwi	128
	__tstw
	__lbeq	LL48
	__ldb	_edit_pos
	__stw	<__temp
	__ldwi	0
	  jsr	gtzp
	__lbeq	LL49
	__ldb	_edit_pos
	__subwi	1
	  stx	_edit_pos
	  call	_put_index
LL49:

LL48:

	__ldb	_pad
	__andwi	32
	__tstw
	__lbeq	LL50
	__ldb	_edit_pos
	__stw	<__temp
	__ldwi	5
	  jsr	ltzp
	__lbeq	LL51
	__ldb	_edit_pos
	__addwi	1
	  stx	_edit_pos
	  call	_put_index
LL51:

LL50:

	__ldb	_pad
	__andwi	16
	__tstw
	__lbeq	LL52
	__ldb	_adjust
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL53
	__ldwi	_start_pos
	__pushw
	__ldwi	_add_num
	__pushw
	__ldb	_edit_pos
	__pushw
	__ldwi	3
	  jsr	smul
	__addws
	  call	_add_3digit
	  call	_limit_startpos
	__ldwi	_start_pos
	__pushw
	__ldwi	_result
	__ldb_p
	__stbps
	__ldwi	_start_pos
	__addwi	1
	__pushw
	__ldwi	_result
	__addwi	1
	__ldb_p
	__stbps
	__ldwi	_start_pos
	__addwi	2
	__pushw
	__ldwi	_result
	__addwi	2
	__ldb_p
	__stbps
	  call	_show_startpos
	  call	_fix_offset
	  call	_show_offset
	  call	_show_target
	__lbra	LL54
LL53:

	__ldb	_adjust
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL55
	__ldwi	_offset
	__pushw
	__ldwi	_add_num
	__pushw
	__ldb	_edit_pos
	__pushw
	__ldwi	3
	  jsr	smul
	__addws
	  call	_add_3digit
	  call	_limit_offset
	__ldwi	_offset
	__pushw
	__ldwi	_result
	__ldb_p
	__stbps
	__ldwi	_offset
	__addwi	1
	__pushw
	__ldwi	_result
	__addwi	1
	__ldb_p
	__stbps
	__ldwi	_offset
	__addwi	2
	__pushw
	__ldwi	_result
	__addwi	2
	__ldb_p
	__stbps
	  call	_fix_offset
	  call	_show_offset
	  call	_show_target
LL55:

LL54:

LL52:

	__ldb	_pad
	__andwi	64
	__tstw
	__lbeq	LL56
	__ldb	_adjust
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL57
	__ldwi	_start_pos
	__pushw
	__ldwi	_add_num
	__pushw
	__ldb	_edit_pos
	__pushw
	__ldwi	3
	  jsr	smul
	__addws
	  call	_sub_3digit
	  call	_limit_startpos
	__ldwi	_start_pos
	__pushw
	__ldwi	_result
	__ldb_p
	__stbps
	__ldwi	_start_pos
	__addwi	1
	__pushw
	__ldwi	_result
	__addwi	1
	__ldb_p
	__stbps
	__ldwi	_start_pos
	__addwi	2
	__pushw
	__ldwi	_result
	__addwi	2
	__ldb_p
	__stbps
	  call	_show_startpos
	  call	_fix_offset
	  call	_show_offset
	  call	_show_target
	__lbra	LL58
LL57:

	__ldb	_adjust
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL59
	__ldwi	_offset
	__pushw
	__ldwi	_add_num
	__pushw
	__ldb	_edit_pos
	__pushw
	__ldwi	3
	  jsr	smul
	__addws
	  call	_sub_3digit
	  call	_limit_offset
	__ldwi	_offset
	__pushw
	__ldwi	_result
	__ldb_p
	__stbps
	__ldwi	_offset
	__addwi	1
	__pushw
	__ldwi	_result
	__addwi	1
	__ldb_p
	__stbps
	__ldwi	_offset
	__addwi	2
	__pushw
	__ldwi	_result
	__addwi	2
	__ldb_p
	__stbps
	  call	_fix_offset
	  call	_show_offset
	  call	_show_target
LL59:

LL58:

LL56:

	__ldb	_pad
	__andwi	2
	__tstw
	__lbeq	LL60
	__ldb	_adjust
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL61
	__ldwi	2
	  stx	_adjust
	  call	_clear_index
	  call	_put_index
	__lbra	LL62
LL61:

	__ldb	_adjust
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL63
	  call	_clear_index
	__ldwi	1
	  stx	_adjust
	__ldwi	0
	  stx	_i
LL64:

	__ldb	_i
	__stw	<__temp
	__ldwi	10
	  jsr	ltzp
	__lbne	LL66
	__lbra	LL67
LL65:

	__ldb	_i
	__addwi	1
	  stx	_i
	__subwi	1
	__lbra	LL64
LL66:

	__ldwi	LL0+188
	__phw	3,3
	__ldwi	5
	__phb	1
	__ldwi	13
	__pushw
	__ldb	_i
	__addws
	  call	_put_string.3
	__lbra	LL65
LL67:

	__ldwi	LL0+194
	__phw	3,3
	__ldwi	18
	__phb	1
	__ldwi	14
	  call	_put_string.3
	__ldwi	LL0+205
	__phw	3,3
	__ldwi	18
	__phb	1
	__ldwi	15
	  call	_put_string.3
	__ldwi	32767
	__stw	_min
	__ldwi	0
	__stw	_tot
	__ldwi	0
	  stx	_i
LL68:

	__ldb	_i
	__stw	<__temp
	__ldwi	10
	  jsr	ltzp
	__lbne	LL70
	__lbra	LL71
LL69:

	__ldb	_i
	__addwi	1
	  stx	_i
	__subwi	1
	__lbra	LL68
LL70:

	__ldwi	LL0+216
	__phw	3,3
	__ldwi	2
	__phb	1
	__ldwi	11
	  call	_put_string.3
	__ldwi	_start_pos
	__ldb_p
	  stx	_rec_h
	__ldwi	_start_pos
	__addwi	1
	__ldb_p
	  stx	_rec_m
	__ldwi	_start_pos
	__addwi	2
	__ldb_p
	  stx	_rec_l
	  call	_cd_read_sector
	__ldwi	LL0+241
	__phw	3,3
	__ldwi	2
	__phb	1
	__ldwi	11
	  call	_put_string.3
	__ldwi	55
	  call	_random
	__addwi	5
	  ldy	#1
	  call	_vsync
	__ldwi	LL0+266
	__phw	3,3
	__ldwi	2
	__phb	1
	__ldwi	11
	  call	_put_string.3
	__ldwi	_target
	__ldb_p
	  stx	_rec_h
	__ldwi	_target
	__addwi	1
	__ldb_p
	  stx	_rec_m
	__ldwi	_target
	__addwi	2
	__ldb_p
	  stx	_rec_l
	__ldwi	0
	  ldy	#1
	  call	_vsync
	  call	_clock_reset
	  call	_cd_read_sector
	__ldwi	_timing
	__pushw
	__ldb	_i
	__aslw
	__addws
	__pushw
	  call	_clock_mm
	__pushw
	__ldwi	3600
	  jsr	smul
	__pushw
	  call	_clock_ss
	__pushw
	__ldwi	60
	  jsr	smul
	__addws
	__pushw
	  call	_clock_tt
	__addws
	__stwps
	__ldwi	_timing
	__pushw
	__ldb	_i
	__aslw
	__addws
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldw	_min
	  jsr	ltzp
	__lbeq	LL72
	__ldwi	_timing
	__pushw
	__ldb	_i
	__aslw
	__addws
	__stw	__ptr
	__ldwp	__ptr
	__stw	_min
LL72:

	__ldw	_tot
	__pushw
	__ldwi	_timing
	__pushw
	__ldb	_i
	__aslw
	__addws
	__stw	__ptr
	__ldwp	__ptr
	__addws
	__stw	_tot
	__ldwi	_timing
	__pushw
	__ldb	_i
	__aslw
	__addws
	__stw	__ptr
	__ldwp	__ptr
	__phw	4,4
	__ldwi	5
	__phb	2
	__ldwi	5
	__phb	1
	__ldwi	13
	__pushw
	__ldb	_i
	__addws
	  call	_put_number.4
	__lbra	LL69
LL71:

	__ldw	_tot
	__pushw
	__ldwi	10
	  jsr	sdiv
	__stw	_avg
	__ldwi	LL0+291
	__phw	3,3
	__ldwi	2
	__phb	1
	__ldwi	11
	  call	_put_string.3
	__ldwi	LL0+316
	__phw	3,3
	__ldwi	18
	__phb	1
	__ldwi	14
	  call	_put_string.3
	__ldw	_min
	__phw	4,4
	__ldwi	5
	__phb	2
	__ldwi	23
	__phb	1
	__ldwi	14
	  call	_put_number.4
	__ldwi	LL0+322
	__phw	3,3
	__ldwi	18
	__phb	1
	__ldwi	15
	  call	_put_string.3
	__ldw	_avg
	__phw	4,4
	__ldwi	5
	__phb	2
	__ldwi	23
	__phb	1
	__ldwi	15
	  call	_put_number.4
LL63:

LL62:

LL60:

	__ldb	_pad
	__andwi	1
	__tstw
	__lbeq	LL73
	__ldb	_adjust
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL74
	__ldwi	1
	  stx	_adjust
	  call	_clear_index
	  call	_put_index
	__lbra	LL75
LL74:

	__ldb	_adjust
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL76
	__ldwi	0
	  stx	_adjust
	  call	_clear_index
	  call	_put_index
LL76:

LL75:

LL73:

LL46:

LL45:

	__ldwi	0
	  ldy	#1
	  call	_vsync
	__lbra	LL38
LL39:

	__lbra	LL33
LL33:

	  rts
	.endp

	.data
	.bank CONST_BANK
	.org $4000
LL0:
	.db	32,32,32,32,32,32,0,32
	.db	32,32,32,32,32,0,32,32
	.db	32,0,32,32,32,0,70,79
	.db	82,87,65,82,68,32,0,66
	.db	65,67,75,87,65,82,68,0
	.db	62,62,62,0,60,60,60,0
	.db	32,32,32,32,32,32,0,94
	.db	0,32,32,32,32,32,32,0
	.db	94,0,72,101,97,100,32,83
	.db	101,101,107,32,84,101,115,116
	.db	0,32,32,32,32,32,32,32
	.db	68,105,114,58,32,0,83,116
	.db	97,114,116,32,32,76,66,65
	.db	58,32,0,79,102,102,115,101
	.db	116,32,76,66,65,58,32,0
	.db	84,97,114,103,101,116,32,76
	.db	66,65,58,32,0,67,104,97
	.db	110,103,101,32,86,97,108,117
	.db	101,115,58,32,100,105,114,101
	.db	99,116,105,111,110,32,112,97
	.db	100,0,66,117,116,116,111,110
	.db	32,73,73,32,61,32,102,119
	.db	100,59,32,73,32,61,32,98
	.db	97,99,107,0,32,32,32,32
	.db	32,0,32,32,32,32,32,32
	.db	32,32,32,32,0,32,32,32
	.db	32,32,32,32,32,32,32,0
	.db	77,111,118,101,32,116,111,32
	.db	105,110,105,116,105,97,108,32
	.db	112,111,115,105,116,105,111,110
	.db	0,82,97,110,100,111,109,32
	.db	100,101,108,97,121,32,32,32
	.db	32,32,32,32,32,32,32,32
	.db	32,0,83,101,101,107,105,110
	.db	103,46,46,46,32,32,32,32
	.db	32,32,32,32,32,32,32,32
	.db	32,32,0,32,32,32,32,32
	.db	32,32,32,32,32,32,32,32
	.db	32,32,32,32,32,32,32,32
	.db	32,32,32,0,77,105,110,58
	.db	32,0,65,118,103,58,32,0
_add_num:
	.db	0x10
	.db	0x00
	.db	0x00
	.db	0x01
	.db	0x00
	.db	0x00
	.db	0x00
	.db	0x10
	.db	0x00
	.db	0x00
	.db	0x01
	.db	0x00
	.db	0x00
	.db	0x00
	.db	0x10
	.db	0x00
	.db	0x00
	.db	0x01

	.bss
_rec_h:		.ds	1
_rec_m:		.ds	1
_rec_l:		.ds	1
_target_data:		.ds	2048
_pad:		.ds	1
_padhold:		.ds	1
_hex1:		.ds	1
_hex2:		.ds	1
_start_pos:		.ds	3
_offset:		.ds	3
_target:		.ds	3
_result:		.ds	3
_adjust:		.ds	1
_edit_pos:		.ds	1
_direction:		.ds	1
_timing:		.ds	20
_min:		.ds	2
_avg:		.ds	2
_tot:		.ds	2
_i:		.ds	1
__arg:

;0 error(s) in compilation
;	literal pool:328
;	constant pool:18
;	global pool:1568
;	Macro pool:1416
