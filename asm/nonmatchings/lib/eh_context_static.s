.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel eh_context_static
/* D7C0 0010D6C0 2A00033C */  lui        $3, (0x2A4F58 >> 16)
/* D7C4 0010D6C4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* D7C8 0010D6C8 584F628C */  lw         $2, (0x2A4F58 & 0xFFFF)($3)
/* D7CC 0010D6CC 2000BFFF */  sd         $31, 0x20($sp)
/* D7D0 0010D6D0 1000B1FF */  sd         $17, 0x10($sp)
/* D7D4 0010D6D4 0D004014 */  bnez       $2, .L0010D70C
/* D7D8 0010D6D8 0000B0FF */   sd        $16, 0x0($sp)
/* D7DC 0010D6DC 2A00113C */  lui        $17, %hi(D_002A4F48)
/* D7E0 0010D6E0 01000224 */  addiu      $2, $0, 0x1
/* D7E4 0010D6E4 484F3026 */  addiu      $16, $17, %lo(D_002A4F48)
/* D7E8 0010D6E8 584F62AC */  sw         $2, (0x2A4F58 & 0xFFFF)($3)
/* D7EC 0010D6EC 2D200002 */  daddu      $4, $16, $0
/* D7F0 0010D6F0 2D280000 */  daddu      $5, $0, $0
/* D7F4 0010D6F4 5A0D040C */  jal        memset
/* D7F8 0010D6F8 10000624 */   addiu     $6, $0, 0x10
/* D7FC 0010D6FC 2A00033C */  lui        $3, %hi(D_002A4F60)
/* D800 0010D700 604F6324 */  addiu      $3, $3, %lo(D_002A4F60)
/* D804 0010D704 02000010 */  b          .L0010D710
/* D808 0010D708 040003AE */   sw        $3, 0x4($16)
.L0010D70C:
/* D80C 0010D70C 2A00113C */  lui        $17, %hi(D_002A4F48)
.L0010D710:
/* D810 0010D710 484F2226 */  addiu      $2, $17, %lo(D_002A4F48)
/* D814 0010D714 2000BFDF */  ld         $31, 0x20($sp)
/* D818 0010D718 1000B1DF */  ld         $17, 0x10($sp)
/* D81C 0010D71C 0000B0DF */  ld         $16, 0x0($sp)
/* D820 0010D720 0800E003 */  jr         $31
/* D824 0010D724 3000BD27 */   addiu     $sp, $sp, 0x30
