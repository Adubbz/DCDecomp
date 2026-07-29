.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleMenuAppear__Fv
/* 0F69C0 001F68C0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0F69C4 001F68C4 2000BF7F */  sq          $31, 0x20($29)
/* 0F69C8 001F68C8 1000B17F */  sq          $17, 0x10($29)
/* 0F69CC 001F68CC 0000B07F */  sq          $16, 0x0($29)
/* 0F69D0 001F68D0 28860070 */  paddub      $16, $0, $0
/* 0F69D4 001F68D4 288E0070 */  paddub      $17, $0, $0
/* 0F69D8 001F68D8 28000010 */  b           .L001F697C
/* 0F69DC 001F68DC 00000000 */   nop
.L001F68E0:
/* 0F69E0 001F68E0 28262072 */  paddub      $4, $17, $0
/* 0F69E4 001F68E4 3800A527 */  addiu       $5, $29, 0x38
/* 0F69E8 001F68E8 44D0070C */  jal         GetMenuIconPos__FiPi
/* 0F69EC 001F68EC 00000000 */   nop
/* 0F69F0 001F68F0 C0201100 */  sll         $4, $17, 3
/* 0F69F4 001F68F4 D901023C */  lui         $2, %hi(NorMenuIcon)
/* 0F69F8 001F68F8 20044224 */  addiu       $2, $2, %lo(NorMenuIcon)
/* 0F69FC 001F68FC 21184400 */  addu        $3, $2, $4
/* 0F6A00 001F6900 000061C4 */  lwc1        $f1, 0x0($3)
/* 0F6A04 001F6904 3800A28F */  lw          $2, 0x38($29)
/* 0F6A08 001F6908 00008244 */  mtc1        $2, $f0
/* 0F6A0C 001F690C 00000000 */  nop
/* 0F6A10 001F6910 E0008046 */  cvt.s.w     $f3, $f0
/* 0F6A14 001F6914 01190146 */  sub.s       $f4, $f3, $f1
/* 0F6A18 001F6918 8040023C */  lui         $2, (0x40800000 >> 16)
/* 0F6A1C 001F691C 00008244 */  mtc1        $2, $f0
/* 0F6A20 001F6920 00000000 */  nop
/* 0F6A24 001F6924 03200046 */  div.s       $f0, $f4, $f0
/* 0F6A28 001F6928 00080046 */  add.s       $f0, $f1, $f0
/* 0F6A2C 001F692C 000060E4 */  swc1        $f0, 0x0($3)
/* 0F6A30 001F6930 D901023C */  lui         $2, %hi(NorMenuIcon + 0x4)
/* 0F6A34 001F6934 24044224 */  addiu       $2, $2, %lo(NorMenuIcon + 0x4)
/* 0F6A38 001F6938 21104400 */  addu        $2, $2, $4
/* 0F6A3C 001F693C 3C00A0C7 */  lwc1        $f0, 0x3C($29)
/* 0F6A40 001F6940 20008046 */  cvt.s.w     $f0, $f0
/* 0F6A44 001F6944 000042C4 */  lwc1        $f2, 0x0($2)
/* 0F6A48 001F6948 41000246 */  sub.s       $f1, $f0, $f2
/* 0F6A4C 001F694C BC8280C7 */  lwc1        $f0, -0x7D44($28)
/* 0F6A50 001F6950 03080046 */  div.s       $f0, $f1, $f0
/* 0F6A54 001F6954 00100046 */  add.s       $f0, $f2, $f0
/* 0F6A58 001F6958 000040E4 */  swc1        $f0, 0x0($2)
/* 0F6A5C 001F695C C08280C7 */  lwc1        $f0, -0x7D40($28)
/* 0F6A60 001F6960 34200046 */  c.lt.s      $f4, $f0
/* 0F6A64 001F6964 00000000 */  nop
/* 0F6A68 001F6968 03000045 */  bc1f        .L001F6978
/* 0F6A6C 001F696C 00000000 */   nop
/* 0F6A70 001F6970 000063E4 */  swc1        $f3, 0x0($3)
/* 0F6A74 001F6974 01001026 */  addiu       $16, $16, 0x1
.L001F6978:
/* 0F6A78 001F6978 01003126 */  addiu       $17, $17, 0x1
.L001F697C:
/* 0F6A7C 001F697C 28D0070C */  jal         GetMenuModeMax__Fv
/* 0F6A80 001F6980 00000000 */   nop
/* 0F6A84 001F6984 2A102202 */  slt         $2, $17, $2
/* 0F6A88 001F6988 D5FF4014 */  bnez        $2, .L001F68E0
/* 0F6A8C 001F698C 00000000 */   nop
/* 0F6A90 001F6990 849581C7 */  lwc1        $f1, -0x6A7C($28)
/* 0F6A94 001F6994 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0F6A98 001F6998 00008244 */  mtc1        $2, $f0
/* 0F6A9C 001F699C 00000000 */  nop
/* 0F6AA0 001F69A0 40080046 */  add.s       $f1, $f1, $f0
/* 0F6AA4 001F69A4 849581E7 */  swc1        $f1, -0x6A7C($28)
/* 0F6AA8 001F69A8 9841023C */  lui         $2, (0x41980000 >> 16)
/* 0F6AAC 001F69AC 00008244 */  mtc1        $2, $f0
/* 0F6AB0 001F69B0 00000000 */  nop
/* 0F6AB4 001F69B4 34080046 */  c.lt.s      $f1, $f0
/* 0F6AB8 001F69B8 00000000 */  nop
/* 0F6ABC 001F69BC 02000145 */  bc1t        .L001F69C8
/* 0F6AC0 001F69C0 00000000 */   nop
/* 0F6AC4 001F69C4 849582AF */  sw          $2, -0x6A7C($28)
.L001F69C8:
/* 0F6AC8 001F69C8 8CFB040C */  jal         ReadBGSync__Fv
/* 0F6ACC 001F69CC 00000000 */   nop
/* 0F6AD0 001F69D0 0600032A */  slti        $3, $16, 0x6
/* 0F6AD4 001F69D4 13006014 */  bnez        $3, .L001F6A24
/* 0F6AD8 001F69D8 00000000 */   nop
/* 0F6ADC 001F69DC 11004014 */  bnez        $2, .L001F6A24
/* 0F6AE0 001F69E0 00000000 */   nop
/* 0F6AE4 001F69E4 70D6070C */  jal         BattleMenuTexEnter__Fv
/* 0F6AE8 001F69E8 00000000 */   nop
/* 0F6AEC 001F69EC 01000424 */  addiu       $4, $0, 0x1
/* 0F6AF0 001F69F0 E89484AF */  sw          $4, -0x6B18($28)
/* 0F6AF4 001F69F4 849580AF */  sw          $0, -0x6A7C($28)
/* 0F6AF8 001F69F8 FFFF0324 */  addiu       $3, $0, -0x1
/* 0F6AFC 001F69FC 308883AF */  sw          $3, -0x77D0($28)
/* 0F6B00 001F6A00 208880AF */  sw          $0, -0x77E0($28)
/* 0F6B04 001F6A04 589584AF */  sw          $4, -0x6AA8($28)
/* 0F6B08 001F6A08 5C9580AF */  sw          $0, -0x6AA4($28)
/* 0F6B0C 001F6A0C 8042033C */  lui         $3, (0x42800000 >> 16)
/* 0F6B10 001F6A10 D901013C */  lui         $1, %hi(SysCur)
/* 0F6B14 001F6A14 600423AC */  sw          $3, %lo(SysCur)($1)
/* 0F6B18 001F6A18 5842033C */  lui         $3, (0x42580000 >> 16)
/* 0F6B1C 001F6A1C D901013C */  lui         $1, %hi(SysCur + 0x4)
/* 0F6B20 001F6A20 640423AC */  sw          $3, %lo(SysCur + 0x4)($1)
.L001F6A24:
/* 0F6B24 001F6A24 2000BF7B */  lq          $31, 0x20($29)
/* 0F6B28 001F6A28 1000B17B */  lq          $17, 0x10($29)
/* 0F6B2C 001F6A2C 0000B07B */  lq          $16, 0x0($29)
/* 0F6B30 001F6A30 4000BD27 */  addiu       $29, $29, 0x40
/* 0F6B34 001F6A34 0800E003 */  jr          $31
/* 0F6B38 001F6A38 00000000 */   nop
/* 0F6B3C 001F6A3C 00000000 */  nop
