.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtAtraGetShort_Init__Fv
/* D2BF0 001D2AF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D2BF4 001D2AF4 0000BF7F */  sq         $31, 0x0($sp)
/* D2BF8 001D2AF8 01000224 */  addiu      $2, $0, 0x1
/* D2BFC 001D2AFC 2C9D82AF */  sw         $2, -0x62D4($gp)
/* D2C00 001D2B00 948B828F */  lw         $2, -0x746C($gp)
/* D2C04 001D2B04 F001013C */  lui        $at, (0x1F06850 >> 16)
/* D2C08 001D2B08 506822AC */  sw         $2, (0x1F06850 & 0xFFFF)($at)
/* D2C0C 001D2B0C 0400023C */  lui        $2, (0x445C0 >> 16)
/* D2C10 001D2B10 C0454234 */  ori        $2, $2, (0x445C0 & 0xFFFF)
/* D2C14 001D2B14 F001013C */  lui        $at, (0x1F0685C >> 16)
/* D2C18 001D2B18 5C6822AC */  sw         $2, (0x1F0685C & 0xFFFF)($at)
/* D2C1C 001D2B1C F001013C */  lui        $at, (0x1F06858 >> 16)
/* D2C20 001D2B20 586820AC */  sw         $0, (0x1F06858 & 0xFFFF)($at)
/* D2C24 001D2B24 30FB040C */  jal        StartReadBG__Fv
/* D2C28 001D2B28 00000000 */   nop
/* D2C2C 001D2B2C F001013C */  lui        $at, (0x1F06858 >> 16)
/* D2C30 001D2B30 5868228C */  lw         $2, (0x1F06858 & 0xFFFF)($at)
/* D2C34 001D2B34 00190200 */  sll        $3, $2, 4
/* D2C38 001D2B38 F001013C */  lui        $at, (0x1F06850 >> 16)
/* D2C3C 001D2B3C 5068228C */  lw         $2, (0x1F06850 & 0xFFFF)($at)
/* D2C40 001D2B40 21284300 */  addu       $5, $2, $3
/* D2C44 001D2B44 549D85AF */  sw         $5, -0x62AC($gp)
/* D2C48 001D2B48 2A00023C */  lui        $2, %hi(_656_4)
/* D2C4C 001D2B4C B0C54424 */  addiu      $4, $2, %lo(_656_4)
/* D2C50 001D2B50 1C00A627 */  addiu      $6, $sp, 0x1C
/* D2C54 001D2B54 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* D2C58 001D2B58 00000000 */   nop
/* D2C5C 001D2B5C 1C00A28F */  lw         $2, 0x1C($sp)
/* D2C60 001D2B60 83110200 */  sra        $2, $2, 6
/* D2C64 001D2B64 01004224 */  addiu      $2, $2, 0x1
/* D2C68 001D2B68 80110200 */  sll        $2, $2, 6
/* D2C6C 001D2B6C 03290200 */  sra        $5, $2, 4
/* D2C70 001D2B70 F001023C */  lui        $2, %hi(D_1F06850)
/* D2C74 001D2B74 50684424 */  addiu      $4, $2, %lo(D_1F06850)
/* D2C78 001D2B78 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* D2C7C 001D2B7C 00000000 */   nop
/* D2C80 001D2B80 F001013C */  lui        $at, (0x1F06858 >> 16)
/* D2C84 001D2B84 5868228C */  lw         $2, (0x1F06858 & 0xFFFF)($at)
/* D2C88 001D2B88 00190200 */  sll        $3, $2, 4
/* D2C8C 001D2B8C F001013C */  lui        $at, (0x1F06850 >> 16)
/* D2C90 001D2B90 5068228C */  lw         $2, (0x1F06850 & 0xFFFF)($at)
/* D2C94 001D2B94 21284300 */  addu       $5, $2, $3
/* D2C98 001D2B98 409D85AF */  sw         $5, -0x62C0($gp)
/* D2C9C 001D2B9C 2A00023C */  lui        $2, %hi(_866_2)
/* D2CA0 001D2BA0 E0C64424 */  addiu      $4, $2, %lo(_866_2)
/* D2CA4 001D2BA4 1C00A627 */  addiu      $6, $sp, 0x1C
/* D2CA8 001D2BA8 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* D2CAC 001D2BAC 00000000 */   nop
/* D2CB0 001D2BB0 1C00A28F */  lw         $2, 0x1C($sp)
/* D2CB4 001D2BB4 83110200 */  sra        $2, $2, 6
/* D2CB8 001D2BB8 01004224 */  addiu      $2, $2, 0x1
/* D2CBC 001D2BBC 80110200 */  sll        $2, $2, 6
/* D2CC0 001D2BC0 03290200 */  sra        $5, $2, 4
/* D2CC4 001D2BC4 F001023C */  lui        $2, %hi(D_1F06850)
/* D2CC8 001D2BC8 50684424 */  addiu      $4, $2, %lo(D_1F06850)
/* D2CCC 001D2BCC 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* D2CD0 001D2BD0 00000000 */   nop
/* D2CD4 001D2BD4 F001013C */  lui        $at, (0x1F06858 >> 16)
/* D2CD8 001D2BD8 5868228C */  lw         $2, (0x1F06858 & 0xFFFF)($at)
/* D2CDC 001D2BDC 00190200 */  sll        $3, $2, 4
/* D2CE0 001D2BE0 F001013C */  lui        $at, (0x1F06850 >> 16)
/* D2CE4 001D2BE4 5068228C */  lw         $2, (0x1F06850 & 0xFFFF)($at)
/* D2CE8 001D2BE8 21284300 */  addu       $5, $2, $3
/* D2CEC 001D2BEC 01000424 */  addiu      $4, $0, 0x1
/* D2CF0 001D2BF0 1C00A627 */  addiu      $6, $sp, 0x1C
/* D2CF4 001D2BF4 D86D050C */  jal        SndSPSeLoadBG__FiPUiPi
/* D2CF8 001D2BF8 00000000 */   nop
/* D2CFC 001D2BFC 1C00A28F */  lw         $2, 0x1C($sp)
/* D2D00 001D2C00 83110200 */  sra        $2, $2, 6
/* D2D04 001D2C04 01004224 */  addiu      $2, $2, 0x1
/* D2D08 001D2C08 80110200 */  sll        $2, $2, 6
/* D2D0C 001D2C0C 03290200 */  sra        $5, $2, 4
/* D2D10 001D2C10 F001023C */  lui        $2, %hi(D_1F06850)
/* D2D14 001D2C14 50684424 */  addiu      $4, $2, %lo(D_1F06850)
/* D2D18 001D2C18 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* D2D1C 001D2C1C 00000000 */   nop
/* D2D20 001D2C20 EA01013C */  lui        $at, (0x1EA7690 >> 16)
/* D2D24 001D2C24 907620AC */  sw         $0, (0x1EA7690 & 0xFFFF)($at)
/* D2D28 001D2C28 0005770C */  jal        func_1DC1400
/* D2D2C 001D2C2C 00000000 */   nop
/* D2D30 001D2C30 789C838F */  lw         $3, -0x6388($gp)
/* D2D34 001D2C34 01000424 */  addiu      $4, $0, 0x1
/* D2D38 001D2C38 0100013C */  lui        $at, (0x10000 >> 16)
/* D2D3C 001D2C3C 21086100 */  addu       $at, $3, $at
/* D2D40 001D2C40 0C8B24AC */  sw         $4, -0x74F4($at)
/* D2D44 001D2C44 BC9D838F */  lw         $3, -0x6244($gp)
/* D2D48 001D2C48 489483AF */  sw         $3, -0x6BB8($gp)
/* D2D4C 001D2C4C FFFF0324 */  addiu      $3, $0, -0x1
/* D2D50 001D2C50 BC9D83AF */  sw         $3, -0x6244($gp)
/* D2D54 001D2C54 2C9480AF */  sw         $0, -0x6BD4($gp)
/* D2D58 001D2C58 DC01013C */  lui        $at, (0x1DC451C >> 16)
/* D2D5C 001D2C5C 1C4524AC */  sw         $4, (0x1DC451C & 0xFFFF)($at)
/* D2D60 001D2C60 0000BF7B */  lq         $31, 0x0($sp)
/* D2D64 001D2C64 2000BD27 */  addiu      $sp, $sp, 0x20
/* D2D68 001D2C68 0800E003 */  jr         $31
/* D2D6C 001D2C6C 00000000 */   nop
