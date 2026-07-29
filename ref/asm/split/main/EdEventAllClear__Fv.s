.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdEventAllClear__Fv
/* 097910 00197810 D0FFBD27 */  addiu       $29, $29, -0x30
/* 097914 00197814 2000BF7F */  sq          $31, 0x20($29)
/* 097918 00197818 1000B17F */  sq          $17, 0x10($29)
/* 09791C 0019781C 0000B07F */  sq          $16, 0x0($29)
/* 097920 00197820 D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 097924 00197824 1CD2248C */  lw          $4, %lo(EdEventInfo + 0x4C)($1)
/* 097928 00197828 08E0040C */  jal         ClearTexAnime__10CCharacterFv
/* 09792C 0019782C 00000000 */   nop
/* 097930 00197830 D401013C */  lui         $1, %hi(EdEventInfo + 0x50)
/* 097934 00197834 20D2228C */  lw          $2, %lo(EdEventInfo + 0x50)($1)
/* 097938 00197838 1A004010 */  beqz        $2, .L001978A4
/* 09793C 0019783C 00000000 */   nop
/* 097940 00197840 28860070 */  paddub      $16, $0, $0
/* 097944 00197844 0C000010 */  b           .L00197878
/* 097948 00197848 00000000 */   nop
.L0019784C:
/* 09794C 0019784C 80101000 */  sll         $2, $16, 2
/* 097950 00197850 21105000 */  addu        $2, $2, $16
/* 097954 00197854 40100200 */  sll         $2, $2, 1
/* 097958 00197858 21105000 */  addu        $2, $2, $16
/* 09795C 0019785C C0180200 */  sll         $3, $2, 3
/* 097960 00197860 D401013C */  lui         $1, %hi(EdEventInfo + 0x50)
/* 097964 00197864 20D2228C */  lw          $2, %lo(EdEventInfo + 0x50)($1)
/* 097968 00197868 21204300 */  addu        $4, $2, $3
/* 09796C 0019786C 349C050C */  jal         Initialize__13CTexAnimeDataFv
/* 097970 00197870 00000000 */   nop
/* 097974 00197874 01001026 */  addiu       $16, $16, 0x1
.L00197878:
/* 097978 00197878 D401013C */  lui         $1, %hi(EdEventInfo + 0x54)
/* 09797C 0019787C 24D2268C */  lw          $6, %lo(EdEventInfo + 0x54)($1)
/* 097980 00197880 2A100602 */  slt         $2, $16, $6
/* 097984 00197884 F1FF4014 */  bnez        $2, .L0019784C
/* 097988 00197888 00000000 */   nop
/* 09798C 0019788C D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 097990 00197890 1CD2248C */  lw          $4, %lo(EdEventInfo + 0x4C)($1)
/* 097994 00197894 D401013C */  lui         $1, %hi(EdEventInfo + 0x50)
/* 097998 00197898 20D2258C */  lw          $5, %lo(EdEventInfo + 0x50)($1)
/* 09799C 0019789C FCDF040C */  jal         InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* 0979A0 001978A0 00000000 */   nop
.L001978A4:
/* 0979A4 001978A4 D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 0979A8 001978A8 1CD2248C */  lw          $4, %lo(EdEventInfo + 0x4C)($1)
/* 0979AC 001978AC D401013C */  lui         $1, %hi(EdEventInfo + 0x70)
/* 0979B0 001978B0 40D2258C */  lw          $5, %lo(EdEventInfo + 0x70)($1)
/* 0979B4 001978B4 34E6040C */  jal         DeleteExtendTexture__10CCharacterFi
/* 0979B8 001978B8 00000000 */   nop
/* 0979BC 001978BC D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 0979C0 001978C0 1CD2248C */  lw          $4, %lo(EdEventInfo + 0x4C)($1)
/* 0979C4 001978C4 64E6040C */  jal         DeleteExtendMotion__10CCharacterFv
/* 0979C8 001978C8 00000000 */   nop
/* 0979CC 001978CC D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 0979D0 001978D0 1CD2238C */  lw          $3, %lo(EdEventInfo + 0x4C)($1)
/* 0979D4 001978D4 680C60AC */  sw          $0, 0xC68($3)
/* 0979D8 001978D8 640C60AC */  sw          $0, 0xC64($3)
/* 0979DC 001978DC 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0979E0 001978E0 600C62AC */  sw          $2, 0xC60($3)
/* 0979E4 001978E4 28860070 */  paddub      $16, $0, $0
/* 0979E8 001978E8 1A000010 */  b           .L00197954
/* 0979EC 001978EC 00000000 */   nop
.L001978F0:
/* 0979F0 001978F0 28260072 */  paddub      $4, $16, $0
/* 0979F4 001978F4 702C060C */  jal         GetNPC__Fi
/* 0979F8 001978F8 00000000 */   nop
/* 0979FC 001978FC 288E4070 */  paddub      $17, $2, $0
/* 097A00 00197900 13002012 */  beqz        $17, .L00197950
/* 097A04 00197904 00000000 */   nop
/* 097A08 00197908 8C14258E */  lw          $5, 0x148C($17)
/* 097A0C 0019790C 3600A228 */  slti        $2, $5, 0x36
/* 097A10 00197910 05004014 */  bnez        $2, .L00197928
/* 097A14 00197914 00000000 */   nop
/* 097A18 00197918 C701023C */  lui         $2, %hi(TexManager)
/* 097A1C 0019791C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 097A20 00197920 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 097A24 00197924 00000000 */   nop
.L00197928:
/* 097A28 00197928 28262072 */  paddub      $4, $17, $0
/* 097A2C 0019792C A000398E */  lw          $25, 0xA0($17)
/* 097A30 00197930 C400398F */  lw          $25, 0xC4($25)
/* 097A34 00197934 09F82003 */  jalr        $25
/* 097A38 00197938 00000000 */   nop
/* 097A3C 0019793C 28262072 */  paddub      $4, $17, $0
/* 097A40 00197940 282E0070 */  paddub      $5, $0, $0
/* 097A44 00197944 28360070 */  paddub      $6, $0, $0
/* 097A48 00197948 FCDF040C */  jal         InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* 097A4C 0019794C 00000000 */   nop
.L00197950:
/* 097A50 00197950 01001026 */  addiu       $16, $16, 0x1
.L00197954:
/* 097A54 00197954 D401013C */  lui         $1, %hi(EdEventInfo + 0x1F8)
/* 097A58 00197958 C8D3228C */  lw          $2, %lo(EdEventInfo + 0x1F8)($1)
/* 097A5C 0019795C 2A100202 */  slt         $2, $16, $2
/* 097A60 00197960 E3FF4014 */  bnez        $2, .L001978F0
/* 097A64 00197964 00000000 */   nop
/* 097A68 00197968 D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 097A6C 0019796C 1CD2248C */  lw          $4, %lo(EdEventInfo + 0x4C)($1)
/* 097A70 00197970 D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 097A74 00197974 10D2258C */  lw          $5, %lo(EdEventInfo + 0x40)($1)
/* 097A78 00197978 DCE0040C */  jal         SetMotionCamera__10CCharacterFP7CCamera
/* 097A7C 0019797C 00000000 */   nop
/* 097A80 00197980 28860070 */  paddub      $16, $0, $0
/* 097A84 00197984 05000010 */  b           .L0019799C
/* 097A88 00197988 00000000 */   nop
.L0019798C:
/* 097A8C 0019798C 28260072 */  paddub      $4, $16, $0
/* 097A90 00197990 B02C060C */  jal         DeleteItemFrame__Fi
/* 097A94 00197994 00000000 */   nop
/* 097A98 00197998 01001026 */  addiu       $16, $16, 0x1
.L0019799C:
/* 097A9C 0019799C FBFF001A */  blez        $16, .L0019798C
/* 097AA0 001979A0 00000000 */   nop
/* 097AA4 001979A4 D501023C */  lui         $2, %hi(SceneData)
/* 097AA8 001979A8 B08F4424 */  addiu       $4, $2, %lo(SceneData)
/* 097AAC 001979AC 74E6040C */  jal         Initialize__10CCharacterFv
/* 097AB0 001979B0 00000000 */   nop
/* 097AB4 001979B4 2D001024 */  addiu       $16, $0, 0x2D
/* 097AB8 001979B8 07000010 */  b           .L001979D8
/* 097ABC 001979BC 00000000 */   nop
.L001979C0:
/* 097AC0 001979C0 C701023C */  lui         $2, %hi(TexManager)
/* 097AC4 001979C4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 097AC8 001979C8 282E0072 */  paddub      $5, $16, $0
/* 097ACC 001979CC C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 097AD0 001979D0 00000000 */   nop
/* 097AD4 001979D4 01001026 */  addiu       $16, $16, 0x1
.L001979D8:
/* 097AD8 001979D8 3200012A */  slti        $1, $16, 0x32
/* 097ADC 001979DC F8FF2014 */  bnez        $1, .L001979C0
/* 097AE0 001979E0 00000000 */   nop
/* 097AE4 001979E4 28860070 */  paddub      $16, $0, $0
/* 097AE8 001979E8 0C000010 */  b           .L00197A1C
/* 097AEC 001979EC 00000000 */   nop
.L001979F0:
/* 097AF0 001979F0 40101000 */  sll         $2, $16, 1
/* 097AF4 001979F4 21105000 */  addu        $2, $2, $16
/* 097AF8 001979F8 80100200 */  sll         $2, $2, 2
/* 097AFC 001979FC 21105000 */  addu        $2, $2, $16
/* 097B00 00197A00 00190200 */  sll         $3, $2, 4
/* 097B04 00197A04 D401023C */  lui         $2, %hi(ActSeq)
/* 097B08 00197A08 50114224 */  addiu       $2, $2, %lo(ActSeq)
/* 097B0C 00197A0C 21204300 */  addu        $4, $2, $3
/* 097B10 00197A10 F052050C */  jal         ClearSeq__10CActionSeqFv
/* 097B14 00197A14 00000000 */   nop
/* 097B18 00197A18 01001026 */  addiu       $16, $16, 0x1
.L00197A1C:
/* 097B1C 00197A1C 0A00022A */  slti        $2, $16, 0xA
/* 097B20 00197A20 F3FF4014 */  bnez        $2, .L001979F0
/* 097B24 00197A24 00000000 */   nop
/* 097B28 00197A28 01000224 */  addiu       $2, $0, 0x1
/* 097B2C 00197A2C 2000BF7B */  lq          $31, 0x20($29)
/* 097B30 00197A30 1000B17B */  lq          $17, 0x10($29)
/* 097B34 00197A34 0000B07B */  lq          $16, 0x0($29)
/* 097B38 00197A38 3000BD27 */  addiu       $29, $29, 0x30
/* 097B3C 00197A3C 0800E003 */  jr          $31
/* 097B40 00197A40 00000000 */   nop
/* 097B44 00197A44 00000000 */  nop
/* 097B48 00197A48 00000000 */  nop
/* 097B4C 00197A4C 00000000 */  nop
