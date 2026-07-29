.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MemoryMapDump__Fv
/* 000370 01DAC070 F0FFBD27 */  addiu       $29, $29, -0x10
/* 000374 01DAC074 0000BF7F */  sq          $31, 0x0($29)
/* 000378 01DAC078 DC01023C */  lui         $2, %hi(LIT_670__4)
/* 00037C 01DAC07C 402C4424 */  addiu       $4, $2, %lo(LIT_670__4)
/* 000380 01DAC080 F001013C */  lui         $1, %hi(MainModelBuffer + 0x8)
/* 000384 01DAC084 4866258C */  lw          $5, %lo(MainModelBuffer + 0x8)($1)
/* 000388 01DAC088 70940634 */  ori         $6, $0, 0x9470
/* 00038C 01DAC08C A611040C */  jal         printf
/* 000390 01DAC090 00000000 */   nop
/* 000394 01DAC094 DC01023C */  lui         $2, %hi(LIT_671__4)
/* 000398 01DAC098 602C4424 */  addiu       $4, $2, %lo(LIT_671__4)
/* 00039C 01DAC09C 2B00013C */  lui         $1, %hi(MotionData + 0x8)
/* 0003A0 01DAC0A0 28B0258C */  lw          $5, %lo(MotionData + 0x8)($1)
/* 0003A4 01DAC0A4 10270624 */  addiu       $6, $0, 0x2710
/* 0003A8 01DAC0A8 A611040C */  jal         printf
/* 0003AC 01DAC0AC 00000000 */   nop
/* 0003B0 01DAC0B0 DC01023C */  lui         $2, %hi(LIT_672__4)
/* 0003B4 01DAC0B4 802C4424 */  addiu       $4, $2, %lo(LIT_672__4)
/* 0003B8 01DAC0B8 F001013C */  lui         $1, %hi(CharaModelBuffer + 0x8)
/* 0003BC 01DAC0BC 6866258C */  lw          $5, %lo(CharaModelBuffer + 0x8)($1)
/* 0003C0 01DAC0C0 0300023C */  lui         $2, (0x33450 >> 16)
/* 0003C4 01DAC0C4 50344634 */  ori         $6, $2, (0x33450 & 0xFFFF)
/* 0003C8 01DAC0C8 A611040C */  jal         printf
/* 0003CC 01DAC0CC 00000000 */   nop
/* 0003D0 01DAC0D0 DC01023C */  lui         $2, %hi(LIT_673__4)
/* 0003D4 01DAC0D4 A02C4424 */  addiu       $4, $2, %lo(LIT_673__4)
/* 0003D8 01DAC0D8 F001013C */  lui         $1, %hi(MasekiModelBuffer + 0x8)
/* 0003DC 01DAC0DC 9866258C */  lw          $5, %lo(MasekiModelBuffer + 0x8)($1)
/* 0003E0 01DAC0E0 E8FD0634 */  ori         $6, $0, 0xFDE8
/* 0003E4 01DAC0E4 A611040C */  jal         printf
/* 0003E8 01DAC0E8 00000000 */   nop
/* 0003EC 01DAC0EC DC01023C */  lui         $2, %hi(LIT_674__4)
/* 0003F0 01DAC0F0 C02C4424 */  addiu       $4, $2, %lo(LIT_674__4)
/* 0003F4 01DAC0F4 F001013C */  lui         $1, %hi(MapModelBuffer + 0x8)
/* 0003F8 01DAC0F8 5866258C */  lw          $5, %lo(MapModelBuffer + 0x8)($1)
/* 0003FC 01DAC0FC 0A00023C */  lui         $2, (0xA7F80 >> 16)
/* 000400 01DAC100 807F4634 */  ori         $6, $2, (0xA7F80 & 0xFFFF)
/* 000404 01DAC104 A611040C */  jal         printf
/* 000408 01DAC108 00000000 */   nop
/* 00040C 01DAC10C F001013C */  lui         $1, %hi(MonstorModelBuffer + 0xC)
/* 000410 01DAC110 DC66268C */  lw          $6, %lo(MonstorModelBuffer + 0xC)($1)
/* 000414 01DAC114 DC01023C */  lui         $2, %hi(LIT_675__4)
/* 000418 01DAC118 E02C4424 */  addiu       $4, $2, %lo(LIT_675__4)
/* 00041C 01DAC11C F001013C */  lui         $1, %hi(MonstorModelBuffer + 0x8)
/* 000420 01DAC120 D866258C */  lw          $5, %lo(MonstorModelBuffer + 0x8)($1)
/* 000424 01DAC124 A611040C */  jal         printf
/* 000428 01DAC128 00000000 */   nop
/* 00042C 01DAC12C DC01023C */  lui         $2, %hi(LIT_676__3)
/* 000430 01DAC130 002D4424 */  addiu       $4, $2, %lo(LIT_676__3)
/* 000434 01DAC134 F001013C */  lui         $1, %hi(BtSystemScriptFileBuffer + 0x8)
/* 000438 01DAC138 7868258C */  lw          $5, %lo(BtSystemScriptFileBuffer + 0x8)($1)
/* 00043C 01DAC13C B8880634 */  ori         $6, $0, 0x88B8
/* 000440 01DAC140 A611040C */  jal         printf
/* 000444 01DAC144 00000000 */   nop
/* 000448 01DAC148 DC01023C */  lui         $2, %hi(LIT_677__3)
/* 00044C 01DAC14C 202D4424 */  addiu       $4, $2, %lo(LIT_677__3)
/* 000450 01DAC150 F001013C */  lui         $1, %hi(BtStartLogoBuffer + 0x8)
/* 000454 01DAC154 C866258C */  lw          $5, %lo(BtStartLogoBuffer + 0x8)($1)
/* 000458 01DAC158 88130624 */  addiu       $6, $0, 0x1388
/* 00045C 01DAC15C A611040C */  jal         printf
/* 000460 01DAC160 00000000 */   nop
/* 000464 01DAC164 DC01023C */  lui         $2, %hi(LIT_678__3)
/* 000468 01DAC168 402D4424 */  addiu       $4, $2, %lo(LIT_678__3)
/* 00046C 01DAC16C F001013C */  lui         $1, %hi(BtMesBuffer + 0x8)
/* 000470 01DAC170 A866258C */  lw          $5, %lo(BtMesBuffer + 0x8)($1)
/* 000474 01DAC174 04290624 */  addiu       $6, $0, 0x2904
/* 000478 01DAC178 A611040C */  jal         printf
/* 00047C 01DAC17C 00000000 */   nop
/* 000480 01DAC180 DC01023C */  lui         $2, %hi(LIT_679__3)
/* 000484 01DAC184 602D4424 */  addiu       $4, $2, %lo(LIT_679__3)
/* 000488 01DAC188 F001013C */  lui         $1, %hi(BtSteebMesBuffer + 0x8)
/* 00048C 01DAC18C B866258C */  lw          $5, %lo(BtSteebMesBuffer + 0x8)($1)
/* 000490 01DAC190 AC0D0624 */  addiu       $6, $0, 0xDAC
/* 000494 01DAC194 A611040C */  jal         printf
/* 000498 01DAC198 00000000 */   nop
/* 00049C 01DAC19C C701023C */  lui         $2, %hi(TexManager)
/* 0004A0 01DAC1A0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0004A4 01DAC1A4 D4D1040C */  jal         print_buff_info__15CTextureManagerFv
/* 0004A8 01DAC1A8 00000000 */   nop
/* 0004AC 01DAC1AC 0000BF7B */  lq          $31, 0x0($29)
/* 0004B0 01DAC1B0 1000BD27 */  addiu       $29, $29, 0x10
/* 0004B4 01DAC1B4 0800E003 */  jr          $31
/* 0004B8 01DAC1B8 00000000 */   nop
/* 0004BC 01DAC1BC 00000000 */  nop
