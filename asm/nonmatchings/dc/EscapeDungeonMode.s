.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EscapeDungeonMode__Fv
/* F4040 001F3F40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* F4044 001F3F44 1000BF7F */  sq         $31, 0x10($sp)
/* F4048 001F3F48 0000B07F */  sq         $16, 0x0($sp)
/* F404C 001F3F4C 28860070 */  paddub     $16, $0, $0
/* F4050 001F3F50 D494848F */  lw         $4, -0x6B2C($gp)
/* F4054 001F3F54 AF000524 */  addiu      $5, $0, 0xAF
/* F4058 001F3F58 50F6060C */  jal        SearchItemIndexNo__14CDngStatusDataFi
/* F405C 001F3F5C 00000000 */   nop
/* F4060 001F3F60 02004004 */  bltz       $2, .L001F3F6C
/* F4064 001F3F64 00000000 */   nop
/* F4068 001F3F68 01001024 */  addiu      $16, $0, 0x1
.L001F3F6C:
/* F406C 001F3F6C E09C848F */  lw         $4, -0x6320($gp)
/* F4070 001F3F70 905E070C */  jal        GetMonstorNum__12CMonstorUnitFv
/* F4074 001F3F74 00000000 */   nop
/* F4078 001F3F78 0200401C */  bgtz       $2, .L001F3F84
/* F407C 001F3F7C 00000000 */   nop
/* F4080 001F3F80 02001024 */  addiu      $16, $0, 0x2
.L001F3F84:
/* F4084 001F3F84 28160072 */  paddub     $2, $16, $0
/* F4088 001F3F88 1000BF7B */  lq         $31, 0x10($sp)
/* F408C 001F3F8C 0000B07B */  lq         $16, 0x0($sp)
/* F4090 001F3F90 2000BD27 */  addiu      $sp, $sp, 0x20
/* F4094 001F3F94 0800E003 */  jr         $31
/* F4098 001F3F98 00000000 */   nop
/* F409C 001F3F9C 00000000 */  nop
