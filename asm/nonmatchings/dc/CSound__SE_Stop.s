.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel SE_Stop__6CSoundFiiii
/* 45BF0 00145AF0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 45BF4 00145AF4 3000BF7F */  sq         $31, 0x30($sp)
/* 45BF8 00145AF8 2000B27F */  sq         $18, 0x20($sp)
/* 45BFC 00145AFC 1000B17F */  sq         $17, 0x10($sp)
/* 45C00 00145B00 0000B07F */  sq         $16, 0x0($sp)
/* 45C04 00145B04 2896E070 */  paddub     $18, $7, $0
/* 45C08 00145B08 288E0071 */  paddub     $17, $8, $0
/* 45C0C 00145B0C F6FFA420 */  addi       $4, $5, -0xA # handwritten instruction
/* 45C10 00145B10 0600812C */  sltiu      $at, $4, 0x6
/* 45C14 00145B14 18002010 */  beqz       $at, .L00145B78
/* 45C18 00145B18 00000000 */   nop
/* 45C1C 00145B1C 2A00023C */  lui        $2, %hi(_837)
/* 45C20 00145B20 D0994324 */  addiu      $3, $2, %lo(_837)
/* 45C24 00145B24 80100400 */  sll        $2, $4, 2
/* 45C28 00145B28 21104300 */  addu       $2, $2, $3
/* 45C2C 00145B2C 0000428C */  lw         $2, 0x0($2)
/* 45C30 00145B30 08004000 */  jr         $2
/* 45C34 00145B34 00000000 */   nop
/* 45C38 00145B38 05001024 */  addiu      $16, $0, 0x5
/* 45C3C 00145B3C 0E000010 */  b          .L00145B78
/* 45C40 00145B40 00000000 */   nop
/* 45C44 00145B44 04001024 */  addiu      $16, $0, 0x4
/* 45C48 00145B48 0B000010 */  b          .L00145B78
/* 45C4C 00145B4C 00000000 */   nop
/* 45C50 00145B50 03001024 */  addiu      $16, $0, 0x3
/* 45C54 00145B54 08000010 */  b          .L00145B78
/* 45C58 00145B58 00000000 */   nop
/* 45C5C 00145B5C 02001024 */  addiu      $16, $0, 0x2
/* 45C60 00145B60 05000010 */  b          .L00145B78
/* 45C64 00145B64 00000000 */   nop
/* 45C68 00145B68 01001024 */  addiu      $16, $0, 0x1
/* 45C6C 00145B6C 02000010 */  b          .L00145B78
/* 45C70 00145B70 00000000 */   nop
/* 45C74 00145B74 28860070 */  paddub     $16, $0, $0
.L00145B78:
/* 45C78 00145B78 7F00C230 */  andi       $2, $6, 0x7F
/* 45C7C 00145B7C 00120200 */  sll        $2, $2, 8
/* 45C80 00145B80 C0004634 */  ori        $6, $2, 0xC0
/* 45C84 00145B84 CE01023C */  lui        $2, %hi(msinCtx)
/* 45C88 00145B88 70754424 */  addiu      $4, $2, %lo(msinCtx)
/* 45C8C 00145B8C 282E0072 */  paddub     $5, $16, $0
/* 45C90 00145B90 A47C040C */  jal        sceMSIn_PutMsg
/* 45C94 00145B94 00000000 */   nop
/* 45C98 00145B98 FD000224 */  addiu      $2, $0, 0xFD
/* 45C9C 00145B9C 4800A2A3 */  sb         $2, 0x48($sp)
/* 45CA0 00145BA0 10000224 */  addiu      $2, $0, 0x10
/* 45CA4 00145BA4 4900A2A3 */  sb         $2, 0x49($sp)
/* 45CA8 00145BA8 4A00A0A3 */  sb         $0, 0x4A($sp)
/* 45CAC 00145BAC 4B00B2A3 */  sb         $18, 0x4B($sp)
/* 45CB0 00145BB0 4C00B1A3 */  sb         $17, 0x4C($sp)
/* 45CB4 00145BB4 4D00A0A3 */  sb         $0, 0x4D($sp)
/* 45CB8 00145BB8 4E00A0A3 */  sb         $0, 0x4E($sp)
/* 45CBC 00145BBC CE01023C */  lui        $2, %hi(msinCtx)
/* 45CC0 00145BC0 70754424 */  addiu      $4, $2, %lo(msinCtx)
/* 45CC4 00145BC4 282E0072 */  paddub     $5, $16, $0
/* 45CC8 00145BC8 4800A627 */  addiu      $6, $sp, 0x48
/* 45CCC 00145BCC EE7C040C */  jal        sceMSIn_PutHsMsg
/* 45CD0 00145BD0 00000000 */   nop
/* 45CD4 00145BD4 3000BF7B */  lq         $31, 0x30($sp)
/* 45CD8 00145BD8 2000B27B */  lq         $18, 0x20($sp)
/* 45CDC 00145BDC 1000B17B */  lq         $17, 0x10($sp)
/* 45CE0 00145BE0 0000B07B */  lq         $16, 0x0($sp)
/* 45CE4 00145BE4 5000BD27 */  addiu      $sp, $sp, 0x50
/* 45CE8 00145BE8 0800E003 */  jr         $31
/* 45CEC 00145BEC 00000000 */   nop
