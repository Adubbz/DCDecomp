.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawItemBox__11CDungeonMapFPf
/* C4EE0 001C4DE0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* C4EE4 001C4DE4 5000BF7F */  sq         $31, 0x50($sp)
/* C4EE8 001C4DE8 4000B47F */  sq         $20, 0x40($sp)
/* C4EEC 001C4DEC 3000B37F */  sq         $19, 0x30($sp)
/* C4EF0 001C4DF0 2000B27F */  sq         $18, 0x20($sp)
/* C4EF4 001C4DF4 1000B17F */  sq         $17, 0x10($sp)
/* C4EF8 001C4DF8 0000B07F */  sq         $16, 0x0($sp)
/* C4EFC 001C4DFC 28A68070 */  paddub     $20, $4, $0
/* C4F00 001C4E00 289EA070 */  paddub     $19, $5, $0
/* C4F04 001C4E04 0100013C */  lui        $at, (0x10000 >> 16)
/* C4F08 001C4E08 21088100 */  addu       $at, $4, $at
/* C4F0C 001C4E0C 64BC238C */  lw         $3, -0x439C($at)
/* C4F10 001C4E10 06006010 */  beqz       $3, .L001C4E2C
/* C4F14 001C4E14 00000000 */   nop
/* C4F18 001C4E18 0100013C */  lui        $at, (0x10000 >> 16)
/* C4F1C 001C4E1C 21088102 */  addu       $at, $20, $at
/* C4F20 001C4E20 68BC238C */  lw         $3, -0x4398($at)
/* C4F24 001C4E24 03006014 */  bnez       $3, .L001C4E34
/* C4F28 001C4E28 00000000 */   nop
.L001C4E2C:
/* C4F2C 001C4E2C A9000010 */  b          .L001C50D4
/* C4F30 001C4E30 00000000 */   nop
.L001C4E34:
/* C4F34 001C4E34 0100013C */  lui        $at, (0x10000 >> 16)
/* C4F38 001C4E38 21088102 */  addu       $at, $20, $at
/* C4F3C 001C4E3C 74BC238C */  lw         $3, -0x438C($at)
/* C4F40 001C4E40 06006010 */  beqz       $3, .L001C4E5C
/* C4F44 001C4E44 00000000 */   nop
/* C4F48 001C4E48 0100013C */  lui        $at, (0x10000 >> 16)
/* C4F4C 001C4E4C 21088102 */  addu       $at, $20, $at
/* C4F50 001C4E50 70BC238C */  lw         $3, -0x4390($at)
/* C4F54 001C4E54 03006014 */  bnez       $3, .L001C4E64
/* C4F58 001C4E58 00000000 */   nop
.L001C4E5C:
/* C4F5C 001C4E5C 9D000010 */  b          .L001C50D4
/* C4F60 001C4E60 00000000 */   nop
.L001C4E64:
/* C4F64 001C4E64 28860070 */  paddub     $16, $0, $0
/* C4F68 001C4E68 97000010 */  b          .L001C50C8
/* C4F6C 001C4E6C 00000000 */   nop
.L001C4E70:
/* C4F70 001C4E70 80891000 */  sll        $17, $16, 6
/* C4F74 001C4E74 21203402 */  addu       $4, $17, $20
/* C4F78 001C4E78 0100013C */  lui        $at, (0x10000 >> 16)
/* C4F7C 001C4E7C 21088100 */  addu       $at, $4, $at
/* C4F80 001C4E80 60B6238C */  lw         $3, -0x49A0($at)
/* C4F84 001C4E84 8F006010 */  beqz       $3, .L001C50C4
/* C4F88 001C4E88 00000000 */   nop
/* C4F8C 001C4E8C 78369224 */  addiu      $18, $4, 0x3678
/* C4F90 001C4E90 F87F5226 */  addiu      $18, $18, 0x7FF8
/* C4F94 001C4E94 28264072 */  paddub     $4, $18, $0
/* C4F98 001C4E98 282E6072 */  paddub     $5, $19, $0
/* C4F9C 001C4E9C 648D040C */  jal        DistVector__FPfPf
/* C4FA0 001C4EA0 00000000 */   nop
/* C4FA4 001C4EA4 2043033C */  lui        $3, (0x43200000 >> 16)
/* C4FA8 001C4EA8 00108344 */  mtc1       $3, $f2
/* C4FAC 001C4EAC B00381C6 */  lwc1       $f1, 0x3B0($20)
/* C4FB0 001C4EB0 42100146 */  mul.s      $f1, $f2, $f1
/* C4FB4 001C4EB4 36000146 */  c.le.s     $f0, $f1
/* C4FB8 001C4EB8 00000000 */  nop
/* C4FBC 001C4EBC 81000045 */  bc1f       .L001C50C4
/* C4FC0 001C4EC0 00000000 */   nop
/* C4FC4 001C4EC4 21183402 */  addu       $3, $17, $20
/* C4FC8 001C4EC8 0100013C */  lui        $at, (0x10000 >> 16)
/* C4FCC 001C4ECC 21086100 */  addu       $at, $3, $at
/* C4FD0 001C4ED0 88B6248C */  lw         $4, -0x4978($at)
/* C4FD4 001C4ED4 01000324 */  addiu      $3, $0, 0x1
/* C4FD8 001C4ED8 42008310 */  beq        $4, $3, .L001C4FE4
/* C4FDC 001C4EDC 00000000 */   nop
/* C4FE0 001C4EE0 03008010 */  beqz       $4, .L001C4EF0
/* C4FE4 001C4EE4 00000000 */   nop
/* C4FE8 001C4EE8 76000010 */  b          .L001C50C4
/* C4FEC 001C4EEC 00000000 */   nop
.L001C4EF0:
/* C4FF0 001C4EF0 0100013C */  lui        $at, (0x10000 >> 16)
/* C4FF4 001C4EF4 21088102 */  addu       $at, $20, $at
/* C4FF8 001C4EF8 68BC248C */  lw         $4, -0x4398($at)
/* C4FFC 001C4EFC 282E4072 */  paddub     $5, $18, $0
/* C5000 001C4F00 B89F040C */  jal        SetPosition__6CFrameFPf
/* C5004 001C4F04 00000000 */   nop
/* C5008 001C4F08 0100013C */  lui        $at, (0x10000 >> 16)
/* C500C 001C4F0C 21088102 */  addu       $at, $20, $at
/* C5010 001C4F10 68BC228C */  lw         $2, -0x4398($at)
/* C5014 001C4F14 6000A427 */  addiu      $4, $sp, 0x60
/* C5018 001C4F18 20024524 */  addiu      $5, $2, 0x220
/* C501C 001C4F1C 0C86040C */  jal        sceVu0CopyVector
/* C5020 001C4F20 00000000 */   nop
/* C5024 001C4F24 6400A1C7 */  lwc1       $f1, 0x64($sp)
/* C5028 001C4F28 0041023C */  lui        $2, (0x41000000 >> 16)
/* C502C 001C4F2C 00008244 */  mtc1       $2, $f0
/* C5030 001C4F30 00000000 */  nop
/* C5034 001C4F34 00080046 */  add.s      $f0, $f1, $f0
/* C5038 001C4F38 6400A0E7 */  swc1       $f0, 0x64($sp)
/* C503C 001C4F3C 6800A1C7 */  lwc1       $f1, 0x68($sp)
/* C5040 001C4F40 A040023C */  lui        $2, (0x40A00000 >> 16)
/* C5044 001C4F44 00008244 */  mtc1       $2, $f0
/* C5048 001C4F48 00000000 */  nop
/* C504C 001C4F4C 01080046 */  sub.s      $f0, $f1, $f0
/* C5050 001C4F50 6800A0E7 */  swc1       $f0, 0x68($sp)
/* C5054 001C4F54 0100013C */  lui        $at, (0x10000 >> 16)
/* C5058 001C4F58 21088102 */  addu       $at, $20, $at
/* C505C 001C4F5C 64BC248C */  lw         $4, -0x439C($at)
/* C5060 001C4F60 6000A527 */  addiu      $5, $sp, 0x60
/* C5064 001C4F64 B89F040C */  jal        SetPosition__6CFrameFPf
/* C5068 001C4F68 00000000 */   nop
/* C506C 001C4F6C 21103402 */  addu       $2, $17, $20
/* C5070 001C4F70 0100013C */  lui        $at, (0x10000 >> 16)
/* C5074 001C4F74 21084100 */  addu       $at, $2, $at
/* C5078 001C4F78 8CB621C4 */  lwc1       $f1, -0x4974($at)
/* C507C 001C4F7C 00688044 */  mtc1       $0, $f13
/* C5080 001C4F80 00000000 */  nop
/* C5084 001C4F84 866B0046 */  mov.s      $f14, $f13
/* C5088 001C4F88 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* C508C 001C4F8C 42000146 */  mul.s      $f1, $f0, $f1
/* C5090 001C4F90 3443023C */  lui        $2, (0x43340000 >> 16)
/* C5094 001C4F94 00008244 */  mtc1       $2, $f0
/* C5098 001C4F98 00000000 */  nop
/* C509C 001C4F9C 030B0046 */  div.s      $f12, $f1, $f0
/* C50A0 001C4FA0 0100013C */  lui        $at, (0x10000 >> 16)
/* C50A4 001C4FA4 21088102 */  addu       $at, $20, $at
/* C50A8 001C4FA8 64BC248C */  lw         $4, -0x439C($at)
/* C50AC 001C4FAC 70A3040C */  jal        SetRotation__6CFrameFfff
/* C50B0 001C4FB0 00000000 */   nop
/* C50B4 001C4FB4 0100013C */  lui        $at, (0x10000 >> 16)
/* C50B8 001C4FB8 21088102 */  addu       $at, $20, $at
/* C50BC 001C4FBC 68BC248C */  lw         $4, -0x4398($at)
/* C50C0 001C4FC0 60BB040C */  jal        MGDraw__FP6CFrame
/* C50C4 001C4FC4 00000000 */   nop
/* C50C8 001C4FC8 0100013C */  lui        $at, (0x10000 >> 16)
/* C50CC 001C4FCC 21088102 */  addu       $at, $20, $at
/* C50D0 001C4FD0 64BC248C */  lw         $4, -0x439C($at)
/* C50D4 001C4FD4 60BB040C */  jal        MGDraw__FP6CFrame
/* C50D8 001C4FD8 00000000 */   nop
/* C50DC 001C4FDC 39000010 */  b          .L001C50C4
/* C50E0 001C4FE0 00000000 */   nop
.L001C4FE4:
/* C50E4 001C4FE4 0100013C */  lui        $at, (0x10000 >> 16)
/* C50E8 001C4FE8 21088102 */  addu       $at, $20, $at
/* C50EC 001C4FEC 74BC248C */  lw         $4, -0x438C($at)
/* C50F0 001C4FF0 282E4072 */  paddub     $5, $18, $0
/* C50F4 001C4FF4 B89F040C */  jal        SetPosition__6CFrameFPf
/* C50F8 001C4FF8 00000000 */   nop
/* C50FC 001C4FFC 0100013C */  lui        $at, (0x10000 >> 16)
/* C5100 001C5000 21088102 */  addu       $at, $20, $at
/* C5104 001C5004 74BC228C */  lw         $2, -0x438C($at)
/* C5108 001C5008 6000A427 */  addiu      $4, $sp, 0x60
/* C510C 001C500C 20024524 */  addiu      $5, $2, 0x220
/* C5110 001C5010 0C86040C */  jal        sceVu0CopyVector
/* C5114 001C5014 00000000 */   nop
/* C5118 001C5018 6400A0C7 */  lwc1       $f0, 0x64($sp)
/* C511C 001C501C 4040023C */  lui        $2, (0x40400000 >> 16)
/* C5120 001C5020 00088244 */  mtc1       $2, $f1
/* C5124 001C5024 00000000 */  nop
/* C5128 001C5028 00000146 */  add.s      $f0, $f0, $f1
/* C512C 001C502C 6400A0E7 */  swc1       $f0, 0x64($sp)
/* C5130 001C5030 6800A0C7 */  lwc1       $f0, 0x68($sp)
/* C5134 001C5034 01000146 */  sub.s      $f0, $f0, $f1
/* C5138 001C5038 6800A0E7 */  swc1       $f0, 0x68($sp)
/* C513C 001C503C 0100013C */  lui        $at, (0x10000 >> 16)
/* C5140 001C5040 21088102 */  addu       $at, $20, $at
/* C5144 001C5044 70BC248C */  lw         $4, -0x4390($at)
/* C5148 001C5048 6000A527 */  addiu      $5, $sp, 0x60
/* C514C 001C504C B89F040C */  jal        SetPosition__6CFrameFPf
/* C5150 001C5050 00000000 */   nop
/* C5154 001C5054 21103402 */  addu       $2, $17, $20
/* C5158 001C5058 0100013C */  lui        $at, (0x10000 >> 16)
/* C515C 001C505C 21084100 */  addu       $at, $2, $at
/* C5160 001C5060 8CB621C4 */  lwc1       $f1, -0x4974($at)
/* C5164 001C5064 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* C5168 001C5068 42000146 */  mul.s      $f1, $f0, $f1
/* C516C 001C506C 3443023C */  lui        $2, (0x43340000 >> 16)
/* C5170 001C5070 00008244 */  mtc1       $2, $f0
/* C5174 001C5074 00000000 */  nop
/* C5178 001C5078 030B0046 */  div.s      $f12, $f1, $f0
/* C517C 001C507C 00688044 */  mtc1       $0, $f13
/* C5180 001C5080 00000000 */  nop
/* C5184 001C5084 866B0046 */  mov.s      $f14, $f13
/* C5188 001C5088 0100013C */  lui        $at, (0x10000 >> 16)
/* C518C 001C508C 21088102 */  addu       $at, $20, $at
/* C5190 001C5090 70BC248C */  lw         $4, -0x4390($at)
/* C5194 001C5094 70A3040C */  jal        SetRotation__6CFrameFfff
/* C5198 001C5098 00000000 */   nop
/* C519C 001C509C 0100013C */  lui        $at, (0x10000 >> 16)
/* C51A0 001C50A0 21088102 */  addu       $at, $20, $at
/* C51A4 001C50A4 74BC248C */  lw         $4, -0x438C($at)
/* C51A8 001C50A8 60BB040C */  jal        MGDraw__FP6CFrame
/* C51AC 001C50AC 00000000 */   nop
/* C51B0 001C50B0 0100013C */  lui        $at, (0x10000 >> 16)
/* C51B4 001C50B4 21088102 */  addu       $at, $20, $at
/* C51B8 001C50B8 70BC248C */  lw         $4, -0x4390($at)
/* C51BC 001C50BC 60BB040C */  jal        MGDraw__FP6CFrame
/* C51C0 001C50C0 00000000 */   nop
.L001C50C4:
/* C51C4 001C50C4 01001026 */  addiu      $16, $16, 0x1
.L001C50C8:
/* C51C8 001C50C8 1800032A */  slti       $3, $16, 0x18
/* C51CC 001C50CC 68FF6014 */  bnez       $3, .L001C4E70
/* C51D0 001C50D0 00000000 */   nop
.L001C50D4:
/* C51D4 001C50D4 5000BF7B */  lq         $31, 0x50($sp)
/* C51D8 001C50D8 4000B47B */  lq         $20, 0x40($sp)
/* C51DC 001C50DC 3000B37B */  lq         $19, 0x30($sp)
/* C51E0 001C50E0 2000B27B */  lq         $18, 0x20($sp)
/* C51E4 001C50E4 1000B17B */  lq         $17, 0x10($sp)
/* C51E8 001C50E8 0000B07B */  lq         $16, 0x0($sp)
/* C51EC 001C50EC 7000BD27 */  addiu      $sp, $sp, 0x70
/* C51F0 001C50F0 0800E003 */  jr         $31
/* C51F4 001C50F4 00000000 */   nop
/* C51F8 001C50F8 00000000 */  nop
/* C51FC 001C50FC 00000000 */  nop
