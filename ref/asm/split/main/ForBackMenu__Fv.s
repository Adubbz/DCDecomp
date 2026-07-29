.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ForBackMenu__Fv
/* 0F7300 001F7200 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0F7304 001F7204 0000BF7F */  sq          $31, 0x0($29)
/* 0F7308 001F7208 849580AF */  sw          $0, -0x6A7C($28)
/* 0F730C 001F720C FFFF0424 */  addiu       $4, $0, -0x1
/* 0F7310 001F7210 308884AF */  sw          $4, -0x77D0($28)
/* 0F7314 001F7214 01000324 */  addiu       $3, $0, 0x1
/* 0F7318 001F7218 489583A3 */  sb          $3, -0x6AB8($28)
/* 0F731C 001F721C DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x16BC)
/* 0F7320 001F7220 4C2224AC */  sw          $4, %lo(CommonMenuMes1 + 0x16BC)($1)
/* 0F7324 001F7224 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x54)
/* 0F7328 001F7228 E40B24AC */  sw          $4, %lo(CommonMenuMes1 + 0x54)($1)
/* 0F732C 001F722C 80000324 */  addiu       $3, $0, 0x80
/* 0F7330 001F7230 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x16D4)
/* 0F7334 001F7234 642223AC */  sw          $3, %lo(CommonMenuMes1 + 0x16D4)($1)
/* 0F7338 001F7238 282E0070 */  paddub      $5, $0, $0
/* 0F733C 001F723C 0C000010 */  b           .L001F7270
/* 0F7340 001F7240 00000000 */   nop
.L001F7244:
/* 0F7344 001F7244 FFFF0424 */  addiu       $4, $0, -0x1
/* 0F7348 001F7248 80300500 */  sll         $6, $5, 2
/* 0F734C 001F724C DA01033C */  lui         $3, %hi(CommonMenuMes1 + 0x16E0)
/* 0F7350 001F7250 70226324 */  addiu       $3, $3, %lo(CommonMenuMes1 + 0x16E0)
/* 0F7354 001F7254 21186600 */  addu        $3, $3, $6
/* 0F7358 001F7258 000064AC */  sw          $4, 0x0($3)
/* 0F735C 001F725C DA01033C */  lui         $3, %hi(CommonMenuMes1 + 0x1708)
/* 0F7360 001F7260 98226324 */  addiu       $3, $3, %lo(CommonMenuMes1 + 0x1708)
/* 0F7364 001F7264 21186600 */  addu        $3, $3, $6
/* 0F7368 001F7268 000064AC */  sw          $4, 0x0($3)
/* 0F736C 001F726C 0100A524 */  addiu       $5, $5, 0x1
.L001F7270:
/* 0F7370 001F7270 0A00A328 */  slti        $3, $5, 0xA
/* 0F7374 001F7274 F3FF6014 */  bnez        $3, .L001F7244
/* 0F7378 001F7278 00000000 */   nop
/* 0F737C 001F727C 2088838F */  lw          $3, -0x77E0($28)
/* 0F7380 001F7280 F0FF6324 */  addiu       $3, $3, -0x10
/* 0F7384 001F7284 589583AF */  sw          $3, -0x6AA8($28)
/* 0F7388 001F7288 5C95848F */  lw          $4, -0x6AA4($28)
/* 0F738C 001F728C 1800A527 */  addiu       $5, $29, 0x18
/* 0F7390 001F7290 44D0070C */  jal         GetMenuIconPos__FiPi
/* 0F7394 001F7294 00000000 */   nop
/* 0F7398 001F7298 1800A38F */  lw          $3, 0x18($29)
/* 0F739C 001F729C D8FF6324 */  addiu       $3, $3, -0x28
/* 0F73A0 001F72A0 00008344 */  mtc1        $3, $f0
/* 0F73A4 001F72A4 00000000 */  nop
/* 0F73A8 001F72A8 20008046 */  cvt.s.w     $f0, $f0
/* 0F73AC 001F72AC D901013C */  lui         $1, %hi(SysCur)
/* 0F73B0 001F72B0 600420E4 */  swc1        $f0, %lo(SysCur)($1)
/* 0F73B4 001F72B4 1C00A38F */  lw          $3, 0x1C($29)
/* 0F73B8 001F72B8 14006324 */  addiu       $3, $3, 0x14
/* 0F73BC 001F72BC 00008344 */  mtc1        $3, $f0
/* 0F73C0 001F72C0 00000000 */  nop
/* 0F73C4 001F72C4 20008046 */  cvt.s.w     $f0, $f0
/* 0F73C8 001F72C8 D901013C */  lui         $1, %hi(SysCur + 0x4)
/* 0F73CC 001F72CC 640420E4 */  swc1        $f0, %lo(SysCur + 0x4)($1)
/* 0F73D0 001F72D0 0000BF7B */  lq          $31, 0x0($29)
/* 0F73D4 001F72D4 2000BD27 */  addiu       $29, $29, 0x20
/* 0F73D8 001F72D8 0800E003 */  jr          $31
/* 0F73DC 001F72DC 00000000 */   nop
