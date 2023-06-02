.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGSetViewMatrix__FPA4_fPf
/* 2E0A0 0012DFA0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2E0A4 0012DFA4 1000BF7F */  sq         $31, 0x10($sp)
/* 2E0A8 0012DFA8 0000B07F */  sq         $16, 0x0($sp)
/* 2E0AC 0012DFAC 2886A070 */  paddub     $16, $5, $0
/* 2E0B0 0012DFB0 DCB7040C */  jal        MGSetViewMatrix__FPA4_f
/* 2E0B4 0012DFB4 00000000 */   nop
/* 2E0B8 0012DFB8 C701023C */  lui        $2, %hi(D_1C75710)
/* 2E0BC 0012DFBC 10574424 */  addiu      $4, $2, %lo(D_1C75710)
/* 2E0C0 0012DFC0 282E0072 */  paddub     $5, $16, $0
/* 2E0C4 0012DFC4 0C86040C */  jal        sceVu0CopyVector
/* 2E0C8 0012DFC8 00000000 */   nop
/* 2E0CC 0012DFCC 000000C6 */  lwc1       $f0, 0x0($16)
/* 2E0D0 0012DFD0 C701013C */  lui        $at, (0x1C75700 >> 16)
/* 2E0D4 0012DFD4 005720E4 */  swc1       $f0, (0x1C75700 & 0xFFFF)($at)
/* 2E0D8 0012DFD8 040000C6 */  lwc1       $f0, 0x4($16)
/* 2E0DC 0012DFDC C701013C */  lui        $at, (0x1C75704 >> 16)
/* 2E0E0 0012DFE0 045720E4 */  swc1       $f0, (0x1C75704 & 0xFFFF)($at)
/* 2E0E4 0012DFE4 080000C6 */  lwc1       $f0, 0x8($16)
/* 2E0E8 0012DFE8 C701013C */  lui        $at, (0x1C75708 >> 16)
/* 2E0EC 0012DFEC 085720E4 */  swc1       $f0, (0x1C75708 & 0xFFFF)($at)
/* 2E0F0 0012DFF0 C701013C */  lui        $at, (0x1C7570C >> 16)
/* 2E0F4 0012DFF4 0C5720AC */  sw         $0, (0x1C7570C & 0xFFFF)($at)
/* 2E0F8 0012DFF8 1000BF7B */  lq         $31, 0x10($sp)
/* 2E0FC 0012DFFC 0000B07B */  lq         $16, 0x0($sp)
/* 2E100 0012E000 2000BD27 */  addiu      $sp, $sp, 0x20
/* 2E104 0012E004 0800E003 */  jr         $31
/* 2E108 0012E008 00000000 */   nop
/* 2E10C 0012E00C 00000000 */  nop
