.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetupTrapCircle__11CDungeonMapFPf
/* C7BB0 001C7AB0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* C7BB4 001C7AB4 3000BF7F */  sq         $31, 0x30($sp)
/* C7BB8 001C7AB8 2000B27F */  sq         $18, 0x20($sp)
/* C7BBC 001C7ABC 1000B17F */  sq         $17, 0x10($sp)
/* C7BC0 001C7AC0 0000B07F */  sq         $16, 0x0($sp)
/* C7BC4 001C7AC4 28968070 */  paddub     $18, $4, $0
/* C7BC8 001C7AC8 28360070 */  paddub     $6, $0, $0
/* C7BCC 001C7ACC 34000010 */  b          .L001C7BA0
/* C7BD0 001C7AD0 00000000 */   nop
.L001C7AD4:
/* C7BD4 001C7AD4 40810600 */  sll        $16, $6, 5
/* C7BD8 001C7AD8 21201202 */  addu       $4, $16, $18
/* C7BDC 001C7ADC 0100013C */  lui        $at, (0x10AC0 >> 16)
/* C7BE0 001C7AE0 C00A2134 */  ori        $at, $at, (0x10AC0 & 0xFFFF)
/* C7BE4 001C7AE4 21888100 */  addu       $17, $4, $at
/* C7BE8 001C7AE8 0000238E */  lw         $3, 0x0($17)
/* C7BEC 001C7AEC 2B180300 */  sltu       $3, $0, $3
/* C7BF0 001C7AF0 01006338 */  xori       $3, $3, 0x1
/* C7BF4 001C7AF4 FF006330 */  andi       $3, $3, 0xFF
/* C7BF8 001C7AF8 28006010 */  beqz       $3, .L001C7B9C
/* C7BFC 001C7AFC 00000000 */   nop
/* C7C00 001C7B00 0100013C */  lui        $at, (0x10AB0 >> 16)
/* C7C04 001C7B04 B00A2134 */  ori        $at, $at, (0x10AB0 & 0xFFFF)
/* C7C08 001C7B08 21208100 */  addu       $4, $4, $at
/* C7C0C 001C7B0C 0C86040C */  jal        sceVu0CopyVector
/* C7C10 001C7B10 00000000 */   nop
/* C7C14 001C7B14 01000224 */  addiu      $2, $0, 0x1
/* C7C18 001C7B18 000022AE */  sw         $2, 0x0($17)
/* C7C1C 001C7B1C BE11040C */  jal        rand
/* C7C20 001C7B20 00000000 */   nop
/* C7C24 001C7B24 00008244 */  mtc1       $2, $f0
/* C7C28 001C7B28 00000000 */  nop
/* C7C2C 001C7B2C 60008046 */  cvt.s.w    $f1, $f0
/* C7C30 001C7B30 2041023C */  lui        $2, (0x41200000 >> 16)
/* C7C34 001C7B34 00008244 */  mtc1       $2, $f0
/* C7C38 001C7B38 00000000 */  nop
/* C7C3C 001C7B3C 42000146 */  mul.s      $f1, $f0, $f1
/* C7C40 001C7B40 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C7C44 001C7B44 00008244 */  mtc1       $2, $f0
/* C7C48 001C7B48 00000000 */  nop
/* C7C4C 001C7B4C 030B0046 */  div.s      $f12, $f1, $f0
/* C7C50 001C7B50 2C44040C */  jal        fptosi
/* C7C54 001C7B54 00000000 */   nop
/* C7C58 001C7B58 21181202 */  addu       $3, $16, $18
/* C7C5C 001C7B5C 0100013C */  lui        $at, (0x10AC4 >> 16)
/* C7C60 001C7B60 C40A2134 */  ori        $at, $at, (0x10AC4 & 0xFFFF)
/* C7C64 001C7B64 21206100 */  addu       $4, $3, $at
/* C7C68 001C7B68 000082AC */  sw         $2, 0x0($4)
/* C7C6C 001C7B6C 0000838C */  lw         $3, 0x0($4)
/* C7C70 001C7B70 0A006328 */  slti       $3, $3, 0xA
/* C7C74 001C7B74 03006014 */  bnez       $3, .L001C7B84
/* C7C78 001C7B78 00000000 */   nop
/* C7C7C 001C7B7C 09000324 */  addiu      $3, $0, 0x9
/* C7C80 001C7B80 000083AC */  sw         $3, 0x0($4)
.L001C7B84:
/* C7C84 001C7B84 21181202 */  addu       $3, $16, $18
/* C7C88 001C7B88 0100013C */  lui        $at, (0x10AC8 >> 16)
/* C7C8C 001C7B8C 21086100 */  addu       $at, $3, $at
/* C7C90 001C7B90 C80A20AC */  sw         $0, (0x10AC8 & 0xFFFF)($at)
/* C7C94 001C7B94 05000010 */  b          .L001C7BAC
/* C7C98 001C7B98 00000000 */   nop
.L001C7B9C:
/* C7C9C 001C7B9C 0100C624 */  addiu      $6, $6, 0x1
.L001C7BA0:
/* C7CA0 001C7BA0 0300C328 */  slti       $3, $6, 0x3
/* C7CA4 001C7BA4 CBFF6014 */  bnez       $3, .L001C7AD4
/* C7CA8 001C7BA8 00000000 */   nop
.L001C7BAC:
/* C7CAC 001C7BAC 3000BF7B */  lq         $31, 0x30($sp)
/* C7CB0 001C7BB0 2000B27B */  lq         $18, 0x20($sp)
/* C7CB4 001C7BB4 1000B17B */  lq         $17, 0x10($sp)
/* C7CB8 001C7BB8 0000B07B */  lq         $16, 0x0($sp)
/* C7CBC 001C7BBC 4000BD27 */  addiu      $sp, $sp, 0x40
/* C7CC0 001C7BC0 0800E003 */  jr         $31
/* C7CC4 001C7BC4 00000000 */   nop
/* C7CC8 001C7BC8 00000000 */  nop
/* C7CCC 001C7BCC 00000000 */  nop
