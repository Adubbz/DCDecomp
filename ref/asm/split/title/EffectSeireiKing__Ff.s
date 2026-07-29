.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EffectSeireiKing__Ff
/* 01AF70 01DC6C70 90FFBD27 */  addiu       $29, $29, -0x70
/* 01AF74 01DC6C74 1000BF7F */  sq          $31, 0x10($29)
/* 01AF78 01DC6C78 0000B4E7 */  swc1        $f20, 0x0($29)
/* 01AF7C 01DC6C7C 06650046 */  mov.s       $f20, $f12
/* 01AF80 01DC6C80 0498838F */  lw          $3, -0x67FC($28)
/* 01AF84 01DC6C84 B0110224 */  addiu       $2, $0, 0x11B0
/* 01AF88 01DC6C88 18186200 */  mult        $3, $3, $2
/* 01AF8C 01DC6C8C E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 01AF90 01DC6C90 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 01AF94 01DC6C94 21104300 */  addu        $2, $2, $3
/* 01AF98 01DC6C98 0000448C */  lw          $4, 0x0($2)
/* 01AF9C 01DC6C9C DE01023C */  lui         $2, %hi(LIT_986__4)
/* 01AFA0 01DC6CA0 18FE4524 */  addiu       $5, $2, %lo(LIT_986__4)
/* 01AFA4 01DC6CA4 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01AFA8 01DC6CA8 00000000 */   nop
/* 01AFAC 01DC6CAC 28264070 */  paddub      $4, $2, $0
/* 01AFB0 01DC6CB0 2F008010 */  beqz        $4, .L01DC6D70_2CC570
/* 01AFB4 01DC6CB4 00000000 */   nop
/* 01AFB8 01DC6CB8 2000A527 */  addiu       $5, $29, 0x20
/* 01AFBC 01DC6CBC 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01AFC0 01DC6CC0 00000000 */   nop
/* 01AFC4 01DC6CC4 C701023C */  lui         $2, %hi(TexManager)
/* 01AFC8 01DC6CC8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01AFCC 01DC6CCC D48B858F */  lw          $5, -0x742C($28)
/* 01AFD0 01DC6CD0 04000624 */  addiu       $6, $0, 0x4
/* 01AFD4 01DC6CD4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 01AFD8 01DC6CD8 00000000 */   nop
/* 01AFDC 01DC6CDC 5000A0C7 */  lwc1        $f0, 0x50($29)
/* 01AFE0 01DC6CE0 6000A0E7 */  swc1        $f0, 0x60($29)
/* 01AFE4 01DC6CE4 5400A0C7 */  lwc1        $f0, 0x54($29)
/* 01AFE8 01DC6CE8 6400A0E7 */  swc1        $f0, 0x64($29)
/* 01AFEC 01DC6CEC 5800A0C7 */  lwc1        $f0, 0x58($29)
/* 01AFF0 01DC6CF0 6800A0E7 */  swc1        $f0, 0x68($29)
/* 01AFF4 01DC6CF4 0898828F */  lw          $2, -0x67F8($28)
/* 01AFF8 01DC6CF8 16004014 */  bnez        $2, .L01DC6D54_2CC554
/* 01AFFC 01DC6CFC 00000000 */   nop
/* 01B000 01DC6D00 FC9A8283 */  lb          $2, -0x6504($28)
/* 01B004 01DC6D04 04004014 */  bnez        $2, .L01DC6D18_2CC518
/* 01B008 01DC6D08 00000000 */   nop
/* 01B00C 01DC6D0C F89A80AF */  sw          $0, -0x6508($28)
/* 01B010 01DC6D10 01000224 */  addiu       $2, $0, 0x1
/* 01B014 01DC6D14 FC9A82A3 */  sb          $2, -0x6504($28)
.L01DC6D18_2CC518:
/* 01B018 01DC6D18 F89A828F */  lw          $2, -0x6508($28)
/* 01B01C 01DC6D1C 01004224 */  addiu       $2, $2, 0x1
/* 01B020 01DC6D20 F89A82AF */  sw          $2, -0x6508($28)
/* 01B024 01DC6D24 F89A828F */  lw          $2, -0x6508($28)
/* 01B028 01DC6D28 02004128 */  slti        $1, $2, 0x2
/* 01B02C 01DC6D2C 02002014 */  bnez        $1, .L01DC6D38_2CC538
/* 01B030 01DC6D30 00000000 */   nop
/* 01B034 01DC6D34 F89A80AF */  sw          $0, -0x6508($28)
.L01DC6D38_2CC538:
/* 01B038 01DC6D38 F89A828F */  lw          $2, -0x6508($28)
/* 01B03C 01DC6D3C 05004014 */  bnez        $2, .L01DC6D54_2CC554
/* 01B040 01DC6D40 00000000 */   nop
/* 01B044 01DC6D44 E301023C */  lui         $2, %hi(SeireiKing)
/* 01B048 01DC6D48 90E44424 */  addiu       $4, $2, %lo(SeireiKing)
/* 01B04C 01DC6D4C 4CBC760C */  jal         Step__11CSeireiKingFv
/* 01B050 01DC6D50 00000000 */   nop
.L01DC6D54_2CC554:
/* 01B054 01DC6D54 E301023C */  lui         $2, %hi(SeireiKing)
/* 01B058 01DC6D58 90E44424 */  addiu       $4, $2, %lo(SeireiKing)
/* 01B05C 01DC6D5C 6000A527 */  addiu       $5, $29, 0x60
/* 01B060 01DC6D60 06A30046 */  mov.s       $f12, $f20
/* 01B064 01DC6D64 02000624 */  addiu       $6, $0, 0x2
/* 01B068 01DC6D68 64B9760C */  jal         Draw__11CSeireiKingFPffi
/* 01B06C 01DC6D6C 00000000 */   nop
.L01DC6D70_2CC570:
/* 01B070 01DC6D70 1000BF7B */  lq          $31, 0x10($29)
/* 01B074 01DC6D74 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 01B078 01DC6D78 7000BD27 */  addiu       $29, $29, 0x70
/* 01B07C 01DC6D7C 0800E003 */  jr          $31
/* 01B080 01DC6D80 00000000 */   nop
/* 01B084 01DC6D84 00000000 */  nop
/* 01B088 01DC6D88 00000000 */  nop
/* 01B08C 01DC6D8C 00000000 */  nop
