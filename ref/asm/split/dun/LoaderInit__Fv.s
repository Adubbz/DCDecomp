.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoaderInit__Fv
/* 015720 01DC1420 F0FFBD27 */  addiu       $29, $29, -0x10
/* 015724 01DC1424 0000BF7F */  sq          $31, 0x0($29)
/* 015728 01DC1428 F096040C */  jal         BufferAllClear__Fv
/* 01572C 01DC142C 00000000 */   nop
/* 015730 01DC1430 C042023C */  lui         $2, (0x42C00000 >> 16)
/* 015734 01DC1434 00688244 */  mtc1        $2, $f13
/* 015738 01DC1438 4041023C */  lui         $2, (0x41400000 >> 16)
/* 01573C 01DC143C 00708244 */  mtc1        $2, $f14
/* 015740 01DC1440 0043023C */  lui         $2, (0x43000000 >> 16)
/* 015744 01DC1444 00788244 */  mtc1        $2, $f15
/* 015748 01DC1448 0042023C */  lui         $2, (0x42000000 >> 16)
/* 01574C 01DC144C 00608244 */  mtc1        $2, $f12
/* 015750 01DC1450 24B8040C */  jal         MGSetBGColor__Fffff
/* 015754 01DC1454 00000000 */   nop
/* 015758 01DC1458 C701023C */  lui         $2, %hi(TexManager)
/* 01575C 01DC145C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 015760 01DC1460 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 015764 01DC1464 F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 015768 01DC1468 00000000 */   nop
/* 01576C 01DC146C C701023C */  lui         $2, %hi(TexManager)
/* 015770 01DC1470 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 015774 01DC1474 DC01023C */  lui         $2, %hi(texdata2)
/* 015778 01DC1478 A0264524 */  addiu       $5, $2, %lo(texdata2)
/* 01577C 01DC147C 98D0040C */  jal         EnterTextureFile__15CTextureManagerFP16LOADTEXTURE_INFO
/* 015780 01DC1480 00000000 */   nop
/* 015784 01DC1484 C701023C */  lui         $2, %hi(TexManager)
/* 015788 01DC1488 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01578C 01DC148C FFFF0524 */  addiu       $5, $0, -0x1
/* 015790 01DC1490 948B868F */  lw          $6, -0x746C($28)
/* 015794 01DC1494 4CCF040C */  jal         LoadTextureBlock__15CTextureManagerFiPUi
/* 015798 01DC1498 00000000 */   nop
/* 01579C 01DC149C DC01033C */  lui         $3, %hi(LIT_922__2)
/* 0157A0 01DC14A0 682E6324 */  addiu       $3, $3, %lo(LIT_922__2)
/* 0157A4 01DC14A4 F001013C */  lui         $1, %hi(CDbgMsg + 0x10)
/* 0157A8 01DC14A8 F06823AC */  sw          $3, %lo(CDbgMsg + 0x10)($1)
/* 0157AC 01DC14AC 20000324 */  addiu       $3, $0, 0x20
/* 0157B0 01DC14B0 F001013C */  lui         $1, %hi(CDbgMsg)
/* 0157B4 01DC14B4 E06823AC */  sw          $3, %lo(CDbgMsg)($1)
/* 0157B8 01DC14B8 10000324 */  addiu       $3, $0, 0x10
/* 0157BC 01DC14BC F001013C */  lui         $1, %hi(CDbgMsg + 0x4)
/* 0157C0 01DC14C0 E46823AC */  sw          $3, %lo(CDbgMsg + 0x4)($1)
/* 0157C4 01DC14C4 00010324 */  addiu       $3, $0, 0x100
/* 0157C8 01DC14C8 F001013C */  lui         $1, %hi(CDbgMsg + 0x8)
/* 0157CC 01DC14CC E86823AC */  sw          $3, %lo(CDbgMsg + 0x8)($1)
/* 0157D0 01DC14D0 E0000324 */  addiu       $3, $0, 0xE0
/* 0157D4 01DC14D4 F001013C */  lui         $1, %hi(CDbgMsg + 0xC)
/* 0157D8 01DC14D8 EC6823AC */  sw          $3, %lo(CDbgMsg + 0xC)($1)
/* 0157DC 01DC14DC 60000324 */  addiu       $3, $0, 0x60
/* 0157E0 01DC14E0 F001013C */  lui         $1, %hi(CDbgMsg + 0x14)
/* 0157E4 01DC14E4 F46823AC */  sw          $3, %lo(CDbgMsg + 0x14)($1)
/* 0157E8 01DC14E8 01000324 */  addiu       $3, $0, 0x1
/* 0157EC 01DC14EC D401013C */  lui         $1, %hi(EdEventInfo + 0x34)
/* 0157F0 01DC14F0 04D223AC */  sw          $3, %lo(EdEventInfo + 0x34)($1)
/* 0157F4 01DC14F4 0000BF7B */  lq          $31, 0x0($29)
/* 0157F8 01DC14F8 1000BD27 */  addiu       $29, $29, 0x10
/* 0157FC 01DC14FC 0800E003 */  jr          $31
/* 015800 01DC1500 00000000 */   nop
/* 015804 01DC1504 00000000 */  nop
/* 015808 01DC1508 00000000 */  nop
/* 01580C 01DC150C 00000000 */  nop
