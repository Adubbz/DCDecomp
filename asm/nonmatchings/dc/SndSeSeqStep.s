.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSeSeqStep__Fv
/* 5B0A0 0015AFA0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5B0A4 0015AFA4 2000BF7F */  sq         $31, 0x20($sp)
/* 5B0A8 0015AFA8 1000B17F */  sq         $17, 0x10($sp)
/* 5B0AC 0015AFAC 0000B07F */  sq         $16, 0x0($sp)
/* 5B0B0 0015AFB0 28860070 */  paddub     $16, $0, $0
/* 5B0B4 0015AFB4 1F000010 */  b          .L0015B034
/* 5B0B8 0015AFB8 00000000 */   nop
.L0015AFBC:
/* 5B0BC 0015AFBC C0201000 */  sll        $4, $16, 3
/* 5B0C0 0015AFC0 D001033C */  lui        $3, %hi(se_seq)
/* 5B0C4 0015AFC4 30B56324 */  addiu      $3, $3, %lo(se_seq)
/* 5B0C8 0015AFC8 21886400 */  addu       $17, $3, $4
/* 5B0CC 0015AFCC 00002486 */  lh         $4, 0x0($17)
/* 5B0D0 0015AFD0 17008004 */  bltz       $4, .L0015B030
/* 5B0D4 0015AFD4 00000000 */   nop
/* 5B0D8 0015AFD8 04002386 */  lh         $3, 0x4($17)
/* 5B0DC 0015AFDC 05006014 */  bnez       $3, .L0015AFF4
/* 5B0E0 0015AFE0 00000000 */   nop
/* 5B0E4 0015AFE4 06002686 */  lh         $6, 0x6($17)
/* 5B0E8 0015AFE8 FFFF0524 */  addiu      $5, $0, -0x1
/* 5B0EC 0015AFEC AC69050C */  jal        SndSePlay__Fiii
/* 5B0F0 0015AFF0 00000000 */   nop
.L0015AFF4:
/* 5B0F4 0015AFF4 04002486 */  lh         $4, 0x4($17)
/* 5B0F8 0015AFF8 02002386 */  lh         $3, 0x2($17)
/* 5B0FC 0015AFFC 2A188300 */  slt        $3, $4, $3
/* 5B100 0015B000 08006014 */  bnez       $3, .L0015B024
/* 5B104 0015B004 00000000 */   nop
/* 5B108 0015B008 00002486 */  lh         $4, 0x0($17)
/* 5B10C 0015B00C 06002586 */  lh         $5, 0x6($17)
/* 5B110 0015B010 2C6A050C */  jal        SndSeStop__Fii
/* 5B114 0015B014 00000000 */   nop
/* 5B118 0015B018 28262072 */  paddub     $4, $17, $0
/* 5B11C 0015B01C 806B050C */  jal        InitSeSeq__FP10SND_SE_SEQ
/* 5B120 0015B020 00000000 */   nop
.L0015B024:
/* 5B124 0015B024 04002386 */  lh         $3, 0x4($17)
/* 5B128 0015B028 01006324 */  addiu      $3, $3, 0x1
/* 5B12C 0015B02C 040023A6 */  sh         $3, 0x4($17)
.L0015B030:
/* 5B130 0015B030 01001026 */  addiu      $16, $16, 0x1
.L0015B034:
/* 5B134 0015B034 2000032A */  slti       $3, $16, 0x20
/* 5B138 0015B038 E0FF6014 */  bnez       $3, .L0015AFBC
/* 5B13C 0015B03C 00000000 */   nop
/* 5B140 0015B040 2000BF7B */  lq         $31, 0x20($sp)
/* 5B144 0015B044 1000B17B */  lq         $17, 0x10($sp)
/* 5B148 0015B048 0000B07B */  lq         $16, 0x0($sp)
/* 5B14C 0015B04C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 5B150 0015B050 0800E003 */  jr         $31
/* 5B154 0015B054 00000000 */   nop
/* 5B158 0015B058 00000000 */  nop
/* 5B15C 0015B05C 00000000 */  nop
