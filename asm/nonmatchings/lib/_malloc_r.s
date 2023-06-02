.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _malloc_r
/* 2B80 00102A80 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 2B84 00102A84 1300A324 */  addiu      $3, $5, 0x13
/* 2B88 00102A88 3000B3FF */  sd         $19, 0x30($sp)
/* 2B8C 00102A8C 1F00622C */  sltiu      $2, $3, 0x1F
/* 2B90 00102A90 5000BFFF */  sd         $31, 0x50($sp)
/* 2B94 00102A94 2D988000 */  daddu      $19, $4, $0
/* 2B98 00102A98 4000B4FF */  sd         $20, 0x40($sp)
/* 2B9C 00102A9C 2000B2FF */  sd         $18, 0x20($sp)
/* 2BA0 00102AA0 1000B1FF */  sd         $17, 0x10($sp)
/* 2BA4 00102AA4 05004014 */  bnez       $2, .L00102ABC
/* 2BA8 00102AA8 0000B0FF */   sd        $16, 0x0($sp)
/* 2BAC 00102AAC FFFF023C */  lui        $2, (0xFFFFFFF0 >> 16)
/* 2BB0 00102AB0 F0FF4234 */  ori        $2, $2, (0xFFFFFFF0 & 0xFFFF)
/* 2BB4 00102AB4 02000010 */  b          .L00102AC0
/* 2BB8 00102AB8 24886200 */   and       $17, $3, $2
.L00102ABC:
/* 2BBC 00102ABC 10001124 */  addiu      $17, $0, 0x10
.L00102AC0:
/* 2BC0 00102AC0 8A0D040C */  jal        __malloc_lock
/* 2BC4 00102AC4 2D206002 */   daddu     $4, $19, $0
/* 2BC8 00102AC8 F801222E */  sltiu      $2, $17, 0x1F8
/* 2BCC 00102ACC 16004010 */  beqz       $2, .L00102B28
/* 2BD0 00102AD0 2500143C */   lui       $20, %hi(__malloc_av_)
/* 2BD4 00102AD4 08FE8226 */  addiu      $2, $20, %lo(__malloc_av_)
/* 2BD8 00102AD8 21482202 */  addu       $9, $17, $2
/* 2BDC 00102ADC 0C00308D */  lw         $16, 0xC($9)
/* 2BE0 00102AE0 0F000912 */  beq        $16, $9, .L00102B20
/* 2BE4 00102AE4 C2581100 */   srl       $11, $17, 3
/* 2BE8 00102AE8 0400038E */  lw         $3, 0x4($16)
/* 2BEC 00102AEC FFFF023C */  lui        $2, (0xFFFFFFFC >> 16)
/* 2BF0 00102AF0 FCFF4234 */  ori        $2, $2, (0xFFFFFFFC & 0xFFFF)
/* 2BF4 00102AF4 0C000A8E */  lw         $10, 0xC($16)
/* 2BF8 00102AF8 24406200 */  and        $8, $3, $2
/* 2BFC 00102AFC 0800098E */  lw         $9, 0x8($16)
/* 2C00 00102B00 21180802 */  addu       $3, $16, $8
/* 2C04 00102B04 2D206002 */  daddu      $4, $19, $0
/* 2C08 00102B08 0400628C */  lw         $2, 0x4($3)
/* 2C0C 00102B0C 0C002AAD */  sw         $10, 0xC($9)
/* 2C10 00102B10 01004234 */  ori        $2, $2, 0x1
/* 2C14 00102B14 080049AD */  sw         $9, 0x8($10)
/* 2C18 00102B18 AC010010 */  b          .L001031CC
/* 2C1C 00102B1C 040062AC */   sw        $2, 0x4($3)
.L00102B20:
/* 2C20 00102B20 3B000010 */  b          .L00102C10
/* 2C24 00102B24 02006B25 */   addiu     $11, $11, 0x2
.L00102B28:
/* 2C28 00102B28 421A1100 */  srl        $3, $17, 9
/* 2C2C 00102B2C 03006014 */  bnez       $3, .L00102B3C
/* 2C30 00102B30 0500622C */   sltiu     $2, $3, 0x5
/* 2C34 00102B34 18000010 */  b          .L00102B98
/* 2C38 00102B38 C2581100 */   srl       $11, $17, 3
.L00102B3C:
/* 2C3C 00102B3C 03004010 */  beqz       $2, .L00102B4C
/* 2C40 00102B40 82111100 */   srl       $2, $17, 6
/* 2C44 00102B44 14000010 */  b          .L00102B98
/* 2C48 00102B48 38004B24 */   addiu     $11, $2, 0x38
.L00102B4C:
/* 2C4C 00102B4C 1500622C */  sltiu      $2, $3, 0x15
/* 2C50 00102B50 11004014 */  bnez       $2, .L00102B98
/* 2C54 00102B54 5B006B24 */   addiu     $11, $3, 0x5B
/* 2C58 00102B58 5500622C */  sltiu      $2, $3, 0x55
/* 2C5C 00102B5C 03004010 */  beqz       $2, .L00102B6C
/* 2C60 00102B60 02131100 */   srl       $2, $17, 12
/* 2C64 00102B64 0C000010 */  b          .L00102B98
/* 2C68 00102B68 6E004B24 */   addiu     $11, $2, 0x6E
.L00102B6C:
/* 2C6C 00102B6C 5501622C */  sltiu      $2, $3, 0x155
/* 2C70 00102B70 03004010 */  beqz       $2, .L00102B80
/* 2C74 00102B74 C2131100 */   srl       $2, $17, 15
/* 2C78 00102B78 07000010 */  b          .L00102B98
/* 2C7C 00102B7C 77004B24 */   addiu     $11, $2, 0x77
.L00102B80:
/* 2C80 00102B80 5505622C */  sltiu      $2, $3, 0x555
/* 2C84 00102B84 03004010 */  beqz       $2, .L00102B94
/* 2C88 00102B88 82141100 */   srl       $2, $17, 18
/* 2C8C 00102B8C 02000010 */  b          .L00102B98
/* 2C90 00102B90 7C004B24 */   addiu     $11, $2, 0x7C
.L00102B94:
/* 2C94 00102B94 7E000B24 */  addiu      $11, $0, 0x7E
.L00102B98:
/* 2C98 00102B98 2500143C */  lui        $20, %hi(__malloc_av_)
/* 2C9C 00102B9C C0180B00 */  sll        $3, $11, 3
/* 2CA0 00102BA0 08FE8226 */  addiu      $2, $20, %lo(__malloc_av_)
/* 2CA4 00102BA4 FFFF043C */  lui        $4, (0xFFFFFFFC >> 16)
/* 2CA8 00102BA8 21286200 */  addu       $5, $3, $2
/* 2CAC 00102BAC FCFF8434 */  ori        $4, $4, (0xFFFFFFFC & 0xFFFF)
/* 2CB0 00102BB0 04000010 */  b          .L00102BC4
/* 2CB4 00102BB4 0C00B08C */   lw        $16, 0xC($5)
.L00102BB8:
/* 2CB8 00102BB8 4B01E104 */  bgez       $7, .L001030E8
/* 2CBC 00102BBC 21180802 */   addu      $3, $16, $8
/* 2CC0 00102BC0 0C00108E */  lw         $16, 0xC($16)
.L00102BC4:
/* 2CC4 00102BC4 12000552 */  beql       $16, $5, .L00102C10
/* 2CC8 00102BC8 01006B25 */   addiu     $11, $11, 0x1
/* 2CCC 00102BCC 0400028E */  lw         $2, 0x4($16)
/* 2CD0 00102BD0 24404400 */  and        $8, $2, $4
/* 2CD4 00102BD4 2B181101 */  sltu       $3, $8, $17
/* 2CD8 00102BD8 05006010 */  beqz       $3, .L00102BF0
/* 2CDC 00102BDC 23102802 */   subu      $2, $17, $8
/* 2CE0 00102BE0 3C100200 */  dsll32     $2, $2, 0
/* 2CE4 00102BE4 3E100200 */  dsrl32     $2, $2, 0
/* 2CE8 00102BE8 04000010 */  b          .L00102BFC
/* 2CEC 00102BEC 2F380200 */   dsubu     $7, $0, $2
.L00102BF0:
/* 2CF0 00102BF0 23101101 */  subu       $2, $8, $17
/* 2CF4 00102BF4 3C100200 */  dsll32     $2, $2, 0
/* 2CF8 00102BF8 3E380200 */  dsrl32     $7, $2, 0
.L00102BFC:
/* 2CFC 00102BFC 1000E228 */  slti       $2, $7, 0x10
/* 2D00 00102C00 EDFF4014 */  bnez       $2, .L00102BB8
/* 2D04 00102C04 00000000 */   nop
/* 2D08 00102C08 FFFF6B25 */  addiu      $11, $11, -0x1
/* 2D0C 00102C0C 01006B25 */  addiu      $11, $11, 0x1
.L00102C10:
/* 2D10 00102C10 25000E3C */  lui        $14, %hi(__malloc_av_ + 0x8)
/* 2D14 00102C14 10FEC225 */  addiu      $2, $14, %lo(__malloc_av_ + 0x8)
/* 2D18 00102C18 0800508C */  lw         $16, 0x8($2)
/* 2D1C 00102C1C 8E000212 */  beq        $16, $2, .L00102E58
/* 2D20 00102C20 03006625 */   addiu     $6, $11, 0x3
/* 2D24 00102C24 0400028E */  lw         $2, 0x4($16)
/* 2D28 00102C28 FFFF033C */  lui        $3, (0xFFFFFFFC >> 16)
/* 2D2C 00102C2C FCFF6334 */  ori        $3, $3, (0xFFFFFFFC & 0xFFFF)
/* 2D30 00102C30 24404300 */  and        $8, $2, $3
/* 2D34 00102C34 2B201101 */  sltu       $4, $8, $17
/* 2D38 00102C38 05008010 */  beqz       $4, .L00102C50
/* 2D3C 00102C3C 23102802 */   subu      $2, $17, $8
/* 2D40 00102C40 3C100200 */  dsll32     $2, $2, 0
/* 2D44 00102C44 3E100200 */  dsrl32     $2, $2, 0
/* 2D48 00102C48 04000010 */  b          .L00102C5C
/* 2D4C 00102C4C 2F380200 */   dsubu     $7, $0, $2
.L00102C50:
/* 2D50 00102C50 23101101 */  subu       $2, $8, $17
/* 2D54 00102C54 3C100200 */  dsll32     $2, $2, 0
/* 2D58 00102C58 3E380200 */  dsrl32     $7, $2, 0
.L00102C5C:
/* 2D5C 00102C5C 1000E228 */  slti       $2, $7, 0x10
/* 2D60 00102C60 14004014 */  bnez       $2, .L00102CB4
/* 2D64 00102C64 10FEC525 */   addiu     $5, $14, %lo(__malloc_av_ + 0x8)
/* 2D68 00102C68 01000224 */  addiu      $2, $0, 0x1
/* 2D6C 00102C6C 3C300700 */  dsll32     $6, $7, 0
/* 2D70 00102C70 3F300600 */  dsra32     $6, $6, 0
/* 2D74 00102C74 2510E200 */  or         $2, $7, $2
/* 2D78 00102C78 01002436 */  ori        $4, $17, 0x1
/* 2D7C 00102C7C 21381102 */  addu       $7, $16, $17
/* 2D80 00102C80 10FEC325 */  addiu      $3, $14, %lo(__malloc_av_ + 0x8)
/* 2D84 00102C84 040004AE */  sw         $4, 0x4($16)
/* 2D88 00102C88 3C100200 */  dsll32     $2, $2, 0
/* 2D8C 00102C8C 3F100200 */  dsra32     $2, $2, 0
/* 2D90 00102C90 0C0067AC */  sw         $7, 0xC($3)
/* 2D94 00102C94 2128E600 */  addu       $5, $7, $6
/* 2D98 00102C98 080067AC */  sw         $7, 0x8($3)
/* 2D9C 00102C9C 2D206002 */  daddu      $4, $19, $0
/* 2DA0 00102CA0 0400E2AC */  sw         $2, 0x4($7)
/* 2DA4 00102CA4 0000A6AC */  sw         $6, 0x0($5)
/* 2DA8 00102CA8 0800E3AC */  sw         $3, 0x8($7)
/* 2DAC 00102CAC 47010010 */  b          .L001031CC
/* 2DB0 00102CB0 0C00E3AC */   sw        $3, 0xC($7)
.L00102CB4:
/* 2DB4 00102CB4 0C00A5AC */  sw         $5, 0xC($5)
/* 2DB8 00102CB8 0700E004 */  bltz       $7, .L00102CD8
/* 2DBC 00102CBC 0800A5AC */   sw        $5, 0x8($5)
/* 2DC0 00102CC0 21180802 */  addu       $3, $16, $8
/* 2DC4 00102CC4 2D206002 */  daddu      $4, $19, $0
/* 2DC8 00102CC8 0400628C */  lw         $2, 0x4($3)
/* 2DCC 00102CCC 01004234 */  ori        $2, $2, 0x1
/* 2DD0 00102CD0 3E010010 */  b          .L001031CC
/* 2DD4 00102CD4 040062AC */   sw        $2, 0x4($3)
.L00102CD8:
/* 2DD8 00102CD8 0002022D */  sltiu      $2, $8, 0x200
/* 2DDC 00102CDC 17004010 */  beqz       $2, .L00102D3C
/* 2DE0 00102CE0 C2300800 */   srl       $6, $8, 3
/* 2DE4 00102CE4 FFFF0224 */  addiu      $2, $0, -0x1
/* 2DE8 00102CE8 F8FFA524 */  addiu      $5, $5, -0x8
/* 2DEC 00102CEC 2A104600 */  slt        $2, $2, $6
/* 2DF0 00102CF0 C0200600 */  sll        $4, $6, 3
/* 2DF4 00102CF4 0300C324 */  addiu      $3, $6, 0x3
/* 2DF8 00102CF8 21508500 */  addu       $10, $4, $5
/* 2DFC 00102CFC 0B18C200 */  movn       $3, $6, $2
/* 2E00 00102D00 0800498D */  lw         $9, 0x8($10)
/* 2E04 00102D04 83180300 */  sra        $3, $3, 2
/* 2E08 00102D08 01000224 */  addiu      $2, $0, 0x1
/* 2E0C 00102D0C 0400A48C */  lw         $4, 0x4($5)
/* 2E10 00102D10 14106200 */  dsllv      $2, $2, $3
/* 2E14 00102D14 0C000AAE */  sw         $10, 0xC($16)
/* 2E18 00102D18 080009AE */  sw         $9, 0x8($16)
/* 2E1C 00102D1C 3C100200 */  dsll32     $2, $2, 0
/* 2E20 00102D20 3F100200 */  dsra32     $2, $2, 0
/* 2E24 00102D24 25208200 */  or         $4, $4, $2
/* 2E28 00102D28 080050AD */  sw         $16, 0x8($10)
/* 2E2C 00102D2C 0C0030AD */  sw         $16, 0xC($9)
/* 2E30 00102D30 03006625 */  addiu      $6, $11, 0x3
/* 2E34 00102D34 48000010 */  b          .L00102E58
/* 2E38 00102D38 0400A4AC */   sw        $4, 0x4($5)
.L00102D3C:
/* 2E3C 00102D3C 421A0800 */  srl        $3, $8, 9
/* 2E40 00102D40 03006014 */  bnez       $3, .L00102D50
/* 2E44 00102D44 0500622C */   sltiu     $2, $3, 0x5
/* 2E48 00102D48 18000010 */  b          .L00102DAC
/* 2E4C 00102D4C C2300800 */   srl       $6, $8, 3
.L00102D50:
/* 2E50 00102D50 03004010 */  beqz       $2, .L00102D60
/* 2E54 00102D54 82110800 */   srl       $2, $8, 6
/* 2E58 00102D58 14000010 */  b          .L00102DAC
/* 2E5C 00102D5C 38004624 */   addiu     $6, $2, 0x38
.L00102D60:
/* 2E60 00102D60 1500622C */  sltiu      $2, $3, 0x15
/* 2E64 00102D64 11004014 */  bnez       $2, .L00102DAC
/* 2E68 00102D68 5B006624 */   addiu     $6, $3, 0x5B
/* 2E6C 00102D6C 5500622C */  sltiu      $2, $3, 0x55
/* 2E70 00102D70 03004010 */  beqz       $2, .L00102D80
/* 2E74 00102D74 02130800 */   srl       $2, $8, 12
/* 2E78 00102D78 0C000010 */  b          .L00102DAC
/* 2E7C 00102D7C 6E004624 */   addiu     $6, $2, 0x6E
.L00102D80:
/* 2E80 00102D80 5501622C */  sltiu      $2, $3, 0x155
/* 2E84 00102D84 03004010 */  beqz       $2, .L00102D94
/* 2E88 00102D88 C2130800 */   srl       $2, $8, 15
/* 2E8C 00102D8C 07000010 */  b          .L00102DAC
/* 2E90 00102D90 77004624 */   addiu     $6, $2, 0x77
.L00102D94:
/* 2E94 00102D94 5505622C */  sltiu      $2, $3, 0x555
/* 2E98 00102D98 03004010 */  beqz       $2, .L00102DA8
/* 2E9C 00102D9C 82140800 */   srl       $2, $8, 18
/* 2EA0 00102DA0 02000010 */  b          .L00102DAC
/* 2EA4 00102DA4 7C004624 */   addiu     $6, $2, 0x7C
.L00102DA8:
/* 2EA8 00102DA8 7E000624 */  addiu      $6, $0, 0x7E
.L00102DAC:
/* 2EAC 00102DAC C0100600 */  sll        $2, $6, 3
/* 2EB0 00102DB0 08FE8726 */  addiu      $7, $20, %lo(__malloc_av_)
/* 2EB4 00102DB4 21504700 */  addu       $10, $2, $7
/* 2EB8 00102DB8 0800498D */  lw         $9, 0x8($10)
/* 2EBC 00102DBC 0F002A55 */  bnel       $9, $10, .L00102DFC
/* 2EC0 00102DC0 0400238D */   lw        $3, 0x4($9)
/* 2EC4 00102DC4 FFFF0224 */  addiu      $2, $0, -0x1
/* 2EC8 00102DC8 0300C324 */  addiu      $3, $6, 0x3
/* 2ECC 00102DCC 2A104600 */  slt        $2, $2, $6
/* 2ED0 00102DD0 01000424 */  addiu      $4, $0, 0x1
/* 2ED4 00102DD4 0B18C200 */  movn       $3, $6, $2
/* 2ED8 00102DD8 0400E58C */  lw         $5, 0x4($7)
/* 2EDC 00102DDC 83180300 */  sra        $3, $3, 2
/* 2EE0 00102DE0 03006625 */  addiu      $6, $11, 0x3
/* 2EE4 00102DE4 14206400 */  dsllv      $4, $4, $3
/* 2EE8 00102DE8 3C200400 */  dsll32     $4, $4, 0
/* 2EEC 00102DEC 3F200400 */  dsra32     $4, $4, 0
/* 2EF0 00102DF0 2528A400 */  or         $5, $5, $4
/* 2EF4 00102DF4 14000010 */  b          .L00102E48
/* 2EF8 00102DF8 0400E5AC */   sw        $5, 0x4($7)
.L00102DFC:
/* 2EFC 00102DFC FFFF023C */  lui        $2, (0xFFFFFFFC >> 16)
/* 2F00 00102E00 FCFF4234 */  ori        $2, $2, (0xFFFFFFFC & 0xFFFF)
/* 2F04 00102E04 24186200 */  and        $3, $3, $2
/* 2F08 00102E08 2B180301 */  sltu       $3, $8, $3
/* 2F0C 00102E0C 0D006010 */  beqz       $3, .L00102E44
/* 2F10 00102E10 03006625 */   addiu     $6, $11, 0x3
/* 2F14 00102E14 0800298D */  lw         $9, 0x8($9)
.L00102E18:
/* 2F18 00102E18 0B002A51 */  beql       $9, $10, .L00102E48
/* 2F1C 00102E1C 0C002A8D */   lw        $10, 0xC($9)
/* 2F20 00102E20 0400238D */  lw         $3, 0x4($9)
/* 2F24 00102E24 FFFF023C */  lui        $2, (0xFFFFFFFC >> 16)
/* 2F28 00102E28 FCFF4234 */  ori        $2, $2, (0xFFFFFFFC & 0xFFFF)
/* 2F2C 00102E2C 24186200 */  and        $3, $3, $2
/* 2F30 00102E30 2B180301 */  sltu       $3, $8, $3
/* 2F34 00102E34 F8FF6054 */  bnel       $3, $0, .L00102E18
/* 2F38 00102E38 0800298D */   lw        $9, 0x8($9)
/* 2F3C 00102E3C 02000010 */  b          .L00102E48
/* 2F40 00102E40 0C002A8D */   lw        $10, 0xC($9)
.L00102E44:
/* 2F44 00102E44 0C002A8D */  lw         $10, 0xC($9)
.L00102E48:
/* 2F48 00102E48 0C000AAE */  sw         $10, 0xC($16)
/* 2F4C 00102E4C 080009AE */  sw         $9, 0x8($16)
/* 2F50 00102E50 080050AD */  sw         $16, 0x8($10)
/* 2F54 00102E54 0C0030AD */  sw         $16, 0xC($9)
.L00102E58:
/* 2F58 00102E58 FFFF0224 */  addiu      $2, $0, -0x1
/* 2F5C 00102E5C 08FE8326 */  addiu      $3, $20, %lo(__malloc_av_)
/* 2F60 00102E60 2A104B00 */  slt        $2, $2, $11
/* 2F64 00102E64 0400659C */  lwu        $5, 0x4($3)
/* 2F68 00102E68 0B306201 */  movn       $6, $11, $2
/* 2F6C 00102E6C 01000424 */  addiu      $4, $0, 0x1
/* 2F70 00102E70 83100600 */  sra        $2, $6, 2
/* 2F74 00102E74 14204400 */  dsllv      $4, $4, $2
/* 2F78 00102E78 2B18A400 */  sltu       $3, $5, $4
/* 2F7C 00102E7C 61006014 */  bnez       $3, .L00103004
/* 2F80 00102E80 08FE8326 */   addiu     $3, $20, %lo(__malloc_av_)
/* 2F84 00102E84 24108500 */  and        $2, $4, $5
/* 2F88 00102E88 11004014 */  bnez       $2, .L00102ED0
/* 2F8C 00102E8C 2500023C */   lui       $2, %hi(__malloc_av_)
/* 2F90 00102E90 FCFF0224 */  addiu      $2, $0, -0x4
/* 2F94 00102E94 78200400 */  dsll       $4, $4, 1
/* 2F98 00102E98 24106201 */  and        $2, $11, $2
/* 2F9C 00102E9C 24188500 */  and        $3, $4, $5
/* 2FA0 00102EA0 0A006014 */  bnez       $3, .L00102ECC
/* 2FA4 00102EA4 04004B24 */   addiu     $11, $2, 0x4
/* 2FA8 00102EA8 2D18A000 */  daddu      $3, $5, $0
/* 2FAC 00102EAC 00000000 */  nop
.L00102EB0:
/* 2FB0 00102EB0 78200400 */  dsll       $4, $4, 1
/* 2FB4 00102EB4 04006B25 */  addiu      $11, $11, 0x4
/* 2FB8 00102EB8 24108300 */  and        $2, $4, $3
/* 2FBC 00102EBC 00000000 */  nop
/* 2FC0 00102EC0 00000000 */  nop
/* 2FC4 00102EC4 FAFF4010 */  beqz       $2, .L00102EB0
/* 2FC8 00102EC8 00000000 */   nop
.L00102ECC:
/* 2FCC 00102ECC 2500023C */  lui        $2, %hi(__malloc_av_)
.L00102ED0:
/* 2FD0 00102ED0 08FE4C24 */  addiu      $12, $2, %lo(__malloc_av_)
/* 2FD4 00102ED4 2D688001 */  daddu      $13, $12, $0
/* 2FD8 00102ED8 C0100B00 */  sll        $2, $11, 3
/* 2FDC 00102EDC 00000000 */  nop
.L00102EE0:
/* 2FE0 00102EE0 2D506001 */  daddu      $10, $11, $0
/* 2FE4 00102EE4 21484C00 */  addu       $9, $2, $12
/* 2FE8 00102EE8 2D282001 */  daddu      $5, $9, $0
/* 2FEC 00102EEC 0C00B08C */  lw         $16, 0xC($5)
.L00102EF0:
/* 2FF0 00102EF0 19000512 */  beq        $16, $5, .L00102F58
/* 2FF4 00102EF4 3F006229 */   slti      $2, $11, 0x3F
/* 2FF8 00102EF8 FFFF063C */  lui        $6, (0xFFFFFFFC >> 16)
/* 2FFC 00102EFC FCFFC634 */  ori        $6, $6, (0xFFFFFFFC & 0xFFFF)
/* 3000 00102F00 0400028E */  lw         $2, 0x4($16)
/* 3004 00102F04 00000000 */  nop
.L00102F08:
/* 3008 00102F08 24404600 */  and        $8, $2, $6
/* 300C 00102F0C 2B181101 */  sltu       $3, $8, $17
/* 3010 00102F10 05006010 */  beqz       $3, .L00102F28
/* 3014 00102F14 23102802 */   subu      $2, $17, $8
/* 3018 00102F18 3C100200 */  dsll32     $2, $2, 0
/* 301C 00102F1C 3E100200 */  dsrl32     $2, $2, 0
/* 3020 00102F20 04000010 */  b          .L00102F34
/* 3024 00102F24 2F380200 */   dsubu     $7, $0, $2
.L00102F28:
/* 3028 00102F28 23101101 */  subu       $2, $8, $17
/* 302C 00102F2C 3C100200 */  dsll32     $2, $2, 0
/* 3030 00102F30 3E380200 */  dsrl32     $7, $2, 0
.L00102F34:
/* 3034 00102F34 1000E228 */  slti       $2, $7, 0x10
/* 3038 00102F38 76004050 */  beql       $2, $0, .L00103114
/* 303C 00102F3C 0C000A8E */   lw        $10, 0xC($16)
/* 3040 00102F40 8C00E104 */  bgez       $7, .L00103174
/* 3044 00102F44 21180802 */   addu      $3, $16, $8
/* 3048 00102F48 0C00108E */  lw         $16, 0xC($16)
/* 304C 00102F4C EEFF0556 */  bnel       $16, $5, .L00102F08
/* 3050 00102F50 0400028E */   lw        $2, 0x4($16)
/* 3054 00102F54 3F006229 */  slti       $2, $11, 0x3F
.L00102F58:
/* 3058 00102F58 03004010 */  beqz       $2, .L00102F68
/* 305C 00102F5C 0800A524 */   addiu     $5, $5, 0x8
/* 3060 00102F60 0800A524 */  addiu      $5, $5, 0x8
/* 3064 00102F64 01006B25 */  addiu      $11, $11, 0x1
.L00102F68:
/* 3068 00102F68 01006B25 */  addiu      $11, $11, 0x1
/* 306C 00102F6C 03006231 */  andi       $2, $11, 0x3
/* 3070 00102F70 DFFF4054 */  bnel       $2, $0, .L00102EF0
/* 3074 00102F74 0C00B08C */   lw        $16, 0xC($5)
/* 3078 00102F78 78280400 */  dsll       $5, $4, 1
/* 307C 00102F7C 00000000 */  nop
.L00102F80:
/* 3080 00102F80 03004231 */  andi       $2, $10, 0x3
/* 3084 00102F84 17004010 */  beqz       $2, .L00102FE4
/* 3088 00102F88 F8FF2925 */   addiu     $9, $9, -0x8
/* 308C 00102F8C 0800228D */  lw         $2, 0x8($9)
/* 3090 00102F90 FBFF4910 */  beq        $2, $9, .L00102F80
/* 3094 00102F94 FFFF4A25 */   addiu     $10, $10, -0x1
.L00102F98:
/* 3098 00102F98 0400A39D */  lwu        $3, 0x4($13)
/* 309C 00102F9C 2D20A000 */  daddu      $4, $5, $0
/* 30A0 00102FA0 2B106400 */  sltu       $2, $3, $4
/* 30A4 00102FA4 17004054 */  bnel       $2, $0, .L00103004
/* 30A8 00102FA8 08FE8326 */   addiu     $3, $20, %lo(__malloc_av_)
/* 30AC 00102FAC 14008010 */  beqz       $4, .L00103000
/* 30B0 00102FB0 24108300 */   and       $2, $4, $3
/* 30B4 00102FB4 CAFF4014 */  bnez       $2, .L00102EE0
/* 30B8 00102FB8 C0100B00 */   sll       $2, $11, 3
/* 30BC 00102FBC 00000000 */  nop
.L00102FC0:
/* 30C0 00102FC0 78200400 */  dsll       $4, $4, 1
/* 30C4 00102FC4 04006B25 */  addiu      $11, $11, 0x4
/* 30C8 00102FC8 24108300 */  and        $2, $4, $3
/* 30CC 00102FCC 00000000 */  nop
/* 30D0 00102FD0 00000000 */  nop
/* 30D4 00102FD4 FAFF4010 */  beqz       $2, .L00102FC0
/* 30D8 00102FD8 00000000 */   nop
/* 30DC 00102FDC C0FF0010 */  b          .L00102EE0
/* 30E0 00102FE0 C0100B00 */   sll       $2, $11, 3
.L00102FE4:
/* 30E4 00102FE4 0400838D */  lw         $3, 0x4($12)
/* 30E8 00102FE8 3C100400 */  dsll32     $2, $4, 0
/* 30EC 00102FEC 3F100200 */  dsra32     $2, $2, 0
/* 30F0 00102FF0 27100200 */  nor        $2, $0, $2
/* 30F4 00102FF4 24186200 */  and        $3, $3, $2
/* 30F8 00102FF8 E7FF0010 */  b          .L00102F98
/* 30FC 00102FFC 040083AD */   sw        $3, 0x4($12)
.L00103000:
/* 3100 00103000 08FE8326 */  addiu      $3, $20, %lo(__malloc_av_)
.L00103004:
/* 3104 00103004 FFFF023C */  lui        $2, (0xFFFFFFFC >> 16)
/* 3108 00103008 0800648C */  lw         $4, 0x8($3)
/* 310C 0010300C FCFF4234 */  ori        $2, $2, (0xFFFFFFFC & 0xFFFF)
/* 3110 00103010 0400838C */  lw         $3, 0x4($4)
/* 3114 00103014 24106200 */  and        $2, $3, $2
/* 3118 00103018 2B205100 */  sltu       $4, $2, $17
/* 311C 0010301C 06008050 */  beql       $4, $0, .L00103038
/* 3120 00103020 23105100 */   subu      $2, $2, $17
/* 3124 00103024 23102202 */  subu       $2, $17, $2
/* 3128 00103028 3C100200 */  dsll32     $2, $2, 0
/* 312C 0010302C 3E100200 */  dsrl32     $2, $2, 0
/* 3130 00103030 03000010 */  b          .L00103040
/* 3134 00103034 2F380200 */   dsubu     $7, $0, $2
.L00103038:
/* 3138 00103038 3C100200 */  dsll32     $2, $2, 0
/* 313C 0010303C 3E380200 */  dsrl32     $7, $2, 0
.L00103040:
/* 3140 00103040 08FE9226 */  addiu      $18, $20, %lo(__malloc_av_)
/* 3144 00103044 FFFF103C */  lui        $16, (0xFFFFFFFC >> 16)
/* 3148 00103048 0800438E */  lw         $3, 0x8($18)
/* 314C 0010304C FCFF1036 */  ori        $16, $16, (0xFFFFFFFC & 0xFFFF)
/* 3150 00103050 0400628C */  lw         $2, 0x4($3)
/* 3154 00103054 24105000 */  and        $2, $2, $16
/* 3158 00103058 2B105100 */  sltu       $2, $2, $17
/* 315C 0010305C 04004014 */  bnez       $2, .L00103070
/* 3160 00103060 2D206002 */   daddu     $4, $19, $0
/* 3164 00103064 1000E228 */  slti       $2, $7, 0x10
/* 3168 00103068 4D004010 */  beqz       $2, .L001031A0
/* 316C 0010306C 08FE8626 */   addiu     $6, $20, %lo(__malloc_av_)
.L00103070:
/* 3170 00103070 0A0A040C */  jal        malloc_extend_top
/* 3174 00103074 2D282002 */   daddu     $5, $17, $0
/* 3178 00103078 0800428E */  lw         $2, 0x8($18)
/* 317C 0010307C 0400438C */  lw         $3, 0x4($2)
/* 3180 00103080 24187000 */  and        $3, $3, $16
/* 3184 00103084 2B107100 */  sltu       $2, $3, $17
/* 3188 00103088 05004010 */  beqz       $2, .L001030A0
/* 318C 0010308C 23102302 */   subu      $2, $17, $3
/* 3190 00103090 3C100200 */  dsll32     $2, $2, 0
/* 3194 00103094 3E100200 */  dsrl32     $2, $2, 0
/* 3198 00103098 04000010 */  b          .L001030AC
/* 319C 0010309C 2F380200 */   dsubu     $7, $0, $2
.L001030A0:
/* 31A0 001030A0 23107100 */  subu       $2, $3, $17
/* 31A4 001030A4 3C100200 */  dsll32     $2, $2, 0
/* 31A8 001030A8 3E380200 */  dsrl32     $7, $2, 0
.L001030AC:
/* 31AC 001030AC 08FE8226 */  addiu      $2, $20, %lo(__malloc_av_)
/* 31B0 001030B0 FFFF033C */  lui        $3, (0xFFFFFFFC >> 16)
/* 31B4 001030B4 0800448C */  lw         $4, 0x8($2)
/* 31B8 001030B8 FCFF6334 */  ori        $3, $3, (0xFFFFFFFC & 0xFFFF)
/* 31BC 001030BC 0400828C */  lw         $2, 0x4($4)
/* 31C0 001030C0 24104300 */  and        $2, $2, $3
/* 31C4 001030C4 2B105100 */  sltu       $2, $2, $17
/* 31C8 001030C8 03004014 */  bnez       $2, .L001030D8
/* 31CC 001030CC 1000E228 */   slti      $2, $7, 0x10
/* 31D0 001030D0 33004010 */  beqz       $2, .L001031A0
/* 31D4 001030D4 08FE8626 */   addiu     $6, $20, %lo(__malloc_av_)
.L001030D8:
/* 31D8 001030D8 8C0D040C */  jal        __malloc_unlock
/* 31DC 001030DC 2D206002 */   daddu     $4, $19, $0
/* 31E0 001030E0 3D000010 */  b          .L001031D8
/* 31E4 001030E4 2D100000 */   daddu     $2, $0, $0
.L001030E8:
/* 31E8 001030E8 0C000A8E */  lw         $10, 0xC($16)
/* 31EC 001030EC 0800098E */  lw         $9, 0x8($16)
/* 31F0 001030F0 2D206002 */  daddu      $4, $19, $0
/* 31F4 001030F4 0400628C */  lw         $2, 0x4($3)
/* 31F8 001030F8 0C002AAD */  sw         $10, 0xC($9)
/* 31FC 001030FC 01004234 */  ori        $2, $2, 0x1
/* 3200 00103100 080049AD */  sw         $9, 0x8($10)
/* 3204 00103104 8C0D040C */  jal        __malloc_unlock
/* 3208 00103108 040062AC */   sw        $2, 0x4($3)
/* 320C 0010310C 32000010 */  b          .L001031D8
/* 3210 00103110 08000226 */   addiu     $2, $16, 0x8
.L00103114:
/* 3214 00103114 01000224 */  addiu      $2, $0, 0x1
/* 3218 00103118 0800098E */  lw         $9, 0x8($16)
/* 321C 0010311C 3C300700 */  dsll32     $6, $7, 0
/* 3220 00103120 3F300600 */  dsra32     $6, $6, 0
/* 3224 00103124 2510E200 */  or         $2, $7, $2
/* 3228 00103128 01002436 */  ori        $4, $17, 0x1
/* 322C 0010312C 0C002AAD */  sw         $10, 0xC($9)
/* 3230 00103130 21381102 */  addu       $7, $16, $17
/* 3234 00103134 10FEC325 */  addiu      $3, $14, %lo(__malloc_av_ + 0x8)
/* 3238 00103138 080049AD */  sw         $9, 0x8($10)
/* 323C 0010313C 040004AE */  sw         $4, 0x4($16)
/* 3240 00103140 3C100200 */  dsll32     $2, $2, 0
/* 3244 00103144 3F100200 */  dsra32     $2, $2, 0
/* 3248 00103148 0C0067AC */  sw         $7, 0xC($3)
/* 324C 0010314C 2128E600 */  addu       $5, $7, $6
/* 3250 00103150 080067AC */  sw         $7, 0x8($3)
/* 3254 00103154 2D206002 */  daddu      $4, $19, $0
/* 3258 00103158 0400E2AC */  sw         $2, 0x4($7)
/* 325C 0010315C 0000A6AC */  sw         $6, 0x0($5)
/* 3260 00103160 0800E3AC */  sw         $3, 0x8($7)
/* 3264 00103164 8C0D040C */  jal        __malloc_unlock
/* 3268 00103168 0C00E3AC */   sw        $3, 0xC($7)
/* 326C 0010316C 1A000010 */  b          .L001031D8
/* 3270 00103170 08000226 */   addiu     $2, $16, 0x8
.L00103174:
/* 3274 00103174 0C000A8E */  lw         $10, 0xC($16)
/* 3278 00103178 0400628C */  lw         $2, 0x4($3)
/* 327C 0010317C 2D206002 */  daddu      $4, $19, $0
/* 3280 00103180 0800098E */  lw         $9, 0x8($16)
/* 3284 00103184 01004234 */  ori        $2, $2, 0x1
/* 3288 00103188 0C002AAD */  sw         $10, 0xC($9)
/* 328C 0010318C 040062AC */  sw         $2, 0x4($3)
/* 3290 00103190 8C0D040C */  jal        __malloc_unlock
/* 3294 00103194 080049AD */   sw        $9, 0x8($10)
/* 3298 00103198 0F000010 */  b          .L001031D8
/* 329C 0010319C 08000226 */   addiu     $2, $16, 0x8
.L001031A0:
/* 32A0 001031A0 01000224 */  addiu      $2, $0, 0x1
/* 32A4 001031A4 0800D08C */  lw         $16, 0x8($6)
/* 32A8 001031A8 2510E200 */  or         $2, $7, $2
/* 32AC 001031AC 01002336 */  ori        $3, $17, 0x1
/* 32B0 001031B0 3C100200 */  dsll32     $2, $2, 0
/* 32B4 001031B4 3F100200 */  dsra32     $2, $2, 0
/* 32B8 001031B8 21281102 */  addu       $5, $16, $17
/* 32BC 001031BC 040003AE */  sw         $3, 0x4($16)
/* 32C0 001031C0 0400A2AC */  sw         $2, 0x4($5)
/* 32C4 001031C4 2D206002 */  daddu      $4, $19, $0
/* 32C8 001031C8 0800C5AC */  sw         $5, 0x8($6)
.L001031CC:
/* 32CC 001031CC 8C0D040C */  jal        __malloc_unlock
/* 32D0 001031D0 00000000 */   nop
/* 32D4 001031D4 08000226 */  addiu      $2, $16, 0x8
.L001031D8:
/* 32D8 001031D8 5000BFDF */  ld         $31, 0x50($sp)
/* 32DC 001031DC 4000B4DF */  ld         $20, 0x40($sp)
/* 32E0 001031E0 3000B3DF */  ld         $19, 0x30($sp)
/* 32E4 001031E4 2000B2DF */  ld         $18, 0x20($sp)
/* 32E8 001031E8 1000B1DF */  ld         $17, 0x10($sp)
/* 32EC 001031EC 0000B0DF */  ld         $16, 0x0($sp)
/* 32F0 001031F0 0800E003 */  jr         $31
/* 32F4 001031F4 6000BD27 */   addiu     $sp, $sp, 0x60