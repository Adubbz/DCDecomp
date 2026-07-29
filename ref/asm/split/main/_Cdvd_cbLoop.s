.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _Cdvd_cbLoop
/* 0097F8 001096F8 70FFBD27 */  addiu       $29, $29, -0x90
/* 0097FC 001096FC 7000B7FF */  sd          $23, 0x70($29)
/* 009800 00109700 6000B6FF */  sd          $22, 0x60($29)
/* 009804 00109704 2500173C */  lui         $23, %hi(cb_semid)
/* 009808 00109708 5000B5FF */  sd          $21, 0x50($29)
/* 00980C 0010970C 2500163C */  lui         $22, %hi(cb_thid)
/* 009810 00109710 4000B4FF */  sd          $20, 0x40($29)
/* 009814 00109714 2500153C */  lui         $21, %hi(CD_debug)
/* 009818 00109718 3000B3FF */  sd          $19, 0x30($29)
/* 00981C 0010971C 2900143C */  lui         $20, %hi(RO_00296F98)
/* 009820 00109720 2000B2FF */  sd          $18, 0x20($29)
/* 009824 00109724 2500133C */  lui         $19, %hi(sceCdCbfunc_num)
/* 009828 00109728 1000B1FF */  sd          $17, 0x10($29)
/* 00982C 0010972C 2500123C */  lui         $18, %hi(c_cb_sem)
/* 009830 00109730 0000B0FF */  sd          $16, 0x0($29)
/* 009834 00109734 2500113C */  lui         $17, %hi(sceCdCbfunc)
/* 009838 00109738 8000BFFF */  sd          $31, 0x80($29)
/* 00983C 0010973C 2500103C */  lui         $16, %hi(sceCdCbfunc_number)
.L00109740:
/* 009840 00109740 D850040C */  jal         WaitSema
/* 009844 00109744 8802E48E */   lw         $4, %lo(cb_semid)($23)
/* 009848 00109748 C002638E */  lw          $3, %lo(sceCdCbfunc_num)($19)
/* 00984C 0010974C FFFF0224 */  addiu       $2, $0, -0x1
/* 009850 00109750 06006214 */  bne         $3, $2, .L0010976C
/* 009854 00109754 7002A28E */   lw         $2, %lo(CD_debug)($21)
/* 009858 00109758 8C0240AE */  sw          $0, %lo(c_cb_sem)($18)
/* 00985C 0010975C 7C02C0AE */  sw          $0, %lo(cb_thid)($22)
/* 009860 00109760 5850040C */  jal         ExitDeleteThread
/* 009864 00109764 C00260AE */   sw         $0, %lo(sceCdCbfunc_num)($19)
/* 009868 00109768 7002A28E */  lw          $2, %lo(CD_debug)($21)
.L0010976C:
/* 00986C 0010976C 04004018 */  blez        $2, .L00109780
/* 009870 00109770 986F8426 */   addiu      $4, $20, %lo(RO_00296F98)
/* 009874 00109774 BC02258E */  lw          $5, %lo(sceCdCbfunc)($17)
/* 009878 00109778 A611040C */  jal         printf
/* 00987C 0010977C C402068E */   lw         $6, %lo(sceCdCbfunc_number)($16)
.L00109780:
/* 009880 00109780 BC02238E */  lw          $3, %lo(sceCdCbfunc)($17)
/* 009884 00109784 06006010 */  beqz        $3, .L001097A0
/* 009888 00109788 00000000 */   nop
/* 00988C 0010978C C402028E */  lw          $2, %lo(sceCdCbfunc_number)($16)
/* 009890 00109790 03004010 */  beqz        $2, .L001097A0
/* 009894 00109794 00000000 */   nop
/* 009898 00109798 09F86000 */  jalr        $3
/* 00989C 0010979C C402048E */   lw         $4, %lo(sceCdCbfunc_number)($16)
.L001097A0:
/* 0098A0 001097A0 C402038E */  lw          $3, %lo(sceCdCbfunc_number)($16)
/* 0098A4 001097A4 0B000224 */  addiu       $2, $0, 0xB
/* 0098A8 001097A8 03006214 */  bne         $3, $2, .L001097B8
/* 0098AC 001097AC 00000000 */   nop
/* 0098B0 001097B0 D826040C */  jal         PowerOffCB
/* 0098B4 001097B4 00000000 */   nop
.L001097B8:
/* 0098B8 001097B8 E1FF0010 */  b           .L00109740
/* 0098BC 001097BC 8C0240AE */   sw         $0, %lo(c_cb_sem)($18)
