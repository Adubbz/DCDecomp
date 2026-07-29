.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawProcF__Fv
/* 0237A0 01DCF4A0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 0237A4 01DCF4A4 4000BF7F */  sq          $31, 0x40($29)
/* 0237A8 01DCF4A8 3000B27F */  sq          $18, 0x30($29)
/* 0237AC 01DCF4AC 2000B17F */  sq          $17, 0x20($29)
/* 0237B0 01DCF4B0 1000B07F */  sq          $16, 0x10($29)
/* 0237B4 01DCF4B4 C701023C */  lui         $2, %hi(TexManager)
/* 0237B8 01DCF4B8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0237BC 01DCF4BC D48B858F */  lw          $5, -0x742C($28)
/* 0237C0 01DCF4C0 0A000624 */  addiu       $6, $0, 0xA
/* 0237C4 01DCF4C4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0237C8 01DCF4C8 00000000 */   nop
/* 0237CC 01DCF4CC E201023C */  lui         $2, %hi(OP_GroundMap)
/* 0237D0 01DCF4D0 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 0237D4 01DCF4D4 700E050C */  jal         Draw__4CMapFv
/* 0237D8 01DCF4D8 00000000 */   nop
/* 0237DC 01DCF4DC E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 0237E0 01DCF4E0 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 0237E4 01DCF4E4 700E050C */  jal         Draw__4CMapFv
/* 0237E8 01DCF4E8 00000000 */   nop
/* 0237EC 01DCF4EC E301013C */  lui         $1, %hi(CScript + 0x134)
/* 0237F0 01DCF4F0 F4EA2290 */  lbu         $2, %lo(CScript + 0x134)($1)
/* 0237F4 01DCF4F4 10004010 */  beqz        $2, .L01DCF538_2D4D38
/* 0237F8 01DCF4F8 00000000 */   nop
/* 0237FC 01DCF4FC E401013C */  lui         $1, %hi(CharaTex + 0x5)
/* 023800 01DCF500 15D02680 */  lb          $6, %lo(CharaTex + 0x5)($1)
/* 023804 01DCF504 C701023C */  lui         $2, %hi(TexManager)
/* 023808 01DCF508 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 02380C 01DCF50C D48B858F */  lw          $5, -0x742C($28)
/* 023810 01DCF510 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 023814 01DCF514 00000000 */   nop
/* 023818 01DCF518 DF01023C */  lui         $2, %hi(DngEventMan + 0x20A0)
/* 02381C 01DCF51C 50574424 */  addiu       $4, $2, %lo(DngEventMan + 0x20A0)
/* 023820 01DCF520 4CE1040C */  jal         Step__10CCharacterFv
/* 023824 01DCF524 00000000 */   nop
/* 023828 01DCF528 DF01023C */  lui         $2, %hi(DngEventMan + 0x20A0)
/* 02382C 01DCF52C 50574424 */  addiu       $4, $2, %lo(DngEventMan + 0x20A0)
/* 023830 01DCF530 C4E4040C */  jal         Draw__10CCharacterFv
/* 023834 01DCF534 00000000 */   nop
.L01DCF538_2D4D38:
/* 023838 01DCF538 C701023C */  lui         $2, %hi(TexManager)
/* 02383C 01DCF53C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 023840 01DCF540 D48B858F */  lw          $5, -0x742C($28)
/* 023844 01DCF544 17000624 */  addiu       $6, $0, 0x17
/* 023848 01DCF548 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 02384C 01DCF54C 00000000 */   nop
/* 023850 01DCF550 C701023C */  lui         $2, %hi(TexManager)
/* 023854 01DCF554 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 023858 01DCF558 DE01023C */  lui         $2, %hi(LIT_1137)
/* 02385C 01DCF55C 88044524 */  addiu       $5, $2, %lo(LIT_1137)
/* 023860 01DCF560 FFFF0624 */  addiu       $6, $0, -0x1
/* 023864 01DCF564 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 023868 01DCF568 00000000 */   nop
/* 02386C 01DCF56C 280044DC */  ld          $4, 0x28($2)
/* 023870 01DCF570 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 023874 01DCF574 00000000 */   nop
/* 023878 01DCF578 28860070 */  paddub      $16, $0, $0
/* 02387C 01DCF57C 1B000010 */  b           .L01DCF5EC_2D4DEC
/* 023880 01DCF580 00000000 */   nop
.L01DCF584_2D4D84:
/* 023884 01DCF584 05000224 */  addiu       $2, $0, 0x5
/* 023888 01DCF588 17000212 */  beq         $16, $2, .L01DCF5E8_2D4DE8
/* 02388C 01DCF58C 00000000 */   nop
/* 023890 01DCF590 40101000 */  sll         $2, $16, 1
/* 023894 01DCF594 21105000 */  addu        $2, $2, $16
/* 023898 01DCF598 80100200 */  sll         $2, $2, 2
/* 02389C 01DCF59C 21105000 */  addu        $2, $2, $16
/* 0238A0 01DCF5A0 80180200 */  sll         $3, $2, 2
/* 0238A4 01DCF5A4 E301023C */  lui         $2, %hi(CScript + 0x30)
/* 0238A8 01DCF5A8 F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 0238AC 01DCF5AC 21104300 */  addu        $2, $2, $3
/* 0238B0 01DCF5B0 00004290 */  lbu         $2, 0x0($2)
/* 0238B4 01DCF5B4 0C004010 */  beqz        $2, .L01DCF5E8_2D4DE8
/* 0238B8 01DCF5B8 00000000 */   nop
/* 0238BC 01DCF5BC B0110224 */  addiu       $2, $0, 0x11B0
/* 0238C0 01DCF5C0 18180202 */  mult        $3, $16, $2
/* 0238C4 01DCF5C4 DF01023C */  lui         $2, %hi(Chara__3)
/* 0238C8 01DCF5C8 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 0238CC 01DCF5CC 21884300 */  addu        $17, $2, $3
/* 0238D0 01DCF5D0 28262072 */  paddub      $4, $17, $0
/* 0238D4 01DCF5D4 24E3040C */  jal         ShadowStep__10CCharacterFv
/* 0238D8 01DCF5D8 00000000 */   nop
/* 0238DC 01DCF5DC 28262072 */  paddub      $4, $17, $0
/* 0238E0 01DCF5E0 C0E5040C */  jal         DrawShadow__10CCharacterFv
/* 0238E4 01DCF5E4 00000000 */   nop
.L01DCF5E8_2D4DE8:
/* 0238E8 01DCF5E8 01001026 */  addiu       $16, $16, 0x1
.L01DCF5EC_2D4DEC:
/* 0238EC 01DCF5EC 0900022A */  slti        $2, $16, 0x9
/* 0238F0 01DCF5F0 E4FF4014 */  bnez        $2, .L01DCF584_2D4D84
/* 0238F4 01DCF5F4 00000000 */   nop
/* 0238F8 01DCF5F8 34000424 */  addiu       $4, $0, 0x34
/* 0238FC 01DCF5FC CCC2040C */  jal         MGEndDrawShadow__FUc
/* 023900 01DCF600 00000000 */   nop
/* 023904 01DCF604 28860070 */  paddub      $16, $0, $0
/* 023908 01DCF608 2C000010 */  b           .L01DCF6BC_2D4EBC
/* 02390C 01DCF60C 00000000 */   nop
.L01DCF610_2D4E10:
/* 023910 01DCF610 40101000 */  sll         $2, $16, 1
/* 023914 01DCF614 21105000 */  addu        $2, $2, $16
/* 023918 01DCF618 80100200 */  sll         $2, $2, 2
/* 02391C 01DCF61C 21105000 */  addu        $2, $2, $16
/* 023920 01DCF620 80180200 */  sll         $3, $2, 2
/* 023924 01DCF624 E301023C */  lui         $2, %hi(CScript + 0x30)
/* 023928 01DCF628 F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 02392C 01DCF62C 21104300 */  addu        $2, $2, $3
/* 023930 01DCF630 00004290 */  lbu         $2, 0x0($2)
/* 023934 01DCF634 20004010 */  beqz        $2, .L01DCF6B8_2D4EB8
/* 023938 01DCF638 00000000 */   nop
/* 02393C 01DCF63C 05000224 */  addiu       $2, $0, 0x5
/* 023940 01DCF640 1D000212 */  beq         $16, $2, .L01DCF6B8_2D4EB8
/* 023944 01DCF644 00000000 */   nop
/* 023948 01DCF648 E401023C */  lui         $2, %hi(CharaTex)
/* 02394C 01DCF64C 10D04224 */  addiu       $2, $2, %lo(CharaTex)
/* 023950 01DCF650 21885000 */  addu        $17, $2, $16
/* 023954 01DCF654 00002682 */  lb          $6, 0x0($17)
/* 023958 01DCF658 C701023C */  lui         $2, %hi(TexManager)
/* 02395C 01DCF65C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 023960 01DCF660 D48B858F */  lw          $5, -0x742C($28)
/* 023964 01DCF664 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 023968 01DCF668 00000000 */   nop
/* 02396C 01DCF66C B0110224 */  addiu       $2, $0, 0x11B0
/* 023970 01DCF670 18180202 */  mult        $3, $16, $2
/* 023974 01DCF674 DF01023C */  lui         $2, %hi(Chara__3)
/* 023978 01DCF678 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 02397C 01DCF67C 21904300 */  addu        $18, $2, $3
/* 023980 01DCF680 00002582 */  lb          $5, 0x0($17)
/* 023984 01DCF684 28264072 */  paddub      $4, $18, $0
/* 023988 01DCF688 14E0040C */  jal         TextureAnime__10CCharacterFi
/* 02398C 01DCF68C 00000000 */   nop
/* 023990 01DCF690 28264072 */  paddub      $4, $18, $0
/* 023994 01DCF694 4CE1040C */  jal         Step__10CCharacterFv
/* 023998 01DCF698 00000000 */   nop
/* 02399C 01DCF69C 28264072 */  paddub      $4, $18, $0
/* 0239A0 01DCF6A0 282E0070 */  paddub      $5, $0, $0
/* 0239A4 01DCF6A4 94E3040C */  jal         ClothStep__10CCharacterFi
/* 0239A8 01DCF6A8 00000000 */   nop
/* 0239AC 01DCF6AC 28264072 */  paddub      $4, $18, $0
/* 0239B0 01DCF6B0 C4E4040C */  jal         Draw__10CCharacterFv
/* 0239B4 01DCF6B4 00000000 */   nop
.L01DCF6B8_2D4EB8:
/* 0239B8 01DCF6B8 01001026 */  addiu       $16, $16, 0x1
.L01DCF6BC_2D4EBC:
/* 0239BC 01DCF6BC 0900022A */  slti        $2, $16, 0x9
/* 0239C0 01DCF6C0 D3FF4014 */  bnez        $2, .L01DCF610_2D4E10
/* 0239C4 01DCF6C4 00000000 */   nop
/* 0239C8 01DCF6C8 C701023C */  lui         $2, %hi(TexManager)
/* 0239CC 01DCF6CC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0239D0 01DCF6D0 D48B858F */  lw          $5, -0x742C($28)
/* 0239D4 01DCF6D4 16000624 */  addiu       $6, $0, 0x16
/* 0239D8 01DCF6D8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0239DC 01DCF6DC 00000000 */   nop
/* 0239E0 01DCF6E0 5800A427 */  addiu       $4, $29, 0x58
/* 0239E4 01DCF6E4 B88A82DF */  ld          $2, -0x7548($28)
/* 0239E8 01DCF6E8 000082FC */  sd          $2, 0x0($4)
/* 0239EC 01DCF6EC 02000524 */  addiu       $5, $0, 0x2
/* 0239F0 01DCF6F0 20000624 */  addiu       $6, $0, 0x20
/* 0239F4 01DCF6F4 283E0070 */  paddub      $7, $0, $0
/* 0239F8 01DCF6F8 B094050C */  jal         DepthOfField__FPfiii
/* 0239FC 01DCF6FC 00000000 */   nop
/* 023A00 01DCF700 4000BF7B */  lq          $31, 0x40($29)
/* 023A04 01DCF704 3000B27B */  lq          $18, 0x30($29)
/* 023A08 01DCF708 2000B17B */  lq          $17, 0x20($29)
/* 023A0C 01DCF70C 1000B07B */  lq          $16, 0x10($29)
/* 023A10 01DCF710 6000BD27 */  addiu       $29, $29, 0x60
/* 023A14 01DCF714 0800E003 */  jr          $31
/* 023A18 01DCF718 00000000 */   nop
/* 023A1C 01DCF71C 00000000 */  nop
