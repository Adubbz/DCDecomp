.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Load__11CEditGroundFiP9CSaveData
/* A4F10 001A4E10 B0AFBD27 */  addiu      $sp, $sp, -0x5050
/* A4F14 001A4E14 3000BF7F */  sq         $31, 0x30($sp)
/* A4F18 001A4E18 2000B27F */  sq         $18, 0x20($sp)
/* A4F1C 001A4E1C 1000B17F */  sq         $17, 0x10($sp)
/* A4F20 001A4E20 0000B07F */  sq         $16, 0x0($sp)
/* A4F24 001A4E24 288E8070 */  paddub     $17, $4, $0
/* A4F28 001A4E28 4000B227 */  addiu      $18, $sp, 0x40
/* A4F2C 001A4E2C 4800B027 */  addiu      $16, $sp, 0x48
/* A4F30 001A4E30 2826C070 */  paddub     $4, $6, $0
/* A4F34 001A4E34 4C50A627 */  addiu      $6, $sp, 0x504C
/* A4F38 001A4E38 1860050C */  jal        GetParts__9CSaveDataFiPi
/* A4F3C 001A4E3C 00000000 */   nop
/* A4F40 001A4E40 20004010 */  beqz       $2, .L001A4EC4
/* A4F44 001A4E44 00000000 */   nop
/* A4F48 001A4E48 4C50A387 */  lh         $3, 0x504C($sp)
/* A4F4C 001A4E4C 000043A6 */  sh         $3, 0x0($18)
/* A4F50 001A4E50 08000324 */  addiu      $3, $0, 0x8
/* A4F54 001A4E54 040043A6 */  sh         $3, 0x4($18)
/* A4F58 001A4E58 28260070 */  paddub     $4, $0, $0
/* A4F5C 001A4E5C 0E000010 */  b          .L001A4E98
/* A4F60 001A4E60 00000000 */   nop
.L001A4E64:
/* A4F64 001A4E64 00004384 */  lh         $3, 0x0($2)
/* A4F68 001A4E68 000003A6 */  sh         $3, 0x0($16)
/* A4F6C 001A4E6C 02004384 */  lh         $3, 0x2($2)
/* A4F70 001A4E70 020003A6 */  sh         $3, 0x2($16)
/* A4F74 001A4E74 040040C4 */  lwc1       $f0, 0x4($2)
/* A4F78 001A4E78 040000E6 */  swc1       $f0, 0x4($16)
/* A4F7C 001A4E7C 080040C4 */  lwc1       $f0, 0x8($2)
/* A4F80 001A4E80 080000E6 */  swc1       $f0, 0x8($16)
/* A4F84 001A4E84 0C0040C4 */  lwc1       $f0, 0xC($2)
/* A4F88 001A4E88 0C0000E6 */  swc1       $f0, 0xC($16)
/* A4F8C 001A4E8C 10004224 */  addiu      $2, $2, 0x10
/* A4F90 001A4E90 10001026 */  addiu      $16, $16, 0x10
/* A4F94 001A4E94 01008424 */  addiu      $4, $4, 0x1
.L001A4E98:
/* A4F98 001A4E98 4C50A38F */  lw         $3, 0x504C($sp)
/* A4F9C 001A4E9C 2A188300 */  slt        $3, $4, $3
/* A4FA0 001A4EA0 F0FF6014 */  bnez       $3, .L001A4E64
/* A4FA4 001A4EA4 00000000 */   nop
/* A4FA8 001A4EA8 FFFF0224 */  addiu      $2, $0, -0x1
/* A4FAC 001A4EAC 000002A6 */  sh         $2, 0x0($16)
/* A4FB0 001A4EB0 020002A6 */  sh         $2, 0x2($16)
/* A4FB4 001A4EB4 28262072 */  paddub     $4, $17, $0
/* A4FB8 001A4EB8 4000A527 */  addiu      $5, $sp, 0x40
/* A4FBC 001A4EBC 4492060C */  jal        Load__11CEditGroundFPc
/* A4FC0 001A4EC0 00000000 */   nop
.L001A4EC4:
/* A4FC4 001A4EC4 3000BF7B */  lq         $31, 0x30($sp)
/* A4FC8 001A4EC8 2000B27B */  lq         $18, 0x20($sp)
/* A4FCC 001A4ECC 1000B17B */  lq         $17, 0x10($sp)
/* A4FD0 001A4ED0 0000B07B */  lq         $16, 0x0($sp)
/* A4FD4 001A4ED4 5050BD27 */  addiu      $sp, $sp, 0x5050
/* A4FD8 001A4ED8 0800E003 */  jr         $31
/* A4FDC 001A4EDC 00000000 */   nop
