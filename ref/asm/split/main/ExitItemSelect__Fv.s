.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ExitItemSelect__Fv
/* 102520 00202420 F0FFBD27 */  addiu       $29, $29, -0x10
/* 102524 00202424 0000BF7F */  sq          $31, 0x0($29)
/* 102528 00202428 03000224 */  addiu       $2, $0, 0x3
/* 10252C 0020242C DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x14)
/* 102530 00202430 243B22AC */  sw          $2, %lo(CommonMenuMes3 + 0x14)($1)
/* 102534 00202434 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16DC)
/* 102538 00202438 EC5120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16DC)($1)
/* 10253C 0020243C 0B000224 */  addiu       $2, $0, 0xB
/* 102540 00202440 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x8)
/* 102544 00202444 183B22AC */  sw          $2, %lo(CommonMenuMes3 + 0x8)($1)
/* 102548 00202448 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x98)
/* 10254C 0020244C 685320AC */  sw          $0, %lo(AtoraNameMes + 0x98)($1)
/* 102550 00202450 FFFF0224 */  addiu       $2, $0, -0x1
/* 102554 00202454 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x54)
/* 102558 00202458 245322AC */  sw          $2, %lo(AtoraNameMes + 0x54)($1)
/* 10255C 0020245C 1C8D848F */  lw          $4, -0x72E4($28)
/* 102560 00202460 D05E050C */  jal         GetMenuCursor__9CSaveDataFv
/* 102564 00202464 00000000 */   nop
/* 102568 00202468 00004384 */  lh          $3, 0x0($2)
/* 10256C 0020246C 0A006014 */  bnez        $3, .L00202498
/* 102570 00202470 00000000 */   nop
/* 102574 00202474 DA01013C */  lui         $1, %hi(ItemMenuMode + 0x2C)
/* 102578 00202478 1CEC238C */  lw          $3, %lo(ItemMenuMode + 0x2C)($1)
/* 10257C 0020247C 020043A4 */  sh          $3, 0x2($2)
/* 102580 00202480 DA01013C */  lui         $1, %hi(ItemMenuMode)
/* 102584 00202484 F0EB2384 */  lh          $3, %lo(ItemMenuMode)($1)
/* 102588 00202488 160043A4 */  sh          $3, 0x16($2)
/* 10258C 0020248C DA01013C */  lui         $1, %hi(ItemMenuMode + 0x24)
/* 102590 00202490 14EC238C */  lw          $3, %lo(ItemMenuMode + 0x24)($1)
/* 102594 00202494 2A0043A4 */  sh          $3, 0x2A($2)
.L00202498:
/* 102598 00202498 0000BF7B */  lq          $31, 0x0($29)
/* 10259C 0020249C 1000BD27 */  addiu       $29, $29, 0x10
/* 1025A0 002024A0 0800E003 */  jr          $31
/* 1025A4 002024A4 00000000 */   nop
/* 1025A8 002024A8 00000000 */  nop
/* 1025AC 002024AC 00000000 */  nop
