.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 5C100 0015C000 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 5C104 0015C004 4000BF7F */  sq         $31, 0x40($sp)
/* 5C108 0015C008 3000B37F */  sq         $19, 0x30($sp)
/* 5C10C 0015C00C 2000B27F */  sq         $18, 0x20($sp)
/* 5C110 0015C010 1000B17F */  sq         $17, 0x10($sp)
/* 5C114 0015C014 0000B07F */  sq         $16, 0x0($sp)
/* 5C118 0015C018 289E8070 */  paddub     $19, $4, $0
/* 5C11C 0015C01C 2896A070 */  paddub     $18, $5, $0
/* 5C120 0015C020 288EC070 */  paddub     $17, $6, $0
/* 5C124 0015C024 2886E070 */  paddub     $16, $7, $0
/* 5C128 0015C028 AE004012 */  beqz       $18, .L0015C2E4
/* 5C12C 0015C02C 00000000 */   nop
/* 5C130 0015C030 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 5C134 0015C034 6C00A2AF */  sw         $2, 0x6C($sp)
/* 5C138 0015C038 282E0070 */  paddub     $5, $0, $0
/* 5C13C 0015C03C 2083040C */  jal        sceVif1PkCnt
/* 5C140 0015C040 00000000 */   nop
/* 5C144 0015C044 28266072 */  paddub     $4, $19, $0
/* 5C148 0015C048 282E0070 */  paddub     $5, $0, $0
/* 5C14C 0015C04C 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 5C150 0015C050 00000000 */   nop
/* 5C154 0015C054 C701023C */  lui        $2, %hi(GiftagAD)
/* 5C158 0015C058 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 5C15C 0015C05C 28266072 */  paddub     $4, $19, $0
/* 5C160 0015C060 00004578 */  lq         $5, 0x0($2)
/* 5C164 0015C064 B083040C */  jal        sceVif1PkOpenGifTag
/* 5C168 0015C068 00000000 */   nop
/* 5C16C 0015C06C F886828F */  lw         $2, -0x7908($gp)
/* 5C170 0015C070 78110200 */  dsll       $2, $2, 5
/* 5C174 0015C074 41004634 */  ori        $6, $2, 0x41
/* 5C178 0015C078 28266072 */  paddub     $4, $19, $0
/* 5C17C 0015C07C 14000524 */  addiu      $5, $0, 0x14
/* 5C180 0015C080 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C184 0015C084 00000000 */   nop
/* 5C188 0015C088 28266072 */  paddub     $4, $19, $0
/* 5C18C 0015C08C 282E0070 */  paddub     $5, $0, $0
/* 5C190 0015C090 D6010624 */  addiu      $6, $0, 0x1D6
/* 5C194 0015C094 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C198 0015C098 00000000 */   nop
/* 5C19C 0015C09C 5800A227 */  addiu      $2, $sp, 0x58
/* 5C1A0 0015C0A0 E88B83DF */  ld         $3, -0x7418($gp)
/* 5C1A4 0015C0A4 000043FC */  sd         $3, 0x0($2)
/* 5C1A8 0015C0A8 5800A393 */  lbu        $3, 0x58($sp)
/* 5C1AC 0015C0AC 01000430 */  andi       $4, $0, 0x1
/* 5C1B0 0015C0B0 FEFF0624 */  addiu      $6, $0, -0x2
/* 5C1B4 0015C0B4 24186600 */  and        $3, $3, $6
/* 5C1B8 0015C0B8 25186400 */  or         $3, $3, $4
/* 5C1BC 0015C0BC 5800A3A3 */  sb         $3, 0x58($sp)
/* 5C1C0 0015C0C0 5800A597 */  lhu        $5, 0x58($sp)
/* 5C1C4 0015C0C4 FF000330 */  andi       $3, $0, 0xFF
/* 5C1C8 0015C0C8 00210300 */  sll        $4, $3, 4
/* 5C1CC 0015C0CC 0FF00324 */  addiu      $3, $0, -0xFF1
/* 5C1D0 0015C0D0 2418A300 */  and        $3, $5, $3
/* 5C1D4 0015C0D4 25186400 */  or         $3, $3, $4
/* 5C1D8 0015C0D8 5800A3A7 */  sh         $3, 0x58($sp)
/* 5C1DC 0015C0DC 5800A493 */  lbu        $4, 0x58($sp)
/* 5C1E0 0015C0E0 02000564 */  daddiu     $5, $0, 0x2
/* 5C1E4 0015C0E4 F1FF0324 */  addiu      $3, $0, -0xF
/* 5C1E8 0015C0E8 24188300 */  and        $3, $4, $3
/* 5C1EC 0015C0EC 25186500 */  or         $3, $3, $5
/* 5C1F0 0015C0F0 5800A3A3 */  sb         $3, 0x58($sp)
/* 5C1F4 0015C0F4 5A00A727 */  addiu      $7, $sp, 0x5A
/* 5C1F8 0015C0F8 0000E390 */  lbu        $3, 0x0($7)
/* 5C1FC 0015C0FC 01000464 */  daddiu     $4, $0, 0x1
/* 5C200 0015C100 24186600 */  and        $3, $3, $6
/* 5C204 0015C104 25186400 */  or         $3, $3, $4
/* 5C208 0015C108 0000E3A0 */  sb         $3, 0x0($7)
/* 5C20C 0015C10C 0000E490 */  lbu        $4, 0x0($7)
/* 5C210 0015C110 F9FF0324 */  addiu      $3, $0, -0x7
/* 5C214 0015C114 24188300 */  and        $3, $4, $3
/* 5C218 0015C118 25186500 */  or         $3, $3, $5
/* 5C21C 0015C11C 0000E3A0 */  sb         $3, 0x0($7)
/* 5C220 0015C120 28266072 */  paddub     $4, $19, $0
/* 5C224 0015C124 47000524 */  addiu      $5, $0, 0x47
/* 5C228 0015C128 000046DC */  ld         $6, 0x0($2)
/* 5C22C 0015C12C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C230 0015C130 00000000 */   nop
/* 5C234 0015C134 6000A627 */  addiu      $6, $sp, 0x60
/* 5C238 0015C138 F08B82DF */  ld         $2, -0x7410($gp)
/* 5C23C 0015C13C 0000C2FC */  sd         $2, 0x0($6)
/* 5C240 0015C140 6400A493 */  lbu        $4, 0x64($sp)
/* 5C244 0015C144 01000364 */  daddiu     $3, $0, 0x1
/* 5C248 0015C148 FEFF0224 */  addiu      $2, $0, -0x2
/* 5C24C 0015C14C 24108200 */  and        $2, $4, $2
/* 5C250 0015C150 25104300 */  or         $2, $2, $3
/* 5C254 0015C154 6400A2A3 */  sb         $2, 0x64($sp)
/* 5C258 0015C158 28266072 */  paddub     $4, $19, $0
/* 5C25C 0015C15C 4E000524 */  addiu      $5, $0, 0x4E
/* 5C260 0015C160 0000C6DC */  ld         $6, 0x0($6)
/* 5C264 0015C164 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C268 0015C168 00000000 */   nop
/* 5C26C 0015C16C 6C00A227 */  addiu      $2, $sp, 0x6C
/* 5C270 0015C170 0000429C */  lwu        $2, 0x0($2)
/* 5C274 0015C174 3C180200 */  dsll32     $3, $2, 0
/* 5C278 0015C178 80800234 */  ori        $2, $0, 0x8080
/* 5C27C 0015C17C 38140200 */  dsll       $2, $2, 16
/* 5C280 0015C180 80804234 */  ori        $2, $2, 0x8080
/* 5C284 0015C184 25306200 */  or         $6, $3, $2
/* 5C288 0015C188 28266072 */  paddub     $4, $19, $0
/* 5C28C 0015C18C 01000524 */  addiu      $5, $0, 0x1
/* 5C290 0015C190 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C294 0015C194 00000000 */   nop
/* 5C298 0015C198 28266072 */  paddub     $4, $19, $0
/* 5C29C 0015C19C 06000524 */  addiu      $5, $0, 0x6
/* 5C2A0 0015C1A0 280046DE */  ld         $6, 0x28($18)
/* 5C2A4 0015C1A4 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C2A8 0015C1A8 00000000 */   nop
/* 5C2AC 0015C1AC 0400028E */  lw         $2, 0x4($16)
/* 5C2B0 0015C1B0 00110200 */  sll        $2, $2, 4
/* 5C2B4 0015C1B4 381C0200 */  dsll       $3, $2, 16
/* 5C2B8 0015C1B8 0000028E */  lw         $2, 0x0($16)
/* 5C2BC 0015C1BC 00110200 */  sll        $2, $2, 4
/* 5C2C0 0015C1C0 25304300 */  or         $6, $2, $3
/* 5C2C4 0015C1C4 28266072 */  paddub     $4, $19, $0
/* 5C2C8 0015C1C8 03000524 */  addiu      $5, $0, 0x3
/* 5C2CC 0015C1CC 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C2D0 0015C1D0 00000000 */   nop
/* 5C2D4 0015C1D4 0400228E */  lw         $2, 0x4($17)
/* 5C2D8 0015C1D8 C0100200 */  sll        $2, $2, 3
/* 5C2DC 0015C1DC 00794224 */  addiu      $2, $2, 0x7900
/* 5C2E0 0015C1E0 3C100200 */  dsll32     $2, $2, 0
/* 5C2E4 0015C1E4 3F100200 */  dsra32     $2, $2, 0
/* 5C2E8 0015C1E8 381C0200 */  dsll       $3, $2, 16
/* 5C2EC 0015C1EC 0000228E */  lw         $2, 0x0($17)
/* 5C2F0 0015C1F0 00110200 */  sll        $2, $2, 4
/* 5C2F4 0015C1F4 006C4224 */  addiu      $2, $2, 0x6C00
/* 5C2F8 0015C1F8 3C100200 */  dsll32     $2, $2, 0
/* 5C2FC 0015C1FC 3F100200 */  dsra32     $2, $2, 0
/* 5C300 0015C200 25304300 */  or         $6, $2, $3
/* 5C304 0015C204 28266072 */  paddub     $4, $19, $0
/* 5C308 0015C208 04000524 */  addiu      $5, $0, 0x4
/* 5C30C 0015C20C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C310 0015C210 00000000 */   nop
/* 5C314 0015C214 0400038E */  lw         $3, 0x4($16)
/* 5C318 0015C218 0C00028E */  lw         $2, 0xC($16)
/* 5C31C 0015C21C 21106200 */  addu       $2, $3, $2
/* 5C320 0015C220 00110200 */  sll        $2, $2, 4
/* 5C324 0015C224 38240200 */  dsll       $4, $2, 16
/* 5C328 0015C228 0000038E */  lw         $3, 0x0($16)
/* 5C32C 0015C22C 0800028E */  lw         $2, 0x8($16)
/* 5C330 0015C230 21106200 */  addu       $2, $3, $2
/* 5C334 0015C234 00110200 */  sll        $2, $2, 4
/* 5C338 0015C238 25304400 */  or         $6, $2, $4
/* 5C33C 0015C23C 28266072 */  paddub     $4, $19, $0
/* 5C340 0015C240 03000524 */  addiu      $5, $0, 0x3
/* 5C344 0015C244 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C348 0015C248 00000000 */   nop
/* 5C34C 0015C24C 0400238E */  lw         $3, 0x4($17)
/* 5C350 0015C250 0C00228E */  lw         $2, 0xC($17)
/* 5C354 0015C254 21106200 */  addu       $2, $3, $2
/* 5C358 0015C258 C0100200 */  sll        $2, $2, 3
/* 5C35C 0015C25C 00794224 */  addiu      $2, $2, 0x7900
/* 5C360 0015C260 3C100200 */  dsll32     $2, $2, 0
/* 5C364 0015C264 3F100200 */  dsra32     $2, $2, 0
/* 5C368 0015C268 38240200 */  dsll       $4, $2, 16
/* 5C36C 0015C26C 0000238E */  lw         $3, 0x0($17)
/* 5C370 0015C270 0800228E */  lw         $2, 0x8($17)
/* 5C374 0015C274 21106200 */  addu       $2, $3, $2
/* 5C378 0015C278 00110200 */  sll        $2, $2, 4
/* 5C37C 0015C27C FF6B4224 */  addiu      $2, $2, 0x6BFF
/* 5C380 0015C280 3C100200 */  dsll32     $2, $2, 0
/* 5C384 0015C284 3F100200 */  dsra32     $2, $2, 0
/* 5C388 0015C288 25304400 */  or         $6, $2, $4
/* 5C38C 0015C28C 28266072 */  paddub     $4, $19, $0
/* 5C390 0015C290 04000524 */  addiu      $5, $0, 0x4
/* 5C394 0015C294 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C398 0015C298 00000000 */   nop
/* 5C39C 0015C29C E88B8227 */  addiu      $2, $gp, -0x7418
/* 5C3A0 0015C2A0 28266072 */  paddub     $4, $19, $0
/* 5C3A4 0015C2A4 47000524 */  addiu      $5, $0, 0x47
/* 5C3A8 0015C2A8 000046DC */  ld         $6, 0x0($2)
/* 5C3AC 0015C2AC 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C3B0 0015C2B0 00000000 */   nop
/* 5C3B4 0015C2B4 F08B8227 */  addiu      $2, $gp, -0x7410
/* 5C3B8 0015C2B8 28266072 */  paddub     $4, $19, $0
/* 5C3BC 0015C2BC 4E000524 */  addiu      $5, $0, 0x4E
/* 5C3C0 0015C2C0 000046DC */  ld         $6, 0x0($2)
/* 5C3C4 0015C2C4 0A84040C */  jal        sceVif1PkAddGsAD
/* 5C3C8 0015C2C8 00000000 */   nop
/* 5C3CC 0015C2CC 28266072 */  paddub     $4, $19, $0
/* 5C3D0 0015C2D0 B683040C */  jal        sceVif1PkCloseGifTag
/* 5C3D4 0015C2D4 00000000 */   nop
/* 5C3D8 0015C2D8 28266072 */  paddub     $4, $19, $0
/* 5C3DC 0015C2DC A483040C */  jal        sceVif1PkCloseDirectCode
/* 5C3E0 0015C2E0 00000000 */   nop
.L0015C2E4:
/* 5C3E4 0015C2E4 4000BF7B */  lq         $31, 0x40($sp)
/* 5C3E8 0015C2E8 3000B37B */  lq         $19, 0x30($sp)
/* 5C3EC 0015C2EC 2000B27B */  lq         $18, 0x20($sp)
/* 5C3F0 0015C2F0 1000B17B */  lq         $17, 0x10($sp)
/* 5C3F4 0015C2F4 0000B07B */  lq         $16, 0x0($sp)
/* 5C3F8 0015C2F8 7000BD27 */  addiu      $sp, $sp, 0x70
/* 5C3FC 0015C2FC 0800E003 */  jr         $31
/* 5C400 0015C300 00000000 */   nop
/* 5C404 0015C304 00000000 */  nop
/* 5C408 0015C308 00000000 */  nop
/* 5C40C 0015C30C 00000000 */  nop
