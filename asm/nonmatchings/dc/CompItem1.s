.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CompItem1__Fii
/* EBC50 001EBB50 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* EBC54 001EBB54 3000BF7F */  sq         $31, 0x30($sp)
/* EBC58 001EBB58 2000B27F */  sq         $18, 0x20($sp)
/* EBC5C 001EBB5C 1000B17F */  sq         $17, 0x10($sp)
/* EBC60 001EBB60 0000B07F */  sq         $16, 0x0($sp)
/* EBC64 001EBB64 288E8070 */  paddub     $17, $4, $0
/* EBC68 001EBB68 2886A070 */  paddub     $16, $5, $0
/* EBC6C 001EBB6C A043070C */  jal        GetItemData__Fi
/* EBC70 001EBB70 00000000 */   nop
/* EBC74 001EBB74 28964070 */  paddub     $18, $2, $0
/* EBC78 001EBB78 28260072 */  paddub     $4, $16, $0
/* EBC7C 001EBB7C A043070C */  jal        GetItemData__Fi
/* EBC80 001EBB80 00000000 */   nop
/* EBC84 001EBB84 28260070 */  paddub     $4, $0, $0
/* EBC88 001EBB88 282E0070 */  paddub     $5, $0, $0
/* EBC8C 001EBB8C 08004012 */  beqz       $18, .L001EBBB0
/* EBC90 001EBB90 00000000 */   nop
/* EBC94 001EBB94 00004386 */  lh         $3, 0x0($18)
/* EBC98 001EBB98 80200300 */  sll        $4, $3, 2
/* EBC9C 001EBB9C 2900033C */  lui        $3, %hi(sort_table)
/* EBCA0 001EBBA0 D0276324 */  addiu      $3, $3, %lo(sort_table)
/* EBCA4 001EBBA4 21186400 */  addu       $3, $3, $4
/* EBCA8 001EBBA8 0000648C */  lw         $4, 0x0($3)
/* EBCAC 001EBBAC 00000000 */  nop
.L001EBBB0:
/* EBCB0 001EBBB0 08004010 */  beqz       $2, .L001EBBD4
/* EBCB4 001EBBB4 00000000 */   nop
/* EBCB8 001EBBB8 00004284 */  lh         $2, 0x0($2)
/* EBCBC 001EBBBC 80180200 */  sll        $3, $2, 2
/* EBCC0 001EBBC0 2900023C */  lui        $2, %hi(sort_table)
/* EBCC4 001EBBC4 D0274224 */  addiu      $2, $2, %lo(sort_table)
/* EBCC8 001EBBC8 21104300 */  addu       $2, $2, $3
/* EBCCC 001EBBCC 0000458C */  lw         $5, 0x0($2)
/* EBCD0 001EBBD0 00000000 */  nop
.L001EBBD4:
/* EBCD4 001EBBD4 8400212A */  slti       $at, $17, 0x84
/* EBCD8 001EBBD8 02002010 */  beqz       $at, .L001EBBE4
/* EBCDC 001EBBDC 00000000 */   nop
/* EBCE0 001EBBE0 09000424 */  addiu      $4, $0, 0x9
.L001EBBE4:
/* EBCE4 001EBBE4 8400012A */  slti       $at, $16, 0x84
/* EBCE8 001EBBE8 02002010 */  beqz       $at, .L001EBBF4
/* EBCEC 001EBBEC 00000000 */   nop
/* EBCF0 001EBBF0 09000524 */  addiu      $5, $0, 0x9
.L001EBBF4:
/* EBCF4 001EBBF4 2A08A400 */  slt        $at, $5, $4
/* EBCF8 001EBBF8 04002010 */  beqz       $at, .L001EBC0C
/* EBCFC 001EBBFC 00000000 */   nop
/* EBD00 001EBC00 01000224 */  addiu      $2, $0, 0x1
/* EBD04 001EBC04 12000010 */  b          .L001EBC50
/* EBD08 001EBC08 00000000 */   nop
.L001EBC0C:
/* EBD0C 001EBC0C 2A088500 */  slt        $at, $4, $5
/* EBD10 001EBC10 04002010 */  beqz       $at, .L001EBC24
/* EBD14 001EBC14 00000000 */   nop
/* EBD18 001EBC18 FFFF0224 */  addiu      $2, $0, -0x1
/* EBD1C 001EBC1C 0C000010 */  b          .L001EBC50
/* EBD20 001EBC20 00000000 */   nop
.L001EBC24:
/* EBD24 001EBC24 2A081102 */  slt        $at, $16, $17
/* EBD28 001EBC28 04002010 */  beqz       $at, .L001EBC3C
/* EBD2C 001EBC2C 00000000 */   nop
/* EBD30 001EBC30 01000224 */  addiu      $2, $0, 0x1
/* EBD34 001EBC34 06000010 */  b          .L001EBC50
/* EBD38 001EBC38 00000000 */   nop
.L001EBC3C:
/* EBD3C 001EBC3C 2A083002 */  slt        $at, $17, $16
/* EBD40 001EBC40 FFFF0224 */  addiu      $2, $0, -0x1
/* EBD44 001EBC44 0A100100 */  movz       $2, $0, $at
/* EBD48 001EBC48 01000010 */  b          .L001EBC50
/* EBD4C 001EBC4C 00000000 */   nop
.L001EBC50:
/* EBD50 001EBC50 3000BF7B */  lq         $31, 0x30($sp)
/* EBD54 001EBC54 2000B27B */  lq         $18, 0x20($sp)
/* EBD58 001EBC58 1000B17B */  lq         $17, 0x10($sp)
/* EBD5C 001EBC5C 0000B07B */  lq         $16, 0x0($sp)
/* EBD60 001EBC60 4000BD27 */  addiu      $sp, $sp, 0x40
/* EBD64 001EBC64 0800E003 */  jr         $31
/* EBD68 001EBC68 00000000 */   nop
/* EBD6C 001EBC6C 00000000 */  nop
