.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGSetViewMatrix__FPA4_fPf
/* 02E0A0 0012DFA0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 02E0A4 0012DFA4 1000BF7F */  sq          $31, 0x10($29)
/* 02E0A8 0012DFA8 0000B07F */  sq          $16, 0x0($29)
/* 02E0AC 0012DFAC 2886A070 */  paddub      $16, $5, $0
/* 02E0B0 0012DFB0 DCB7040C */  jal         MGSetViewMatrix__FPA4_f
/* 02E0B4 0012DFB4 00000000 */   nop
/* 02E0B8 0012DFB8 C701023C */  lui         $2, %hi(mgRenderInfo + 0x1F0)
/* 02E0BC 0012DFBC 10574424 */  addiu       $4, $2, %lo(mgRenderInfo + 0x1F0)
/* 02E0C0 0012DFC0 282E0072 */  paddub      $5, $16, $0
/* 02E0C4 0012DFC4 0C86040C */  jal         sceVu0CopyVector
/* 02E0C8 0012DFC8 00000000 */   nop
/* 02E0CC 0012DFCC 000000C6 */  lwc1        $f0, 0x0($16)
/* 02E0D0 0012DFD0 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1E0)
/* 02E0D4 0012DFD4 005720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x1E0)($1)
/* 02E0D8 0012DFD8 040000C6 */  lwc1        $f0, 0x4($16)
/* 02E0DC 0012DFDC C701013C */  lui         $1, %hi(mgRenderInfo + 0x1E4)
/* 02E0E0 0012DFE0 045720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x1E4)($1)
/* 02E0E4 0012DFE4 080000C6 */  lwc1        $f0, 0x8($16)
/* 02E0E8 0012DFE8 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1E8)
/* 02E0EC 0012DFEC 085720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x1E8)($1)
/* 02E0F0 0012DFF0 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1EC)
/* 02E0F4 0012DFF4 0C5720AC */  sw          $0, %lo(mgRenderInfo + 0x1EC)($1)
/* 02E0F8 0012DFF8 1000BF7B */  lq          $31, 0x10($29)
/* 02E0FC 0012DFFC 0000B07B */  lq          $16, 0x0($29)
/* 02E100 0012E000 2000BD27 */  addiu       $29, $29, 0x20
/* 02E104 0012E004 0800E003 */  jr          $31
/* 02E108 0012E008 00000000 */   nop
/* 02E10C 0012E00C 00000000 */  nop
