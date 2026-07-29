.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel cd_callback
/* 009748 00109648 E0FFBD27 */  addiu       $29, $29, -0x20
/* 00974C 0010964C 2500053C */  lui         $5, %hi(Init_seq)
/* 009750 00109650 0000B0FF */  sd          $16, 0x0($29)
/* 009754 00109654 1000BFFF */  sd          $31, 0x10($29)
/* 009758 00109658 2500103C */  lui         $16, %hi(sceCdCbfunc_num)
/* 00975C 0010965C 0000838C */  lw          $3, 0x0($4)
/* 009760 00109660 2500043C */  lui         $4, %hi(sceCdCbfunc_number)
/* 009764 00109664 C00203AE */  sw          $3, %lo(sceCdCbfunc_num)($16)
/* 009768 00109668 C002028E */  lw          $2, %lo(sceCdCbfunc_num)($16)
/* 00976C 0010966C C40282AC */  sw          $2, %lo(sceCdCbfunc_number)($4)
/* 009770 00109670 9002A38C */  lw          $3, %lo(Init_seq)($5)
/* 009774 00109674 0A006010 */  beqz        $3, .L001096A0
/* 009778 00109678 2500023C */   lui        $2, %hi(ncmd_semid)
/* 00977C 0010967C C002038E */  lw          $3, %lo(sceCdCbfunc_num)($16)
/* 009780 00109680 0B000224 */  addiu       $2, $0, 0xB
/* 009784 00109684 06006214 */  bne         $3, $2, .L001096A0
/* 009788 00109688 2500023C */   lui        $2, %hi(ncmd_semid)
/* 00978C 0010968C C00200AE */  sw          $0, %lo(sceCdCbfunc_num)($16)
/* 009790 00109690 2500023C */  lui         $2, %hi(c_cb_sem)
/* 009794 00109694 8C0240AC */  sw          $0, %lo(c_cb_sem)($2)
/* 009798 00109698 14000010 */  b           .L001096EC
/* 00979C 0010969C 1000BFDF */   ld         $31, 0x10($29)
.L001096A0:
/* 0097A0 001096A0 8002448C */  lw          $4, %lo(ncmd_semid)($2)
/* 0097A4 001096A4 D450040C */  jal         iSignalSema
/* 0097A8 001096A8 00000000 */   nop
/* 0097AC 001096AC 2500033C */  lui         $3, %hi(cb_thid)
/* 0097B0 001096B0 7C02628C */  lw          $2, %lo(cb_thid)($3)
/* 0097B4 001096B4 09004010 */  beqz        $2, .L001096DC
/* 0097B8 001096B8 2500023C */   lui        $2, %hi(sceCdCbfunc)
/* 0097BC 001096BC BC02438C */  lw          $3, %lo(sceCdCbfunc)($2)
/* 0097C0 001096C0 06006010 */  beqz        $3, .L001096DC
/* 0097C4 001096C4 2500023C */   lui        $2, %hi(cb_semid)
/* 0097C8 001096C8 8802448C */  lw          $4, %lo(cb_semid)($2)
/* 0097CC 001096CC D450040C */  jal         iSignalSema
/* 0097D0 001096D0 00000000 */   nop
/* 0097D4 001096D4 03000010 */  b           .L001096E4
/* 0097D8 001096D8 00000000 */   nop
.L001096DC:
/* 0097DC 001096DC 2500023C */  lui         $2, %hi(c_cb_sem)
/* 0097E0 001096E0 8C0240AC */  sw          $0, %lo(c_cb_sem)($2)
.L001096E4:
/* 0097E4 001096E4 C00200AE */  sw          $0, %lo(sceCdCbfunc_num)($16)
/* 0097E8 001096E8 1000BFDF */  ld          $31, 0x10($29)
.L001096EC:
/* 0097EC 001096EC 0000B0DF */  ld          $16, 0x0($29)
/* 0097F0 001096F0 0800E003 */  jr          $31
/* 0097F4 001096F4 2000BD27 */   addiu      $29, $29, 0x20
