.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel throw_helper
/* DEF8 0010DDF8 60F9BD27 */  addiu      $sp, $sp, -0x6A0
/* DEFC 0010DDFC 8006BEFF */  sd         $fp, 0x680($sp)
/* DF00 0010DE00 6006B6FF */  sd         $22, 0x660($sp)
/* DF04 0010DE04 2DF0C000 */  daddu      $fp, $6, $0
/* DF08 0010DE08 5006B5FF */  sd         $21, 0x650($sp)
/* DF0C 0010DE0C 4006B4FF */  sd         $20, 0x640($sp)
/* DF10 0010DE10 2DA80000 */  daddu      $21, $0, $0
/* DF14 0010DE14 3006B3FF */  sd         $19, 0x630($sp)
/* DF18 0010DE18 2DA0A003 */  daddu      $20, $sp, $0
/* DF1C 0010DE1C 0006B0FF */  sd         $16, 0x600($sp)
/* DF20 0010DE20 2D988000 */  daddu      $19, $4, $0
/* DF24 0010DE24 9006BFFF */  sd         $31, 0x690($sp)
/* DF28 0010DE28 2D80A000 */  daddu      $16, $5, $0
/* DF2C 0010DE2C 7006B7FF */  sd         $23, 0x670($sp)
/* DF30 0010DE30 2006B2FF */  sd         $18, 0x620($sp)
/* DF34 0010DE34 1006B1FF */  sd         $17, 0x610($sp)
/* DF38 0010DE38 E405A7AF */  sw         $7, 0x5E4($sp)
/* DF3C 0010DE3C 0C00628E */  lw         $2, 0xC($19)
/* DF40 0010DE40 0800778E */  lw         $23, 0x8($19)
/* DF44 0010DE44 E805B0AF */  sw         $16, 0x5E8($sp)
/* DF48 0010DE48 2BB00200 */  sltu       $22, $0, $2
/* DF4C 0010DE4C 0000F18C */  lw         $17, 0x0($7)
/* DF50 0010DE50 F405A0AF */  sw         $0, 0x5F4($sp)
/* DF54 0010DE54 F805A0AF */  sw         $0, 0x5F8($sp)
/* DF58 0010DE58 4D000010 */  b          .L0010DF90
/* DF5C 0010DE5C E005A0AF */   sw        $0, 0x5E0($sp)
.L0010DE60:
/* DF60 0010DE60 0400238E */  lw         $3, 0x4($17)
/* DF64 0010DE64 03006054 */  bnel       $3, $0, .L0010DE74
/* DF68 0010DE68 0000638C */   lw        $3, 0x0($3)
/* DF6C 0010DE6C 05000010 */  b          .L0010DE84
/* DF70 0010DE70 2D180000 */   daddu     $3, $0, $0
.L0010DE74:
/* DF74 0010DE74 FFFF023C */  lui        $2, (0xFFFFFFFE >> 16)
/* DF78 0010DE78 FEFF4234 */  ori        $2, $2, (0xFFFFFFFE & 0xFFFF)
/* DF7C 0010DE7C 26186200 */  xor        $3, $3, $2
/* DF80 0010DE80 0100632C */  sltiu      $3, $3, 0x1
.L0010DE84:
/* DF84 0010DE84 0A00C012 */  beqz       $22, .L0010DEB0
/* DF88 0010DE88 2D30E002 */   daddu     $6, $23, $0
/* DF8C 0010DE8C 0C00648E */  lw         $4, 0xC($19)
/* DF90 0010DE90 0400258E */  lw         $5, 0x4($17)
/* DF94 0010DE94 01000724 */  addiu      $7, $0, 0x1
/* DF98 0010DE98 E005A827 */  addiu      $8, $sp, 0x5E0
/* DF9C 0010DE9C C436040C */  jal        find_exception_handler
/* DFA0 0010DEA0 2DB00000 */   daddu     $22, $0, $0
/* DFA4 0010DEA4 2DA84000 */  daddu      $21, $2, $0
/* DFA8 0010DEA8 0E000010 */  b          .L0010DEE4
/* DFAC 0010DEAC 0C0060AE */   sw        $0, 0xC($19)
.L0010DEB0:
/* DFB0 0010DEB0 08006010 */  beqz       $3, .L0010DED4
/* DFB4 0010DEB4 2D200002 */   daddu     $4, $16, $0
/* DFB8 0010DEB8 0400258E */  lw         $5, 0x4($17)
/* DFBC 0010DEBC 2D30E002 */  daddu      $6, $23, $0
/* DFC0 0010DEC0 2D380000 */  daddu      $7, $0, $0
/* DFC4 0010DEC4 C436040C */  jal        find_exception_handler
/* DFC8 0010DEC8 E005A827 */   addiu     $8, $sp, 0x5E0
/* DFCC 0010DECC 05000010 */  b          .L0010DEE4
/* DFD0 0010DED0 2DA84000 */   daddu     $21, $2, $0
.L0010DED4:
/* DFD4 0010DED4 0400258E */  lw         $5, 0x4($17)
/* DFD8 0010DED8 8E36040C */  jal        old_find_exception_handler
/* DFDC 0010DEDC 2D200002 */   daddu     $4, $16, $0
/* DFE0 0010DEE0 2DA84000 */  daddu      $21, $2, $0
.L0010DEE4:
/* DFE4 0010DEE4 2200A012 */  beqz       $21, .L0010DF70
/* DFE8 0010DEE8 E005A28F */   lw        $2, 0x5E0($sp)
/* DFEC 0010DEEC 1E004010 */  beqz       $2, .L0010DF68
/* DFF0 0010DEF0 F805A28F */   lw        $2, 0x5F8($sp)
/* DFF4 0010DEF4 1F004054 */  bnel       $2, $0, .L0010DF74
/* DFF8 0010DEF8 9A022496 */   lhu       $4, 0x29A($17)
/* DFFC 0010DEFC F002A327 */  addiu      $3, $sp, 0x2F0
/* E000 0010DF00 2D102002 */  daddu      $2, $17, $0
/* E004 0010DF04 E0022426 */  addiu      $4, $17, 0x2E0
.L0010DF08:
/* E008 0010DF08 000045DC */  ld         $5, 0x0($2)
/* E00C 0010DF0C 080046DC */  ld         $6, 0x8($2)
/* E010 0010DF10 100047DC */  ld         $7, 0x10($2)
/* E014 0010DF14 180048DC */  ld         $8, 0x18($2)
/* E018 0010DF18 000065FC */  sd         $5, 0x0($3)
/* E01C 0010DF1C 080066FC */  sd         $6, 0x8($3)
/* E020 0010DF20 100067FC */  sd         $7, 0x10($3)
/* E024 0010DF24 180068FC */  sd         $8, 0x18($3)
/* E028 0010DF28 20004224 */  addiu      $2, $2, 0x20
/* E02C 0010DF2C 20006324 */  addiu      $3, $3, 0x20
/* E030 0010DF30 00000000 */  nop
/* E034 0010DF34 F4FF4414 */  bne        $2, $4, .L0010DF08
/* E038 0010DF38 00000000 */   nop
/* E03C 0010DF3C 01000424 */  addiu      $4, $0, 0x1
/* E040 0010DF40 01000524 */  addiu      $5, $0, 0x1
/* E044 0010DF44 F005B0AF */  sw         $16, 0x5F0($sp)
/* E048 0010DF48 EC05B5AF */  sw         $21, 0x5EC($sp)
/* E04C 0010DF4C F805A4AF */  sw         $4, 0x5F8($sp)
/* E050 0010DF50 F405A5AF */  sw         $5, 0x5F4($sp)
/* E054 0010DF54 000046DC */  ld         $6, 0x0($2)
/* E058 0010DF58 080047DC */  ld         $7, 0x8($2)
/* E05C 0010DF5C 000066FC */  sd         $6, 0x0($3)
/* E060 0010DF60 03000010 */  b          .L0010DF70
/* E064 0010DF64 080067FC */   sd        $7, 0x8($3)
.L0010DF68:
/* E068 0010DF68 11000010 */  b          .L0010DFB0
/* E06C 0010DF6C F405A0AF */   sw        $0, 0x5F4($sp)
.L0010DF70:
/* E070 0010DF70 9A022496 */  lhu        $4, 0x29A($17)
.L0010DF74:
/* E074 0010DF74 2D304002 */  daddu      $6, $18, $0
/* E078 0010DF78 1637040C */  jal        get_reg_addr
/* E07C 0010DF7C 2D282002 */   daddu     $5, $17, $0
/* E080 0010DF80 000043DC */  ld         $3, 0x0($2)
/* E084 0010DF84 3C180300 */  dsll32     $3, $3, 0
/* E088 0010DF88 3F180300 */  dsra32     $3, $3, 0
/* E08C 0010DF8C FFFF7024 */  addiu      $16, $3, -0x1
.L0010DF90:
/* E090 0010DF90 2D902002 */  daddu      $18, $17, $0
/* E094 0010DF94 2D308002 */  daddu      $6, $20, $0
/* E098 0010DF98 2D200002 */  daddu      $4, $16, $0
/* E09C 0010DF9C 5837040C */  jal        next_stack_level
/* E0A0 0010DFA0 2D284002 */   daddu     $5, $18, $0
/* E0A4 0010DFA4 2D884000 */  daddu      $17, $2, $0
/* E0A8 0010DFA8 ADFF2016 */  bnez       $17, .L0010DE60
/* E0AC 0010DFAC 2DA04002 */   daddu     $20, $18, $0
.L0010DFB0:
/* E0B0 0010DFB0 F805A58F */  lw         $5, 0x5F8($sp)
/* E0B4 0010DFB4 0700A010 */  beqz       $5, .L0010DFD4
/* E0B8 0010DFB8 F405A68F */   lw        $6, 0x5F4($sp)
/* E0BC 0010DFBC F002B127 */  addiu      $17, $sp, 0x2F0
/* E0C0 0010DFC0 EC05B58F */  lw         $21, 0x5EC($sp)
/* E0C4 0010DFC4 0300C010 */  beqz       $6, .L0010DFD4
/* E0C8 0010DFC8 F005B08F */   lw        $16, 0x5F0($sp)
/* E0CC 0010DFCC 7C37040C */  jal        __unwinding_cleanup
/* E0D0 0010DFD0 00000000 */   nop
.L0010DFD4:
/* E0D4 0010DFD4 0400A056 */  bnel       $21, $0, .L0010DFE8
/* E0D8 0010DFD8 000075AE */   sw        $21, 0x0($19)
/* E0DC 0010DFDC 6435040C */  jal        __terminate
/* E0E0 0010DFE0 00000000 */   nop
/* E0E4 0010DFE4 000075AE */  sw         $21, 0x0($19)
.L0010DFE8:
/* E0E8 0010DFE8 E805A78F */  lw         $7, 0x5E8($sp)
/* E0EC 0010DFEC 03000716 */  bne        $16, $7, .L0010DFFC
/* E0F0 0010DFF0 2DB00002 */   daddu     $22, $16, $0
/* E0F4 0010DFF4 3D000010 */  b          .L0010E0EC
/* E0F8 0010DFF8 2D88C003 */   daddu     $17, $fp, $0
.L0010DFFC:
/* E0FC 0010DFFC 2D182002 */  daddu      $3, $17, $0
/* E100 0010E000 E805B08F */  lw         $16, 0x5E8($sp)
/* E104 0010E004 2D10C003 */  daddu      $2, $fp, $0
/* E108 0010E008 E002C427 */  addiu      $4, $fp, 0x2E0
.L0010E00C:
/* E10C 0010E00C 000048DC */  ld         $8, 0x0($2)
/* E110 0010E010 080045DC */  ld         $5, 0x8($2)
/* E114 0010E014 100046DC */  ld         $6, 0x10($2)
/* E118 0010E018 180047DC */  ld         $7, 0x18($2)
/* E11C 0010E01C 000068FC */  sd         $8, 0x0($3)
/* E120 0010E020 080065FC */  sd         $5, 0x8($3)
/* E124 0010E024 100066FC */  sd         $6, 0x10($3)
/* E128 0010E028 180067FC */  sd         $7, 0x18($3)
/* E12C 0010E02C 20004224 */  addiu      $2, $2, 0x20
/* E130 0010E030 20006324 */  addiu      $3, $3, 0x20
/* E134 0010E034 00000000 */  nop
/* E138 0010E038 F4FF4414 */  bne        $2, $4, .L0010E00C
/* E13C 0010E03C 00000000 */   nop
/* E140 0010E040 000048DC */  ld         $8, 0x0($2)
/* E144 0010E044 080044DC */  ld         $4, 0x8($2)
/* E148 0010E048 000068FC */  sd         $8, 0x0($3)
/* E14C 0010E04C 080064FC */  sd         $4, 0x8($3)
/* E150 0010E050 E805A78F */  lw         $7, 0x5E8($sp)
/* E154 0010E054 2200F650 */  beql       $7, $22, .L0010E0E0
/* E158 0010E058 9A022296 */   lhu       $2, 0x29A($17)
/* E15C 0010E05C 2D902002 */  daddu      $18, $17, $0
.L0010E060:
/* E160 0010E060 2D308002 */  daddu      $6, $20, $0
/* E164 0010E064 2D200002 */  daddu      $4, $16, $0
/* E168 0010E068 5837040C */  jal        next_stack_level
/* E16C 0010E06C 2D284002 */   daddu     $5, $18, $0
/* E170 0010E070 2DA04002 */  daddu      $20, $18, $0
/* E174 0010E074 2D884000 */  daddu      $17, $2, $0
/* E178 0010E078 2D800000 */  daddu      $16, $0, $0
/* E17C 0010E07C 9A022496 */  lhu        $4, 0x29A($17)
/* E180 0010E080 9C023326 */  addiu      $19, $17, 0x29C
/* E184 0010E084 00000000 */  nop
.L0010E088:
/* E188 0010E088 08000412 */  beq        $16, $4, .L0010E0AC
/* E18C 0010E08C 21107002 */   addu      $2, $19, $16
/* E190 0010E090 00004380 */  lb         $3, 0x0($2)
/* E194 0010E094 05006010 */  beqz       $3, .L0010E0AC
/* E198 0010E098 2D282002 */   daddu     $5, $17, $0
/* E19C 0010E09C 2D200002 */  daddu      $4, $16, $0
/* E1A0 0010E0A0 3837040C */  jal        copy_reg
/* E1A4 0010E0A4 2D30C003 */   daddu     $6, $fp, $0
/* E1A8 0010E0A8 9A022496 */  lhu        $4, 0x29A($17)
.L0010E0AC:
/* E1AC 0010E0AC 01001026 */  addiu      $16, $16, 0x1
/* E1B0 0010E0B0 4F00022A */  slti       $2, $16, 0x4F
/* E1B4 0010E0B4 F4FF4014 */  bnez       $2, .L0010E088
/* E1B8 0010E0B8 2D304002 */   daddu     $6, $18, $0
/* E1BC 0010E0BC 1637040C */  jal        get_reg_addr
/* E1C0 0010E0C0 2D282002 */   daddu     $5, $17, $0
/* E1C4 0010E0C4 000043DC */  ld         $3, 0x0($2)
/* E1C8 0010E0C8 3C180300 */  dsll32     $3, $3, 0
/* E1CC 0010E0CC 3F180300 */  dsra32     $3, $3, 0
/* E1D0 0010E0D0 FFFF7024 */  addiu      $16, $3, -0x1
/* E1D4 0010E0D4 E2FF1616 */  bne        $16, $22, .L0010E060
/* E1D8 0010E0D8 2D902002 */   daddu     $18, $17, $0
/* E1DC 0010E0DC 9A022296 */  lhu        $2, 0x29A($17)
.L0010E0E0:
/* E1E0 0010E0E0 02000424 */  addiu      $4, $0, 0x2
/* E1E4 0010E0E4 21102202 */  addu       $2, $17, $2
/* E1E8 0010E0E8 9C024380 */  lb         $3, 0x29C($2)
.L0010E0EC:
/* E1EC 0010E0EC E405A88F */  lw         $8, 0x5E4($sp)
/* E1F0 0010E0F0 2D10A002 */  daddu      $2, $21, $0
/* E1F4 0010E0F4 9006BFDF */  ld         $31, 0x690($sp)
/* E1F8 0010E0F8 000011AD */  sw         $17, 0x0($8)
/* E1FC 0010E0FC 8006BEDF */  ld         $fp, 0x680($sp)
/* E200 0010E100 7006B7DF */  ld         $23, 0x670($sp)
/* E204 0010E104 6006B6DF */  ld         $22, 0x660($sp)
/* E208 0010E108 5006B5DF */  ld         $21, 0x650($sp)
/* E20C 0010E10C 4006B4DF */  ld         $20, 0x640($sp)
/* E210 0010E110 3006B3DF */  ld         $19, 0x630($sp)
/* E214 0010E114 2006B2DF */  ld         $18, 0x620($sp)
/* E218 0010E118 1006B1DF */  ld         $17, 0x610($sp)
/* E21C 0010E11C 0006B0DF */  ld         $16, 0x600($sp)
/* E220 0010E120 0800E003 */  jr         $31
/* E224 0010E124 A006BD27 */   addiu     $sp, $sp, 0x6A0
