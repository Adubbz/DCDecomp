.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawFullSizePicture__FP8CTextureiii
/* 1328D0 002327D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1328D4 002327D4 0000BF7F */  sq         $31, 0x0($sp)
/* 1328D8 002327D8 0E008010 */  beqz       $4, .L00232814
/* 1328DC 002327DC 00000000 */   nop
/* 1328E0 002327E0 DA01013C */  lui        $at, (0x1DA6A9C >> 16)
/* 1328E4 002327E4 9C6A238C */  lw         $3, (0x1DA6A9C & 0xFFFF)($at)
/* 1328E8 002327E8 DA01013C */  lui        $at, (0x1DA6A98 >> 16)
/* 1328EC 002327EC 986A228C */  lw         $2, (0x1DA6A98 & 0xFFFF)($at)
/* 1328F0 002327F0 1000A5AF */  sw         $5, 0x10($sp)
/* 1328F4 002327F4 1400A6AF */  sw         $6, 0x14($sp)
/* 1328F8 002327F8 1800A2AF */  sw         $2, 0x18($sp)
/* 1328FC 002327FC 1C00A3AF */  sw         $3, 0x1C($sp)
/* 132900 00232800 1000A527 */  addiu      $5, $sp, 0x10
/* 132904 00232804 DA01023C */  lui        $2, %hi(MenuDispRc)
/* 132908 00232808 906A4624 */  addiu      $6, $2, %lo(MenuDispRc)
/* 13290C 0023280C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 132910 00232810 00000000 */   nop
.L00232814:
/* 132914 00232814 0000BF7B */  lq         $31, 0x0($sp)
/* 132918 00232818 2000BD27 */  addiu      $sp, $sp, 0x20
/* 13291C 0023281C 0800E003 */  jr         $31
/* 132920 00232820 00000000 */   nop
/* 132924 00232824 00000000 */  nop
/* 132928 00232828 00000000 */  nop
/* 13292C 0023282C 00000000 */  nop
