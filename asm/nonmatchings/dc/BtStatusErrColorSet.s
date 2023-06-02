.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtStatusErrColorSet__Fv
/* B1A60 001B1960 28160070 */  paddub     $2, $0, $0
/* B1A64 001B1964 789C848F */  lw         $4, -0x6388($gp)
/* B1A68 001B1968 04008380 */  lb         $3, 0x4($4)
/* B1A6C 001B196C 80180300 */  sll        $3, $3, 2
/* B1A70 001B1970 21186400 */  addu       $3, $3, $4
/* B1A74 001B1974 C842648C */  lw         $4, 0x42C8($3)
/* B1A78 001B1978 04008330 */  andi       $3, $4, 0x4
/* B1A7C 001B197C 09006010 */  beqz       $3, .L001B19A4
/* B1A80 001B1980 00000000 */   nop
/* B1A84 001B1984 FF42023C */  lui        $2, (0x42FF0000 >> 16)
/* B1A88 001B1988 D501013C */  lui        $at, (0x1D564B8 >> 16)
/* B1A8C 001B198C B86422AC */  sw         $2, (0x1D564B8 & 0xFFFF)($at)
/* B1A90 001B1990 D501013C */  lui        $at, (0x1D564BC >> 16)
/* B1A94 001B1994 BC6422AC */  sw         $2, (0x1D564BC & 0xFFFF)($at)
/* B1A98 001B1998 D501013C */  lui        $at, (0x1D564C0 >> 16)
/* B1A9C 001B199C C06422AC */  sw         $2, (0x1D564C0 & 0xFFFF)($at)
/* B1AA0 001B19A0 01000224 */  addiu      $2, $0, 0x1
.L001B19A4:
/* B1AA4 001B19A4 40008330 */  andi       $3, $4, 0x40
/* B1AA8 001B19A8 0B006010 */  beqz       $3, .L001B19D8
/* B1AAC 001B19AC 00000000 */   nop
/* B1AB0 001B19B0 4842023C */  lui        $2, (0x42480000 >> 16)
/* B1AB4 001B19B4 D501013C */  lui        $at, (0x1D564B8 >> 16)
/* B1AB8 001B19B8 B86422AC */  sw         $2, (0x1D564B8 & 0xFFFF)($at)
/* B1ABC 001B19BC 9642023C */  lui        $2, (0x42960000 >> 16)
/* B1AC0 001B19C0 D501013C */  lui        $at, (0x1D564BC >> 16)
/* B1AC4 001B19C4 BC6422AC */  sw         $2, (0x1D564BC & 0xFFFF)($at)
/* B1AC8 001B19C8 FF42023C */  lui        $2, (0x42FF0000 >> 16)
/* B1ACC 001B19CC D501013C */  lui        $at, (0x1D564C0 >> 16)
/* B1AD0 001B19D0 C06422AC */  sw         $2, (0x1D564C0 & 0xFFFF)($at)
/* B1AD4 001B19D4 01000224 */  addiu      $2, $0, 0x1
.L001B19D8:
/* B1AD8 001B19D8 10008330 */  andi       $3, $4, 0x10
/* B1ADC 001B19DC 0B006010 */  beqz       $3, .L001B1A0C
/* B1AE0 001B19E0 00000000 */   nop
/* B1AE4 001B19E4 3C42023C */  lui        $2, (0x423C0000 >> 16)
/* B1AE8 001B19E8 D501013C */  lui        $at, (0x1D564B8 >> 16)
/* B1AEC 001B19EC B86422AC */  sw         $2, (0x1D564B8 & 0xFFFF)($at)
/* B1AF0 001B19F0 003F023C */  lui        $2, (0x3F000000 >> 16)
/* B1AF4 001B19F4 D501013C */  lui        $at, (0x1D564BC >> 16)
/* B1AF8 001B19F8 BC6422AC */  sw         $2, (0x1D564BC & 0xFFFF)($at)
/* B1AFC 001B19FC 7F42023C */  lui        $2, (0x427F0000 >> 16)
/* B1B00 001B1A00 D501013C */  lui        $at, (0x1D564C0 >> 16)
/* B1B04 001B1A04 C06422AC */  sw         $2, (0x1D564C0 & 0xFFFF)($at)
/* B1B08 001B1A08 01000224 */  addiu      $2, $0, 0x1
.L001B1A0C:
/* B1B0C 001B1A0C 08008330 */  andi       $3, $4, 0x8
/* B1B10 001B1A10 0B006010 */  beqz       $3, .L001B1A40
/* B1B14 001B1A14 00000000 */   nop
/* B1B18 001B1A18 FF42023C */  lui        $2, (0x42FF0000 >> 16)
/* B1B1C 001B1A1C D501013C */  lui        $at, (0x1D564B8 >> 16)
/* B1B20 001B1A20 B86422AC */  sw         $2, (0x1D564B8 & 0xFFFF)($at)
/* B1B24 001B1A24 A042023C */  lui        $2, (0x42A00000 >> 16)
/* B1B28 001B1A28 D501013C */  lui        $at, (0x1D564BC >> 16)
/* B1B2C 001B1A2C BC6422AC */  sw         $2, (0x1D564BC & 0xFFFF)($at)
/* B1B30 001B1A30 7041023C */  lui        $2, (0x41700000 >> 16)
/* B1B34 001B1A34 D501013C */  lui        $at, (0x1D564C0 >> 16)
/* B1B38 001B1A38 C06422AC */  sw         $2, (0x1D564C0 & 0xFFFF)($at)
/* B1B3C 001B1A3C 01000224 */  addiu      $2, $0, 0x1
.L001B1A40:
/* B1B40 001B1A40 0800E003 */  jr         $31
/* B1B44 001B1A44 00000000 */   nop
/* B1B48 001B1A48 00000000 */  nop
/* B1B4C 001B1A4C 00000000 */  nop
