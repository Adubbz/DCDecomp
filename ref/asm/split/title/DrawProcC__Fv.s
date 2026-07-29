.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawProcC__Fv
/* 021DE0 01DCDAE0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 021DE4 01DCDAE4 3000BF7F */  sq          $31, 0x30($29)
/* 021DE8 01DCDAE8 2000B17F */  sq          $17, 0x20($29)
/* 021DEC 01DCDAEC 1000B07F */  sq          $16, 0x10($29)
/* 021DF0 01DCDAF0 C701023C */  lui         $2, %hi(TexManager)
/* 021DF4 01DCDAF4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 021DF8 01DCDAF8 D48B858F */  lw          $5, -0x742C($28)
/* 021DFC 01DCDAFC 0A000624 */  addiu       $6, $0, 0xA
/* 021E00 01DCDB00 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 021E04 01DCDB04 00000000 */   nop
/* 021E08 01DCDB08 28860070 */  paddub      $16, $0, $0
/* 021E0C 01DCDB0C 0C000010 */  b           .L01DCDB40_2D3340
/* 021E10 01DCDB10 00000000 */   nop
.L01DCDB14_2D3314:
/* 021E14 01DCDB14 00111000 */  sll         $2, $16, 4
/* 021E18 01DCDB18 23105000 */  subu        $2, $2, $16
/* 021E1C 01DCDB1C 00190200 */  sll         $3, $2, 4
/* 021E20 01DCDB20 E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 021E24 01DCDB24 B0F64224 */  addiu       $2, $2, %lo(OP_NornMapObj)
/* 021E28 01DCDB28 21204300 */  addu        $4, $2, $3
/* 021E2C 01DCDB2C A000998C */  lw          $25, 0xA0($4)
/* 021E30 01DCDB30 9400398F */  lw          $25, 0x94($25)
/* 021E34 01DCDB34 09F82003 */  jalr        $25
/* 021E38 01DCDB38 00000000 */   nop
/* 021E3C 01DCDB3C 01001026 */  addiu       $16, $16, 0x1
.L01DCDB40_2D3340:
/* 021E40 01DCDB40 1A00022A */  slti        $2, $16, 0x1A
/* 021E44 01DCDB44 F3FF4014 */  bnez        $2, .L01DCDB14_2D3314
/* 021E48 01DCDB48 00000000 */   nop
/* 021E4C 01DCDB4C 082C770C */  jal         WaterProcess__Fv__2
/* 021E50 01DCDB50 00000000 */   nop
/* 021E54 01DCDB54 C701023C */  lui         $2, %hi(TexManager)
/* 021E58 01DCDB58 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 021E5C 01DCDB5C D48B858F */  lw          $5, -0x742C($28)
/* 021E60 01DCDB60 17000624 */  addiu       $6, $0, 0x17
/* 021E64 01DCDB64 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 021E68 01DCDB68 00000000 */   nop
/* 021E6C 01DCDB6C C701023C */  lui         $2, %hi(TexManager)
/* 021E70 01DCDB70 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 021E74 01DCDB74 DE01023C */  lui         $2, %hi(LIT_1137)
/* 021E78 01DCDB78 88044524 */  addiu       $5, $2, %lo(LIT_1137)
/* 021E7C 01DCDB7C FFFF0624 */  addiu       $6, $0, -0x1
/* 021E80 01DCDB80 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 021E84 01DCDB84 00000000 */   nop
/* 021E88 01DCDB88 280044DC */  ld          $4, 0x28($2)
/* 021E8C 01DCDB8C 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 021E90 01DCDB90 00000000 */   nop
/* 021E94 01DCDB94 28860070 */  paddub      $16, $0, $0
/* 021E98 01DCDB98 18000010 */  b           .L01DCDBFC_2D33FC
/* 021E9C 01DCDB9C 00000000 */   nop
.L01DCDBA0_2D33A0:
/* 021EA0 01DCDBA0 40101000 */  sll         $2, $16, 1
/* 021EA4 01DCDBA4 21105000 */  addu        $2, $2, $16
/* 021EA8 01DCDBA8 80100200 */  sll         $2, $2, 2
/* 021EAC 01DCDBAC 21105000 */  addu        $2, $2, $16
/* 021EB0 01DCDBB0 80180200 */  sll         $3, $2, 2
/* 021EB4 01DCDBB4 E301023C */  lui         $2, %hi(CScript + 0x30)
/* 021EB8 01DCDBB8 F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 021EBC 01DCDBBC 21104300 */  addu        $2, $2, $3
/* 021EC0 01DCDBC0 00004290 */  lbu         $2, 0x0($2)
/* 021EC4 01DCDBC4 0C004010 */  beqz        $2, .L01DCDBF8_2D33F8
/* 021EC8 01DCDBC8 00000000 */   nop
/* 021ECC 01DCDBCC B0110224 */  addiu       $2, $0, 0x11B0
/* 021ED0 01DCDBD0 18180202 */  mult        $3, $16, $2
/* 021ED4 01DCDBD4 DF01023C */  lui         $2, %hi(Chara__3)
/* 021ED8 01DCDBD8 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 021EDC 01DCDBDC 21884300 */  addu        $17, $2, $3
/* 021EE0 01DCDBE0 28262072 */  paddub      $4, $17, $0
/* 021EE4 01DCDBE4 24E3040C */  jal         ShadowStep__10CCharacterFv
/* 021EE8 01DCDBE8 00000000 */   nop
/* 021EEC 01DCDBEC 28262072 */  paddub      $4, $17, $0
/* 021EF0 01DCDBF0 C0E5040C */  jal         DrawShadow__10CCharacterFv
/* 021EF4 01DCDBF4 00000000 */   nop
.L01DCDBF8_2D33F8:
/* 021EF8 01DCDBF8 01001026 */  addiu       $16, $16, 0x1
.L01DCDBFC_2D33FC:
/* 021EFC 01DCDBFC 0900022A */  slti        $2, $16, 0x9
/* 021F00 01DCDC00 E7FF4014 */  bnez        $2, .L01DCDBA0_2D33A0
/* 021F04 01DCDC04 00000000 */   nop
/* 021F08 01DCDC08 34000424 */  addiu       $4, $0, 0x34
/* 021F0C 01DCDC0C CCC2040C */  jal         MGEndDrawShadow__FUc
/* 021F10 01DCDC10 00000000 */   nop
/* 021F14 01DCDC14 28860070 */  paddub      $16, $0, $0
/* 021F18 01DCDC18 25000010 */  b           .L01DCDCB0_2D34B0
/* 021F1C 01DCDC1C 00000000 */   nop
.L01DCDC20_2D3420:
/* 021F20 01DCDC20 40101000 */  sll         $2, $16, 1
/* 021F24 01DCDC24 21105000 */  addu        $2, $2, $16
/* 021F28 01DCDC28 80100200 */  sll         $2, $2, 2
/* 021F2C 01DCDC2C 21105000 */  addu        $2, $2, $16
/* 021F30 01DCDC30 80180200 */  sll         $3, $2, 2
/* 021F34 01DCDC34 E301023C */  lui         $2, %hi(CScript + 0x30)
/* 021F38 01DCDC38 F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 021F3C 01DCDC3C 21104300 */  addu        $2, $2, $3
/* 021F40 01DCDC40 00004290 */  lbu         $2, 0x0($2)
/* 021F44 01DCDC44 19004010 */  beqz        $2, .L01DCDCAC_2D34AC
/* 021F48 01DCDC48 00000000 */   nop
/* 021F4C 01DCDC4C E401023C */  lui         $2, %hi(CharaTex)
/* 021F50 01DCDC50 10D04224 */  addiu       $2, $2, %lo(CharaTex)
/* 021F54 01DCDC54 21105000 */  addu        $2, $2, $16
/* 021F58 01DCDC58 00004680 */  lb          $6, 0x0($2)
/* 021F5C 01DCDC5C C701023C */  lui         $2, %hi(TexManager)
/* 021F60 01DCDC60 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 021F64 01DCDC64 D48B858F */  lw          $5, -0x742C($28)
/* 021F68 01DCDC68 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 021F6C 01DCDC6C 00000000 */   nop
/* 021F70 01DCDC70 B0110224 */  addiu       $2, $0, 0x11B0
/* 021F74 01DCDC74 18180202 */  mult        $3, $16, $2
/* 021F78 01DCDC78 DF01023C */  lui         $2, %hi(Chara__3)
/* 021F7C 01DCDC7C E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 021F80 01DCDC80 21884300 */  addu        $17, $2, $3
/* 021F84 01DCDC84 28262072 */  paddub      $4, $17, $0
/* 021F88 01DCDC88 4CE1040C */  jal         Step__10CCharacterFv
/* 021F8C 01DCDC8C 00000000 */   nop
/* 021F90 01DCDC90 28262072 */  paddub      $4, $17, $0
/* 021F94 01DCDC94 282E0070 */  paddub      $5, $0, $0
/* 021F98 01DCDC98 94E3040C */  jal         ClothStep__10CCharacterFi
/* 021F9C 01DCDC9C 00000000 */   nop
/* 021FA0 01DCDCA0 28262072 */  paddub      $4, $17, $0
/* 021FA4 01DCDCA4 C4E4040C */  jal         Draw__10CCharacterFv
/* 021FA8 01DCDCA8 00000000 */   nop
.L01DCDCAC_2D34AC:
/* 021FAC 01DCDCAC 01001026 */  addiu       $16, $16, 0x1
.L01DCDCB0_2D34B0:
/* 021FB0 01DCDCB0 0900022A */  slti        $2, $16, 0x9
/* 021FB4 01DCDCB4 DAFF4014 */  bnez        $2, .L01DCDC20_2D3420
/* 021FB8 01DCDCB8 00000000 */   nop
/* 021FBC 01DCDCBC A0B8040C */  jal         GetVif1Packet__Fv
/* 021FC0 01DCDCC0 00000000 */   nop
/* 021FC4 01DCDCC4 C701033C */  lui         $3, %hi(TexManager)
/* 021FC8 01DCDCC8 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 021FCC 01DCDCCC 282E4070 */  paddub      $5, $2, $0
/* 021FD0 01DCDCD0 28360070 */  paddub      $6, $0, $0
/* 021FD4 01DCDCD4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 021FD8 01DCDCD8 00000000 */   nop
/* 021FDC 01DCDCDC C09B838F */  lw          $3, -0x6440($28)
/* 021FE0 01DCDCE0 B0110224 */  addiu       $2, $0, 0x11B0
/* 021FE4 01DCDCE4 18186200 */  mult        $3, $3, $2
/* 021FE8 01DCDCE8 E501023C */  lui         $2, %hi(Cam + 0xBC)
/* 021FEC 01DCDCEC ACC44224 */  addiu       $2, $2, %lo(Cam + 0xBC)
/* 021FF0 01DCDCF0 21104300 */  addu        $2, $2, $3
/* 021FF4 01DCDCF4 0000428C */  lw          $2, 0x0($2)
/* 021FF8 01DCDCF8 B09B82AF */  sw          $2, -0x6450($28)
/* 021FFC 01DCDCFC B09B828F */  lw          $2, -0x6450($28)
/* 022000 01DCDD00 4000A427 */  addiu       $4, $29, 0x40
/* 022004 01DCDD04 20024524 */  addiu       $5, $2, 0x220
/* 022008 01DCDD08 0C86040C */  jal         sceVu0CopyVector
/* 02200C 01DCDD0C 00000000 */   nop
/* 022010 01DCDD10 E301023C */  lui         $2, %hi(CFire__4)
/* 022014 01DCDD14 80E94424 */  addiu       $4, $2, %lo(CFire__4)
/* 022018 01DCDD18 BC85050C */  jal         FireStep__9CFireOmniFv
/* 02201C 01DCDD1C 00000000 */   nop
/* 022020 01DCDD20 E301023C */  lui         $2, %hi(CFire__4)
/* 022024 01DCDD24 80E94424 */  addiu       $4, $2, %lo(CFire__4)
/* 022028 01DCDD28 F085050C */  jal         FireCreate__9CFireOmniFv
/* 02202C 01DCDD2C 00000000 */   nop
/* 022030 01DCDD30 28860070 */  paddub      $16, $0, $0
/* 022034 01DCDD34 31000010 */  b           .L01DCDDFC_2D35FC
/* 022038 01DCDD38 00000000 */   nop
.L01DCDD3C_2D353C:
/* 02203C 01DCDD3C 00211000 */  sll         $4, $16, 4
/* 022040 01DCDD40 E201023C */  lui         $2, %hi(OP_FirePosition + 0x8)
/* 022044 01DCDD44 28D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x8)
/* 022048 01DCDD48 21184400 */  addu        $3, $2, $4
/* 02204C 01DCDD4C 2041023C */  lui         $2, (0x41200000 >> 16)
/* 022050 01DCDD50 00088244 */  mtc1        $2, $f1
/* 022054 01DCDD54 000060C4 */  lwc1        $f0, 0x0($3)
/* 022058 01DCDD58 C3000146 */  div.s       $f3, $f0, $f1
/* 02205C 01DCDD5C E201023C */  lui         $2, %hi(OP_FirePosition + 0x4)
/* 022060 01DCDD60 24D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x4)
/* 022064 01DCDD64 21104400 */  addu        $2, $2, $4
/* 022068 01DCDD68 000040C4 */  lwc1        $f0, 0x0($2)
/* 02206C 01DCDD6C 83000146 */  div.s       $f2, $f0, $f1
/* 022070 01DCDD70 E201023C */  lui         $2, %hi(OP_FirePosition)
/* 022074 01DCDD74 20D74224 */  addiu       $2, $2, %lo(OP_FirePosition)
/* 022078 01DCDD78 21104400 */  addu        $2, $2, $4
/* 02207C 01DCDD7C 000040C4 */  lwc1        $f0, 0x0($2)
/* 022080 01DCDD80 03000146 */  div.s       $f0, $f0, $f1
/* 022084 01DCDD84 02080046 */  mul.s       $f0, $f1, $f0
/* 022088 01DCDD88 E301013C */  lui         $1, %hi(CFire__4 + 0x20)
/* 02208C 01DCDD8C A0E920E4 */  swc1        $f0, %lo(CFire__4 + 0x20)($1)
/* 022090 01DCDD90 02080246 */  mul.s       $f0, $f1, $f2
/* 022094 01DCDD94 E301013C */  lui         $1, %hi(CFire__4 + 0x24)
/* 022098 01DCDD98 A4E920E4 */  swc1        $f0, %lo(CFire__4 + 0x24)($1)
/* 02209C 01DCDD9C 02080346 */  mul.s       $f0, $f1, $f3
/* 0220A0 01DCDDA0 E301013C */  lui         $1, %hi(CFire__4 + 0x28)
/* 0220A4 01DCDDA4 A8E920E4 */  swc1        $f0, %lo(CFire__4 + 0x28)($1)
/* 0220A8 01DCDDA8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0220AC 01DCDDAC E301013C */  lui         $1, %hi(CFire__4 + 0x2C)
/* 0220B0 01DCDDB0 ACE922AC */  sw          $2, %lo(CFire__4 + 0x2C)($1)
/* 0220B4 01DCDDB4 80181000 */  sll         $3, $16, 2
/* 0220B8 01DCDDB8 E201023C */  lui         $2, %hi(OP_FireScale)
/* 0220BC 01DCDDBC 20DD4224 */  addiu       $2, $2, %lo(OP_FireScale)
/* 0220C0 01DCDDC0 21184300 */  addu        $3, $2, $3
/* 0220C4 01DCDDC4 7041023C */  lui         $2, (0x41700000 >> 16)
/* 0220C8 01DCDDC8 00688244 */  mtc1        $2, $f13
/* 0220CC 01DCDDCC E301023C */  lui         $2, %hi(CFire__4)
/* 0220D0 01DCDDD0 80E94424 */  addiu       $4, $2, %lo(CFire__4)
/* 0220D4 01DCDDD4 01000524 */  addiu       $5, $0, 0x1
/* 0220D8 01DCDDD8 2836A070 */  paddub      $6, $5, $0
/* 0220DC 01DCDDDC E301023C */  lui         $2, %hi(MainCamera__3)
/* 0220E0 01DCDDE0 80E64724 */  addiu       $7, $2, %lo(MainCamera__3)
/* 0220E4 01DCDDE4 4000A827 */  addiu       $8, $29, 0x40
/* 0220E8 01DCDDE8 00006CC4 */  lwc1        $f12, 0x0($3)
/* 0220EC 01DCDDEC 02000924 */  addiu       $9, $0, 0x2
/* 0220F0 01DCDDF0 B086050C */  jal         DrawFire__9CFireOmniFiiP7CCameraPffif
/* 0220F4 01DCDDF4 00000000 */   nop
/* 0220F8 01DCDDF8 01001026 */  addiu       $16, $16, 0x1
.L01DCDDFC_2D35FC:
/* 0220FC 01DCDDFC B898828F */  lw          $2, -0x6748($28)
/* 022100 01DCDE00 2A100202 */  slt         $2, $16, $2
/* 022104 01DCDE04 CDFF4014 */  bnez        $2, .L01DCDD3C_2D353C
/* 022108 01DCDE08 00000000 */   nop
/* 02210C 01DCDE0C C701023C */  lui         $2, %hi(TexManager)
/* 022110 01DCDE10 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 022114 01DCDE14 D48B858F */  lw          $5, -0x742C($28)
/* 022118 01DCDE18 16000624 */  addiu       $6, $0, 0x16
/* 02211C 01DCDE1C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 022120 01DCDE20 00000000 */   nop
/* 022124 01DCDE24 5800A427 */  addiu       $4, $29, 0x58
/* 022128 01DCDE28 988A82DF */  ld          $2, -0x7568($28)
/* 02212C 01DCDE2C 000082FC */  sd          $2, 0x0($4)
/* 022130 01DCDE30 02000524 */  addiu       $5, $0, 0x2
/* 022134 01DCDE34 20000624 */  addiu       $6, $0, 0x20
/* 022138 01DCDE38 283E0070 */  paddub      $7, $0, $0
/* 02213C 01DCDE3C B094050C */  jal         DepthOfField__FPfiii
/* 022140 01DCDE40 00000000 */   nop
/* 022144 01DCDE44 3000BF7B */  lq          $31, 0x30($29)
/* 022148 01DCDE48 2000B17B */  lq          $17, 0x20($29)
/* 02214C 01DCDE4C 1000B07B */  lq          $16, 0x10($29)
/* 022150 01DCDE50 6000BD27 */  addiu       $29, $29, 0x60
/* 022154 01DCDE54 0800E003 */  jr          $31
/* 022158 01DCDE58 00000000 */   nop
/* 02215C 01DCDE5C 00000000 */  nop
