.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdEventFinish__Fv
/* 97B50 00197A50 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 97B54 00197A54 0000BF7F */  sq         $31, 0x0($sp)
/* 97B58 00197A58 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 97B5C 00197A5C ACD420AC */  sw         $0, -0x2B54($at)
/* 97B60 00197A60 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 97B64 00197A64 B0D420AC */  sw         $0, -0x2B50($at)
/* 97B68 00197A68 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 97B6C 00197A6C D0D420AC */  sw         $0, -0x2B30($at)
/* 97B70 00197A70 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 97B74 00197A74 F0D420AC */  sw         $0, -0x2B10($at)
/* 97B78 00197A78 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 97B7C 00197A7C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 97B80 00197A80 0CD422AC */  sw         $2, -0x2BF4($at)
/* 97B84 00197A84 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 97B88 00197A88 1CD2228C */  lw         $2, -0x2DE4($at)
/* 97B8C 00197A8C BC00448C */  lw         $4, 0xBC($2)
/* 97B90 00197A90 68A0040C */  jal        DeleteReference__6CFrameFv
/* 97B94 00197A94 00000000 */   nop
/* 97B98 00197A98 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 97B9C 00197A9C 1CD2228C */  lw         $2, -0x2DE4($at)
/* 97BA0 00197AA0 C000448C */  lw         $4, 0xC0($2)
/* 97BA4 00197AA4 03008010 */  beqz       $4, .L00197AB4
/* 97BA8 00197AA8 00000000 */   nop
/* 97BAC 00197AAC 68A0040C */  jal        DeleteReference__6CFrameFv
/* 97BB0 00197AB0 00000000 */   nop
.L00197AB4:
/* 97BB4 00197AB4 01000224 */  addiu      $2, $0, 0x1
/* 97BB8 00197AB8 0000BF7B */  lq         $31, 0x0($sp)
/* 97BBC 00197ABC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 97BC0 00197AC0 0800E003 */  jr         $31
/* 97BC4 00197AC4 00000000 */   nop
/* 97BC8 00197AC8 00000000 */  nop
/* 97BCC 00197ACC 00000000 */  nop
