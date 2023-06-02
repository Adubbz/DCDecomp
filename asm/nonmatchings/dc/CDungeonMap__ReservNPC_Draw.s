.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ReservNPC_Draw__11CDungeonMapFifffi
/* C1FB0 001C1EB0 30130324 */  addiu      $3, $0, 0x1330
/* C1FB4 001C1EB4 1818A300 */  mult       $3, $5, $3
/* C1FB8 001C1EB8 21206400 */  addu       $4, $3, $4
/* C1FBC 001C1EBC 0100013C */  lui        $at, (0x10000 >> 16)
/* C1FC0 001C1EC0 21088100 */  addu       $at, $4, $at
/* C1FC4 001C1EC4 C4CF238C */  lw         $3, -0x303C($at)
/* C1FC8 001C1EC8 28006010 */  beqz       $3, .L001C1F6C
/* C1FCC 001C1ECC 00000000 */   nop
/* C1FD0 001C1ED0 0100013C */  lui        $at, (0x10000 >> 16)
/* C1FD4 001C1ED4 21088100 */  addu       $at, $4, $at
/* C1FD8 001C1ED8 C8CF238C */  lw         $3, -0x3038($at)
/* C1FDC 001C1EDC 23006010 */  beqz       $3, .L001C1F6C
/* C1FE0 001C1EE0 00000000 */   nop
/* C1FE4 001C1EE4 0100013C */  lui        $at, (0x10000 >> 16)
/* C1FE8 001C1EE8 21088100 */  addu       $at, $4, $at
/* C1FEC 001C1EEC ACBE238C */  lw         $3, -0x4154($at)
/* C1FF0 001C1EF0 1E006010 */  beqz       $3, .L001C1F6C
/* C1FF4 001C1EF4 00000000 */   nop
/* C1FF8 001C1EF8 18518524 */  addiu      $5, $4, 0x5118
/* C1FFC 001C1EFC F87FA524 */  addiu      $5, $5, 0x7FF8
/* C2000 001C1F00 0000A38C */  lw         $3, 0x0($5)
/* C2004 001C1F04 00190300 */  sll        $3, $3, 4
/* C2008 001C1F08 21186400 */  addu       $3, $3, $4
/* C200C 001C1F0C 0100013C */  lui        $at, (0x10000 >> 16)
/* C2010 001C1F10 21086100 */  addu       $at, $3, $at
/* C2014 001C1F14 D0CF2CE4 */  swc1       $f12, -0x3030($at)
/* C2018 001C1F18 0000A38C */  lw         $3, 0x0($5)
/* C201C 001C1F1C 00190300 */  sll        $3, $3, 4
/* C2020 001C1F20 21186400 */  addu       $3, $3, $4
/* C2024 001C1F24 0100013C */  lui        $at, (0x10000 >> 16)
/* C2028 001C1F28 21086100 */  addu       $at, $3, $at
/* C202C 001C1F2C D4CF2DE4 */  swc1       $f13, -0x302C($at)
/* C2030 001C1F30 0000A38C */  lw         $3, 0x0($5)
/* C2034 001C1F34 00190300 */  sll        $3, $3, 4
/* C2038 001C1F38 21186400 */  addu       $3, $3, $4
/* C203C 001C1F3C 0100013C */  lui        $at, (0x10000 >> 16)
/* C2040 001C1F40 21086100 */  addu       $at, $3, $at
/* C2044 001C1F44 D8CF2EE4 */  swc1       $f14, -0x3028($at)
/* C2048 001C1F48 0000A38C */  lw         $3, 0x0($5)
/* C204C 001C1F4C 80180300 */  sll        $3, $3, 2
/* C2050 001C1F50 21186400 */  addu       $3, $3, $4
/* C2054 001C1F54 0100013C */  lui        $at, (0x10000 >> 16)
/* C2058 001C1F58 21086100 */  addu       $at, $3, $at
/* C205C 001C1F5C D0D026AC */  sw         $6, -0x2F30($at)
/* C2060 001C1F60 0000A38C */  lw         $3, 0x0($5)
/* C2064 001C1F64 01006324 */  addiu      $3, $3, 0x1
/* C2068 001C1F68 0000A3AC */  sw         $3, 0x0($5)
.L001C1F6C:
/* C206C 001C1F6C 0800E003 */  jr         $31
/* C2070 001C1F70 00000000 */   nop
/* C2074 001C1F74 00000000 */  nop
/* C2078 001C1F78 00000000 */  nop
/* C207C 001C1F7C 00000000 */  nop
