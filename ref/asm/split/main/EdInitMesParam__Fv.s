.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdInitMesParam__Fv
/* 0782D0 001781D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0782D4 001781D4 0000BF7F */  sq          $31, 0x0($29)
/* 0782D8 001781D8 1C8D848F */  lw          $4, -0x72E4($28)
/* 0782DC 001781DC CC5E050C */  jal         GetConfigData__9CSaveDataFv
/* 0782E0 001781E0 00000000 */   nop
/* 0782E4 001781E4 1000428C */  lw          $2, 0x10($2)
/* 0782E8 001781E8 04004010 */  beqz        $2, .L001781FC
/* 0782EC 001781EC 00000000 */   nop
/* 0782F0 001781F0 A08081C7 */  lwc1        $f1, -0x7F60($28)
/* 0782F4 001781F4 03000010 */  b           .L00178204
/* 0782F8 001781F8 00000000 */   nop
.L001781FC:
/* 0782FC 001781FC 7C8081C7 */  lwc1        $f1, -0x7F84($28)
/* 078300 00178200 00000000 */  nop
.L00178204:
/* 078304 00178204 15000424 */  addiu       $4, $0, 0x15
/* 078308 00178208 D201013C */  lui         $1, %hi(EditMes1 + 0x10)
/* 07830C 0017820C 60B524AC */  sw          $4, %lo(EditMes1 + 0x10)($1)
/* 078310 00178210 04000324 */  addiu       $3, $0, 0x4
/* 078314 00178214 D201013C */  lui         $1, %hi(EditMes1 + 0x14)
/* 078318 00178218 64B523AC */  sw          $3, %lo(EditMes1 + 0x14)($1)
/* 07831C 0017821C D201013C */  lui         $1, %hi(EditMes1 + 0xA4)
/* 078320 00178220 F4B521E4 */  swc1        $f1, %lo(EditMes1 + 0xA4)($1)
/* 078324 00178224 D201013C */  lui         $1, %hi(EditMes1 + 0xA8)
/* 078328 00178228 F8B521E4 */  swc1        $f1, %lo(EditMes1 + 0xA8)($1)
/* 07832C 0017822C 1A000224 */  addiu       $2, $0, 0x1A
/* 078330 00178230 D201013C */  lui         $1, %hi(EditMes1 + 0x174C)
/* 078334 00178234 9CCC22AC */  sw          $2, %lo(EditMes1 + 0x174C)($1)
/* 078338 00178238 D201013C */  lui         $1, %hi(EditMes1 + 0x16C0)
/* 07833C 0017823C 10CC20AC */  sw          $0, %lo(EditMes1 + 0x16C0)($1)
/* 078340 00178240 D201013C */  lui         $1, %hi(EditMes1 + 0x16C4)
/* 078344 00178244 14CC20AC */  sw          $0, %lo(EditMes1 + 0x16C4)($1)
/* 078348 00178248 01000524 */  addiu       $5, $0, 0x1
/* 07834C 0017824C D201013C */  lui         $1, %hi(EditMes1 + 0x16CC)
/* 078350 00178250 1CCC25AC */  sw          $5, %lo(EditMes1 + 0x16CC)($1)
/* 078354 00178254 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 078358 00178258 D201013C */  lui         $1, %hi(EditMes1 + 0x8C)
/* 07835C 0017825C DCB520E4 */  swc1        $f0, %lo(EditMes1 + 0x8C)($1)
/* 078360 00178260 D201013C */  lui         $1, %hi(EditMes1 + 0x16C4)
/* 078364 00178264 14CC25AC */  sw          $5, %lo(EditMes1 + 0x16C4)($1)
/* 078368 00178268 D201013C */  lui         $1, %hi(EditEventMes1 + 0x10)
/* 07836C 0017826C E0E424AC */  sw          $4, %lo(EditEventMes1 + 0x10)($1)
/* 078370 00178270 D201013C */  lui         $1, %hi(EditEventMes1 + 0x14)
/* 078374 00178274 E4E423AC */  sw          $3, %lo(EditEventMes1 + 0x14)($1)
/* 078378 00178278 D201013C */  lui         $1, %hi(EditEventMes1 + 0xA4)
/* 07837C 0017827C 74E521E4 */  swc1        $f1, %lo(EditEventMes1 + 0xA4)($1)
/* 078380 00178280 D201013C */  lui         $1, %hi(EditEventMes1 + 0xA8)
/* 078384 00178284 78E521E4 */  swc1        $f1, %lo(EditEventMes1 + 0xA8)($1)
/* 078388 00178288 D201013C */  lui         $1, %hi(EditEventMes1 + 0x174C)
/* 07838C 0017828C 1CFC22AC */  sw          $2, %lo(EditEventMes1 + 0x174C)($1)
/* 078390 00178290 D201013C */  lui         $1, %hi(EditEventMes1 + 0x16C0)
/* 078394 00178294 90FB20AC */  sw          $0, %lo(EditEventMes1 + 0x16C0)($1)
/* 078398 00178298 D201013C */  lui         $1, %hi(EditEventMes1 + 0x16C4)
/* 07839C 0017829C 94FB20AC */  sw          $0, %lo(EditEventMes1 + 0x16C4)($1)
/* 0783A0 001782A0 D201013C */  lui         $1, %hi(EditEventMes1 + 0x16CC)
/* 0783A4 001782A4 9CFB25AC */  sw          $5, %lo(EditEventMes1 + 0x16CC)($1)
/* 0783A8 001782A8 D201013C */  lui         $1, %hi(EditEventMes1 + 0x8C)
/* 0783AC 001782AC 5CE520E4 */  swc1        $f0, %lo(EditEventMes1 + 0x8C)($1)
/* 0783B0 001782B0 D201013C */  lui         $1, %hi(EditEventMes1 + 0x16C4)
/* 0783B4 001782B4 94FB25AC */  sw          $5, %lo(EditEventMes1 + 0x16C4)($1)
/* 0783B8 001782B8 D201023C */  lui         $2, %hi(EditSystemMes)
/* 0783BC 001782BC 102C4424 */  addiu       $4, $2, %lo(EditSystemMes)
/* 0783C0 001782C0 9836050C */  jal         Preset__6ClsMesFi
/* 0783C4 001782C4 00000000 */   nop
/* 0783C8 001782C8 D201013C */  lui         $1, %hi(EditSystemMes + 0x34)
/* 0783CC 001782CC 442C20AC */  sw          $0, %lo(EditSystemMes + 0x34)($1)
/* 0783D0 001782D0 01000324 */  addiu       $3, $0, 0x1
/* 0783D4 001782D4 D201013C */  lui         $1, %hi(EditSystemMes + 0x98)
/* 0783D8 001782D8 A82C23AC */  sw          $3, %lo(EditSystemMes + 0x98)($1)
/* 0783DC 001782DC D201013C */  lui         $1, %hi(EditSystemMes + 0xA4)
/* 0783E0 001782E0 B42C20AC */  sw          $0, %lo(EditSystemMes + 0xA4)($1)
/* 0783E4 001782E4 D201013C */  lui         $1, %hi(EditSystemMes + 0xA8)
/* 0783E8 001782E8 B82C20AC */  sw          $0, %lo(EditSystemMes + 0xA8)($1)
/* 0783EC 001782EC D201013C */  lui         $1, %hi(EditSystemMes + 0x16C4)
/* 0783F0 001782F0 D44220AC */  sw          $0, %lo(EditSystemMes + 0x16C4)($1)
/* 0783F4 001782F4 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0783F8 001782F8 D201013C */  lui         $1, %hi(EditSystemMes + 0x8C)
/* 0783FC 001782FC 9C2C22AC */  sw          $2, %lo(EditSystemMes + 0x8C)($1)
/* 078400 00178300 1A000224 */  addiu       $2, $0, 0x1A
/* 078404 00178304 D201013C */  lui         $1, %hi(EditSystemMes + 0x10)
/* 078408 00178308 202C22AC */  sw          $2, %lo(EditSystemMes + 0x10)($1)
/* 07840C 0017830C D201013C */  lui         $1, %hi(EditSystemMes + 0x14)
/* 078410 00178310 242C23AC */  sw          $3, %lo(EditSystemMes + 0x14)($1)
/* 078414 00178314 D201013C */  lui         $1, %hi(EditSystemMes + 0x16CC)
/* 078418 00178318 DC4220AC */  sw          $0, %lo(EditSystemMes + 0x16CC)($1)
/* 07841C 0017831C 03000224 */  addiu       $2, $0, 0x3
/* 078420 00178320 D201013C */  lui         $1, %hi(EditSystemMes + 0x16C0)
/* 078424 00178324 D04222AC */  sw          $2, %lo(EditSystemMes + 0x16C0)($1)
/* 078428 00178328 D201023C */  lui         $2, %hi(EditNameMes)
/* 07842C 0017832C 50144424 */  addiu       $4, $2, %lo(EditNameMes)
/* 078430 00178330 04000524 */  addiu       $5, $0, 0x4
/* 078434 00178334 9836050C */  jal         Preset__6ClsMesFi
/* 078438 00178338 00000000 */   nop
/* 07843C 0017833C 1A000324 */  addiu       $3, $0, 0x1A
/* 078440 00178340 D201013C */  lui         $1, %hi(EditNameMes + 0x174C)
/* 078444 00178344 9C2B23AC */  sw          $3, %lo(EditNameMes + 0x174C)($1)
/* 078448 00178348 04000324 */  addiu       $3, $0, 0x4
/* 07844C 0017834C D201013C */  lui         $1, %hi(EditNameMes + 0x14)
/* 078450 00178350 641423AC */  sw          $3, %lo(EditNameMes + 0x14)($1)
/* 078454 00178354 D201013C */  lui         $1, %hi(EditNameMes + 0x34)
/* 078458 00178358 841420AC */  sw          $0, %lo(EditNameMes + 0x34)($1)
/* 07845C 0017835C D201013C */  lui         $1, %hi(EditNameMes + 0x98)
/* 078460 00178360 E81420AC */  sw          $0, %lo(EditNameMes + 0x98)($1)
/* 078464 00178364 03000324 */  addiu       $3, $0, 0x3
/* 078468 00178368 D201013C */  lui         $1, %hi(EditNameMes + 0x16C0)
/* 07846C 0017836C 102B23AC */  sw          $3, %lo(EditNameMes + 0x16C0)($1)
/* 078470 00178370 0000BF7B */  lq          $31, 0x0($29)
/* 078474 00178374 1000BD27 */  addiu       $29, $29, 0x10
/* 078478 00178378 0800E003 */  jr          $31
/* 07847C 0017837C 00000000 */   nop
