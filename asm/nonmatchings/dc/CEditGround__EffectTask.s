.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EffectTask__11CEditGroundFv
/* A1C20 001A1B20 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A1C24 001A1B24 2000BF7F */  sq         $31, 0x20($sp)
/* A1C28 001A1B28 1000B17F */  sq         $17, 0x10($sp)
/* A1C2C 001A1B2C 0000B07F */  sq         $16, 0x0($sp)
/* A1C30 001A1B30 288E8070 */  paddub     $17, $4, $0
/* A1C34 001A1B34 01000364 */  daddiu     $3, $0, 0x1
/* A1C38 001A1B38 0100013C */  lui        $at, (0x15F04 >> 16)
/* A1C3C 001A1B3C 21088100 */  addu       $at, $4, $at
/* A1C40 001A1B40 045F248C */  lw         $4, (0x15F04 & 0xFFFF)($at)
/* A1C44 001A1B44 05008004 */  bltz       $4, .L001A1B5C
/* A1C48 001A1B48 00000000 */   nop
/* A1C4C 001A1B4C 80008128 */  slti       $at, $4, 0x80
/* A1C50 001A1B50 02002010 */  beqz       $at, .L001A1B5C
/* A1C54 001A1B54 00000000 */   nop
/* A1C58 001A1B58 281E0070 */  paddub     $3, $0, $0
.L001A1B5C:
/* A1C5C 001A1B5C FF006330 */  andi       $3, $3, 0xFF
/* A1C60 001A1B60 2B180300 */  sltu       $3, $0, $3
/* A1C64 001A1B64 06006014 */  bnez       $3, .L001A1B80
/* A1C68 001A1B68 00000000 */   nop
/* A1C6C 001A1B6C 0100013C */  lui        $at, (0x15F00 >> 16)
/* A1C70 001A1B70 21082102 */  addu       $at, $17, $at
/* A1C74 001A1B74 005F238C */  lw         $3, (0x15F00 & 0xFFFF)($at)
/* A1C78 001A1B78 2A180300 */  slt        $3, $0, $3
/* A1C7C 001A1B7C 01006338 */  xori       $3, $3, 0x1
.L001A1B80:
/* A1C80 001A1B80 FF006330 */  andi       $3, $3, 0xFF
/* A1C84 001A1B84 2B180300 */  sltu       $3, $0, $3
/* A1C88 001A1B88 09006014 */  bnez       $3, .L001A1BB0
/* A1C8C 001A1B8C 00000000 */   nop
/* A1C90 001A1B90 C0180400 */  sll        $3, $4, 3
/* A1C94 001A1B94 23206400 */  subu       $4, $3, $4
/* A1C98 001A1B98 80180400 */  sll        $3, $4, 2
/* A1C9C 001A1B9C 23186400 */  subu       $3, $3, $4
/* A1CA0 001A1BA0 40190300 */  sll        $3, $3, 5
/* A1CA4 001A1BA4 21187100 */  addu       $3, $3, $17
/* A1CA8 001A1BA8 1801638C */  lw         $3, 0x118($3)
/* A1CAC 001A1BAC 2A186000 */  slt        $3, $3, $0
.L001A1BB0:
/* A1CB0 001A1BB0 FF006330 */  andi       $3, $3, 0xFF
/* A1CB4 001A1BB4 0A006010 */  beqz       $3, .L001A1BE0
/* A1CB8 001A1BB8 00000000 */   nop
/* A1CBC 001A1BBC FFFF0324 */  addiu      $3, $0, -0x1
/* A1CC0 001A1BC0 0100013C */  lui        $at, (0x15F04 >> 16)
/* A1CC4 001A1BC4 21082102 */  addu       $at, $17, $at
/* A1CC8 001A1BC8 045F23AC */  sw         $3, (0x15F04 & 0xFFFF)($at)
/* A1CCC 001A1BCC 0100013C */  lui        $at, (0x15F00 >> 16)
/* A1CD0 001A1BD0 21082102 */  addu       $at, $17, $at
/* A1CD4 001A1BD4 005F23AC */  sw         $3, (0x15F00 & 0xFFFF)($at)
/* A1CD8 001A1BD8 43000010 */  b          .L001A1CE8
/* A1CDC 001A1BDC 00000000 */   nop
.L001A1BE0:
/* A1CE0 001A1BE0 0100013C */  lui        $at, (0x15F00 >> 16)
/* A1CE4 001A1BE4 21082102 */  addu       $at, $17, $at
/* A1CE8 001A1BE8 005F228C */  lw         $2, (0x15F00 & 0xFFFF)($at)
/* A1CEC 001A1BEC FFFF4224 */  addiu      $2, $2, -0x1
/* A1CF0 001A1BF0 0100013C */  lui        $at, (0x15F00 >> 16)
/* A1CF4 001A1BF4 21082102 */  addu       $at, $17, $at
/* A1CF8 001A1BF8 005F22AC */  sw         $2, (0x15F00 & 0xFFFF)($at)
/* A1CFC 001A1BFC 0100013C */  lui        $at, (0x15F04 >> 16)
/* A1D00 001A1C00 21082102 */  addu       $at, $17, $at
/* A1D04 001A1C04 045F238C */  lw         $3, (0x15F04 & 0xFFFF)($at)
/* A1D08 001A1C08 C0100300 */  sll        $2, $3, 3
/* A1D0C 001A1C0C 23184300 */  subu       $3, $2, $3
/* A1D10 001A1C10 80100300 */  sll        $2, $3, 2
/* A1D14 001A1C14 23104300 */  subu       $2, $2, $3
/* A1D18 001A1C18 40110200 */  sll        $2, $2, 5
/* A1D1C 001A1C1C 21102202 */  addu       $2, $17, $2
/* A1D20 001A1C20 30004424 */  addiu      $4, $2, 0x30
/* A1D24 001A1C24 3000A527 */  addiu      $5, $sp, 0x30
/* A1D28 001A1C28 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A1D2C 001A1C2C 00000000 */   nop
/* A1D30 001A1C30 0100013C */  lui        $at, (0x15F10 >> 16)
/* A1D34 001A1C34 21082102 */  addu       $at, $17, $at
/* A1D38 001A1C38 105F21C4 */  lwc1       $f1, (0x15F10 & 0xFFFF)($at)
/* A1D3C 001A1C3C 3400B027 */  addiu      $16, $sp, 0x34
/* A1D40 001A1C40 000000C6 */  lwc1       $f0, 0x0($16)
/* A1D44 001A1C44 00000146 */  add.s      $f0, $f0, $f1
/* A1D48 001A1C48 000000E6 */  swc1       $f0, 0x0($16)
/* A1D4C 001A1C4C 0100013C */  lui        $at, (0x15F04 >> 16)
/* A1D50 001A1C50 21082102 */  addu       $at, $17, $at
/* A1D54 001A1C54 045F238C */  lw         $3, (0x15F04 & 0xFFFF)($at)
/* A1D58 001A1C58 C0100300 */  sll        $2, $3, 3
/* A1D5C 001A1C5C 23184300 */  subu       $3, $2, $3
/* A1D60 001A1C60 80100300 */  sll        $2, $3, 2
/* A1D64 001A1C64 23104300 */  subu       $2, $2, $3
/* A1D68 001A1C68 40110200 */  sll        $2, $2, 5
/* A1D6C 001A1C6C 21102202 */  addu       $2, $17, $2
/* A1D70 001A1C70 30004424 */  addiu      $4, $2, 0x30
/* A1D74 001A1C74 3000A527 */  addiu      $5, $sp, 0x30
/* A1D78 001A1C78 D000598C */  lw         $25, 0xD0($2)
/* A1D7C 001A1C7C 1400398F */  lw         $25, 0x14($25)
/* A1D80 001A1C80 09F82003 */  jalr       $25
/* A1D84 001A1C84 00000000 */   nop
/* A1D88 001A1C88 0100013C */  lui        $at, (0x15F00 >> 16)
/* A1D8C 001A1C8C 21082102 */  addu       $at, $17, $at
/* A1D90 001A1C90 005F238C */  lw         $3, (0x15F00 & 0xFFFF)($at)
/* A1D94 001A1C94 1400601C */  bgtz       $3, .L001A1CE8
/* A1D98 001A1C98 00000000 */   nop
/* A1D9C 001A1C9C 0100013C */  lui        $at, (0x15F0C >> 16)
/* A1DA0 001A1CA0 21082102 */  addu       $at, $17, $at
/* A1DA4 001A1CA4 0C5F20C4 */  lwc1       $f0, (0x15F0C & 0xFFFF)($at)
/* A1DA8 001A1CA8 000000E6 */  swc1       $f0, 0x0($16)
/* A1DAC 001A1CAC 0100013C */  lui        $at, (0x15F04 >> 16)
/* A1DB0 001A1CB0 21082102 */  addu       $at, $17, $at
/* A1DB4 001A1CB4 045F238C */  lw         $3, (0x15F04 & 0xFFFF)($at)
/* A1DB8 001A1CB8 C0100300 */  sll        $2, $3, 3
/* A1DBC 001A1CBC 23184300 */  subu       $3, $2, $3
/* A1DC0 001A1CC0 80100300 */  sll        $2, $3, 2
/* A1DC4 001A1CC4 23104300 */  subu       $2, $2, $3
/* A1DC8 001A1CC8 40110200 */  sll        $2, $2, 5
/* A1DCC 001A1CCC 21102202 */  addu       $2, $17, $2
/* A1DD0 001A1CD0 30004424 */  addiu      $4, $2, 0x30
/* A1DD4 001A1CD4 3000A527 */  addiu      $5, $sp, 0x30
/* A1DD8 001A1CD8 D000598C */  lw         $25, 0xD0($2)
/* A1DDC 001A1CDC 1400398F */  lw         $25, 0x14($25)
/* A1DE0 001A1CE0 09F82003 */  jalr       $25
/* A1DE4 001A1CE4 00000000 */   nop
.L001A1CE8:
/* A1DE8 001A1CE8 2000BF7B */  lq         $31, 0x20($sp)
/* A1DEC 001A1CEC 1000B17B */  lq         $17, 0x10($sp)
/* A1DF0 001A1CF0 0000B07B */  lq         $16, 0x0($sp)
/* A1DF4 001A1CF4 4000BD27 */  addiu      $sp, $sp, 0x40
/* A1DF8 001A1CF8 0800E003 */  jr         $31
/* A1DFC 001A1CFC 00000000 */   nop
