.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel WaitKeyProcess__Fv
/* 004210 01DAFF10 F0FFBD27 */  addiu       $29, $29, -0x10
/* 004214 01DAFF14 0000BF7F */  sq          $31, 0x0($29)
/* 004218 01DAFF18 44988383 */  lb          $3, -0x67BC($28)
/* 00421C 01DAFF1C 04006014 */  bnez        $3, .L01DAFF30_2B5730
/* 004220 01DAFF20 00000000 */   nop
/* 004224 01DAFF24 409880AF */  sw          $0, -0x67C0($28)
/* 004228 01DAFF28 01000324 */  addiu       $3, $0, 0x1
/* 00422C 01DAFF2C 449883A3 */  sb          $3, -0x67BC($28)
.L01DAFF30_2B5730:
/* 004230 01DAFF30 4C988383 */  lb          $3, -0x67B4($28)
/* 004234 01DAFF34 04006014 */  bnez        $3, .L01DAFF48_2B5748
/* 004238 01DAFF38 00000000 */   nop
/* 00423C 01DAFF3C 489880AF */  sw          $0, -0x67B8($28)
/* 004240 01DAFF40 01000324 */  addiu       $3, $0, 0x1
/* 004244 01DAFF44 4C9883A3 */  sb          $3, -0x67B4($28)
.L01DAFF48_2B5748:
/* 004248 01DAFF48 DE01013C */  lui         $1, %hi(CScript__2 + 0x24)
/* 00424C 01DAFF4C 241B238C */  lw          $3, %lo(CScript__2 + 0x24)($1)
/* 004250 01DAFF50 43006010 */  beqz        $3, .L01DB0060_2B5860
/* 004254 01DAFF54 00000000 */   nop
/* 004258 01DAFF58 4098838F */  lw          $3, -0x67C0($28)
/* 00425C 01DAFF5C 0B006014 */  bnez        $3, .L01DAFF8C_2B578C
/* 004260 01DAFF60 00000000 */   nop
/* 004264 01DAFF64 0498848F */  lw          $4, -0x67FC($28)
/* 004268 01DAFF68 B0110324 */  addiu       $3, $0, 0x11B0
/* 00426C 01DAFF6C 18208300 */  mult        $4, $4, $3
/* 004270 01DAFF70 E101033C */  lui         $3, %hi(Cam__2 + 0x2F0)
/* 004274 01DAFF74 C09B6324 */  addiu       $3, $3, %lo(Cam__2 + 0x2F0)
/* 004278 01DAFF78 21186400 */  addu        $3, $3, $4
/* 00427C 01DAFF7C 000060C4 */  lwc1        $f0, 0x0($3)
/* 004280 01DAFF80 209880E7 */  swc1        $f0, -0x67E0($28)
/* 004284 01DAFF84 01000324 */  addiu       $3, $0, 0x1
/* 004288 01DAFF88 409883AF */  sw          $3, -0x67C0($28)
.L01DAFF8C_2B578C:
/* 00428C 01DAFF8C 0898838F */  lw          $3, -0x67F8($28)
/* 004290 01DAFF90 3A006014 */  bnez        $3, .L01DB007C_2B587C
/* 004294 01DAFF94 00000000 */   nop
/* 004298 01DAFF98 CC01023C */  lui         $2, %hi(GamePad)
/* 00429C 01DAFF9C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0042A0 01DAFFA0 20000524 */  addiu       $5, $0, 0x20
/* 0042A4 01DAFFA4 1CAE040C */  jal         Down__8CGamePadFi
/* 0042A8 01DAFFA8 00000000 */   nop
/* 0042AC 01DAFFAC 08004014 */  bnez        $2, .L01DAFFD0_2B57D0
/* 0042B0 01DAFFB0 00000000 */   nop
/* 0042B4 01DAFFB4 CC01023C */  lui         $2, %hi(GamePad)
/* 0042B8 01DAFFB8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0042BC 01DAFFBC 40000524 */  addiu       $5, $0, 0x40
/* 0042C0 01DAFFC0 1CAE040C */  jal         Down__8CGamePadFi
/* 0042C4 01DAFFC4 00000000 */   nop
/* 0042C8 01DAFFC8 2C004010 */  beqz        $2, .L01DB007C_2B587C
/* 0042CC 01DAFFCC 00000000 */   nop
.L01DAFFD0_2B57D0:
/* 0042D0 01DAFFD0 E101023C */  lui         $2, %hi(Mes1)
/* 0042D4 01DAFFD4 F0CD4424 */  addiu       $4, $2, %lo(Mes1)
/* 0042D8 01DAFFD8 2038050C */  jal         State__6ClsMesFv
/* 0042DC 01DAFFDC 00000000 */   nop
/* 0042E0 01DAFFE0 05000324 */  addiu       $3, $0, 0x5
/* 0042E4 01DAFFE4 0C004314 */  bne         $2, $3, .L01DB0018_2B5818
/* 0042E8 01DAFFE8 00000000 */   nop
/* 0042EC 01DAFFEC 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0042F0 01DAFFF0 E101013C */  lui         $1, %hi(Mes1 + 0xA4)
/* 0042F4 01DAFFF4 94CE22AC */  sw          $2, %lo(Mes1 + 0xA4)($1)
/* 0042F8 01DAFFF8 E101013C */  lui         $1, %hi(Mes1 + 0xA8)
/* 0042FC 01DAFFFC 98CE22AC */  sw          $2, %lo(Mes1 + 0xA8)($1)
/* 004300 01DB0000 E101023C */  lui         $2, %hi(Mes1)
/* 004304 01DB0004 F0CD4424 */  addiu       $4, $2, %lo(Mes1)
/* 004308 01DB0008 5C38050C */  jal         GoNextPage__6ClsMesFv
/* 00430C 01DB000C 00000000 */   nop
/* 004310 01DB0010 1A000010 */  b           .L01DB007C_2B587C
/* 004314 01DB0014 00000000 */   nop
.L01DB0018_2B5818:
/* 004318 01DB0018 E101023C */  lui         $2, %hi(Mes1)
/* 00431C 01DB001C F0CD4424 */  addiu       $4, $2, %lo(Mes1)
/* 004320 01DB0020 2038050C */  jal         State__6ClsMesFv
/* 004324 01DB0024 00000000 */   nop
/* 004328 01DB0028 03000324 */  addiu       $3, $0, 0x3
/* 00432C 01DB002C 06004314 */  bne         $2, $3, .L01DB0048_2B5848
/* 004330 01DB0030 00000000 */   nop
/* 004334 01DB0034 DE01013C */  lui         $1, %hi(CScript__2 + 0x24)
/* 004338 01DB0038 241B20AC */  sw          $0, %lo(CScript__2 + 0x24)($1)
/* 00433C 01DB003C 409880AF */  sw          $0, -0x67C0($28)
/* 004340 01DB0040 0E000010 */  b           .L01DB007C_2B587C
/* 004344 01DB0044 00000000 */   nop
.L01DB0048_2B5848:
/* 004348 01DB0048 E101013C */  lui         $1, %hi(Mes1 + 0xA4)
/* 00434C 01DB004C 94CE20AC */  sw          $0, %lo(Mes1 + 0xA4)($1)
/* 004350 01DB0050 E101013C */  lui         $1, %hi(Mes1 + 0xA8)
/* 004354 01DB0054 98CE20AC */  sw          $0, %lo(Mes1 + 0xA8)($1)
/* 004358 01DB0058 08000010 */  b           .L01DB007C_2B587C
/* 00435C 01DB005C 00000000 */   nop
.L01DB0060_2B5860:
/* 004360 01DB0060 409880AF */  sw          $0, -0x67C0($28)
/* 004364 01DB0064 489880AF */  sw          $0, -0x67B8($28)
/* 004368 01DB0068 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 00436C 01DB006C E101013C */  lui         $1, %hi(Mes1 + 0xA4)
/* 004370 01DB0070 94CE23AC */  sw          $3, %lo(Mes1 + 0xA4)($1)
/* 004374 01DB0074 E101013C */  lui         $1, %hi(Mes1 + 0xA8)
/* 004378 01DB0078 98CE23AC */  sw          $3, %lo(Mes1 + 0xA8)($1)
.L01DB007C_2B587C:
/* 00437C 01DB007C 0000BF7B */  lq          $31, 0x0($29)
/* 004380 01DB0080 1000BD27 */  addiu       $29, $29, 0x10
/* 004384 01DB0084 0800E003 */  jr          $31
/* 004388 01DB0088 00000000 */   nop
/* 00438C 01DB008C 00000000 */  nop
