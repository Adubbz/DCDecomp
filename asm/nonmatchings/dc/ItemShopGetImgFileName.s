.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ItemShopGetImgFileName__FiiPc
/* EDC60 001EDB60 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* EDC64 001EDB64 1000BF7F */  sq         $31, 0x10($sp)
/* EDC68 001EDB68 0000B07F */  sq         $16, 0x0($sp)
/* EDC6C 001EDB6C 2886C070 */  paddub     $16, $6, $0
/* EDC70 001EDB70 2900023C */  lui        $2, %hi(_2144)
/* EDC74 001EDB74 20294724 */  addiu      $7, $2, %lo(_2144)
/* EDC78 001EDB78 2000A627 */  addiu      $6, $sp, 0x20
/* EDC7C 001EDB7C 09000324 */  addiu      $3, $0, 0x9
.L001EDB80:
/* EDC80 001EDB80 0000E278 */  lq         $2, 0x0($7)
/* EDC84 001EDB84 1000E724 */  addiu      $7, $7, 0x10
/* EDC88 001EDB88 FFFF6324 */  addiu      $3, $3, -0x1
/* EDC8C 001EDB8C 0000C27C */  sq         $2, 0x0($6)
/* EDC90 001EDB90 1000C624 */  addiu      $6, $6, 0x10
/* EDC94 001EDB94 FAFF601C */  bgtz       $3, .L001EDB80
/* EDC98 001EDB98 00000000 */   nop
/* EDC9C 001EDB9C C0100400 */  sll        $2, $4, 3
/* EDCA0 001EDBA0 21104400 */  addu       $2, $2, $4
/* EDCA4 001EDBA4 C0100200 */  sll        $2, $2, 3
/* EDCA8 001EDBA8 21185D00 */  addu       $3, $2, $sp
/* EDCAC 001EDBAC 80100500 */  sll        $2, $5, 2
/* EDCB0 001EDBB0 21104300 */  addu       $2, $2, $3
/* EDCB4 001EDBB4 28260072 */  paddub     $4, $16, $0
/* EDCB8 001EDBB8 2000458C */  lw         $5, 0x20($2)
/* EDCBC 001EDBBC 5A15040C */  jal        strcpy
/* EDCC0 001EDBC0 00000000 */   nop
/* EDCC4 001EDBC4 28260072 */  paddub     $4, $16, $0
/* EDCC8 001EDBC8 2A00023C */  lui        $2, %hi(_2146)
/* EDCCC 001EDBCC 68D34524 */  addiu      $5, $2, %lo(_2146)
/* EDCD0 001EDBD0 BC14040C */  jal        strcat
/* EDCD4 001EDBD4 00000000 */   nop
/* EDCD8 001EDBD8 1000BF7B */  lq         $31, 0x10($sp)
/* EDCDC 001EDBDC 0000B07B */  lq         $16, 0x0($sp)
/* EDCE0 001EDBE0 B000BD27 */  addiu      $sp, $sp, 0xB0
/* EDCE4 001EDBE4 0800E003 */  jr         $31
/* EDCE8 001EDBE8 00000000 */   nop
/* EDCEC 001EDBEC 00000000 */  nop
