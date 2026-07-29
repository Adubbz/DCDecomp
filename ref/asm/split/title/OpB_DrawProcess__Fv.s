.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpB_DrawProcess__Fv
/* 00F520 01DBB220 A0FFBD27 */  addiu       $29, $29, -0x60
/* 00F524 01DBB224 3000BF7F */  sq          $31, 0x30($29)
/* 00F528 01DBB228 2000B17F */  sq          $17, 0x20($29)
/* 00F52C 01DBB22C 1000B07F */  sq          $16, 0x10($29)
/* 00F530 01DBB230 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 00F534 01DBB234 00008244 */  mtc1        $2, $f0
/* 00F538 01DBB238 00000000 */  nop
/* 00F53C 01DBB23C A0038046 */  cvt.s.w     $f14, $f0
/* 00F540 01DBB240 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 00F544 01DBB244 00688244 */  mtc1        $2, $f13
/* 00F548 01DBB248 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 00F54C 01DBB24C C0562CC4 */  lwc1        $f12, %lo(mgRenderInfo + 0x1A0)($1)
/* 00F550 01DBB250 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 00F554 01DBB254 00000000 */   nop
/* 00F558 01DBB258 C701023C */  lui         $2, %hi(TexManager)
/* 00F55C 01DBB25C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00F560 01DBB260 D48B858F */  lw          $5, -0x742C($28)
/* 00F564 01DBB264 0A000624 */  addiu       $6, $0, 0xA
/* 00F568 01DBB268 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00F56C 01DBB26C 00000000 */   nop
/* 00F570 01DBB270 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 00F574 01DBB274 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 00F578 01DBB278 02000224 */  addiu       $2, $0, 0x2
/* 00F57C 01DBB27C 30006210 */  beq         $3, $2, .L01DBB340_2C0B40
/* 00F580 01DBB280 00000000 */   nop
/* 00F584 01DBB284 01000224 */  addiu       $2, $0, 0x1
/* 00F588 01DBB288 03006210 */  beq         $3, $2, .L01DBB298_2C0A98
/* 00F58C 01DBB28C 00000000 */   nop
/* 00F590 01DBB290 31000010 */  b           .L01DBB358_2C0B58
/* 00F594 01DBB294 00000000 */   nop
.L01DBB298_2C0A98:
/* 00F598 01DBB298 28860070 */  paddub      $16, $0, $0
/* 00F59C 01DBB29C 0C000010 */  b           .L01DBB2D0_2C0AD0
/* 00F5A0 01DBB2A0 00000000 */   nop
.L01DBB2A4_2C0AA4:
/* 00F5A4 01DBB2A4 00111000 */  sll         $2, $16, 4
/* 00F5A8 01DBB2A8 23105000 */  subu        $2, $2, $16
/* 00F5AC 01DBB2AC 00190200 */  sll         $3, $2, 4
/* 00F5B0 01DBB2B0 E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 00F5B4 01DBB2B4 B0F64224 */  addiu       $2, $2, %lo(OP_NornMapObj)
/* 00F5B8 01DBB2B8 21204300 */  addu        $4, $2, $3
/* 00F5BC 01DBB2BC A000998C */  lw          $25, 0xA0($4)
/* 00F5C0 01DBB2C0 9400398F */  lw          $25, 0x94($25)
/* 00F5C4 01DBB2C4 09F82003 */  jalr        $25
/* 00F5C8 01DBB2C8 00000000 */   nop
/* 00F5CC 01DBB2CC 01001026 */  addiu       $16, $16, 0x1
.L01DBB2D0_2C0AD0:
/* 00F5D0 01DBB2D0 4400022A */  slti        $2, $16, 0x44
/* 00F5D4 01DBB2D4 F3FF4014 */  bnez        $2, .L01DBB2A4_2C0AA4
/* 00F5D8 01DBB2D8 00000000 */   nop
/* 00F5DC 01DBB2DC C701023C */  lui         $2, %hi(TexManager)
/* 00F5E0 01DBB2E0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00F5E4 01DBB2E4 D48B858F */  lw          $5, -0x742C($28)
/* 00F5E8 01DBB2E8 0B000624 */  addiu       $6, $0, 0xB
/* 00F5EC 01DBB2EC 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00F5F0 01DBB2F0 00000000 */   nop
/* 00F5F4 01DBB2F4 28860070 */  paddub      $16, $0, $0
/* 00F5F8 01DBB2F8 0C000010 */  b           .L01DBB32C_2C0B2C
/* 00F5FC 01DBB2FC 00000000 */   nop
.L01DBB300_2C0B00:
/* 00F600 01DBB300 00111000 */  sll         $2, $16, 4
/* 00F604 01DBB304 23105000 */  subu        $2, $2, $16
/* 00F608 01DBB308 00190200 */  sll         $3, $2, 4
/* 00F60C 01DBB30C E201023C */  lui         $2, %hi(OP_NornMapObj2)
/* 00F610 01DBB310 F03D4224 */  addiu       $2, $2, %lo(OP_NornMapObj2)
/* 00F614 01DBB314 21204300 */  addu        $4, $2, $3
/* 00F618 01DBB318 A000998C */  lw          $25, 0xA0($4)
/* 00F61C 01DBB31C 9400398F */  lw          $25, 0x94($25)
/* 00F620 01DBB320 09F82003 */  jalr        $25
/* 00F624 01DBB324 00000000 */   nop
/* 00F628 01DBB328 01001026 */  addiu       $16, $16, 0x1
.L01DBB32C_2C0B2C:
/* 00F62C 01DBB32C 1700022A */  slti        $2, $16, 0x17
/* 00F630 01DBB330 F3FF4014 */  bnez        $2, .L01DBB300_2C0B00
/* 00F634 01DBB334 00000000 */   nop
/* 00F638 01DBB338 07000010 */  b           .L01DBB358_2C0B58
/* 00F63C 01DBB33C 00000000 */   nop
.L01DBB340_2C0B40:
/* 00F640 01DBB340 28EE760C */  jal         setTexAnime__Fv
/* 00F644 01DBB344 00000000 */   nop
/* 00F648 01DBB348 E301023C */  lui         $2, %hi(OP_ToanMapObj)
/* 00F64C 01DBB34C 40AA4424 */  addiu       $4, $2, %lo(OP_ToanMapObj)
/* 00F650 01DBB350 B05D050C */  jal         Draw__10CMapObjectFv
/* 00F654 01DBB354 00000000 */   nop
.L01DBB358_2C0B58:
/* 00F658 01DBB358 B898828F */  lw          $2, -0x6748($28)
/* 00F65C 01DBB35C 6D004018 */  blez        $2, .L01DBB514_2C0D14
/* 00F660 01DBB360 00000000 */   nop
/* 00F664 01DBB364 A0B8040C */  jal         GetVif1Packet__Fv
/* 00F668 01DBB368 00000000 */   nop
/* 00F66C 01DBB36C C701033C */  lui         $3, %hi(TexManager)
/* 00F670 01DBB370 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 00F674 01DBB374 282E4070 */  paddub      $5, $2, $0
/* 00F678 01DBB378 28360070 */  paddub      $6, $0, $0
/* 00F67C 01DBB37C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00F680 01DBB380 00000000 */   nop
/* 00F684 01DBB384 0498838F */  lw          $3, -0x67FC($28)
/* 00F688 01DBB388 B0110224 */  addiu       $2, $0, 0x11B0
/* 00F68C 01DBB38C 18186200 */  mult        $3, $3, $2
/* 00F690 01DBB390 E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 00F694 01DBB394 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 00F698 01DBB398 21104300 */  addu        $2, $2, $3
/* 00F69C 01DBB39C 0000428C */  lw          $2, 0x0($2)
/* 00F6A0 01DBB3A0 C49882AF */  sw          $2, -0x673C($28)
/* 00F6A4 01DBB3A4 C498828F */  lw          $2, -0x673C($28)
/* 00F6A8 01DBB3A8 4000A427 */  addiu       $4, $29, 0x40
/* 00F6AC 01DBB3AC 20024524 */  addiu       $5, $2, 0x220
/* 00F6B0 01DBB3B0 0C86040C */  jal         sceVu0CopyVector
/* 00F6B4 01DBB3B4 00000000 */   nop
/* 00F6B8 01DBB3B8 0898828F */  lw          $2, -0x67F8($28)
/* 00F6BC 01DBB3BC 05004014 */  bnez        $2, .L01DBB3D4_2C0BD4
/* 00F6C0 01DBB3C0 00000000 */   nop
/* 00F6C4 01DBB3C4 E301023C */  lui         $2, %hi(CFire__2)
/* 00F6C8 01DBB3C8 808F4424 */  addiu       $4, $2, %lo(CFire__2)
/* 00F6CC 01DBB3CC BC85050C */  jal         FireStep__9CFireOmniFv
/* 00F6D0 01DBB3D0 00000000 */   nop
.L01DBB3D4_2C0BD4:
/* 00F6D4 01DBB3D4 E301023C */  lui         $2, %hi(CFire__2)
/* 00F6D8 01DBB3D8 808F4424 */  addiu       $4, $2, %lo(CFire__2)
/* 00F6DC 01DBB3DC F085050C */  jal         FireCreate__9CFireOmniFv
/* 00F6E0 01DBB3E0 00000000 */   nop
/* 00F6E4 01DBB3E4 28860070 */  paddub      $16, $0, $0
/* 00F6E8 01DBB3E8 46000010 */  b           .L01DBB504_2C0D04
/* 00F6EC 01DBB3EC 00000000 */   nop
.L01DBB3F0_2C0BF0:
/* 00F6F0 01DBB3F0 00191000 */  sll         $3, $16, 4
/* 00F6F4 01DBB3F4 E201023C */  lui         $2, %hi(OP_FirePosition + 0x8)
/* 00F6F8 01DBB3F8 28D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x8)
/* 00F6FC 01DBB3FC 21104300 */  addu        $2, $2, $3
/* 00F700 01DBB400 000043C4 */  lwc1        $f3, 0x0($2)
/* 00F704 01DBB404 E201023C */  lui         $2, %hi(OP_FirePosition + 0x4)
/* 00F708 01DBB408 24D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x4)
/* 00F70C 01DBB40C 21104300 */  addu        $2, $2, $3
/* 00F710 01DBB410 000042C4 */  lwc1        $f2, 0x0($2)
/* 00F714 01DBB414 E201023C */  lui         $2, %hi(OP_FirePosition)
/* 00F718 01DBB418 20D74224 */  addiu       $2, $2, %lo(OP_FirePosition)
/* 00F71C 01DBB41C 21104300 */  addu        $2, $2, $3
/* 00F720 01DBB420 000040C4 */  lwc1        $f0, 0x0($2)
/* 00F724 01DBB424 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00F728 01DBB428 00088244 */  mtc1        $2, $f1
/* 00F72C 01DBB42C 00000000 */  nop
/* 00F730 01DBB430 02080046 */  mul.s       $f0, $f1, $f0
/* 00F734 01DBB434 E301013C */  lui         $1, %hi(CFire__2 + 0x20)
/* 00F738 01DBB438 A08F20E4 */  swc1        $f0, %lo(CFire__2 + 0x20)($1)
/* 00F73C 01DBB43C 02080246 */  mul.s       $f0, $f1, $f2
/* 00F740 01DBB440 E301013C */  lui         $1, %hi(CFire__2 + 0x24)
/* 00F744 01DBB444 A48F20E4 */  swc1        $f0, %lo(CFire__2 + 0x24)($1)
/* 00F748 01DBB448 02080346 */  mul.s       $f0, $f1, $f3
/* 00F74C 01DBB44C E301013C */  lui         $1, %hi(CFire__2 + 0x28)
/* 00F750 01DBB450 A88F20E4 */  swc1        $f0, %lo(CFire__2 + 0x28)($1)
/* 00F754 01DBB454 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00F758 01DBB458 E301013C */  lui         $1, %hi(CFire__2 + 0x2C)
/* 00F75C 01DBB45C AC8F22AC */  sw          $2, %lo(CFire__2 + 0x2C)($1)
/* 00F760 01DBB460 80181000 */  sll         $3, $16, 2
/* 00F764 01DBB464 E201023C */  lui         $2, %hi(OP_FireFlg)
/* 00F768 01DBB468 A0DE4224 */  addiu       $2, $2, %lo(OP_FireFlg)
/* 00F76C 01DBB46C 21104300 */  addu        $2, $2, $3
/* 00F770 01DBB470 0000428C */  lw          $2, 0x0($2)
/* 00F774 01DBB474 01000524 */  addiu       $5, $0, 0x1
/* 00F778 01DBB478 12004514 */  bne         $2, $5, .L01DBB4C4_2C0CC4
/* 00F77C 01DBB47C 00000000 */   nop
/* 00F780 01DBB480 E201023C */  lui         $2, %hi(OP_FireScale)
/* 00F784 01DBB484 20DD4224 */  addiu       $2, $2, %lo(OP_FireScale)
/* 00F788 01DBB488 21184300 */  addu        $3, $2, $3
/* 00F78C 01DBB48C 7041023C */  lui         $2, (0x41700000 >> 16)
/* 00F790 01DBB490 00688244 */  mtc1        $2, $f13
/* 00F794 01DBB494 E301023C */  lui         $2, %hi(CFire__2)
/* 00F798 01DBB498 808F4424 */  addiu       $4, $2, %lo(CFire__2)
/* 00F79C 01DBB49C 2836A070 */  paddub      $6, $5, $0
/* 00F7A0 01DBB4A0 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 00F7A4 01DBB4A4 E0954724 */  addiu       $7, $2, %lo(OP_MainCamera)
/* 00F7A8 01DBB4A8 4000A827 */  addiu       $8, $29, 0x40
/* 00F7AC 01DBB4AC 00006CC4 */  lwc1        $f12, 0x0($3)
/* 00F7B0 01DBB4B0 03000924 */  addiu       $9, $0, 0x3
/* 00F7B4 01DBB4B4 B086050C */  jal         DrawFire__9CFireOmniFiiP7CCameraPffif
/* 00F7B8 01DBB4B8 00000000 */   nop
/* 00F7BC 01DBB4BC 10000010 */  b           .L01DBB500_2C0D00
/* 00F7C0 01DBB4C0 00000000 */   nop
.L01DBB4C4_2C0CC4:
/* 00F7C4 01DBB4C4 E201023C */  lui         $2, %hi(OP_FireScale)
/* 00F7C8 01DBB4C8 20DD4224 */  addiu       $2, $2, %lo(OP_FireScale)
/* 00F7CC 01DBB4CC 21184300 */  addu        $3, $2, $3
/* 00F7D0 01DBB4D0 7041023C */  lui         $2, (0x41700000 >> 16)
/* 00F7D4 01DBB4D4 00688244 */  mtc1        $2, $f13
/* 00F7D8 01DBB4D8 E301023C */  lui         $2, %hi(CFire__2)
/* 00F7DC 01DBB4DC 808F4424 */  addiu       $4, $2, %lo(CFire__2)
/* 00F7E0 01DBB4E0 2836A070 */  paddub      $6, $5, $0
/* 00F7E4 01DBB4E4 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 00F7E8 01DBB4E8 E0954724 */  addiu       $7, $2, %lo(OP_MainCamera)
/* 00F7EC 01DBB4EC 4000A827 */  addiu       $8, $29, 0x40
/* 00F7F0 01DBB4F0 00006CC4 */  lwc1        $f12, 0x0($3)
/* 00F7F4 01DBB4F4 02000924 */  addiu       $9, $0, 0x2
/* 00F7F8 01DBB4F8 B086050C */  jal         DrawFire__9CFireOmniFiiP7CCameraPffif
/* 00F7FC 01DBB4FC 00000000 */   nop
.L01DBB500_2C0D00:
/* 00F800 01DBB500 01001026 */  addiu       $16, $16, 0x1
.L01DBB504_2C0D04:
/* 00F804 01DBB504 B898828F */  lw          $2, -0x6748($28)
/* 00F808 01DBB508 2A100202 */  slt         $2, $16, $2
/* 00F80C 01DBB50C B8FF4014 */  bnez        $2, .L01DBB3F0_2C0BF0
/* 00F810 01DBB510 00000000 */   nop
.L01DBB514_2C0D14:
/* 00F814 01DBB514 DE01013C */  lui         $1, %hi(CScript__2 + 0x14)
/* 00F818 01DBB518 141B238C */  lw          $3, %lo(CScript__2 + 0x14)($1)
/* 00F81C 01DBB51C 03000224 */  addiu       $2, $0, 0x3
/* 00F820 01DBB520 0A006214 */  bne         $3, $2, .L01DBB54C_2C0D4C
/* 00F824 01DBB524 00000000 */   nop
/* 00F828 01DBB528 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x54C)
/* 00F82C 01DBB52C 1C8D248C */  lw          $4, %lo(MainMonstorUnit + 0x54C)($1)
/* 00F830 01DBB530 DE01023C */  lui         $2, %hi(LIT_776__4)
/* 00F834 01DBB534 48EB4524 */  addiu       $5, $2, %lo(LIT_776__4)
/* 00F838 01DBB538 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00F83C 01DBB53C 00000000 */   nop
/* 00F840 01DBB540 02004010 */  beqz        $2, .L01DBB54C_2C0D4C
/* 00F844 01DBB544 00000000 */   nop
/* 00F848 01DBB548 B00040A4 */  sh          $0, 0xB0($2)
.L01DBB54C_2C0D4C:
/* 00F84C 01DBB54C C701023C */  lui         $2, %hi(TexManager)
/* 00F850 01DBB550 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00F854 01DBB554 D48B858F */  lw          $5, -0x742C($28)
/* 00F858 01DBB558 17000624 */  addiu       $6, $0, 0x17
/* 00F85C 01DBB55C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00F860 01DBB560 00000000 */   nop
/* 00F864 01DBB564 C701023C */  lui         $2, %hi(TexManager)
/* 00F868 01DBB568 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00F86C 01DBB56C DE01023C */  lui         $2, %hi(LIT_777__3)
/* 00F870 01DBB570 58EB4524 */  addiu       $5, $2, %lo(LIT_777__3)
/* 00F874 01DBB574 FFFF0624 */  addiu       $6, $0, -0x1
/* 00F878 01DBB578 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00F87C 01DBB57C 00000000 */   nop
/* 00F880 01DBB580 280044DC */  ld          $4, 0x28($2)
/* 00F884 01DBB584 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 00F888 01DBB588 00000000 */   nop
/* 00F88C 01DBB58C 08001024 */  addiu       $16, $0, 0x8
/* 00F890 01DBB590 1E000010 */  b           .L01DBB60C_2C0E0C
/* 00F894 01DBB594 00000000 */   nop
.L01DBB598_2C0D98:
/* 00F898 01DBB598 40101000 */  sll         $2, $16, 1
/* 00F89C 01DBB59C 21105000 */  addu        $2, $2, $16
/* 00F8A0 01DBB5A0 80100200 */  sll         $2, $2, 2
/* 00F8A4 01DBB5A4 21105000 */  addu        $2, $2, $16
/* 00F8A8 01DBB5A8 80180200 */  sll         $3, $2, 2
/* 00F8AC 01DBB5AC DE01023C */  lui         $2, %hi(CScript__2 + 0x30)
/* 00F8B0 01DBB5B0 301B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x30)
/* 00F8B4 01DBB5B4 21104300 */  addu        $2, $2, $3
/* 00F8B8 01DBB5B8 00004290 */  lbu         $2, 0x0($2)
/* 00F8BC 01DBB5BC 12004010 */  beqz        $2, .L01DBB608_2C0E08
/* 00F8C0 01DBB5C0 00000000 */   nop
/* 00F8C4 01DBB5C4 0898828F */  lw          $2, -0x67F8($28)
/* 00F8C8 01DBB5C8 08004014 */  bnez        $2, .L01DBB5EC_2C0DEC
/* 00F8CC 01DBB5CC 00000000 */   nop
/* 00F8D0 01DBB5D0 B0110224 */  addiu       $2, $0, 0x11B0
/* 00F8D4 01DBB5D4 18180202 */  mult        $3, $16, $2
/* 00F8D8 01DBB5D8 DF01023C */  lui         $2, %hi(Chara__3)
/* 00F8DC 01DBB5DC E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 00F8E0 01DBB5E0 21204300 */  addu        $4, $2, $3
/* 00F8E4 01DBB5E4 24E3040C */  jal         ShadowStep__10CCharacterFv
/* 00F8E8 01DBB5E8 00000000 */   nop
.L01DBB5EC_2C0DEC:
/* 00F8EC 01DBB5EC B0110224 */  addiu       $2, $0, 0x11B0
/* 00F8F0 01DBB5F0 18180202 */  mult        $3, $16, $2
/* 00F8F4 01DBB5F4 DF01023C */  lui         $2, %hi(Chara__3)
/* 00F8F8 01DBB5F8 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 00F8FC 01DBB5FC 21204300 */  addu        $4, $2, $3
/* 00F900 01DBB600 C0E5040C */  jal         DrawShadow__10CCharacterFv
/* 00F904 01DBB604 00000000 */   nop
.L01DBB608_2C0E08:
/* 00F908 01DBB608 01001026 */  addiu       $16, $16, 0x1
.L01DBB60C_2C0E0C:
/* 00F90C 01DBB60C 0C00022A */  slti        $2, $16, 0xC
/* 00F910 01DBB610 E1FF4014 */  bnez        $2, .L01DBB598_2C0D98
/* 00F914 01DBB614 00000000 */   nop
/* 00F918 01DBB618 34000424 */  addiu       $4, $0, 0x34
/* 00F91C 01DBB61C CCC2040C */  jal         MGEndDrawShadow__FUc
/* 00F920 01DBB620 00000000 */   nop
/* 00F924 01DBB624 08001024 */  addiu       $16, $0, 0x8
/* 00F928 01DBB628 32000010 */  b           .L01DBB6F4_2C0EF4
/* 00F92C 01DBB62C 00000000 */   nop
.L01DBB630_2C0E30:
/* 00F930 01DBB630 40181000 */  sll         $3, $16, 1
/* 00F934 01DBB634 21187000 */  addu        $3, $3, $16
/* 00F938 01DBB638 80180300 */  sll         $3, $3, 2
/* 00F93C 01DBB63C 21187000 */  addu        $3, $3, $16
/* 00F940 01DBB640 80200300 */  sll         $4, $3, 2
/* 00F944 01DBB644 DE01033C */  lui         $3, %hi(CScript__2 + 0x30)
/* 00F948 01DBB648 301B6324 */  addiu       $3, $3, %lo(CScript__2 + 0x30)
/* 00F94C 01DBB64C 21186400 */  addu        $3, $3, $4
/* 00F950 01DBB650 00006390 */  lbu         $3, 0x0($3)
/* 00F954 01DBB654 26006010 */  beqz        $3, .L01DBB6F0_2C0EF0
/* 00F958 01DBB658 00000000 */   nop
/* 00F95C 01DBB65C E101023C */  lui         $2, %hi(CharaTex__2)
/* 00F960 01DBB660 B0954224 */  addiu       $2, $2, %lo(CharaTex__2)
/* 00F964 01DBB664 21105000 */  addu        $2, $2, $16
/* 00F968 01DBB668 00004680 */  lb          $6, 0x0($2)
/* 00F96C 01DBB66C C701023C */  lui         $2, %hi(TexManager)
/* 00F970 01DBB670 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00F974 01DBB674 D48B858F */  lw          $5, -0x742C($28)
/* 00F978 01DBB678 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00F97C 01DBB67C 00000000 */   nop
/* 00F980 01DBB680 0898828F */  lw          $2, -0x67F8($28)
/* 00F984 01DBB684 0D004014 */  bnez        $2, .L01DBB6BC_2C0EBC
/* 00F988 01DBB688 00000000 */   nop
/* 00F98C 01DBB68C B0110224 */  addiu       $2, $0, 0x11B0
/* 00F990 01DBB690 18180202 */  mult        $3, $16, $2
/* 00F994 01DBB694 DF01023C */  lui         $2, %hi(Chara__3)
/* 00F998 01DBB698 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 00F99C 01DBB69C 21884300 */  addu        $17, $2, $3
/* 00F9A0 01DBB6A0 28262072 */  paddub      $4, $17, $0
/* 00F9A4 01DBB6A4 4CE1040C */  jal         Step__10CCharacterFv
/* 00F9A8 01DBB6A8 00000000 */   nop
/* 00F9AC 01DBB6AC 28262072 */  paddub      $4, $17, $0
/* 00F9B0 01DBB6B0 282E0070 */  paddub      $5, $0, $0
/* 00F9B4 01DBB6B4 94E3040C */  jal         ClothStep__10CCharacterFi
/* 00F9B8 01DBB6B8 00000000 */   nop
.L01DBB6BC_2C0EBC:
/* 00F9BC 01DBB6BC 09000224 */  addiu       $2, $0, 0x9
/* 00F9C0 01DBB6C0 04000216 */  bne         $16, $2, .L01DBB6D4_2C0ED4
/* 00F9C4 01DBB6C4 00000000 */   nop
/* 00F9C8 01DBB6C8 28260072 */  paddub      $4, $16, $0
/* 00F9CC 01DBB6CC A4EE760C */  jal         FaceChange__Fi__2
/* 00F9D0 01DBB6D0 00000000 */   nop
.L01DBB6D4_2C0ED4:
/* 00F9D4 01DBB6D4 B0110224 */  addiu       $2, $0, 0x11B0
/* 00F9D8 01DBB6D8 18180202 */  mult        $3, $16, $2
/* 00F9DC 01DBB6DC DF01023C */  lui         $2, %hi(Chara__3)
/* 00F9E0 01DBB6E0 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 00F9E4 01DBB6E4 21204300 */  addu        $4, $2, $3
/* 00F9E8 01DBB6E8 C4E4040C */  jal         Draw__10CCharacterFv
/* 00F9EC 01DBB6EC 00000000 */   nop
.L01DBB6F0_2C0EF0:
/* 00F9F0 01DBB6F0 01001026 */  addiu       $16, $16, 0x1
.L01DBB6F4_2C0EF4:
/* 00F9F4 01DBB6F4 0C00032A */  slti        $3, $16, 0xC
/* 00F9F8 01DBB6F8 CDFF6014 */  bnez        $3, .L01DBB630_2C0E30
/* 00F9FC 01DBB6FC 00000000 */   nop
/* 00FA00 01DBB700 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 00FA04 01DBB704 181B248C */  lw          $4, %lo(CScript__2 + 0x18)($1)
/* 00FA08 01DBB708 02000324 */  addiu       $3, $0, 0x2
/* 00FA0C 01DBB70C 12008314 */  bne         $4, $3, .L01DBB758_2C0F58
/* 00FA10 01DBB710 00000000 */   nop
/* 00FA14 01DBB714 C701023C */  lui         $2, %hi(TexManager)
/* 00FA18 01DBB718 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00FA1C 01DBB71C D48B858F */  lw          $5, -0x742C($28)
/* 00FA20 01DBB720 16000624 */  addiu       $6, $0, 0x16
/* 00FA24 01DBB724 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00FA28 01DBB728 00000000 */   nop
/* 00FA2C 01DBB72C 0898828F */  lw          $2, -0x67F8($28)
/* 00FA30 01DBB730 05004014 */  bnez        $2, .L01DBB748_2C0F48
/* 00FA34 01DBB734 00000000 */   nop
/* 00FA38 01DBB738 E301023C */  lui         $2, %hi(Komono)
/* 00FA3C 01DBB73C C08F4424 */  addiu       $4, $2, %lo(Komono)
/* 00FA40 01DBB740 4CE1040C */  jal         Step__10CCharacterFv
/* 00FA44 01DBB744 00000000 */   nop
.L01DBB748_2C0F48:
/* 00FA48 01DBB748 E301023C */  lui         $2, %hi(Komono)
/* 00FA4C 01DBB74C C08F4424 */  addiu       $4, $2, %lo(Komono)
/* 00FA50 01DBB750 C4E4040C */  jal         Draw__10CCharacterFv
/* 00FA54 01DBB754 00000000 */   nop
.L01DBB758_2C0F58:
/* 00FA58 01DBB758 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 00FA5C 01DBB75C 181B248C */  lw          $4, %lo(CScript__2 + 0x18)($1)
/* 00FA60 01DBB760 01000324 */  addiu       $3, $0, 0x1
/* 00FA64 01DBB764 35008314 */  bne         $4, $3, .L01DBB83C_2C103C
/* 00FA68 01DBB768 00000000 */   nop
/* 00FA6C 01DBB76C C701023C */  lui         $2, %hi(TexManager)
/* 00FA70 01DBB770 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00FA74 01DBB774 D48B858F */  lw          $5, -0x742C($28)
/* 00FA78 01DBB778 17000624 */  addiu       $6, $0, 0x17
/* 00FA7C 01DBB77C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00FA80 01DBB780 00000000 */   nop
/* 00FA84 01DBB784 C701023C */  lui         $2, %hi(TexManager)
/* 00FA88 01DBB788 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00FA8C 01DBB78C DE01023C */  lui         $2, %hi(LIT_777__3)
/* 00FA90 01DBB790 58EB4524 */  addiu       $5, $2, %lo(LIT_777__3)
/* 00FA94 01DBB794 FFFF0624 */  addiu       $6, $0, -0x1
/* 00FA98 01DBB798 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00FA9C 01DBB79C 00000000 */   nop
/* 00FAA0 01DBB7A0 280044DC */  ld          $4, 0x28($2)
/* 00FAA4 01DBB7A4 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 00FAA8 01DBB7A8 00000000 */   nop
/* 00FAAC 01DBB7AC DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 00FAB0 01DBB7B0 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 00FAB4 01DBB7B4 02000224 */  addiu       $2, $0, 0x2
/* 00FAB8 01DBB7B8 18006210 */  beq         $3, $2, .L01DBB81C_2C101C
/* 00FABC 01DBB7BC 00000000 */   nop
/* 00FAC0 01DBB7C0 01000224 */  addiu       $2, $0, 0x1
/* 00FAC4 01DBB7C4 03006210 */  beq         $3, $2, .L01DBB7D4_2C0FD4
/* 00FAC8 01DBB7C8 00000000 */   nop
/* 00FACC 01DBB7CC 18000010 */  b           .L01DBB830_2C1030
/* 00FAD0 01DBB7D0 00000000 */   nop
.L01DBB7D4_2C0FD4:
/* 00FAD4 01DBB7D4 28860070 */  paddub      $16, $0, $0
/* 00FAD8 01DBB7D8 0B000010 */  b           .L01DBB808_2C1008
/* 00FADC 01DBB7DC 00000000 */   nop
.L01DBB7E0_2C0FE0:
/* 00FAE0 01DBB7E0 00111000 */  sll         $2, $16, 4
/* 00FAE4 01DBB7E4 23105000 */  subu        $2, $2, $16
/* 00FAE8 01DBB7E8 00190200 */  sll         $3, $2, 4
/* 00FAEC 01DBB7EC E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 00FAF0 01DBB7F0 B0F64224 */  addiu       $2, $2, %lo(OP_NornMapObj)
/* 00FAF4 01DBB7F4 21204300 */  addu        $4, $2, $3
/* 00FAF8 01DBB7F8 282E0070 */  paddub      $5, $0, $0
/* 00FAFC 01DBB7FC D85D050C */  jal         DrawShadow__10CMapObjectFi
/* 00FB00 01DBB800 00000000 */   nop
/* 00FB04 01DBB804 01001026 */  addiu       $16, $16, 0x1
.L01DBB808_2C1008:
/* 00FB08 01DBB808 4400022A */  slti        $2, $16, 0x44
/* 00FB0C 01DBB80C F4FF4014 */  bnez        $2, .L01DBB7E0_2C0FE0
/* 00FB10 01DBB810 00000000 */   nop
/* 00FB14 01DBB814 06000010 */  b           .L01DBB830_2C1030
/* 00FB18 01DBB818 00000000 */   nop
.L01DBB81C_2C101C:
/* 00FB1C 01DBB81C E301023C */  lui         $2, %hi(OP_ToanMapObj)
/* 00FB20 01DBB820 40AA4424 */  addiu       $4, $2, %lo(OP_ToanMapObj)
/* 00FB24 01DBB824 282E0070 */  paddub      $5, $0, $0
/* 00FB28 01DBB828 D85D050C */  jal         DrawShadow__10CMapObjectFi
/* 00FB2C 01DBB82C 00000000 */   nop
.L01DBB830_2C1030:
/* 00FB30 01DBB830 34000424 */  addiu       $4, $0, 0x34
/* 00FB34 01DBB834 CCC2040C */  jal         MGEndDrawShadow__FUc
/* 00FB38 01DBB838 00000000 */   nop
.L01DBB83C_2C103C:
/* 00FB3C 01DBB83C DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 00FB40 01DBB840 181B248C */  lw          $4, %lo(CScript__2 + 0x18)($1)
/* 00FB44 01DBB844 02000324 */  addiu       $3, $0, 0x2
/* 00FB48 01DBB848 0F008310 */  beq         $4, $3, .L01DBB888_2C1088
/* 00FB4C 01DBB84C 00000000 */   nop
/* 00FB50 01DBB850 C701023C */  lui         $2, %hi(TexManager)
/* 00FB54 01DBB854 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00FB58 01DBB858 D48B858F */  lw          $5, -0x742C($28)
/* 00FB5C 01DBB85C 15000624 */  addiu       $6, $0, 0x15
/* 00FB60 01DBB860 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00FB64 01DBB864 00000000 */   nop
/* 00FB68 01DBB868 5800A427 */  addiu       $4, $29, 0x58
/* 00FB6C 01DBB86C 688A82DF */  ld          $2, -0x7598($28)
/* 00FB70 01DBB870 000082FC */  sd          $2, 0x0($4)
/* 00FB74 01DBB874 02000524 */  addiu       $5, $0, 0x2
/* 00FB78 01DBB878 40000624 */  addiu       $6, $0, 0x40
/* 00FB7C 01DBB87C 283E0070 */  paddub      $7, $0, $0
/* 00FB80 01DBB880 B094050C */  jal         DepthOfField__FPfiii
/* 00FB84 01DBB884 00000000 */   nop
.L01DBB888_2C1088:
/* 00FB88 01DBB888 3000BF7B */  lq          $31, 0x30($29)
/* 00FB8C 01DBB88C 2000B17B */  lq          $17, 0x20($29)
/* 00FB90 01DBB890 1000B07B */  lq          $16, 0x10($29)
/* 00FB94 01DBB894 6000BD27 */  addiu       $29, $29, 0x60
/* 00FB98 01DBB898 0800E003 */  jr          $31
/* 00FB9C 01DBB89C 00000000 */   nop
