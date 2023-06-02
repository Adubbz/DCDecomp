.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set3DSpriteFog__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 5DAA0 0015D9A0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 5DAA4 0015D9A4 8000BF7F */  sq         $31, 0x80($sp)
/* 5DAA8 0015D9A8 7000B77F */  sq         $23, 0x70($sp)
/* 5DAAC 0015D9AC 6000B67F */  sq         $22, 0x60($sp)
/* 5DAB0 0015D9B0 5000B57F */  sq         $21, 0x50($sp)
/* 5DAB4 0015D9B4 4000B47F */  sq         $20, 0x40($sp)
/* 5DAB8 0015D9B8 3000B37F */  sq         $19, 0x30($sp)
/* 5DABC 0015D9BC 2000B27F */  sq         $18, 0x20($sp)
/* 5DAC0 0015D9C0 1000B17F */  sq         $17, 0x10($sp)
/* 5DAC4 0015D9C4 0000B07F */  sq         $16, 0x0($sp)
/* 5DAC8 0015D9C8 28AE8070 */  paddub     $21, $4, $0
/* 5DACC 0015D9CC 28B6A070 */  paddub     $22, $5, $0
/* 5DAD0 0015D9D0 28A6C070 */  paddub     $20, $6, $0
/* 5DAD4 0015D9D4 289EE070 */  paddub     $19, $7, $0
/* 5DAD8 0015D9D8 28960071 */  paddub     $18, $8, $0
/* 5DADC 0015D9DC 288E2071 */  paddub     $17, $9, $0
/* 5DAE0 0015D9E0 28864071 */  paddub     $16, $10, $0
/* 5DAE4 0015D9E4 28BE6071 */  paddub     $23, $11, $0
/* 5DAE8 0015D9E8 A000C012 */  beqz       $22, .L0015DC6C
/* 5DAEC 0015D9EC 00000000 */   nop
/* 5DAF0 0015D9F0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 5DAF4 0015D9F4 9C00A2AF */  sw         $2, 0x9C($sp)
/* 5DAF8 0015D9F8 282E0070 */  paddub     $5, $0, $0
/* 5DAFC 0015D9FC 2083040C */  jal        sceVif1PkCnt
/* 5DB00 0015DA00 00000000 */   nop
/* 5DB04 0015DA04 2826A072 */  paddub     $4, $21, $0
/* 5DB08 0015DA08 282E0070 */  paddub     $5, $0, $0
/* 5DB0C 0015DA0C 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 5DB10 0015DA10 00000000 */   nop
/* 5DB14 0015DA14 C701023C */  lui        $2, %hi(GiftagAD)
/* 5DB18 0015DA18 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 5DB1C 0015DA1C 2826A072 */  paddub     $4, $21, $0
/* 5DB20 0015DA20 00004578 */  lq         $5, 0x0($2)
/* 5DB24 0015DA24 B083040C */  jal        sceVif1PkOpenGifTag
/* 5DB28 0015DA28 00000000 */   nop
/* 5DB2C 0015DA2C 2826A072 */  paddub     $4, $21, $0
/* 5DB30 0015DA30 14000524 */  addiu      $5, $0, 0x14
/* 5DB34 0015DA34 61000624 */  addiu      $6, $0, 0x61
/* 5DB38 0015DA38 0A84040C */  jal        sceVif1PkAddGsAD
/* 5DB3C 0015DA3C 00000000 */   nop
/* 5DB40 0015DA40 2826A072 */  paddub     $4, $21, $0
/* 5DB44 0015DA44 282E0070 */  paddub     $5, $0, $0
/* 5DB48 0015DA48 74010624 */  addiu      $6, $0, 0x174
/* 5DB4C 0015DA4C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5DB50 0015DA50 00000000 */   nop
/* 5DB54 0015DA54 FF00E232 */  andi       $2, $23, 0xFF
/* 5DB58 0015DA58 381E0200 */  dsll       $3, $2, 24
/* 5DB5C 0015DA5C 8000023C */  lui        $2, (0x808080 >> 16)
/* 5DB60 0015DA60 80804234 */  ori        $2, $2, (0x808080 & 0xFFFF)
/* 5DB64 0015DA64 25186200 */  or         $3, $3, $2
/* 5DB68 0015DA68 9C00A227 */  addiu      $2, $sp, 0x9C
/* 5DB6C 0015DA6C 0000429C */  lwu        $2, 0x0($2)
/* 5DB70 0015DA70 3C100200 */  dsll32     $2, $2, 0
/* 5DB74 0015DA74 25306200 */  or         $6, $3, $2
/* 5DB78 0015DA78 2826A072 */  paddub     $4, $21, $0
/* 5DB7C 0015DA7C 01000524 */  addiu      $5, $0, 0x1
/* 5DB80 0015DA80 0A84040C */  jal        sceVif1PkAddGsAD
/* 5DB84 0015DA84 00000000 */   nop
/* 5DB88 0015DA88 2826A072 */  paddub     $4, $21, $0
/* 5DB8C 0015DA8C 06000524 */  addiu      $5, $0, 0x6
/* 5DB90 0015DA90 2800C6DE */  ld         $6, 0x28($22)
/* 5DB94 0015DA94 0A84040C */  jal        sceVif1PkAddGsAD
/* 5DB98 0015DA98 00000000 */   nop
/* 5DB9C 0015DA9C 0400828E */  lw         $2, 0x4($20)
/* 5DBA0 0015DAA0 00110200 */  sll        $2, $2, 4
/* 5DBA4 0015DAA4 381C0200 */  dsll       $3, $2, 16
/* 5DBA8 0015DAA8 0000828E */  lw         $2, 0x0($20)
/* 5DBAC 0015DAAC 00110200 */  sll        $2, $2, 4
/* 5DBB0 0015DAB0 25304300 */  or         $6, $2, $3
/* 5DBB4 0015DAB4 2826A072 */  paddub     $4, $21, $0
/* 5DBB8 0015DAB8 03000524 */  addiu      $5, $0, 0x3
/* 5DBBC 0015DABC 0A84040C */  jal        sceVif1PkAddGsAD
/* 5DBC0 0015DAC0 00000000 */   nop
/* 5DBC4 0015DAC4 0400628E */  lw         $2, 0x4($19)
/* 5DBC8 0015DAC8 381C0200 */  dsll       $3, $2, 16
/* 5DBCC 0015DACC 0000628E */  lw         $2, 0x0($19)
/* 5DBD0 0015DAD0 25184300 */  or         $3, $2, $3
/* 5DBD4 0015DAD4 0800628E */  lw         $2, 0x8($19)
/* 5DBD8 0015DAD8 3C100200 */  dsll32     $2, $2, 0
/* 5DBDC 0015DADC 25184300 */  or         $3, $2, $3
/* 5DBE0 0015DAE0 0C00628E */  lw         $2, 0xC($19)
/* 5DBE4 0015DAE4 3C160200 */  dsll32     $2, $2, 24
/* 5DBE8 0015DAE8 25304300 */  or         $6, $2, $3
/* 5DBEC 0015DAEC 2826A072 */  paddub     $4, $21, $0
/* 5DBF0 0015DAF0 04000524 */  addiu      $5, $0, 0x4
/* 5DBF4 0015DAF4 0A84040C */  jal        sceVif1PkAddGsAD
/* 5DBF8 0015DAF8 00000000 */   nop
/* 5DBFC 0015DAFC 0400828E */  lw         $2, 0x4($20)
/* 5DC00 0015DB00 00110200 */  sll        $2, $2, 4
/* 5DC04 0015DB04 38240200 */  dsll       $4, $2, 16
/* 5DC08 0015DB08 0000838E */  lw         $3, 0x0($20)
/* 5DC0C 0015DB0C 0800828E */  lw         $2, 0x8($20)
/* 5DC10 0015DB10 21106200 */  addu       $2, $3, $2
/* 5DC14 0015DB14 00110200 */  sll        $2, $2, 4
/* 5DC18 0015DB18 25308200 */  or         $6, $4, $2
/* 5DC1C 0015DB1C 2826A072 */  paddub     $4, $21, $0
/* 5DC20 0015DB20 03000524 */  addiu      $5, $0, 0x3
/* 5DC24 0015DB24 0A84040C */  jal        sceVif1PkAddGsAD
/* 5DC28 0015DB28 00000000 */   nop
/* 5DC2C 0015DB2C 0400428E */  lw         $2, 0x4($18)
/* 5DC30 0015DB30 381C0200 */  dsll       $3, $2, 16
/* 5DC34 0015DB34 0000428E */  lw         $2, 0x0($18)
/* 5DC38 0015DB38 25184300 */  or         $3, $2, $3
/* 5DC3C 0015DB3C 0800428E */  lw         $2, 0x8($18)
/* 5DC40 0015DB40 3C100200 */  dsll32     $2, $2, 0
/* 5DC44 0015DB44 25184300 */  or         $3, $2, $3
/* 5DC48 0015DB48 0C00428E */  lw         $2, 0xC($18)
/* 5DC4C 0015DB4C 3C160200 */  dsll32     $2, $2, 24
/* 5DC50 0015DB50 25304300 */  or         $6, $2, $3
/* 5DC54 0015DB54 2826A072 */  paddub     $4, $21, $0
/* 5DC58 0015DB58 04000524 */  addiu      $5, $0, 0x4
/* 5DC5C 0015DB5C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5DC60 0015DB60 00000000 */   nop
/* 5DC64 0015DB64 0400838E */  lw         $3, 0x4($20)
/* 5DC68 0015DB68 0C00828E */  lw         $2, 0xC($20)
/* 5DC6C 0015DB6C 21106200 */  addu       $2, $3, $2
/* 5DC70 0015DB70 00110200 */  sll        $2, $2, 4
/* 5DC74 0015DB74 381C0200 */  dsll       $3, $2, 16
/* 5DC78 0015DB78 0000828E */  lw         $2, 0x0($20)
/* 5DC7C 0015DB7C 00110200 */  sll        $2, $2, 4
/* 5DC80 0015DB80 25304300 */  or         $6, $2, $3
/* 5DC84 0015DB84 2826A072 */  paddub     $4, $21, $0
/* 5DC88 0015DB88 03000524 */  addiu      $5, $0, 0x3
/* 5DC8C 0015DB8C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5DC90 0015DB90 00000000 */   nop
/* 5DC94 0015DB94 0400228E */  lw         $2, 0x4($17)
/* 5DC98 0015DB98 381C0200 */  dsll       $3, $2, 16
/* 5DC9C 0015DB9C 0000228E */  lw         $2, 0x0($17)
/* 5DCA0 0015DBA0 25184300 */  or         $3, $2, $3
/* 5DCA4 0015DBA4 0800228E */  lw         $2, 0x8($17)
/* 5DCA8 0015DBA8 3C100200 */  dsll32     $2, $2, 0
/* 5DCAC 0015DBAC 25184300 */  or         $3, $2, $3
/* 5DCB0 0015DBB0 0C00228E */  lw         $2, 0xC($17)
/* 5DCB4 0015DBB4 3C160200 */  dsll32     $2, $2, 24
/* 5DCB8 0015DBB8 25304300 */  or         $6, $2, $3
/* 5DCBC 0015DBBC 2826A072 */  paddub     $4, $21, $0
/* 5DCC0 0015DBC0 04000524 */  addiu      $5, $0, 0x4
/* 5DCC4 0015DBC4 0A84040C */  jal        sceVif1PkAddGsAD
/* 5DCC8 0015DBC8 00000000 */   nop
/* 5DCCC 0015DBCC 0400838E */  lw         $3, 0x4($20)
/* 5DCD0 0015DBD0 0C00828E */  lw         $2, 0xC($20)
/* 5DCD4 0015DBD4 21106200 */  addu       $2, $3, $2
/* 5DCD8 0015DBD8 00110200 */  sll        $2, $2, 4
/* 5DCDC 0015DBDC 38240200 */  dsll       $4, $2, 16
/* 5DCE0 0015DBE0 0000838E */  lw         $3, 0x0($20)
/* 5DCE4 0015DBE4 0800828E */  lw         $2, 0x8($20)
/* 5DCE8 0015DBE8 21106200 */  addu       $2, $3, $2
/* 5DCEC 0015DBEC 00110200 */  sll        $2, $2, 4
/* 5DCF0 0015DBF0 25304400 */  or         $6, $2, $4
/* 5DCF4 0015DBF4 2826A072 */  paddub     $4, $21, $0
/* 5DCF8 0015DBF8 03000524 */  addiu      $5, $0, 0x3
/* 5DCFC 0015DBFC 0A84040C */  jal        sceVif1PkAddGsAD
/* 5DD00 0015DC00 00000000 */   nop
/* 5DD04 0015DC04 0400028E */  lw         $2, 0x4($16)
/* 5DD08 0015DC08 381C0200 */  dsll       $3, $2, 16
/* 5DD0C 0015DC0C 0000028E */  lw         $2, 0x0($16)
/* 5DD10 0015DC10 25184300 */  or         $3, $2, $3
/* 5DD14 0015DC14 0800028E */  lw         $2, 0x8($16)
/* 5DD18 0015DC18 3C100200 */  dsll32     $2, $2, 0
/* 5DD1C 0015DC1C 25184300 */  or         $3, $2, $3
/* 5DD20 0015DC20 0C00028E */  lw         $2, 0xC($16)
/* 5DD24 0015DC24 3C160200 */  dsll32     $2, $2, 24
/* 5DD28 0015DC28 25304300 */  or         $6, $2, $3
/* 5DD2C 0015DC2C 2826A072 */  paddub     $4, $21, $0
/* 5DD30 0015DC30 04000524 */  addiu      $5, $0, 0x4
/* 5DD34 0015DC34 0A84040C */  jal        sceVif1PkAddGsAD
/* 5DD38 0015DC38 00000000 */   nop
/* 5DD3C 0015DC3C E88B8227 */  addiu      $2, $gp, -0x7418
/* 5DD40 0015DC40 2826A072 */  paddub     $4, $21, $0
/* 5DD44 0015DC44 47000524 */  addiu      $5, $0, 0x47
/* 5DD48 0015DC48 000046DC */  ld         $6, 0x0($2)
/* 5DD4C 0015DC4C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5DD50 0015DC50 00000000 */   nop
/* 5DD54 0015DC54 2826A072 */  paddub     $4, $21, $0
/* 5DD58 0015DC58 B683040C */  jal        sceVif1PkCloseGifTag
/* 5DD5C 0015DC5C 00000000 */   nop
/* 5DD60 0015DC60 2826A072 */  paddub     $4, $21, $0
/* 5DD64 0015DC64 A483040C */  jal        sceVif1PkCloseDirectCode
/* 5DD68 0015DC68 00000000 */   nop
.L0015DC6C:
/* 5DD6C 0015DC6C 8000BF7B */  lq         $31, 0x80($sp)
/* 5DD70 0015DC70 7000B77B */  lq         $23, 0x70($sp)
/* 5DD74 0015DC74 6000B67B */  lq         $22, 0x60($sp)
/* 5DD78 0015DC78 5000B57B */  lq         $21, 0x50($sp)
/* 5DD7C 0015DC7C 4000B47B */  lq         $20, 0x40($sp)
/* 5DD80 0015DC80 3000B37B */  lq         $19, 0x30($sp)
/* 5DD84 0015DC84 2000B27B */  lq         $18, 0x20($sp)
/* 5DD88 0015DC88 1000B17B */  lq         $17, 0x10($sp)
/* 5DD8C 0015DC8C 0000B07B */  lq         $16, 0x0($sp)
/* 5DD90 0015DC90 A000BD27 */  addiu      $sp, $sp, 0xA0
/* 5DD94 0015DC94 0800E003 */  jr         $31
/* 5DD98 0015DC98 00000000 */   nop
/* 5DD9C 0015DC9C 00000000 */  nop
