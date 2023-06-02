.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sprintf
/* 5158 00105058 2500023C */  lui        $2, (0x250000 >> 16)
/* 515C 0010505C 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* 5160 00105060 ECFD4D8C */  lw         $13, -0x214($2)
/* 5164 00105064 FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 5168 00105068 2D608000 */  daddu      $12, $4, $0
/* 516C 0010506C FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 5170 00105070 B000A6FF */  sd         $6, 0xB0($sp)
/* 5174 00105074 08020224 */  addiu      $2, $0, 0x208
/* 5178 00105078 6000BFFF */  sd         $31, 0x60($sp)
/* 517C 0010507C 2D20A003 */  daddu      $4, $sp, $0
/* 5180 00105080 B800A7FF */  sd         $7, 0xB8($sp)
/* 5184 00105084 B000A627 */  addiu      $6, $sp, 0xB0
/* 5188 00105088 C000A8FF */  sd         $8, 0xC0($sp)
/* 518C 0010508C C800A9FF */  sd         $9, 0xC8($sp)
/* 5190 00105090 D000AAFF */  sd         $10, 0xD0($sp)
/* 5194 00105094 D800ABFF */  sd         $11, 0xD8($sp)
/* 5198 00105098 0C00A2A7 */  sh         $2, 0xC($sp)
/* 519C 0010509C 1000ACAF */  sw         $12, 0x10($sp)
/* 51A0 001050A0 1400A3AF */  sw         $3, 0x14($sp)
/* 51A4 001050A4 5400ADAF */  sw         $13, 0x54($sp)
/* 51A8 001050A8 0000ACAF */  sw         $12, 0x0($sp)
/* 51AC 001050AC 021F040C */  jal        vfprintf
/* 51B0 001050B0 0800A3AF */   sw        $3, 0x8($sp)
/* 51B4 001050B4 0000A38F */  lw         $3, 0x0($sp)
/* 51B8 001050B8 6000BFDF */  ld         $31, 0x60($sp)
/* 51BC 001050BC 000060A0 */  sb         $0, 0x0($3)
/* 51C0 001050C0 0800E003 */  jr         $31
/* 51C4 001050C4 E000BD27 */   addiu     $sp, $sp, 0xE0
