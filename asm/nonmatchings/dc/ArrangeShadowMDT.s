.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ArrangeShadowMDT__FPUi
/* 26C30 00126B30 408FBD27 */  addiu      $sp, $sp, -0x70C0
/* 26C34 00126B34 8000BF7F */  sq         $31, 0x80($sp)
/* 26C38 00126B38 7000B77F */  sq         $23, 0x70($sp)
/* 26C3C 00126B3C 6000B67F */  sq         $22, 0x60($sp)
/* 26C40 00126B40 5000B57F */  sq         $21, 0x50($sp)
/* 26C44 00126B44 4000B47F */  sq         $20, 0x40($sp)
/* 26C48 00126B48 3000B37F */  sq         $19, 0x30($sp)
/* 26C4C 00126B4C 2000B27F */  sq         $18, 0x20($sp)
/* 26C50 00126B50 1000B17F */  sq         $17, 0x10($sp)
/* 26C54 00126B54 0000B07F */  sq         $16, 0x0($sp)
/* 26C58 00126B58 2800838C */  lw         $3, 0x28($4)
/* 26C5C 00126B5C 21288300 */  addu       $5, $4, $3
/* 26C60 00126B60 1000838C */  lw         $3, 0x10($4)
/* 26C64 00126B64 21888300 */  addu       $17, $4, $3
/* 26C68 00126B68 0800B78C */  lw         $23, 0x8($5)
/* 26C6C 00126B6C 1000B424 */  addiu      $20, $5, 0x10
/* 26C70 00126B70 28860070 */  paddub     $16, $0, $0
/* 26C74 00126B74 28960070 */  paddub     $18, $0, $0
/* 26C78 00126B78 7A000010 */  b          .L00126D64
/* 26C7C 00126B7C 00000000 */   nop
.L00126B80:
/* 26C80 00126B80 0400968E */  lw         $22, 0x4($20)
/* 26C84 00126B84 0C009426 */  addiu      $20, $20, 0xC
/* 26C88 00126B88 289E0070 */  paddub     $19, $0, $0
/* 26C8C 00126B8C 6B000010 */  b          .L00126D3C
/* 26C90 00126B90 00000000 */   nop
.L00126B94:
/* 26C94 00126B94 0C00828E */  lw         $2, 0xC($20)
/* 26C98 00126B98 00110200 */  sll        $2, $2, 4
/* 26C9C 00126B9C 21282202 */  addu       $5, $17, $2
/* 26CA0 00126BA0 0000828E */  lw         $2, 0x0($20)
/* 26CA4 00126BA4 00110200 */  sll        $2, $2, 4
/* 26CA8 00126BA8 21302202 */  addu       $6, $17, $2
/* 26CAC 00126BAC 9070A427 */  addiu      $4, $sp, 0x7090
/* 26CB0 00126BB0 EE85040C */  jal        sceVu0SubVector
/* 26CB4 00126BB4 00000000 */   nop
/* 26CB8 00126BB8 1800828E */  lw         $2, 0x18($20)
/* 26CBC 00126BBC 00110200 */  sll        $2, $2, 4
/* 26CC0 00126BC0 21282202 */  addu       $5, $17, $2
/* 26CC4 00126BC4 0000828E */  lw         $2, 0x0($20)
/* 26CC8 00126BC8 00110200 */  sll        $2, $2, 4
/* 26CCC 00126BCC 21302202 */  addu       $6, $17, $2
/* 26CD0 00126BD0 A070A427 */  addiu      $4, $sp, 0x70A0
/* 26CD4 00126BD4 EE85040C */  jal        sceVu0SubVector
/* 26CD8 00126BD8 00000000 */   nop
/* 26CDC 00126BDC B070A427 */  addiu      $4, $sp, 0x70B0
/* 26CE0 00126BE0 9070A527 */  addiu      $5, $sp, 0x7090
/* 26CE4 00126BE4 A070A627 */  addiu      $6, $sp, 0x70A0
/* 26CE8 00126BE8 8085040C */  jal        sceVu0OuterProduct
/* 26CEC 00126BEC 00000000 */   nop
/* 26CF0 00126BF0 00111000 */  sll        $2, $16, 4
/* 26CF4 00126BF4 21105D00 */  addu       $2, $2, $sp
/* 26CF8 00126BF8 90305524 */  addiu      $21, $2, 0x3090
/* 26CFC 00126BFC 2826A072 */  paddub     $4, $21, $0
/* 26D00 00126C00 B070A527 */  addiu      $5, $sp, 0x70B0
/* 26D04 00126C04 9285040C */  jal        sceVu0Normalize
/* 26D08 00126C08 00000000 */   nop
/* 26D0C 00126C0C 01000226 */  addiu      $2, $16, 0x1
/* 26D10 00126C10 00110200 */  sll        $2, $2, 4
/* 26D14 00126C14 21105D00 */  addu       $2, $2, $sp
/* 26D18 00126C18 90304424 */  addiu      $4, $2, 0x3090
/* 26D1C 00126C1C 282EA072 */  paddub     $5, $21, $0
/* 26D20 00126C20 0C86040C */  jal        sceVu0CopyVector
/* 26D24 00126C24 00000000 */   nop
/* 26D28 00126C28 02000226 */  addiu      $2, $16, 0x2
/* 26D2C 00126C2C 00110200 */  sll        $2, $2, 4
/* 26D30 00126C30 21105D00 */  addu       $2, $2, $sp
/* 26D34 00126C34 90304424 */  addiu      $4, $2, 0x3090
/* 26D38 00126C38 282EA072 */  paddub     $5, $21, $0
/* 26D3C 00126C3C 0C86040C */  jal        sceVu0CopyVector
/* 26D40 00126C40 00000000 */   nop
/* 26D44 00126C44 00008486 */  lh         $4, 0x0($20)
/* 26D48 00126C48 40181000 */  sll        $3, $16, 1
/* 26D4C 00126C4C 21187000 */  addu       $3, $3, $16
/* 26D50 00126C50 80300300 */  sll        $6, $3, 2
/* 26D54 00126C54 2118DD00 */  addu       $3, $6, $sp
/* 26D58 00126C58 900064A4 */  sh         $4, 0x90($3)
/* 26D5C 00126C5C 0C008586 */  lh         $5, 0xC($20)
/* 26D60 00126C60 9200A327 */  addiu      $3, $sp, 0x92
/* 26D64 00126C64 21206600 */  addu       $4, $3, $6
/* 26D68 00126C68 000085A4 */  sh         $5, 0x0($4)
/* 26D6C 00126C6C 9400A427 */  addiu      $4, $sp, 0x94
/* 26D70 00126C70 21288600 */  addu       $5, $4, $6
/* 26D74 00126C74 0000A0A4 */  sh         $0, 0x0($5)
/* 26D78 00126C78 08008726 */  addiu      $7, $20, 0x8
/* 26D7C 00126C7C 9800A527 */  addiu      $5, $sp, 0x98
/* 26D80 00126C80 2130A600 */  addu       $6, $5, $6
/* 26D84 00126C84 0000C7AC */  sw         $7, 0x0($6)
/* 26D88 00126C88 080080AE */  sw         $0, 0x8($20)
/* 26D8C 00126C8C 0C008886 */  lh         $8, 0xC($20)
/* 26D90 00126C90 01000726 */  addiu      $7, $16, 0x1
/* 26D94 00126C94 40300700 */  sll        $6, $7, 1
/* 26D98 00126C98 2130C700 */  addu       $6, $6, $7
/* 26D9C 00126C9C 80480600 */  sll        $9, $6, 2
/* 26DA0 00126CA0 21303D01 */  addu       $6, $9, $sp
/* 26DA4 00126CA4 9000C8A4 */  sh         $8, 0x90($6)
/* 26DA8 00126CA8 18008786 */  lh         $7, 0x18($20)
/* 26DAC 00126CAC 21306900 */  addu       $6, $3, $9
/* 26DB0 00126CB0 0000C7A4 */  sh         $7, 0x0($6)
/* 26DB4 00126CB4 21308900 */  addu       $6, $4, $9
/* 26DB8 00126CB8 0000C0A4 */  sh         $0, 0x0($6)
/* 26DBC 00126CBC 14008726 */  addiu      $7, $20, 0x14
/* 26DC0 00126CC0 2130A900 */  addu       $6, $5, $9
/* 26DC4 00126CC4 0000C7AC */  sw         $7, 0x0($6)
/* 26DC8 00126CC8 140080AE */  sw         $0, 0x14($20)
/* 26DCC 00126CCC 18008886 */  lh         $8, 0x18($20)
/* 26DD0 00126CD0 02000726 */  addiu      $7, $16, 0x2
/* 26DD4 00126CD4 40300700 */  sll        $6, $7, 1
/* 26DD8 00126CD8 2130C700 */  addu       $6, $6, $7
/* 26DDC 00126CDC 80380600 */  sll        $7, $6, 2
/* 26DE0 00126CE0 2130FD00 */  addu       $6, $7, $sp
/* 26DE4 00126CE4 9000C8A4 */  sh         $8, 0x90($6)
/* 26DE8 00126CE8 00008686 */  lh         $6, 0x0($20)
/* 26DEC 00126CEC 21186700 */  addu       $3, $3, $7
/* 26DF0 00126CF0 000066A4 */  sh         $6, 0x0($3)
/* 26DF4 00126CF4 21188700 */  addu       $3, $4, $7
/* 26DF8 00126CF8 000060A4 */  sh         $0, 0x0($3)
/* 26DFC 00126CFC 20008426 */  addiu      $4, $20, 0x20
/* 26E00 00126D00 2118A700 */  addu       $3, $5, $7
/* 26E04 00126D04 000064AC */  sw         $4, 0x0($3)
/* 26E08 00126D08 200080AE */  sw         $0, 0x20($20)
/* 26E0C 00126D0C 03001026 */  addiu      $16, $16, 0x3
/* 26E10 00126D10 FD03012A */  slti       $at, $16, 0x3FD
/* 26E14 00126D14 07002014 */  bnez       $at, .L00126D34
/* 26E18 00126D18 00000000 */   nop
/* 26E1C 00126D1C 2A00023C */  lui        $2, %hi(_541)
/* 26E20 00126D20 B08D4424 */  addiu      $4, $2, %lo(_541)
/* 26E24 00126D24 A611040C */  jal        printf
/* 26E28 00126D28 00000000 */   nop
.L00126D2C:
/* 26E2C 00126D2C FFFF0010 */  b          .L00126D2C
/* 26E30 00126D30 00000000 */   nop
.L00126D34:
/* 26E34 00126D34 24009426 */  addiu      $20, $20, 0x24
/* 26E38 00126D38 01007326 */  addiu      $19, $19, 0x1
.L00126D3C:
/* 26E3C 00126D3C 03000324 */  addiu      $3, $0, 0x3
/* 26E40 00126D40 1A00C302 */  div        $0, $22, $3
/* 26E44 00126D44 02006014 */  bnez       $3, .L00126D50
/* 26E48 00126D48 00000000 */   nop
/* 26E4C 00126D4C CD010000 */  break      0, 7
.L00126D50:
/* 26E50 00126D50 12180000 */  mflo       $3
/* 26E54 00126D54 2A186302 */  slt        $3, $19, $3
/* 26E58 00126D58 8EFF6014 */  bnez       $3, .L00126B94
/* 26E5C 00126D5C 00000000 */   nop
/* 26E60 00126D60 01005226 */  addiu      $18, $18, 0x1
.L00126D64:
/* 26E64 00126D64 2A185702 */  slt        $3, $18, $23
/* 26E68 00126D68 85FF6014 */  bnez       $3, .L00126B80
/* 26E6C 00126D6C 00000000 */   nop
/* 26E70 00126D70 288E0070 */  paddub     $17, $0, $0
/* 26E74 00126D74 3E000010 */  b          .L00126E70
/* 26E78 00126D78 00000000 */   nop
.L00126D7C:
/* 26E7C 00126D7C 40181100 */  sll        $3, $17, 1
/* 26E80 00126D80 21187100 */  addu       $3, $3, $17
/* 26E84 00126D84 80A00300 */  sll        $20, $3, 2
/* 26E88 00126D88 9400B727 */  addiu      $23, $sp, 0x94
/* 26E8C 00126D8C 21B0F402 */  addu       $22, $23, $20
/* 26E90 00126D90 0000C386 */  lh         $3, 0x0($22)
/* 26E94 00126D94 35006014 */  bnez       $3, .L00126E6C
/* 26E98 00126D98 00000000 */   nop
/* 26E9C 00126D9C 01003226 */  addiu      $18, $17, 0x1
/* 26EA0 00126DA0 2F000010 */  b          .L00126E60
/* 26EA4 00126DA4 00000000 */   nop
.L00126DA8:
/* 26EA8 00126DA8 40181200 */  sll        $3, $18, 1
/* 26EAC 00126DAC 21187200 */  addu       $3, $3, $18
/* 26EB0 00126DB0 80980300 */  sll        $19, $3, 2
/* 26EB4 00126DB4 21A8F302 */  addu       $21, $23, $19
/* 26EB8 00126DB8 0000A386 */  lh         $3, 0x0($21)
/* 26EBC 00126DBC 27006014 */  bnez       $3, .L00126E5C
/* 26EC0 00126DC0 00000000 */   nop
/* 26EC4 00126DC4 21189D02 */  addu       $3, $20, $sp
/* 26EC8 00126DC8 90006484 */  lh         $4, 0x90($3)
/* 26ECC 00126DCC 9200A527 */  addiu      $5, $sp, 0x92
/* 26ED0 00126DD0 2118B300 */  addu       $3, $5, $19
/* 26ED4 00126DD4 00006384 */  lh         $3, 0x0($3)
/* 26ED8 00126DD8 20008314 */  bne        $4, $3, .L00126E5C
/* 26EDC 00126DDC 00000000 */   nop
/* 26EE0 00126DE0 2118B400 */  addu       $3, $5, $20
/* 26EE4 00126DE4 00006484 */  lh         $4, 0x0($3)
/* 26EE8 00126DE8 21187D02 */  addu       $3, $19, $sp
/* 26EEC 00126DEC 90006384 */  lh         $3, 0x90($3)
/* 26EF0 00126DF0 1A008314 */  bne        $4, $3, .L00126E5C
/* 26EF4 00126DF4 00000000 */   nop
/* 26EF8 00126DF8 00111100 */  sll        $2, $17, 4
/* 26EFC 00126DFC 21185D00 */  addu       $3, $2, $sp
/* 26F00 00126E00 00111200 */  sll        $2, $18, 4
/* 26F04 00126E04 21105D00 */  addu       $2, $2, $sp
/* 26F08 00126E08 90306424 */  addiu      $4, $3, 0x3090
/* 26F0C 00126E0C 90304524 */  addiu      $5, $2, 0x3090
/* 26F10 00126E10 648D040C */  jal        DistVector__FPfPf
/* 26F14 00126E14 00000000 */   nop
/* 26F18 00126E18 948081C7 */  lwc1       $f1, -0x7F6C($gp)
/* 26F1C 00126E1C 34000146 */  c.lt.s     $f0, $f1
/* 26F20 00126E20 00000000 */  nop
/* 26F24 00126E24 0D000045 */  bc1f       .L00126E5C
/* 26F28 00126E28 00000000 */   nop
/* 26F2C 00126E2C 01000424 */  addiu      $4, $0, 0x1
/* 26F30 00126E30 0000C4A6 */  sh         $4, 0x0($22)
/* 26F34 00126E34 9800A527 */  addiu      $5, $sp, 0x98
/* 26F38 00126E38 2118B400 */  addu       $3, $5, $20
/* 26F3C 00126E3C 0000638C */  lw         $3, 0x0($3)
/* 26F40 00126E40 000064AC */  sw         $4, 0x0($3)
/* 26F44 00126E44 0000A4A6 */  sh         $4, 0x0($21)
/* 26F48 00126E48 2118B300 */  addu       $3, $5, $19
/* 26F4C 00126E4C 0000638C */  lw         $3, 0x0($3)
/* 26F50 00126E50 000064AC */  sw         $4, 0x0($3)
/* 26F54 00126E54 05000010 */  b          .L00126E6C
/* 26F58 00126E58 00000000 */   nop
.L00126E5C:
/* 26F5C 00126E5C 01005226 */  addiu      $18, $18, 0x1
.L00126E60:
/* 26F60 00126E60 2A185002 */  slt        $3, $18, $16
/* 26F64 00126E64 D0FF6014 */  bnez       $3, .L00126DA8
/* 26F68 00126E68 00000000 */   nop
.L00126E6C:
/* 26F6C 00126E6C 01003126 */  addiu      $17, $17, 0x1
.L00126E70:
/* 26F70 00126E70 FFFF0326 */  addiu      $3, $16, -0x1
/* 26F74 00126E74 2A182302 */  slt        $3, $17, $3
/* 26F78 00126E78 C0FF6014 */  bnez       $3, .L00126D7C
/* 26F7C 00126E7C 00000000 */   nop
/* 26F80 00126E80 8000BF7B */  lq         $31, 0x80($sp)
/* 26F84 00126E84 7000B77B */  lq         $23, 0x70($sp)
/* 26F88 00126E88 6000B67B */  lq         $22, 0x60($sp)
/* 26F8C 00126E8C 5000B57B */  lq         $21, 0x50($sp)
/* 26F90 00126E90 4000B47B */  lq         $20, 0x40($sp)
/* 26F94 00126E94 3000B37B */  lq         $19, 0x30($sp)
/* 26F98 00126E98 2000B27B */  lq         $18, 0x20($sp)
/* 26F9C 00126E9C 1000B17B */  lq         $17, 0x10($sp)
/* 26FA0 00126EA0 0000B07B */  lq         $16, 0x0($sp)
/* 26FA4 00126EA4 C070BD27 */  addiu      $sp, $sp, 0x70C0
/* 26FA8 00126EA8 0800E003 */  jr         $31
/* 26FAC 00126EAC 00000000 */   nop
