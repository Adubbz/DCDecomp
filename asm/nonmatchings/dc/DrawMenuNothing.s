.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMenuNothing__FiiiiPcii
/* 10C170 0020C070 20FEBD27 */  addiu      $sp, $sp, -0x1E0
/* 10C174 0020C074 9000BF7F */  sq         $31, 0x90($sp)
/* 10C178 0020C078 8000BE7F */  sq         $fp, 0x80($sp)
/* 10C17C 0020C07C 7000B77F */  sq         $23, 0x70($sp)
/* 10C180 0020C080 6000B67F */  sq         $22, 0x60($sp)
/* 10C184 0020C084 5000B57F */  sq         $21, 0x50($sp)
/* 10C188 0020C088 4000B47F */  sq         $20, 0x40($sp)
/* 10C18C 0020C08C 3000B37F */  sq         $19, 0x30($sp)
/* 10C190 0020C090 2000B27F */  sq         $18, 0x20($sp)
/* 10C194 0020C094 1000B17F */  sq         $17, 0x10($sp)
/* 10C198 0020C098 0000B07F */  sq         $16, 0x0($sp)
/* 10C19C 0020C09C 28B68070 */  paddub     $22, $4, $0
/* 10C1A0 0020C0A0 28AEA070 */  paddub     $21, $5, $0
/* 10C1A4 0020C0A4 288EC070 */  paddub     $17, $6, $0
/* 10C1A8 0020C0A8 28F6E070 */  paddub     $fp, $7, $0
/* 10C1AC 0020C0AC BC00A9AF */  sw         $9, 0xBC($sp)
/* 10C1B0 0020C0B0 28A64071 */  paddub     $20, $10, $0
/* 10C1B4 0020C0B4 C701023C */  lui        $2, %hi(TexManager)
/* 10C1B8 0020C0B8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10C1BC 0020C0BC 282E0071 */  paddub     $5, $8, $0
/* 10C1C0 0020C0C0 FFFF0624 */  addiu      $6, $0, -0x1
/* 10C1C4 0020C0C4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 10C1C8 0020C0C8 00000000 */   nop
/* 10C1CC 0020C0CC 28864070 */  paddub     $16, $2, $0
/* 10C1D0 0020C0D0 DCFF3726 */  addiu      $23, $17, -0x24
/* 10C1D4 0020C0D4 DCFFD127 */  addiu      $17, $fp, -0x24
/* 10C1D8 0020C0D8 BC00A28F */  lw         $2, 0xBC($sp)
/* 10C1DC 0020C0DC 03004010 */  beqz       $2, .L0020C0EC
/* 10C1E0 0020C0E0 00000000 */   nop
/* 10C1E4 0020C0E4 03000010 */  b          .L0020C0F4
/* 10C1E8 0020C0E8 00000000 */   nop
.L0020C0EC:
/* 10C1EC 0020C0EC D4001224 */  addiu      $18, $0, 0xD4
/* 10C1F0 0020C0F0 59011324 */  addiu      $19, $0, 0x159
.L0020C0F4:
/* 10C1F4 0020C0F4 D000B2AF */  sw         $18, 0xD0($sp)
/* 10C1F8 0020C0F8 D400B3AF */  sw         $19, 0xD4($sp)
/* 10C1FC 0020C0FC 12000224 */  addiu      $2, $0, 0x12
/* 10C200 0020C100 D800A2AF */  sw         $2, 0xD8($sp)
/* 10C204 0020C104 DC00A2AF */  sw         $2, 0xDC($sp)
/* 10C208 0020C108 C000B6AF */  sw         $22, 0xC0($sp)
/* 10C20C 0020C10C C400B5AF */  sw         $21, 0xC4($sp)
/* 10C210 0020C110 C800A2AF */  sw         $2, 0xC8($sp)
/* 10C214 0020C114 CC00A2AF */  sw         $2, 0xCC($sp)
/* 10C218 0020C118 28260072 */  paddub     $4, $16, $0
/* 10C21C 0020C11C C000A527 */  addiu      $5, $sp, 0xC0
/* 10C220 0020C120 D000A627 */  addiu      $6, $sp, 0xD0
/* 10C224 0020C124 283E8072 */  paddub     $7, $20, $0
/* 10C228 0020C128 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10C22C 0020C12C 00000000 */   nop
/* 10C230 0020C130 10004226 */  addiu      $2, $18, 0x10
/* 10C234 0020C134 F000A2AF */  sw         $2, 0xF0($sp)
/* 10C238 0020C138 F400B3AF */  sw         $19, 0xF4($sp)
/* 10C23C 0020C13C 04000224 */  addiu      $2, $0, 0x4
/* 10C240 0020C140 F800A2AF */  sw         $2, 0xF8($sp)
/* 10C244 0020C144 12000324 */  addiu      $3, $0, 0x12
/* 10C248 0020C148 FC00A3AF */  sw         $3, 0xFC($sp)
/* 10C24C 0020C14C 1200C226 */  addiu      $2, $22, 0x12
/* 10C250 0020C150 E000A2AF */  sw         $2, 0xE0($sp)
/* 10C254 0020C154 E400B5AF */  sw         $21, 0xE4($sp)
/* 10C258 0020C158 E800B7AF */  sw         $23, 0xE8($sp)
/* 10C25C 0020C15C EC00A3AF */  sw         $3, 0xEC($sp)
/* 10C260 0020C160 28260072 */  paddub     $4, $16, $0
/* 10C264 0020C164 E000A527 */  addiu      $5, $sp, 0xE0
/* 10C268 0020C168 F000A627 */  addiu      $6, $sp, 0xF0
/* 10C26C 0020C16C 283E8072 */  paddub     $7, $20, $0
/* 10C270 0020C170 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10C274 0020C174 00000000 */   nop
/* 10C278 0020C178 12004226 */  addiu      $2, $18, 0x12
/* 10C27C 0020C17C 1001A2AF */  sw         $2, 0x110($sp)
/* 10C280 0020C180 1401B3AF */  sw         $19, 0x114($sp)
/* 10C284 0020C184 12000324 */  addiu      $3, $0, 0x12
/* 10C288 0020C188 1801A3AF */  sw         $3, 0x118($sp)
/* 10C28C 0020C18C 1C01A3AF */  sw         $3, 0x11C($sp)
/* 10C290 0020C190 1200C226 */  addiu      $2, $22, 0x12
/* 10C294 0020C194 21105700 */  addu       $2, $2, $23
/* 10C298 0020C198 A000A2AF */  sw         $2, 0xA0($sp)
/* 10C29C 0020C19C A000A28F */  lw         $2, 0xA0($sp)
/* 10C2A0 0020C1A0 0001A2AF */  sw         $2, 0x100($sp)
/* 10C2A4 0020C1A4 0401B5AF */  sw         $21, 0x104($sp)
/* 10C2A8 0020C1A8 0801A3AF */  sw         $3, 0x108($sp)
/* 10C2AC 0020C1AC 0C01A3AF */  sw         $3, 0x10C($sp)
/* 10C2B0 0020C1B0 28260072 */  paddub     $4, $16, $0
/* 10C2B4 0020C1B4 0001A527 */  addiu      $5, $sp, 0x100
/* 10C2B8 0020C1B8 1001A627 */  addiu      $6, $sp, 0x110
/* 10C2BC 0020C1BC 283E8072 */  paddub     $7, $20, $0
/* 10C2C0 0020C1C0 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10C2C4 0020C1C4 00000000 */   nop
/* 10C2C8 0020C1C8 3001B2AF */  sw         $18, 0x130($sp)
/* 10C2CC 0020C1CC 0E006226 */  addiu      $2, $19, 0xE
/* 10C2D0 0020C1D0 3401A2AF */  sw         $2, 0x134($sp)
/* 10C2D4 0020C1D4 12000324 */  addiu      $3, $0, 0x12
/* 10C2D8 0020C1D8 3801A3AF */  sw         $3, 0x138($sp)
/* 10C2DC 0020C1DC 04000224 */  addiu      $2, $0, 0x4
/* 10C2E0 0020C1E0 3C01A2AF */  sw         $2, 0x13C($sp)
/* 10C2E4 0020C1E4 2001B6AF */  sw         $22, 0x120($sp)
/* 10C2E8 0020C1E8 1200A226 */  addiu      $2, $21, 0x12
/* 10C2EC 0020C1EC 2401A2AF */  sw         $2, 0x124($sp)
/* 10C2F0 0020C1F0 2801A3AF */  sw         $3, 0x128($sp)
/* 10C2F4 0020C1F4 2C01B1AF */  sw         $17, 0x12C($sp)
/* 10C2F8 0020C1F8 28260072 */  paddub     $4, $16, $0
/* 10C2FC 0020C1FC 2001A527 */  addiu      $5, $sp, 0x120
/* 10C300 0020C200 3001A627 */  addiu      $6, $sp, 0x130
/* 10C304 0020C204 283E8072 */  paddub     $7, $20, $0
/* 10C308 0020C208 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10C30C 0020C20C 00000000 */   nop
/* 10C310 0020C210 12004226 */  addiu      $2, $18, 0x12
/* 10C314 0020C214 5001A2AF */  sw         $2, 0x150($sp)
/* 10C318 0020C218 0E006226 */  addiu      $2, $19, 0xE
/* 10C31C 0020C21C 5401A2AF */  sw         $2, 0x154($sp)
/* 10C320 0020C220 12000324 */  addiu      $3, $0, 0x12
/* 10C324 0020C224 5801A3AF */  sw         $3, 0x158($sp)
/* 10C328 0020C228 04000224 */  addiu      $2, $0, 0x4
/* 10C32C 0020C22C 5C01A2AF */  sw         $2, 0x15C($sp)
/* 10C330 0020C230 A000A28F */  lw         $2, 0xA0($sp)
/* 10C334 0020C234 4001A2AF */  sw         $2, 0x140($sp)
/* 10C338 0020C238 1200A226 */  addiu      $2, $21, 0x12
/* 10C33C 0020C23C 4401A2AF */  sw         $2, 0x144($sp)
/* 10C340 0020C240 4801A3AF */  sw         $3, 0x148($sp)
/* 10C344 0020C244 4C01B1AF */  sw         $17, 0x14C($sp)
/* 10C348 0020C248 28260072 */  paddub     $4, $16, $0
/* 10C34C 0020C24C 4001A527 */  addiu      $5, $sp, 0x140
/* 10C350 0020C250 5001A627 */  addiu      $6, $sp, 0x150
/* 10C354 0020C254 283E8072 */  paddub     $7, $20, $0
/* 10C358 0020C258 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10C35C 0020C25C 00000000 */   nop
/* 10C360 0020C260 7001B2AF */  sw         $18, 0x170($sp)
/* 10C364 0020C264 12006226 */  addiu      $2, $19, 0x12
/* 10C368 0020C268 7401A2AF */  sw         $2, 0x174($sp)
/* 10C36C 0020C26C 12000324 */  addiu      $3, $0, 0x12
/* 10C370 0020C270 7801A3AF */  sw         $3, 0x178($sp)
/* 10C374 0020C274 7C01A3AF */  sw         $3, 0x17C($sp)
/* 10C378 0020C278 6001B6AF */  sw         $22, 0x160($sp)
/* 10C37C 0020C27C 1200A226 */  addiu      $2, $21, 0x12
/* 10C380 0020C280 21F05100 */  addu       $fp, $2, $17
/* 10C384 0020C284 6401BEAF */  sw         $fp, 0x164($sp)
/* 10C388 0020C288 6801A3AF */  sw         $3, 0x168($sp)
/* 10C38C 0020C28C 6C01A3AF */  sw         $3, 0x16C($sp)
/* 10C390 0020C290 28260072 */  paddub     $4, $16, $0
/* 10C394 0020C294 6001A527 */  addiu      $5, $sp, 0x160
/* 10C398 0020C298 7001A627 */  addiu      $6, $sp, 0x170
/* 10C39C 0020C29C 283E8072 */  paddub     $7, $20, $0
/* 10C3A0 0020C2A0 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10C3A4 0020C2A4 00000000 */   nop
/* 10C3A8 0020C2A8 10004226 */  addiu      $2, $18, 0x10
/* 10C3AC 0020C2AC 9001A2AF */  sw         $2, 0x190($sp)
/* 10C3B0 0020C2B0 12006226 */  addiu      $2, $19, 0x12
/* 10C3B4 0020C2B4 9401A2AF */  sw         $2, 0x194($sp)
/* 10C3B8 0020C2B8 04000224 */  addiu      $2, $0, 0x4
/* 10C3BC 0020C2BC 9801A2AF */  sw         $2, 0x198($sp)
/* 10C3C0 0020C2C0 12000324 */  addiu      $3, $0, 0x12
/* 10C3C4 0020C2C4 9C01A3AF */  sw         $3, 0x19C($sp)
/* 10C3C8 0020C2C8 1200C226 */  addiu      $2, $22, 0x12
/* 10C3CC 0020C2CC 8001A2AF */  sw         $2, 0x180($sp)
/* 10C3D0 0020C2D0 8401BEAF */  sw         $fp, 0x184($sp)
/* 10C3D4 0020C2D4 8801B7AF */  sw         $23, 0x188($sp)
/* 10C3D8 0020C2D8 8C01A3AF */  sw         $3, 0x18C($sp)
/* 10C3DC 0020C2DC 28260072 */  paddub     $4, $16, $0
/* 10C3E0 0020C2E0 8001A527 */  addiu      $5, $sp, 0x180
/* 10C3E4 0020C2E4 9001A627 */  addiu      $6, $sp, 0x190
/* 10C3E8 0020C2E8 283E8072 */  paddub     $7, $20, $0
/* 10C3EC 0020C2EC C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10C3F0 0020C2F0 00000000 */   nop
/* 10C3F4 0020C2F4 12004226 */  addiu      $2, $18, 0x12
/* 10C3F8 0020C2F8 B001A2AF */  sw         $2, 0x1B0($sp)
/* 10C3FC 0020C2FC 12006226 */  addiu      $2, $19, 0x12
/* 10C400 0020C300 B401A2AF */  sw         $2, 0x1B4($sp)
/* 10C404 0020C304 12000324 */  addiu      $3, $0, 0x12
/* 10C408 0020C308 B801A3AF */  sw         $3, 0x1B8($sp)
/* 10C40C 0020C30C BC01A3AF */  sw         $3, 0x1BC($sp)
/* 10C410 0020C310 A000A28F */  lw         $2, 0xA0($sp)
/* 10C414 0020C314 A001A2AF */  sw         $2, 0x1A0($sp)
/* 10C418 0020C318 A401BEAF */  sw         $fp, 0x1A4($sp)
/* 10C41C 0020C31C A801A3AF */  sw         $3, 0x1A8($sp)
/* 10C420 0020C320 AC01A3AF */  sw         $3, 0x1AC($sp)
/* 10C424 0020C324 28260072 */  paddub     $4, $16, $0
/* 10C428 0020C328 A001A527 */  addiu      $5, $sp, 0x1A0
/* 10C42C 0020C32C B001A627 */  addiu      $6, $sp, 0x1B0
/* 10C430 0020C330 283E8072 */  paddub     $7, $20, $0
/* 10C434 0020C334 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10C438 0020C338 00000000 */   nop
/* 10C43C 0020C33C FA000224 */  addiu      $2, $0, 0xFA
/* 10C440 0020C340 D001A2AF */  sw         $2, 0x1D0($sp)
/* 10C444 0020C344 D2010224 */  addiu      $2, $0, 0x1D2
/* 10C448 0020C348 D401A2AF */  sw         $2, 0x1D4($sp)
/* 10C44C 0020C34C 86000524 */  addiu      $5, $0, 0x86
/* 10C450 0020C350 D801A5AF */  sw         $5, 0x1D8($sp)
/* 10C454 0020C354 22000424 */  addiu      $4, $0, 0x22
/* 10C458 0020C358 DC01A4AF */  sw         $4, 0x1DC($sp)
/* 10C45C 0020C35C CDFFC326 */  addiu      $3, $22, -0x33
/* 10C460 0020C360 43101700 */  sra        $2, $23, 1
/* 10C464 0020C364 21106200 */  addu       $2, $3, $2
/* 10C468 0020C368 C001A2AF */  sw         $2, 0x1C0($sp)
/* 10C46C 0020C36C FFFFA326 */  addiu      $3, $21, -0x1
/* 10C470 0020C370 43101100 */  sra        $2, $17, 1
/* 10C474 0020C374 21106200 */  addu       $2, $3, $2
/* 10C478 0020C378 C401A2AF */  sw         $2, 0x1C4($sp)
/* 10C47C 0020C37C C801A5AF */  sw         $5, 0x1C8($sp)
/* 10C480 0020C380 CC01A4AF */  sw         $4, 0x1CC($sp)
/* 10C484 0020C384 28260072 */  paddub     $4, $16, $0
/* 10C488 0020C388 C001A527 */  addiu      $5, $sp, 0x1C0
/* 10C48C 0020C38C D001A627 */  addiu      $6, $sp, 0x1D0
/* 10C490 0020C390 283E8072 */  paddub     $7, $20, $0
/* 10C494 0020C394 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10C498 0020C398 00000000 */   nop
/* 10C49C 0020C39C 9000BF7B */  lq         $31, 0x90($sp)
/* 10C4A0 0020C3A0 8000BE7B */  lq         $fp, 0x80($sp)
/* 10C4A4 0020C3A4 7000B77B */  lq         $23, 0x70($sp)
/* 10C4A8 0020C3A8 6000B67B */  lq         $22, 0x60($sp)
/* 10C4AC 0020C3AC 5000B57B */  lq         $21, 0x50($sp)
/* 10C4B0 0020C3B0 4000B47B */  lq         $20, 0x40($sp)
/* 10C4B4 0020C3B4 3000B37B */  lq         $19, 0x30($sp)
/* 10C4B8 0020C3B8 2000B27B */  lq         $18, 0x20($sp)
/* 10C4BC 0020C3BC 1000B17B */  lq         $17, 0x10($sp)
/* 10C4C0 0020C3C0 0000B07B */  lq         $16, 0x0($sp)
/* 10C4C4 0020C3C4 E001BD27 */  addiu      $sp, $sp, 0x1E0
/* 10C4C8 0020C3C8 0800E003 */  jr         $31
/* 10C4CC 0020C3CC 00000000 */   nop
