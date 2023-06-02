.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetParts__11CEditGroundFfff
/* A1A60 001A1960 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A1A64 001A1964 1000BF7F */  sq         $31, 0x10($sp)
/* A1A68 001A1968 0000B07F */  sq         $16, 0x0($sp)
/* A1A6C 001A196C 28868070 */  paddub     $16, $4, $0
/* A1A70 001A1970 3486060C */  jal        GetPartsID__11CEditGroundFfff
/* A1A74 001A1974 00000000 */   nop
/* A1A78 001A1978 04004104 */  bgez       $2, .L001A198C
/* A1A7C 001A197C 00000000 */   nop
/* A1A80 001A1980 28160070 */  paddub     $2, $0, $0
/* A1A84 001A1984 08000010 */  b          .L001A19A8
/* A1A88 001A1988 00000000 */   nop
.L001A198C:
/* A1A8C 001A198C C0180200 */  sll        $3, $2, 3
/* A1A90 001A1990 23186200 */  subu       $3, $3, $2
/* A1A94 001A1994 80100300 */  sll        $2, $3, 2
/* A1A98 001A1998 23104300 */  subu       $2, $2, $3
/* A1A9C 001A199C 40110200 */  sll        $2, $2, 5
/* A1AA0 001A19A0 21100202 */  addu       $2, $16, $2
/* A1AA4 001A19A4 30004224 */  addiu      $2, $2, 0x30
.L001A19A8:
/* A1AA8 001A19A8 1000BF7B */  lq         $31, 0x10($sp)
/* A1AAC 001A19AC 0000B07B */  lq         $16, 0x0($sp)
/* A1AB0 001A19B0 2000BD27 */  addiu      $sp, $sp, 0x20
/* A1AB4 001A19B4 0800E003 */  jr         $31
/* A1AB8 001A19B8 00000000 */   nop
/* A1ABC 001A19BC 00000000 */  nop
