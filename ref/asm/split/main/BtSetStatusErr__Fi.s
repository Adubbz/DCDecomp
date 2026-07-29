.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtSetStatusErr__Fi
/* 0B1CB0 001B1BB0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0B1CB4 001B1BB4 0000BF7F */  sq          $31, 0x0($29)
/* 0B1CB8 001B1BB8 789C868F */  lw          $6, -0x6388($28)
/* 0B1CBC 001B1BBC 0400C380 */  lb          $3, 0x4($6)
/* 0B1CC0 001B1BC0 40000524 */  addiu       $5, $0, 0x40
/* 0B1CC4 001B1BC4 5A008510 */  beq         $4, $5, .L001B1D30
/* 0B1CC8 001B1BC8 00000000 */   nop
/* 0B1CCC 001B1BCC 20000524 */  addiu       $5, $0, 0x20
/* 0B1CD0 001B1BD0 4B008510 */  beq         $4, $5, .L001B1D00
/* 0B1CD4 001B1BD4 00000000 */   nop
/* 0B1CD8 001B1BD8 10000524 */  addiu       $5, $0, 0x10
/* 0B1CDC 001B1BDC 31008510 */  beq         $4, $5, .L001B1CA4
/* 0B1CE0 001B1BE0 00000000 */   nop
/* 0B1CE4 001B1BE4 08000524 */  addiu       $5, $0, 0x8
/* 0B1CE8 001B1BE8 1D008510 */  beq         $4, $5, .L001B1C60
/* 0B1CEC 001B1BEC 00000000 */   nop
/* 0B1CF0 001B1BF0 04000524 */  addiu       $5, $0, 0x4
/* 0B1CF4 001B1BF4 03008510 */  beq         $4, $5, .L001B1C04
/* 0B1CF8 001B1BF8 00000000 */   nop
/* 0B1CFC 001B1BFC 5B000010 */  b           .L001B1D6C
/* 0B1D00 001B1C00 00000000 */   nop
.L001B1C04:
/* 0B1D04 001B1C04 80380300 */  sll         $7, $3, 2
/* 0B1D08 001B1C08 2128E600 */  addu        $5, $7, $6
/* 0B1D0C 001B1C0C C842A28C */  lw          $2, 0x42C8($5)
/* 0B1D10 001B1C10 25104400 */  or          $2, $2, $4
/* 0B1D14 001B1C14 C842A2AC */  sw          $2, 0x42C8($5)
/* 0B1D18 001B1C18 789C828F */  lw          $2, -0x6388($28)
/* 0B1D1C 001B1C1C 2128E200 */  addu        $5, $7, $2
/* 0B1D20 001B1C20 C842A48C */  lw          $4, 0x42C8($5)
/* 0B1D24 001B1C24 A7FF0224 */  addiu       $2, $0, -0x59
/* 0B1D28 001B1C28 24108200 */  and         $2, $4, $2
/* 0B1D2C 001B1C2C C842A2AC */  sw          $2, 0x42C8($5)
/* 0B1D30 001B1C30 2C010524 */  addiu       $5, $0, 0x12C
/* 0B1D34 001B1C34 789C848F */  lw          $4, -0x6388($28)
/* 0B1D38 001B1C38 40100300 */  sll         $2, $3, 1
/* 0B1D3C 001B1C3C 21104400 */  addu        $2, $2, $4
/* 0B1D40 001B1C40 E04245A4 */  sh          $5, 0x42E0($2)
/* 0B1D44 001B1C44 6B000424 */  addiu       $4, $0, 0x6B
/* 0B1D48 001B1C48 FFFF0524 */  addiu       $5, $0, -0x1
/* 0B1D4C 001B1C4C 28360070 */  paddub      $6, $0, $0
/* 0B1D50 001B1C50 AC69050C */  jal         SndSePlay__Fiii
/* 0B1D54 001B1C54 00000000 */   nop
/* 0B1D58 001B1C58 44000010 */  b           .L001B1D6C
/* 0B1D5C 001B1C5C 00000000 */   nop
.L001B1C60:
/* 0B1D60 001B1C60 80280300 */  sll         $5, $3, 2
/* 0B1D64 001B1C64 2128A600 */  addu        $5, $5, $6
/* 0B1D68 001B1C68 C842A624 */  addiu       $6, $5, 0x42C8
/* 0B1D6C 001B1C6C C842A58C */  lw          $5, 0x42C8($5)
/* 0B1D70 001B1C70 0400A530 */  andi        $5, $5, 0x4
/* 0B1D74 001B1C74 3D00A014 */  bnez        $5, .L001B1D6C
/* 0B1D78 001B1C78 00000000 */   nop
/* 0B1D7C 001B1C7C 0000C58C */  lw          $5, 0x0($6)
/* 0B1D80 001B1C80 2520A400 */  or          $4, $5, $4
/* 0B1D84 001B1C84 0000C4AC */  sw          $4, 0x0($6)
/* 0B1D88 001B1C88 08070524 */  addiu       $5, $0, 0x708
/* 0B1D8C 001B1C8C 789C848F */  lw          $4, -0x6388($28)
/* 0B1D90 001B1C90 40180300 */  sll         $3, $3, 1
/* 0B1D94 001B1C94 21186400 */  addu        $3, $3, $4
/* 0B1D98 001B1C98 E04265A4 */  sh          $5, 0x42E0($3)
/* 0B1D9C 001B1C9C 33000010 */  b           .L001B1D6C
/* 0B1DA0 001B1CA0 00000000 */   nop
.L001B1CA4:
/* 0B1DA4 001B1CA4 80380300 */  sll         $7, $3, 2
/* 0B1DA8 001B1CA8 2118E600 */  addu        $3, $7, $6
/* 0B1DAC 001B1CAC C8426524 */  addiu       $5, $3, 0x42C8
/* 0B1DB0 001B1CB0 C842638C */  lw          $3, 0x42C8($3)
/* 0B1DB4 001B1CB4 0C006330 */  andi        $3, $3, 0xC
/* 0B1DB8 001B1CB8 2C006014 */  bnez        $3, .L001B1D6C
/* 0B1DBC 001B1CBC 00000000 */   nop
/* 0B1DC0 001B1CC0 0000A28C */  lw          $2, 0x0($5)
/* 0B1DC4 001B1CC4 25104400 */  or          $2, $2, $4
/* 0B1DC8 001B1CC8 0000A2AC */  sw          $2, 0x0($5)
/* 0B1DCC 001B1CCC 789C828F */  lw          $2, -0x6388($28)
/* 0B1DD0 001B1CD0 2120E200 */  addu        $4, $7, $2
/* 0B1DD4 001B1CD4 C842838C */  lw          $3, 0x42C8($4)
/* 0B1DD8 001B1CD8 BFFF0224 */  addiu       $2, $0, -0x41
/* 0B1DDC 001B1CDC 24106200 */  and         $2, $3, $2
/* 0B1DE0 001B1CE0 C84282AC */  sw          $2, 0x42C8($4)
/* 0B1DE4 001B1CE4 6B000424 */  addiu       $4, $0, 0x6B
/* 0B1DE8 001B1CE8 FFFF0524 */  addiu       $5, $0, -0x1
/* 0B1DEC 001B1CEC 28360070 */  paddub      $6, $0, $0
/* 0B1DF0 001B1CF0 AC69050C */  jal         SndSePlay__Fiii
/* 0B1DF4 001B1CF4 00000000 */   nop
/* 0B1DF8 001B1CF8 1C000010 */  b           .L001B1D6C
/* 0B1DFC 001B1CFC 00000000 */   nop
.L001B1D00:
/* 0B1E00 001B1D00 80100300 */  sll         $2, $3, 2
/* 0B1E04 001B1D04 21184600 */  addu        $3, $2, $6
/* 0B1E08 001B1D08 C842628C */  lw          $2, 0x42C8($3)
/* 0B1E0C 001B1D0C 25104400 */  or          $2, $2, $4
/* 0B1E10 001B1D10 C84262AC */  sw          $2, 0x42C8($3)
/* 0B1E14 001B1D14 6B000424 */  addiu       $4, $0, 0x6B
/* 0B1E18 001B1D18 FFFF0524 */  addiu       $5, $0, -0x1
/* 0B1E1C 001B1D1C 28360070 */  paddub      $6, $0, $0
/* 0B1E20 001B1D20 AC69050C */  jal         SndSePlay__Fiii
/* 0B1E24 001B1D24 00000000 */   nop
/* 0B1E28 001B1D28 10000010 */  b           .L001B1D6C
/* 0B1E2C 001B1D2C 00000000 */   nop
.L001B1D30:
/* 0B1E30 001B1D30 80180300 */  sll         $3, $3, 2
/* 0B1E34 001B1D34 21186600 */  addu        $3, $3, $6
/* 0B1E38 001B1D38 C8426524 */  addiu       $5, $3, 0x42C8
/* 0B1E3C 001B1D3C C842638C */  lw          $3, 0x42C8($3)
/* 0B1E40 001B1D40 1C006330 */  andi        $3, $3, 0x1C
/* 0B1E44 001B1D44 09006014 */  bnez        $3, .L001B1D6C
/* 0B1E48 001B1D48 00000000 */   nop
/* 0B1E4C 001B1D4C 0000A28C */  lw          $2, 0x0($5)
/* 0B1E50 001B1D50 25104400 */  or          $2, $2, $4
/* 0B1E54 001B1D54 0000A2AC */  sw          $2, 0x0($5)
/* 0B1E58 001B1D58 6B000424 */  addiu       $4, $0, 0x6B
/* 0B1E5C 001B1D5C FFFF0524 */  addiu       $5, $0, -0x1
/* 0B1E60 001B1D60 28360070 */  paddub      $6, $0, $0
/* 0B1E64 001B1D64 AC69050C */  jal         SndSePlay__Fiii
/* 0B1E68 001B1D68 00000000 */   nop
.L001B1D6C:
/* 0B1E6C 001B1D6C 0000BF7B */  lq          $31, 0x0($29)
/* 0B1E70 001B1D70 1000BD27 */  addiu       $29, $29, 0x10
/* 0B1E74 001B1D74 0800E003 */  jr          $31
/* 0B1E78 001B1D78 00000000 */   nop
/* 0B1E7C 001B1D7C 00000000 */  nop
