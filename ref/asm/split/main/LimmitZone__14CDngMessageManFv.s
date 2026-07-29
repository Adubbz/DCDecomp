.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LimmitZone__14CDngMessageManFv
/* 0B5C90 001B5B90 789C838F */  lw          $3, -0x6388($28)
/* 0B5C94 001B5B94 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B5C98 001B5B98 21086100 */  addu        $1, $3, $1
/* 0B5C9C 001B5B9C 108B238C */  lw          $3, -0x74F0($1)
/* 0B5CA0 001B5BA0 0A006004 */  bltz        $3, .L001B5BCC
/* 0B5CA4 001B5BA4 00000000 */   nop
/* 0B5CA8 001B5BA8 06006128 */  slti        $1, $3, 0x6
/* 0B5CAC 001B5BAC 07002010 */  beqz        $1, .L001B5BCC
/* 0B5CB0 001B5BB0 00000000 */   nop
/* 0B5CB4 001B5BB4 0B000324 */  addiu       $3, $0, 0xB
/* 0B5CB8 001B5BB8 240083AC */  sw          $3, 0x24($4)
/* 0B5CBC 001B5BBC 789C838F */  lw          $3, -0x6388($28)
/* 0B5CC0 001B5BC0 04006380 */  lb          $3, 0x4($3)
/* 0B5CC4 001B5BC4 32006324 */  addiu       $3, $3, 0x32
/* 0B5CC8 001B5BC8 0C0083AC */  sw          $3, 0xC($4)
.L001B5BCC:
/* 0B5CCC 001B5BCC 789C838F */  lw          $3, -0x6388($28)
/* 0B5CD0 001B5BD0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B5CD4 001B5BD4 21086100 */  addu        $1, $3, $1
/* 0B5CD8 001B5BD8 108B258C */  lw          $5, -0x74F0($1)
/* 0B5CDC 001B5BDC 0A000324 */  addiu       $3, $0, 0xA
/* 0B5CE0 001B5BE0 0300A314 */  bne         $5, $3, .L001B5BF0
/* 0B5CE4 001B5BE4 00000000 */   nop
/* 0B5CE8 001B5BE8 0D000324 */  addiu       $3, $0, 0xD
/* 0B5CEC 001B5BEC 240083AC */  sw          $3, 0x24($4)
.L001B5BF0:
/* 0B5CF0 001B5BF0 789C838F */  lw          $3, -0x6388($28)
/* 0B5CF4 001B5BF4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B5CF8 001B5BF8 21086100 */  addu        $1, $3, $1
/* 0B5CFC 001B5BFC 108B258C */  lw          $5, -0x74F0($1)
/* 0B5D00 001B5C00 0B000324 */  addiu       $3, $0, 0xB
/* 0B5D04 001B5C04 0300A314 */  bne         $5, $3, .L001B5C14
/* 0B5D08 001B5C08 00000000 */   nop
/* 0B5D0C 001B5C0C 0E000324 */  addiu       $3, $0, 0xE
/* 0B5D10 001B5C10 240083AC */  sw          $3, 0x24($4)
.L001B5C14:
/* 0B5D14 001B5C14 F0000324 */  addiu       $3, $0, 0xF0
/* 0B5D18 001B5C18 040083AC */  sw          $3, 0x4($4)
/* 0B5D1C 001B5C1C 1C0080AC */  sw          $0, 0x1C($4)
/* 0B5D20 001B5C20 0800E003 */  jr          $31
/* 0B5D24 001B5C24 00000000 */   nop
/* 0B5D28 001B5C28 00000000 */  nop
/* 0B5D2C 001B5C2C 00000000 */  nop
