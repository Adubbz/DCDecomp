.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw__13CSHOT_FIREBARFv
/* 0AF2E0 001AF1E0 90FFBD27 */  addiu       $29, $29, -0x70
/* 0AF2E4 001AF1E4 6000BF7F */  sq          $31, 0x60($29)
/* 0AF2E8 001AF1E8 5000B57F */  sq          $21, 0x50($29)
/* 0AF2EC 001AF1EC 4000B47F */  sq          $20, 0x40($29)
/* 0AF2F0 001AF1F0 3000B37F */  sq          $19, 0x30($29)
/* 0AF2F4 001AF1F4 2000B27F */  sq          $18, 0x20($29)
/* 0AF2F8 001AF1F8 1000B17F */  sq          $17, 0x10($29)
/* 0AF2FC 001AF1FC 0000B07F */  sq          $16, 0x0($29)
/* 0AF300 001AF200 28AE8070 */  paddub      $21, $4, $0
/* 0AF304 001AF204 28860070 */  paddub      $16, $0, $0
/* 0AF308 001AF208 289E0070 */  paddub      $19, $0, $0
/* 0AF30C 001AF20C 47000010 */  b           .L001AF32C
/* 0AF310 001AF210 00000000 */   nop
.L001AF214:
/* 0AF314 001AF214 80A01300 */  sll         $20, $19, 2
/* 0AF318 001AF218 21189502 */  addu        $3, $20, $21
/* 0AF31C 001AF21C 000C668C */  lw          $6, 0xC00($3)
/* 0AF320 001AF220 FFFF0324 */  addiu       $3, $0, -0x1
/* 0AF324 001AF224 4000C310 */  beq         $6, $3, .L001AF328
/* 0AF328 001AF228 00000000 */   nop
/* 0AF32C 001AF22C 08000016 */  bnez        $16, .L001AF250
/* 0AF330 001AF230 00000000 */   nop
/* 0AF334 001AF234 C701023C */  lui         $2, %hi(TexManager)
/* 0AF338 001AF238 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0AF33C 001AF23C D48B858F */  lw          $5, -0x742C($28)
/* 0AF340 001AF240 46000624 */  addiu       $6, $0, 0x46
/* 0AF344 001AF244 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0AF348 001AF248 00000000 */   nop
/* 0AF34C 001AF24C 01001024 */  addiu       $16, $0, 0x1
.L001AF250:
/* 0AF350 001AF250 21109502 */  addu        $2, $20, $21
/* 0AF354 001AF254 000B438C */  lw          $3, 0xB00($2)
/* 0AF358 001AF258 04000224 */  addiu       $2, $0, 0x4
/* 0AF35C 001AF25C 1C006210 */  beq         $3, $2, .L001AF2D0
/* 0AF360 001AF260 00000000 */   nop
/* 0AF364 001AF264 03000224 */  addiu       $2, $0, 0x3
/* 0AF368 001AF268 15006210 */  beq         $3, $2, .L001AF2C0
/* 0AF36C 001AF26C 00000000 */   nop
/* 0AF370 001AF270 02000224 */  addiu       $2, $0, 0x2
/* 0AF374 001AF274 0E006210 */  beq         $3, $2, .L001AF2B0
/* 0AF378 001AF278 00000000 */   nop
/* 0AF37C 001AF27C 01001224 */  addiu       $18, $0, 0x1
/* 0AF380 001AF280 08007210 */  beq         $3, $18, .L001AF2A4
/* 0AF384 001AF284 00000000 */   nop
/* 0AF388 001AF288 03006010 */  beqz        $3, .L001AF298
/* 0AF38C 001AF28C 00000000 */   nop
/* 0AF390 001AF290 13000010 */  b           .L001AF2E0
/* 0AF394 001AF294 00000000 */   nop
.L001AF298:
/* 0AF398 001AF298 288E0070 */  paddub      $17, $0, $0
/* 0AF39C 001AF29C 11000010 */  b           .L001AF2E4
/* 0AF3A0 001AF2A0 00000000 */   nop
.L001AF2A4:
/* 0AF3A4 001AF2A4 288E4072 */  paddub      $17, $18, $0
/* 0AF3A8 001AF2A8 0E000010 */  b           .L001AF2E4
/* 0AF3AC 001AF2AC 00000000 */   nop
.L001AF2B0:
/* 0AF3B0 001AF2B0 01001124 */  addiu       $17, $0, 0x1
/* 0AF3B4 001AF2B4 28960070 */  paddub      $18, $0, $0
/* 0AF3B8 001AF2B8 0A000010 */  b           .L001AF2E4
/* 0AF3BC 001AF2BC 00000000 */   nop
.L001AF2C0:
/* 0AF3C0 001AF2C0 288E0070 */  paddub      $17, $0, $0
/* 0AF3C4 001AF2C4 28960070 */  paddub      $18, $0, $0
/* 0AF3C8 001AF2C8 06000010 */  b           .L001AF2E4
/* 0AF3CC 001AF2CC 00000000 */   nop
.L001AF2D0:
/* 0AF3D0 001AF2D0 02001124 */  addiu       $17, $0, 0x2
/* 0AF3D4 001AF2D4 01001224 */  addiu       $18, $0, 0x1
/* 0AF3D8 001AF2D8 02000010 */  b           .L001AF2E4
/* 0AF3DC 001AF2DC 00000000 */   nop
.L001AF2E0:
/* 0AF3E0 001AF2E0 288E0070 */  paddub      $17, $0, $0
.L001AF2E4:
/* 0AF3E4 001AF2E4 21109502 */  addu        $2, $20, $21
/* 0AF3E8 001AF2E8 00094CC4 */  lwc1        $f12, 0x900($2)
/* 0AF3EC 001AF2EC 2C44040C */  jal         fptosi
/* 0AF3F0 001AF2F0 00000000 */   nop
/* 0AF3F4 001AF2F4 FF004A30 */  andi        $10, $2, 0xFF
/* 0AF3F8 001AF2F8 00111300 */  sll         $2, $19, 4
/* 0AF3FC 001AF2FC 2120A202 */  addu        $4, $21, $2
/* 0AF400 001AF300 21189502 */  addu        $3, $20, $21
/* 0AF404 001AF304 C0311100 */  sll         $6, $17, 7
/* 0AF408 001AF308 C0391200 */  sll         $7, $18, 7
/* 0AF40C 001AF30C 2A00023C */  lui         $2, %hi(LIT_1211)
/* 0AF410 001AF310 30B54524 */  addiu       $5, $2, %lo(LIT_1211)
/* 0AF414 001AF314 00086CC4 */  lwc1        $f12, 0x800($3)
/* 0AF418 001AF318 80000824 */  addiu       $8, $0, 0x80
/* 0AF41C 001AF31C 284E0071 */  paddub      $9, $8, $0
/* 0AF420 001AF320 C0AE060C */  jal         set3DCellModel__FPfPcfiiiiUc
/* 0AF424 001AF324 00000000 */   nop
.L001AF328:
/* 0AF428 001AF328 01007326 */  addiu       $19, $19, 0x1
.L001AF32C:
/* 0AF42C 001AF32C 1800632A */  slti        $3, $19, 0x18
/* 0AF430 001AF330 B8FF6014 */  bnez        $3, .L001AF214
/* 0AF434 001AF334 00000000 */   nop
/* 0AF438 001AF338 6000BF7B */  lq          $31, 0x60($29)
/* 0AF43C 001AF33C 5000B57B */  lq          $21, 0x50($29)
/* 0AF440 001AF340 4000B47B */  lq          $20, 0x40($29)
/* 0AF444 001AF344 3000B37B */  lq          $19, 0x30($29)
/* 0AF448 001AF348 2000B27B */  lq          $18, 0x20($29)
/* 0AF44C 001AF34C 1000B17B */  lq          $17, 0x10($29)
/* 0AF450 001AF350 0000B07B */  lq          $16, 0x0($29)
/* 0AF454 001AF354 7000BD27 */  addiu       $29, $29, 0x70
/* 0AF458 001AF358 0800E003 */  jr          $31
/* 0AF45C 001AF35C 00000000 */   nop
