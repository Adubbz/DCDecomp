.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LimitEditCursorPos__FPfPf
/* 89C80 00189B80 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 89C84 00189B84 6000BF7F */  sq         $31, 0x60($sp)
/* 89C88 00189B88 5000B47F */  sq         $20, 0x50($sp)
/* 89C8C 00189B8C 4000B37F */  sq         $19, 0x40($sp)
/* 89C90 00189B90 3000B27F */  sq         $18, 0x30($sp)
/* 89C94 00189B94 2000B17F */  sq         $17, 0x20($sp)
/* 89C98 00189B98 1000B07F */  sq         $16, 0x10($sp)
/* 89C9C 00189B9C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 89CA0 00189BA0 289E8070 */  paddub     $19, $4, $0
/* 89CA4 00189BA4 2886A070 */  paddub     $16, $5, $0
/* 89CA8 00189BA8 7000A427 */  addiu      $4, $sp, 0x70
/* 89CAC 00189BAC 282E6072 */  paddub     $5, $19, $0
/* 89CB0 00189BB0 0C86040C */  jal        sceVu0CopyVector
/* 89CB4 00189BB4 00000000 */   nop
/* 89CB8 00189BB8 28266072 */  paddub     $4, $19, $0
/* 89CBC 00189BBC 282E6072 */  paddub     $5, $19, $0
/* 89CC0 00189BC0 28360072 */  paddub     $6, $16, $0
/* 89CC4 00189BC4 E885040C */  jal        sceVu0AddVector
/* 89CC8 00189BC8 00000000 */   nop
/* 89CCC 00189BCC 28860070 */  paddub     $16, $0, $0
/* 89CD0 00189BD0 13000010 */  b          .L00189C20
/* 89CD4 00189BD4 00000000 */   nop
.L00189BD8:
/* 89CD8 00189BD8 40211000 */  sll        $4, $16, 5
/* 89CDC 00189BDC 6090838F */  lw         $3, -0x6FA0($gp)
/* 89CE0 00189BE0 21186400 */  addu       $3, $3, $4
/* 89CE4 00189BE4 0100013C */  lui        $at, (0x182D0 >> 16)
/* 89CE8 00189BE8 D0822134 */  ori        $at, $at, (0x182D0 & 0xFFFF)
/* 89CEC 00189BEC 21186100 */  addu       $3, $3, $at
/* 89CF0 00189BF0 100061C4 */  lwc1       $f1, 0x10($3)
/* 89CF4 00189BF4 000060C4 */  lwc1       $f0, 0x0($3)
/* 89CF8 00189BF8 32000146 */  c.eq.s     $f0, $f1
/* 89CFC 00189BFC 00000000 */  nop
/* 89D00 00189C00 0A000145 */  bc1t       .L00189C2C
/* 89D04 00189C04 00000000 */   nop
/* 89D08 00189C08 080060C4 */  lwc1       $f0, 0x8($3)
/* 89D0C 00189C0C 32000146 */  c.eq.s     $f0, $f1
/* 89D10 00189C10 00000000 */  nop
/* 89D14 00189C14 05000145 */  bc1t       .L00189C2C
/* 89D18 00189C18 00000000 */   nop
/* 89D1C 00189C1C 01001026 */  addiu      $16, $16, 0x1
.L00189C20:
/* 89D20 00189C20 0800032A */  slti       $3, $16, 0x8
/* 89D24 00189C24 ECFF6014 */  bnez       $3, .L00189BD8
/* 89D28 00189C28 00000000 */   nop
.L00189C2C:
/* 89D2C 00189C2C 04000016 */  bnez       $16, .L00189C40
/* 89D30 00189C30 00000000 */   nop
/* 89D34 00189C34 040060AE */  sw         $0, 0x4($19)
/* 89D38 00189C38 29010010 */  b          .L0018A0E0
/* 89D3C 00189C3C 00000000 */   nop
.L00189C40:
/* 89D40 00189C40 28260070 */  paddub     $4, $0, $0
/* 89D44 00189C44 24000010 */  b          .L00189CD8
/* 89D48 00189C48 00000000 */   nop
.L00189C4C:
/* 89D4C 00189C4C 40190400 */  sll        $3, $4, 5
/* 89D50 00189C50 6090828F */  lw         $2, -0x6FA0($gp)
/* 89D54 00189C54 21104300 */  addu       $2, $2, $3
/* 89D58 00189C58 0100013C */  lui        $at, (0x182D0 >> 16)
/* 89D5C 00189C5C D0822134 */  ori        $at, $at, (0x182D0 & 0xFFFF)
/* 89D60 00189C60 21104100 */  addu       $2, $2, $at
/* 89D64 00189C64 000061C6 */  lwc1       $f1, 0x0($19)
/* 89D68 00189C68 000040C4 */  lwc1       $f0, 0x0($2)
/* 89D6C 00189C6C 36080046 */  c.le.s     $f1, $f0
/* 89D70 00189C70 00000000 */  nop
/* 89D74 00189C74 17000045 */  bc1f       .L00189CD4
/* 89D78 00189C78 00000000 */   nop
/* 89D7C 00189C7C 080062C6 */  lwc1       $f2, 0x8($19)
/* 89D80 00189C80 080040C4 */  lwc1       $f0, 0x8($2)
/* 89D84 00189C84 36100046 */  c.le.s     $f2, $f0
/* 89D88 00189C88 00000000 */  nop
/* 89D8C 00189C8C 11000045 */  bc1f       .L00189CD4
/* 89D90 00189C90 00000000 */   nop
/* 89D94 00189C94 100040C4 */  lwc1       $f0, 0x10($2)
/* 89D98 00189C98 34080046 */  c.lt.s     $f1, $f0
/* 89D9C 00189C9C 00000000 */  nop
/* 89DA0 00189CA0 0C000145 */  bc1t       .L00189CD4
/* 89DA4 00189CA4 00000000 */   nop
/* 89DA8 00189CA8 180040C4 */  lwc1       $f0, 0x18($2)
/* 89DAC 00189CAC 34100046 */  c.lt.s     $f2, $f0
/* 89DB0 00189CB0 00000000 */  nop
/* 89DB4 00189CB4 07000145 */  bc1t       .L00189CD4
/* 89DB8 00189CB8 00000000 */   nop
/* 89DBC 00189CBC 28266072 */  paddub     $4, $19, $0
/* 89DC0 00189CC0 8426060C */  jal        GetMaxHeightCursor__FPf
/* 89DC4 00189CC4 00000000 */   nop
/* 89DC8 00189CC8 040060E6 */  swc1       $f0, 0x4($19)
/* 89DCC 00189CCC 04010010 */  b          .L0018A0E0
/* 89DD0 00189CD0 00000000 */   nop
.L00189CD4:
/* 89DD4 00189CD4 01008424 */  addiu      $4, $4, 0x1
.L00189CD8:
/* 89DD8 00189CD8 2A109000 */  slt        $2, $4, $16
/* 89DDC 00189CDC DBFF4014 */  bnez       $2, .L00189C4C
/* 89DE0 00189CE0 00000000 */   nop
/* 89DE4 00189CE4 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 89DE8 00189CE8 00A08244 */  mtc1       $2, $f20
/* 89DEC 00189CEC FFFF1124 */  addiu      $17, $0, -0x1
/* 89DF0 00189CF0 28960070 */  paddub     $18, $0, $0
/* 89DF4 00189CF4 3D000010 */  b          .L00189DEC
/* 89DF8 00189CF8 00000000 */   nop
.L00189CFC:
/* 89DFC 00189CFC 40191200 */  sll        $3, $18, 5
/* 89E00 00189D00 6090828F */  lw         $2, -0x6FA0($gp)
/* 89E04 00189D04 21104300 */  addu       $2, $2, $3
/* 89E08 00189D08 0100013C */  lui        $at, (0x182D0 >> 16)
/* 89E0C 00189D0C D0822134 */  ori        $at, $at, (0x182D0 & 0xFFFF)
/* 89E10 00189D10 21A04100 */  addu       $20, $2, $at
/* 89E14 00189D14 7000A1C7 */  lwc1       $f1, 0x70($sp)
/* 89E18 00189D18 000080C6 */  lwc1       $f0, 0x0($20)
/* 89E1C 00189D1C 36080046 */  c.le.s     $f1, $f0
/* 89E20 00189D20 00000000 */  nop
/* 89E24 00189D24 30000045 */  bc1f       .L00189DE8
/* 89E28 00189D28 00000000 */   nop
/* 89E2C 00189D2C 7800A2C7 */  lwc1       $f2, 0x78($sp)
/* 89E30 00189D30 080080C6 */  lwc1       $f0, 0x8($20)
/* 89E34 00189D34 36100046 */  c.le.s     $f2, $f0
/* 89E38 00189D38 00000000 */  nop
/* 89E3C 00189D3C 2A000045 */  bc1f       .L00189DE8
/* 89E40 00189D40 00000000 */   nop
/* 89E44 00189D44 100080C6 */  lwc1       $f0, 0x10($20)
/* 89E48 00189D48 34080046 */  c.lt.s     $f1, $f0
/* 89E4C 00189D4C 00000000 */  nop
/* 89E50 00189D50 25000145 */  bc1t       .L00189DE8
/* 89E54 00189D54 00000000 */   nop
/* 89E58 00189D58 180080C6 */  lwc1       $f0, 0x18($20)
/* 89E5C 00189D5C 34100046 */  c.lt.s     $f2, $f0
/* 89E60 00189D60 00000000 */  nop
/* 89E64 00189D64 20000145 */  bc1t       .L00189DE8
/* 89E68 00189D68 00000000 */   nop
/* 89E6C 00189D6C 8000A427 */  addiu      $4, $sp, 0x80
/* 89E70 00189D70 282E6072 */  paddub     $5, $19, $0
/* 89E74 00189D74 28368072 */  paddub     $6, $20, $0
/* 89E78 00189D78 088C040C */  jal        VectorMin__FPfPfPf
/* 89E7C 00189D7C 00000000 */   nop
/* 89E80 00189D80 8000A427 */  addiu      $4, $sp, 0x80
/* 89E84 00189D84 282E8070 */  paddub     $5, $4, $0
/* 89E88 00189D88 10008626 */  addiu      $6, $20, 0x10
/* 89E8C 00189D8C EC8B040C */  jal        VectorMax__FPfPfPf
/* 89E90 00189D90 00000000 */   nop
/* 89E94 00189D94 9000A427 */  addiu      $4, $sp, 0x90
/* 89E98 00189D98 8000A527 */  addiu      $5, $sp, 0x80
/* 89E9C 00189D9C 28366072 */  paddub     $6, $19, $0
/* 89EA0 00189DA0 EE85040C */  jal        sceVu0SubVector
/* 89EA4 00189DA4 00000000 */   nop
/* 89EA8 00189DA8 9400A0AF */  sw         $0, 0x94($sp)
/* 89EAC 00189DAC 9000A427 */  addiu      $4, $sp, 0x90
/* 89EB0 00189DB0 588D040C */  jal        DistVector__FPf
/* 89EB4 00189DB4 00000000 */   nop
/* 89EB8 00189DB8 05002106 */  bgez       $17, .L00189DD0
/* 89EBC 00189DBC 00000000 */   nop
/* 89EC0 00189DC0 288E4072 */  paddub     $17, $18, $0
/* 89EC4 00189DC4 06050046 */  mov.s      $f20, $f0
/* 89EC8 00189DC8 07000010 */  b          .L00189DE8
/* 89ECC 00189DCC 00000000 */   nop
.L00189DD0:
/* 89ED0 00189DD0 34001446 */  c.lt.s     $f0, $f20
/* 89ED4 00189DD4 00000000 */  nop
/* 89ED8 00189DD8 03000045 */  bc1f       .L00189DE8
/* 89EDC 00189DDC 00000000 */   nop
/* 89EE0 00189DE0 288E4072 */  paddub     $17, $18, $0
/* 89EE4 00189DE4 06050046 */  mov.s      $f20, $f0
.L00189DE8:
/* 89EE8 00189DE8 01005226 */  addiu      $18, $18, 0x1
.L00189DEC:
/* 89EEC 00189DEC 2A105002 */  slt        $2, $18, $16
/* 89EF0 00189DF0 C2FF4014 */  bnez       $2, .L00189CFC
/* 89EF4 00189DF4 00000000 */   nop
/* 89EF8 00189DF8 17002006 */  bltz       $17, .L00189E58
/* 89EFC 00189DFC 00000000 */   nop
/* 89F00 00189E00 40191100 */  sll        $3, $17, 5
/* 89F04 00189E04 6090828F */  lw         $2, -0x6FA0($gp)
/* 89F08 00189E08 21104300 */  addu       $2, $2, $3
/* 89F0C 00189E0C 0100013C */  lui        $at, (0x182D0 >> 16)
/* 89F10 00189E10 D0822134 */  ori        $at, $at, (0x182D0 & 0xFFFF)
/* 89F14 00189E14 21804100 */  addu       $16, $2, $at
/* 89F18 00189E18 28266072 */  paddub     $4, $19, $0
/* 89F1C 00189E1C 282E6072 */  paddub     $5, $19, $0
/* 89F20 00189E20 28360072 */  paddub     $6, $16, $0
/* 89F24 00189E24 088C040C */  jal        VectorMin__FPfPfPf
/* 89F28 00189E28 00000000 */   nop
/* 89F2C 00189E2C 28266072 */  paddub     $4, $19, $0
/* 89F30 00189E30 282E6072 */  paddub     $5, $19, $0
/* 89F34 00189E34 10000626 */  addiu      $6, $16, 0x10
/* 89F38 00189E38 EC8B040C */  jal        VectorMax__FPfPfPf
/* 89F3C 00189E3C 00000000 */   nop
/* 89F40 00189E40 28266072 */  paddub     $4, $19, $0
/* 89F44 00189E44 8426060C */  jal        GetMaxHeightCursor__FPf
/* 89F48 00189E48 00000000 */   nop
/* 89F4C 00189E4C 040060E6 */  swc1       $f0, 0x4($19)
/* 89F50 00189E50 A3000010 */  b          .L0018A0E0
/* 89F54 00189E54 00000000 */   nop
.L00189E58:
/* 89F58 00189E58 288E0070 */  paddub     $17, $0, $0
/* 89F5C 00189E5C 6090848F */  lw         $4, -0x6FA0($gp)
/* 89F60 00189E60 0100013C */  lui        $at, (0x182D0 >> 16)
/* 89F64 00189E64 D0822134 */  ori        $at, $at, (0x182D0 & 0xFFFF)
/* 89F68 00189E68 21908100 */  addu       $18, $4, $at
/* 89F6C 00189E6C 000065C6 */  lwc1       $f5, 0x0($19)
/* 89F70 00189E70 000040C6 */  lwc1       $f0, 0x0($18)
/* 89F74 00189E74 41280046 */  sub.s      $f1, $f5, $f0
/* 89F78 00189E78 00008044 */  mtc1       $0, $f0
/* 89F7C 00189E7C 00000000 */  nop
/* 89F80 00189E80 34080046 */  c.lt.s     $f1, $f0
/* 89F84 00189E84 00000000 */  nop
/* 89F88 00189E88 04000045 */  bc1f       .L00189E9C
/* 89F8C 00189E8C 00000000 */   nop
/* 89F90 00189E90 47080046 */  neg.s      $f1, $f1
/* 89F94 00189E94 01000010 */  b          .L00189E9C
/* 89F98 00189E98 00000000 */   nop
.L00189E9C:
/* 89F9C 00189E9C 100040C6 */  lwc1       $f0, 0x10($18)
/* 89FA0 00189EA0 81280046 */  sub.s      $f2, $f5, $f0
/* 89FA4 00189EA4 00008044 */  mtc1       $0, $f0
/* 89FA8 00189EA8 00000000 */  nop
/* 89FAC 00189EAC 34100046 */  c.lt.s     $f2, $f0
/* 89FB0 00189EB0 00000000 */  nop
/* 89FB4 00189EB4 04000045 */  bc1f       .L00189EC8
/* 89FB8 00189EB8 00000000 */   nop
/* 89FBC 00189EBC 87100046 */  neg.s      $f2, $f2
/* 89FC0 00189EC0 01000010 */  b          .L00189EC8
/* 89FC4 00189EC4 00000000 */   nop
.L00189EC8:
/* 89FC8 00189EC8 080066C6 */  lwc1       $f6, 0x8($19)
/* 89FCC 00189ECC 080040C6 */  lwc1       $f0, 0x8($18)
/* 89FD0 00189ED0 01310046 */  sub.s      $f4, $f6, $f0
/* 89FD4 00189ED4 00008044 */  mtc1       $0, $f0
/* 89FD8 00189ED8 00000000 */  nop
/* 89FDC 00189EDC 34200046 */  c.lt.s     $f4, $f0
/* 89FE0 00189EE0 00000000 */  nop
/* 89FE4 00189EE4 04000045 */  bc1f       .L00189EF8
/* 89FE8 00189EE8 00000000 */   nop
/* 89FEC 00189EEC 07210046 */  neg.s      $f4, $f4
/* 89FF0 00189EF0 01000010 */  b          .L00189EF8
/* 89FF4 00189EF4 00000000 */   nop
.L00189EF8:
/* 89FF8 00189EF8 180040C6 */  lwc1       $f0, 0x18($18)
/* 89FFC 00189EFC C1300046 */  sub.s      $f3, $f6, $f0
/* 8A000 00189F00 00008044 */  mtc1       $0, $f0
/* 8A004 00189F04 00000000 */  nop
/* 8A008 00189F08 34180046 */  c.lt.s     $f3, $f0
/* 8A00C 00189F0C 00000000 */  nop
/* 8A010 00189F10 04000045 */  bc1f       .L00189F24
/* 8A014 00189F14 00000000 */   nop
/* 8A018 00189F18 C7180046 */  neg.s      $f3, $f3
/* 8A01C 00189F1C 01000010 */  b          .L00189F24
/* 8A020 00189F20 00000000 */   nop
.L00189F24:
/* 8A024 00189F24 34200346 */  c.lt.s     $f4, $f3
/* 8A028 00189F28 00000000 */  nop
/* 8A02C 00189F2C 03000045 */  bc1f       .L00189F3C
/* 8A030 00189F30 00000000 */   nop
/* 8A034 00189F34 02000010 */  b          .L00189F40
/* 8A038 00189F38 00000000 */   nop
.L00189F3C:
/* 8A03C 00189F3C 06190046 */  mov.s      $f4, $f3
.L00189F40:
/* 8A040 00189F40 34080246 */  c.lt.s     $f1, $f2
/* 8A044 00189F44 00000000 */  nop
/* 8A048 00189F48 03000045 */  bc1f       .L00189F58
/* 8A04C 00189F4C 00000000 */   nop
/* 8A050 00189F50 02000010 */  b          .L00189F5C
/* 8A054 00189F54 00000000 */   nop
.L00189F58:
/* 8A058 00189F58 46100046 */  mov.s      $f1, $f2
.L00189F5C:
/* 8A05C 00189F5C 000D0446 */  add.s      $f20, $f1, $f4
/* 8A060 00189F60 01000324 */  addiu      $3, $0, 0x1
/* 8A064 00189F64 48000010 */  b          .L0018A088
/* 8A068 00189F68 00000000 */   nop
.L00189F6C:
/* 8A06C 00189F6C 40110300 */  sll        $2, $3, 5
/* 8A070 00189F70 21108200 */  addu       $2, $4, $2
/* 8A074 00189F74 0100013C */  lui        $at, (0x182D0 >> 16)
/* 8A078 00189F78 D0822134 */  ori        $at, $at, (0x182D0 & 0xFFFF)
/* 8A07C 00189F7C 21904100 */  addu       $18, $2, $at
/* 8A080 00189F80 000040C6 */  lwc1       $f0, 0x0($18)
/* 8A084 00189F84 41280046 */  sub.s      $f1, $f5, $f0
/* 8A088 00189F88 00008044 */  mtc1       $0, $f0
/* 8A08C 00189F8C 00000000 */  nop
/* 8A090 00189F90 34080046 */  c.lt.s     $f1, $f0
/* 8A094 00189F94 00000000 */  nop
/* 8A098 00189F98 04000045 */  bc1f       .L00189FAC
/* 8A09C 00189F9C 00000000 */   nop
/* 8A0A0 00189FA0 47080046 */  neg.s      $f1, $f1
/* 8A0A4 00189FA4 01000010 */  b          .L00189FAC
/* 8A0A8 00189FA8 00000000 */   nop
.L00189FAC:
/* 8A0AC 00189FAC 100040C6 */  lwc1       $f0, 0x10($18)
/* 8A0B0 00189FB0 81280046 */  sub.s      $f2, $f5, $f0
/* 8A0B4 00189FB4 00008044 */  mtc1       $0, $f0
/* 8A0B8 00189FB8 00000000 */  nop
/* 8A0BC 00189FBC 34100046 */  c.lt.s     $f2, $f0
/* 8A0C0 00189FC0 00000000 */  nop
/* 8A0C4 00189FC4 04000045 */  bc1f       .L00189FD8
/* 8A0C8 00189FC8 00000000 */   nop
/* 8A0CC 00189FCC 87100046 */  neg.s      $f2, $f2
/* 8A0D0 00189FD0 01000010 */  b          .L00189FD8
/* 8A0D4 00189FD4 00000000 */   nop
.L00189FD8:
/* 8A0D8 00189FD8 080040C6 */  lwc1       $f0, 0x8($18)
/* 8A0DC 00189FDC 01310046 */  sub.s      $f4, $f6, $f0
/* 8A0E0 00189FE0 00008044 */  mtc1       $0, $f0
/* 8A0E4 00189FE4 00000000 */  nop
/* 8A0E8 00189FE8 34200046 */  c.lt.s     $f4, $f0
/* 8A0EC 00189FEC 00000000 */  nop
/* 8A0F0 00189FF0 04000045 */  bc1f       .L0018A004
/* 8A0F4 00189FF4 00000000 */   nop
/* 8A0F8 00189FF8 07210046 */  neg.s      $f4, $f4
/* 8A0FC 00189FFC 01000010 */  b          .L0018A004
/* 8A100 0018A000 00000000 */   nop
.L0018A004:
/* 8A104 0018A004 180040C6 */  lwc1       $f0, 0x18($18)
/* 8A108 0018A008 C1300046 */  sub.s      $f3, $f6, $f0
/* 8A10C 0018A00C 00008044 */  mtc1       $0, $f0
/* 8A110 0018A010 00000000 */  nop
/* 8A114 0018A014 34180046 */  c.lt.s     $f3, $f0
/* 8A118 0018A018 00000000 */  nop
/* 8A11C 0018A01C 04000045 */  bc1f       .L0018A030
/* 8A120 0018A020 00000000 */   nop
/* 8A124 0018A024 C7180046 */  neg.s      $f3, $f3
/* 8A128 0018A028 01000010 */  b          .L0018A030
/* 8A12C 0018A02C 00000000 */   nop
.L0018A030:
/* 8A130 0018A030 34200346 */  c.lt.s     $f4, $f3
/* 8A134 0018A034 00000000 */  nop
/* 8A138 0018A038 03000045 */  bc1f       .L0018A048
/* 8A13C 0018A03C 00000000 */   nop
/* 8A140 0018A040 02000010 */  b          .L0018A04C
/* 8A144 0018A044 00000000 */   nop
.L0018A048:
/* 8A148 0018A048 06190046 */  mov.s      $f4, $f3
.L0018A04C:
/* 8A14C 0018A04C 34080246 */  c.lt.s     $f1, $f2
/* 8A150 0018A050 00000000 */  nop
/* 8A154 0018A054 03000045 */  bc1f       .L0018A064
/* 8A158 0018A058 00000000 */   nop
/* 8A15C 0018A05C 02000010 */  b          .L0018A068
/* 8A160 0018A060 00000000 */   nop
.L0018A064:
/* 8A164 0018A064 46100046 */  mov.s      $f1, $f2
.L0018A068:
/* 8A168 0018A068 00080446 */  add.s      $f0, $f1, $f4
/* 8A16C 0018A06C 34001446 */  c.lt.s     $f0, $f20
/* 8A170 0018A070 00000000 */  nop
/* 8A174 0018A074 03000045 */  bc1f       .L0018A084
/* 8A178 0018A078 00000000 */   nop
/* 8A17C 0018A07C 06050046 */  mov.s      $f20, $f0
/* 8A180 0018A080 288E6070 */  paddub     $17, $3, $0
.L0018A084:
/* 8A184 0018A084 01006324 */  addiu      $3, $3, 0x1
.L0018A088:
/* 8A188 0018A088 2A107000 */  slt        $2, $3, $16
/* 8A18C 0018A08C B7FF4014 */  bnez       $2, .L00189F6C
/* 8A190 0018A090 00000000 */   nop
/* 8A194 0018A094 40111100 */  sll        $2, $17, 5
/* 8A198 0018A098 21108200 */  addu       $2, $4, $2
/* 8A19C 0018A09C 0100013C */  lui        $at, (0x182D0 >> 16)
/* 8A1A0 0018A0A0 D0822134 */  ori        $at, $at, (0x182D0 & 0xFFFF)
/* 8A1A4 0018A0A4 21904100 */  addu       $18, $2, $at
/* 8A1A8 0018A0A8 28266072 */  paddub     $4, $19, $0
/* 8A1AC 0018A0AC 282E6072 */  paddub     $5, $19, $0
/* 8A1B0 0018A0B0 28364072 */  paddub     $6, $18, $0
/* 8A1B4 0018A0B4 088C040C */  jal        VectorMin__FPfPfPf
/* 8A1B8 0018A0B8 00000000 */   nop
/* 8A1BC 0018A0BC 28266072 */  paddub     $4, $19, $0
/* 8A1C0 0018A0C0 282E6072 */  paddub     $5, $19, $0
/* 8A1C4 0018A0C4 10004626 */  addiu      $6, $18, 0x10
/* 8A1C8 0018A0C8 EC8B040C */  jal        VectorMax__FPfPfPf
/* 8A1CC 0018A0CC 00000000 */   nop
/* 8A1D0 0018A0D0 28266072 */  paddub     $4, $19, $0
/* 8A1D4 0018A0D4 8426060C */  jal        GetMaxHeightCursor__FPf
/* 8A1D8 0018A0D8 00000000 */   nop
/* 8A1DC 0018A0DC 040060E6 */  swc1       $f0, 0x4($19)
.L0018A0E0:
/* 8A1E0 0018A0E0 6000BF7B */  lq         $31, 0x60($sp)
/* 8A1E4 0018A0E4 5000B47B */  lq         $20, 0x50($sp)
/* 8A1E8 0018A0E8 4000B37B */  lq         $19, 0x40($sp)
/* 8A1EC 0018A0EC 3000B27B */  lq         $18, 0x30($sp)
/* 8A1F0 0018A0F0 2000B17B */  lq         $17, 0x20($sp)
/* 8A1F4 0018A0F4 1000B07B */  lq         $16, 0x10($sp)
/* 8A1F8 0018A0F8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 8A1FC 0018A0FC A000BD27 */  addiu      $sp, $sp, 0xA0
/* 8A200 0018A100 0800E003 */  jr         $31
/* 8A204 0018A104 00000000 */   nop
/* 8A208 0018A108 00000000 */  nop
/* 8A20C 0018A10C 00000000 */  nop