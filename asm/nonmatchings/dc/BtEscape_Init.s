.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtEscape_Init__Fv
/* D3CF0 001D3BF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D3CF4 001D3BF4 0000BF7F */  sq         $31, 0x0($sp)
/* D3CF8 001D3BF8 948B828F */  lw         $2, -0x746C($gp)
/* D3CFC 001D3BFC F001013C */  lui        $at, (0x1F06850 >> 16)
/* D3D00 001D3C00 506822AC */  sw         $2, (0x1F06850 & 0xFFFF)($at)
/* D3D04 001D3C04 0400023C */  lui        $2, (0x445C0 >> 16)
/* D3D08 001D3C08 C0454234 */  ori        $2, $2, (0x445C0 & 0xFFFF)
/* D3D0C 001D3C0C F001013C */  lui        $at, (0x1F0685C >> 16)
/* D3D10 001D3C10 5C6822AC */  sw         $2, (0x1F0685C & 0xFFFF)($at)
/* D3D14 001D3C14 F001013C */  lui        $at, (0x1F06858 >> 16)
/* D3D18 001D3C18 586820AC */  sw         $0, (0x1F06858 & 0xFFFF)($at)
/* D3D1C 001D3C1C 30FB040C */  jal        StartReadBG__Fv
/* D3D20 001D3C20 00000000 */   nop
/* D3D24 001D3C24 F001013C */  lui        $at, (0x1F06858 >> 16)
/* D3D28 001D3C28 5868228C */  lw         $2, (0x1F06858 & 0xFFFF)($at)
/* D3D2C 001D3C2C 00190200 */  sll        $3, $2, 4
/* D3D30 001D3C30 F001013C */  lui        $at, (0x1F06850 >> 16)
/* D3D34 001D3C34 5068228C */  lw         $2, (0x1F06850 & 0xFFFF)($at)
/* D3D38 001D3C38 21284300 */  addu       $5, $2, $3
/* D3D3C 001D3C3C 6C9485AF */  sw         $5, -0x6B94($gp)
/* D3D40 001D3C40 2A00023C */  lui        $2, %hi(_996)
/* D3D44 001D3C44 30C74424 */  addiu      $4, $2, %lo(_996)
/* D3D48 001D3C48 1C00A627 */  addiu      $6, $sp, 0x1C
/* D3D4C 001D3C4C ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* D3D50 001D3C50 00000000 */   nop
/* D3D54 001D3C54 1C00A28F */  lw         $2, 0x1C($sp)
/* D3D58 001D3C58 83110200 */  sra        $2, $2, 6
/* D3D5C 001D3C5C 01004224 */  addiu      $2, $2, 0x1
/* D3D60 001D3C60 80110200 */  sll        $2, $2, 6
/* D3D64 001D3C64 03290200 */  sra        $5, $2, 4
/* D3D68 001D3C68 F001023C */  lui        $2, %hi(D_1F06850)
/* D3D6C 001D3C6C 50684424 */  addiu      $4, $2, %lo(D_1F06850)
/* D3D70 001D3C70 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* D3D74 001D3C74 00000000 */   nop
/* D3D78 001D3C78 F001013C */  lui        $at, (0x1F06858 >> 16)
/* D3D7C 001D3C7C 5868228C */  lw         $2, (0x1F06858 & 0xFFFF)($at)
/* D3D80 001D3C80 00190200 */  sll        $3, $2, 4
/* D3D84 001D3C84 F001013C */  lui        $at, (0x1F06850 >> 16)
/* D3D88 001D3C88 5068228C */  lw         $2, (0x1F06850 & 0xFFFF)($at)
/* D3D8C 001D3C8C 21284300 */  addu       $5, $2, $3
/* D3D90 001D3C90 08000424 */  addiu      $4, $0, 0x8
/* D3D94 001D3C94 1C00A627 */  addiu      $6, $sp, 0x1C
/* D3D98 001D3C98 D86D050C */  jal        SndSPSeLoadBG__FiPUiPi
/* D3D9C 001D3C9C 00000000 */   nop
/* D3DA0 001D3CA0 1C00A28F */  lw         $2, 0x1C($sp)
/* D3DA4 001D3CA4 83110200 */  sra        $2, $2, 6
/* D3DA8 001D3CA8 01004224 */  addiu      $2, $2, 0x1
/* D3DAC 001D3CAC 80110200 */  sll        $2, $2, 6
/* D3DB0 001D3CB0 03290200 */  sra        $5, $2, 4
/* D3DB4 001D3CB4 F001023C */  lui        $2, %hi(D_1F06850)
/* D3DB8 001D3CB8 50684424 */  addiu      $4, $2, %lo(D_1F06850)
/* D3DBC 001D3CBC 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* D3DC0 001D3CC0 00000000 */   nop
/* D3DC4 001D3CC4 EA01013C */  lui        $at, (0x1EA7690 >> 16)
/* D3DC8 001D3CC8 907620AC */  sw         $0, (0x1EA7690 & 0xFFFF)($at)
/* D3DCC 001D3CCC 789C838F */  lw         $3, -0x6388($gp)
/* D3DD0 001D3CD0 01000224 */  addiu      $2, $0, 0x1
/* D3DD4 001D3CD4 0100013C */  lui        $at, (0x10000 >> 16)
/* D3DD8 001D3CD8 21086100 */  addu       $at, $3, $at
/* D3DDC 001D3CDC 0C8B22AC */  sw         $2, -0x74F4($at)
/* D3DE0 001D3CE0 EC9C82AF */  sw         $2, -0x6314($gp)
/* D3DE4 001D3CE4 F09C82AF */  sw         $2, -0x6310($gp)
/* D3DE8 001D3CE8 E49C82AF */  sw         $2, -0x631C($gp)
/* D3DEC 001D3CEC E89C82AF */  sw         $2, -0x6318($gp)
/* D3DF0 001D3CF0 28260070 */  paddub     $4, $0, $0
/* D3DF4 001D3CF4 B004770C */  jal        func_1DC12C0
/* D3DF8 001D3CF8 00000000 */   nop
/* D3DFC 001D3CFC FFFF0224 */  addiu      $2, $0, -0x1
/* D3E00 001D3D00 B49D82AF */  sw         $2, -0x624C($gp)
/* D3E04 001D3D04 0005770C */  jal        func_1DC1400
/* D3E08 001D3D08 00000000 */   nop
/* D3E0C 001D3D0C DC01013C */  lui        $at, (0x1DC448C >> 16)
/* D3E10 001D3D10 8C4420AC */  sw         $0, (0x1DC448C & 0xFFFF)($at)
/* D3E14 001D3D14 01000224 */  addiu      $2, $0, 0x1
/* D3E18 001D3D18 DC01013C */  lui        $at, (0x1DC451C >> 16)
/* D3E1C 001D3D1C 1C4522AC */  sw         $2, (0x1DC451C & 0xFFFF)($at)
/* D3E20 001D3D20 709480AF */  sw         $0, -0x6B90($gp)
/* D3E24 001D3D24 5CFA760C */  jal        func_1DBE970
/* D3E28 001D3D28 00000000 */   nop
/* D3E2C 001D3D2C 0000BF7B */  lq         $31, 0x0($sp)
/* D3E30 001D3D30 2000BD27 */  addiu      $sp, $sp, 0x20
/* D3E34 001D3D34 0800E003 */  jr         $31
/* D3E38 001D3D38 00000000 */   nop
/* D3E3C 001D3D3C 00000000 */  nop
