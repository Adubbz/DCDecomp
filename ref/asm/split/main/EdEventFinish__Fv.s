.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdEventFinish__Fv
/* 097B50 00197A50 F0FFBD27 */  addiu       $29, $29, -0x10
/* 097B54 00197A54 0000BF7F */  sq          $31, 0x0($29)
/* 097B58 00197A58 D401013C */  lui         $1, %hi(EdEventInfo + 0x2DC)
/* 097B5C 00197A5C ACD420AC */  sw          $0, %lo(EdEventInfo + 0x2DC)($1)
/* 097B60 00197A60 D401013C */  lui         $1, %hi(EdEventInfo + 0x2E0)
/* 097B64 00197A64 B0D420AC */  sw          $0, %lo(EdEventInfo + 0x2E0)($1)
/* 097B68 00197A68 D401013C */  lui         $1, %hi(EdEventInfo + 0x300)
/* 097B6C 00197A6C D0D420AC */  sw          $0, %lo(EdEventInfo + 0x300)($1)
/* 097B70 00197A70 D401013C */  lui         $1, %hi(EdEventInfo + 0x320)
/* 097B74 00197A74 F0D420AC */  sw          $0, %lo(EdEventInfo + 0x320)($1)
/* 097B78 00197A78 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 097B7C 00197A7C D401013C */  lui         $1, %hi(EdEventInfo + 0x23C)
/* 097B80 00197A80 0CD422AC */  sw          $2, %lo(EdEventInfo + 0x23C)($1)
/* 097B84 00197A84 D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 097B88 00197A88 1CD2228C */  lw          $2, %lo(EdEventInfo + 0x4C)($1)
/* 097B8C 00197A8C BC00448C */  lw          $4, 0xBC($2)
/* 097B90 00197A90 68A0040C */  jal         DeleteReference__6CFrameFv
/* 097B94 00197A94 00000000 */   nop
/* 097B98 00197A98 D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 097B9C 00197A9C 1CD2228C */  lw          $2, %lo(EdEventInfo + 0x4C)($1)
/* 097BA0 00197AA0 C000448C */  lw          $4, 0xC0($2)
/* 097BA4 00197AA4 03008010 */  beqz        $4, .L00197AB4
/* 097BA8 00197AA8 00000000 */   nop
/* 097BAC 00197AAC 68A0040C */  jal         DeleteReference__6CFrameFv
/* 097BB0 00197AB0 00000000 */   nop
.L00197AB4:
/* 097BB4 00197AB4 01000224 */  addiu       $2, $0, 0x1
/* 097BB8 00197AB8 0000BF7B */  lq          $31, 0x0($29)
/* 097BBC 00197ABC 1000BD27 */  addiu       $29, $29, 0x10
/* 097BC0 00197AC0 0800E003 */  jr          $31
/* 097BC4 00197AC4 00000000 */   nop
/* 097BC8 00197AC8 00000000 */  nop
/* 097BCC 00197ACC 00000000 */  nop
