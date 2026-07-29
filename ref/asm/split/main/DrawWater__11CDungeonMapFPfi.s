.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawWater__11CDungeonMapFPfi
/* 0C4A40 001C4940 10FFBD27 */  addiu       $29, $29, -0xF0
/* 0C4A44 001C4944 A000BF7F */  sq          $31, 0xA0($29)
/* 0C4A48 001C4948 9000BE7F */  sq          $30, 0x90($29)
/* 0C4A4C 001C494C 8000B77F */  sq          $23, 0x80($29)
/* 0C4A50 001C4950 7000B67F */  sq          $22, 0x70($29)
/* 0C4A54 001C4954 6000B57F */  sq          $21, 0x60($29)
/* 0C4A58 001C4958 5000B47F */  sq          $20, 0x50($29)
/* 0C4A5C 001C495C 4000B37F */  sq          $19, 0x40($29)
/* 0C4A60 001C4960 3000B27F */  sq          $18, 0x30($29)
/* 0C4A64 001C4964 2000B17F */  sq          $17, 0x20($29)
/* 0C4A68 001C4968 1000B07F */  sq          $16, 0x10($29)
/* 0C4A6C 001C496C 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0C4A70 001C4970 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0C4A74 001C4974 28AE8070 */  paddub      $21, $4, $0
/* 0C4A78 001C4978 28BEA070 */  paddub      $23, $5, $0
/* 0C4A7C 001C497C 28A6C070 */  paddub      $20, $6, $0
/* 0C4A80 001C4980 28960070 */  paddub      $18, $0, $0
/* 0C4A84 001C4984 A043023C */  lui         $2, (0x43A00000 >> 16)
/* 0C4A88 001C4988 00A08244 */  mtc1        $2, $f20
/* 0C4A8C 001C498C 9643023C */  lui         $2, (0x43960000 >> 16)
/* 0C4A90 001C4990 00A88244 */  mtc1        $2, $f21
/* 0C4A94 001C4994 28B60070 */  paddub      $22, $0, $0
/* 0C4A98 001C4998 00948283 */  lb          $2, -0x6C00($28)
/* 0C4A9C 001C499C 04004014 */  bnez        $2, .L001C49B0
/* 0C4AA0 001C49A0 00000000 */   nop
/* 0C4AA4 001C49A4 FC9380AF */  sw          $0, -0x6C04($28)
/* 0C4AA8 001C49A8 01000224 */  addiu       $2, $0, 0x1
/* 0C4AAC 001C49AC 009482A3 */  sb          $2, -0x6C00($28)
.L001C49B0:
/* 0C4AB0 001C49B0 FC93838F */  lw          $3, -0x6C04($28)
/* 0C4AB4 001C49B4 1E006228 */  slti        $2, $3, 0x1E
/* 0C4AB8 001C49B8 05004014 */  bnez        $2, .L001C49D0
/* 0C4ABC 001C49BC 00000000 */   nop
/* 0C4AC0 001C49C0 FC9380AF */  sw          $0, -0x6C04($28)
/* 0C4AC4 001C49C4 01001624 */  addiu       $22, $0, 0x1
/* 0C4AC8 001C49C8 03000010 */  b           .L001C49D8
/* 0C4ACC 001C49CC 00000000 */   nop
.L001C49D0:
/* 0C4AD0 001C49D0 01006224 */  addiu       $2, $3, 0x1
/* 0C4AD4 001C49D4 FC9382AF */  sw          $2, -0x6C04($28)
.L001C49D8:
/* 0C4AD8 001C49D8 288E0070 */  paddub      $17, $0, $0
/* 0C4ADC 001C49DC 49000010 */  b           .L001C4B04
/* 0C4AE0 001C49E0 00000000 */   nop
.L001C49E4:
/* 0C4AE4 001C49E4 28860070 */  paddub      $16, $0, $0
/* 0C4AE8 001C49E8 42000010 */  b           .L001C4AF4
/* 0C4AEC 001C49EC 00000000 */   nop
.L001C49F0:
/* 0C4AF0 001C49F0 80101100 */  sll         $2, $17, 2
/* 0C4AF4 001C49F4 21105100 */  addu        $2, $2, $17
/* 0C4AF8 001C49F8 80100200 */  sll         $2, $2, 2
/* 0C4AFC 001C49FC 21100202 */  addu        $2, $16, $2
/* 0C4B00 001C4A00 00110200 */  sll         $2, $2, 4
/* 0C4B04 001C4A04 21105500 */  addu        $2, $2, $21
/* 0C4B08 001C4A08 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C4B0C 001C4A0C 21084100 */  addu        $1, $2, $1
/* 0C4B10 001C4A10 509C238C */  lw          $3, -0x63B0($1)
/* 0C4B14 001C4A14 FFFF0224 */  addiu       $2, $0, -0x1
/* 0C4B18 001C4A18 35006210 */  beq         $3, $2, .L001C4AF0
/* 0C4B1C 001C4A1C 00000000 */   nop
/* 0C4B20 001C4A20 C0100300 */  sll         $2, $3, 3
/* 0C4B24 001C4A24 23104300 */  subu        $2, $2, $3
/* 0C4B28 001C4A28 80100200 */  sll         $2, $2, 2
/* 0C4B2C 001C4A2C 21104300 */  addu        $2, $2, $3
/* 0C4B30 001C4A30 00110200 */  sll         $2, $2, 4
/* 0C4B34 001C4A34 2110A202 */  addu        $2, $21, $2
/* 0C4B38 001C4A38 90044324 */  addiu       $3, $2, 0x490
/* 0C4B3C 001C4A3C 90007324 */  addiu       $19, $3, 0x90
/* 0C4B40 001C4A40 2005428C */  lw          $2, 0x520($2)
/* 0C4B44 001C4A44 2A004010 */  beqz        $2, .L001C4AF0
/* 0C4B48 001C4A48 00000000 */   nop
/* 0C4B4C 001C4A4C 2043023C */  lui         $2, (0x43200000 >> 16)
/* 0C4B50 001C4A50 00088244 */  mtc1        $2, $f1
/* 0C4B54 001C4A54 00009044 */  mtc1        $16, $f0
/* 0C4B58 001C4A58 00000000 */  nop
/* 0C4B5C 001C4A5C 20008046 */  cvt.s.w     $f0, $f0
/* 0C4B60 001C4A60 02080046 */  mul.s       $f0, $f1, $f0
/* 0C4B64 001C4A64 C000A0E7 */  swc1        $f0, 0xC0($29)
/* 0C4B68 001C4A68 140060C6 */  lwc1        $f0, 0x14($19)
/* 0C4B6C 001C4A6C C400A227 */  addiu       $2, $29, 0xC4
/* 0C4B70 001C4A70 000040E4 */  swc1        $f0, 0x0($2)
/* 0C4B74 001C4A74 00009144 */  mtc1        $17, $f0
/* 0C4B78 001C4A78 00000000 */  nop
/* 0C4B7C 001C4A7C 20008046 */  cvt.s.w     $f0, $f0
/* 0C4B80 001C4A80 02080046 */  mul.s       $f0, $f1, $f0
/* 0C4B84 001C4A84 C800A227 */  addiu       $2, $29, 0xC8
/* 0C4B88 001C4A88 000040E4 */  swc1        $f0, 0x0($2)
/* 0C4B8C 001C4A8C 2826E072 */  paddub      $4, $23, $0
/* 0C4B90 001C4A90 C000A527 */  addiu       $5, $29, 0xC0
/* 0C4B94 001C4A94 648D040C */  jal         DistVector__FPfPf
/* 0C4B98 001C4A98 00000000 */   nop
/* 0C4B9C 001C4A9C 34001446 */  c.lt.s      $f0, $f20
/* 0C4BA0 001C4AA0 00000000 */  nop
/* 0C4BA4 001C4AA4 0D000045 */  bc1f        .L001C4ADC
/* 0C4BA8 001C4AA8 00000000 */   nop
/* 0C4BAC 001C4AAC 28966072 */  paddub      $18, $19, $0
/* 0C4BB0 001C4AB0 06050046 */  mov.s       $f20, $f0
/* 0C4BB4 001C4AB4 C000A1C7 */  lwc1        $f1, 0xC0($29)
/* 0C4BB8 001C4AB8 D000A1E7 */  swc1        $f1, 0xD0($29)
/* 0C4BBC 001C4ABC C400A227 */  addiu       $2, $29, 0xC4
/* 0C4BC0 001C4AC0 000041C4 */  lwc1        $f1, 0x0($2)
/* 0C4BC4 001C4AC4 D400A1E7 */  swc1        $f1, 0xD4($29)
/* 0C4BC8 001C4AC8 C800A227 */  addiu       $2, $29, 0xC8
/* 0C4BCC 001C4ACC 000041C4 */  lwc1        $f1, 0x0($2)
/* 0C4BD0 001C4AD0 D800A1E7 */  swc1        $f1, 0xD8($29)
/* 0C4BD4 001C4AD4 BC00B0AF */  sw          $16, 0xBC($29)
/* 0C4BD8 001C4AD8 28F62072 */  paddub      $30, $17, $0
.L001C4ADC:
/* 0C4BDC 001C4ADC 34A80046 */  c.lt.s      $f21, $f0
/* 0C4BE0 001C4AE0 00000000 */  nop
/* 0C4BE4 001C4AE4 02000145 */  bc1t        .L001C4AF0
/* 0C4BE8 001C4AE8 00000000 */   nop
/* 0C4BEC 001C4AEC 46050046 */  mov.s       $f21, $f0
.L001C4AF0:
/* 0C4BF0 001C4AF0 01001026 */  addiu       $16, $16, 0x1
.L001C4AF4:
/* 0C4BF4 001C4AF4 1000022A */  slti        $2, $16, 0x10
/* 0C4BF8 001C4AF8 BDFF4014 */  bnez        $2, .L001C49F0
/* 0C4BFC 001C4AFC 00000000 */   nop
/* 0C4C00 001C4B00 01003126 */  addiu       $17, $17, 0x1
.L001C4B04:
/* 0C4C04 001C4B04 1000222A */  slti        $2, $17, 0x10
/* 0C4C08 001C4B08 B6FF4014 */  bnez        $2, .L001C49E4
/* 0C4C0C 001C4B0C 00000000 */   nop
/* 0C4C10 001C4B10 3E004012 */  beqz        $18, .L001C4C0C
/* 0C4C14 001C4B14 00000000 */   nop
/* 0C4C18 001C4B18 9000A426 */  addiu       $4, $21, 0x90
/* 0C4C1C 001C4B1C 10004526 */  addiu       $5, $18, 0x10
/* 0C4C20 001C4B20 20004626 */  addiu       $6, $18, 0x20
/* 0C4C24 001C4B24 30004726 */  addiu       $7, $18, 0x30
/* 0C4C28 001C4B28 40004826 */  addiu       $8, $18, 0x40
/* 0C4C2C 001C4B2C B884050C */  jal         SetVertex__6CWaterFPfPfPfPf
/* 0C4C30 001C4B30 00000000 */   nop
/* 0C4C34 001C4B34 4001A426 */  addiu       $4, $21, 0x140
/* 0C4C38 001C4B38 D000A527 */  addiu       $5, $29, 0xD0
/* 0C4C3C 001C4B3C B89F040C */  jal         SetPosition__6CFrameFPf
/* 0C4C40 001C4B40 00000000 */   nop
/* 0C4C44 001C4B44 50004592 */  lbu         $5, 0x50($18)
/* 0C4C48 001C4B48 54004692 */  lbu         $6, 0x54($18)
/* 0C4C4C 001C4B4C 58004792 */  lbu         $7, 0x58($18)
/* 0C4C50 001C4B50 9000A426 */  addiu       $4, $21, 0x90
/* 0C4C54 001C4B54 80000824 */  addiu       $8, $0, 0x80
/* 0C4C58 001C4B58 F081050C */  jal         SetColor__6CWaterFUcUcUcUc
/* 0C4C5C 001C4B5C 00000000 */   nop
/* 0C4C60 001C4B60 2000C012 */  beqz        $22, .L001C4BE4
/* 0C4C64 001C4B64 00000000 */   nop
/* 0C4C68 001C4B68 A49D838F */  lw          $3, -0x625C($28)
/* 0C4C6C 001C4B6C 0F006014 */  bnez        $3, .L001C4BAC
/* 0C4C70 001C4B70 00000000 */   nop
/* 0C4C74 001C4B74 06000224 */  addiu       $2, $0, 0x6
/* 0C4C78 001C4B78 0C006214 */  bne         $3, $2, .L001C4BAC
/* 0C4C7C 001C4B7C 00000000 */   nop
/* 0C4C80 001C4B80 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0C4C84 001C4B84 00708244 */  mtc1        $2, $f14
/* 0C4C88 001C4B88 3041023C */  lui         $2, (0x41300000 >> 16)
/* 0C4C8C 001C4B8C 00788244 */  mtc1        $2, $f15
/* 0C4C90 001C4B90 9000A426 */  addiu       $4, $21, 0x90
/* 0C4C94 001C4B94 20858CC7 */  lwc1        $f12, -0x7AE0($28)
/* 0C4C98 001C4B98 34858DC7 */  lwc1        $f13, -0x7ACC($28)
/* 0C4C9C 001C4B9C E881050C */  jal         SetParam__6CWaterFffff
/* 0C4CA0 001C4BA0 00000000 */   nop
/* 0C4CA4 001C4BA4 09000010 */  b           .L001C4BCC
/* 0C4CA8 001C4BA8 00000000 */   nop
.L001C4BAC:
/* 0C4CAC 001C4BAC 3041023C */  lui         $2, (0x41300000 >> 16)
/* 0C4CB0 001C4BB0 00788244 */  mtc1        $2, $f15
/* 0C4CB4 001C4BB4 00708044 */  mtc1        $0, $f14
/* 0C4CB8 001C4BB8 9000A426 */  addiu       $4, $21, 0x90
/* 0C4CBC 001C4BBC 20858CC7 */  lwc1        $f12, -0x7AE0($28)
/* 0C4CC0 001C4BC0 34858DC7 */  lwc1        $f13, -0x7ACC($28)
/* 0C4CC4 001C4BC4 E881050C */  jal         SetParam__6CWaterFffff
/* 0C4CC8 001C4BC8 00000000 */   nop
.L001C4BCC:
/* 0C4CCC 001C4BCC 9000A426 */  addiu       $4, $21, 0x90
/* 0C4CD0 001C4BD0 10000524 */  addiu       $5, $0, 0x10
/* 0C4CD4 001C4BD4 04000624 */  addiu       $6, $0, 0x4
/* 0C4CD8 001C4BD8 E8858CC7 */  lwc1        $f12, -0x7A18($28)
/* 0C4CDC 001C4BDC DC84050C */  jal         Shake__6CWaterFiif
/* 0C4CE0 001C4BE0 00000000 */   nop
.L001C4BE4:
/* 0C4CE4 001C4BE4 9000A426 */  addiu       $4, $21, 0x90
/* 0C4CE8 001C4BE8 7484050C */  jal         Hamon__6CWaterFv
/* 0C4CEC 001C4BEC 00000000 */   nop
/* 0C4CF0 001C4BF0 9000A426 */  addiu       $4, $21, 0x90
/* 0C4CF4 001C4BF4 C701023C */  lui         $2, %hi(mgRenderInfo)
/* 0C4CF8 001C4BF8 20554524 */  addiu       $5, $2, %lo(mgRenderInfo)
/* 0C4CFC 001C4BFC D48B868F */  lw          $6, -0x742C($28)
/* 0C4D00 001C4C00 283E0070 */  paddub      $7, $0, $0
/* 0C4D04 001C4C04 C883050C */  jal         DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1
/* 0C4D08 001C4C08 00000000 */   nop
.L001C4C0C:
/* 0C4D0C 001C4C0C 40004012 */  beqz        $18, .L001C4D10
/* 0C4D10 001C4C10 00000000 */   nop
/* 0C4D14 001C4C14 5C00428E */  lw          $2, 0x5C($18)
/* 0C4D18 001C4C18 19004010 */  beqz        $2, .L001C4C80
/* 0C4D1C 001C4C1C 00000000 */   nop
/* 0C4D20 001C4C20 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C4D24 001C4C24 2108A102 */  addu        $1, $21, $1
/* 0C4D28 001C4C28 7CBC248C */  lw          $4, -0x4384($1)
/* 0C4D2C 001C4C2C 14008010 */  beqz        $4, .L001C4C80
/* 0C4D30 001C4C30 00000000 */   nop
/* 0C4D34 001C4C34 2043023C */  lui         $2, (0x43200000 >> 16)
/* 0C4D38 001C4C38 00088244 */  mtc1        $2, $f1
/* 0C4D3C 001C4C3C BC00A28F */  lw          $2, 0xBC($29)
/* 0C4D40 001C4C40 00008244 */  mtc1        $2, $f0
/* 0C4D44 001C4C44 00000000 */  nop
/* 0C4D48 001C4C48 20008046 */  cvt.s.w     $f0, $f0
/* 0C4D4C 001C4C4C 020B0046 */  mul.s       $f12, $f1, $f0
/* 0C4D50 001C4C50 00009E44 */  mtc1        $30, $f0
/* 0C4D54 001C4C54 00000000 */  nop
/* 0C4D58 001C4C58 20008046 */  cvt.s.w     $f0, $f0
/* 0C4D5C 001C4C5C 820B0046 */  mul.s       $f14, $f1, $f0
/* 0C4D60 001C4C60 00688044 */  mtc1        $0, $f13
/* 0C4D64 001C4C64 A09F040C */  jal         SetPosition__6CFrameFfff
/* 0C4D68 001C4C68 00000000 */   nop
/* 0C4D6C 001C4C6C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C4D70 001C4C70 2108A102 */  addu        $1, $21, $1
/* 0C4D74 001C4C74 7CBC248C */  lw          $4, -0x4384($1)
/* 0C4D78 001C4C78 60BB040C */  jal         MGDraw__FP6CFrame
/* 0C4D7C 001C4C7C 00000000 */   nop
.L001C4C80:
/* 0C4D80 001C4C80 9643023C */  lui         $2, (0x43960000 >> 16)
/* 0C4D84 001C4C84 00688244 */  mtc1        $2, $f13
/* 0C4D88 001C4C88 00000000 */  nop
/* 0C4D8C 001C4C8C 34A80D46 */  c.lt.s      $f21, $f13
/* 0C4D90 001C4C90 00000000 */  nop
/* 0C4D94 001C4C94 17000045 */  bc1f        .L001C4CF4
/* 0C4D98 001C4C98 00000000 */   nop
/* 0C4D9C 001C4C9C 4842023C */  lui         $2, (0x42480000 >> 16)
/* 0C4DA0 001C4CA0 00608244 */  mtc1        $2, $f12
/* 0C4DA4 001C4CA4 E000A427 */  addiu       $4, $29, 0xE0
/* 0C4DA8 001C4CA8 E400A527 */  addiu       $5, $29, 0xE4
/* 0C4DAC 001C4CAC D000A627 */  addiu       $6, $29, 0xD0
/* 0C4DB0 001C4CB0 006B050C */  jal         SndGetVolPan__FPfPfPfff
/* 0C4DB4 001C4CB4 00000000 */   nop
/* 0C4DB8 001C4CB8 02008012 */  beqz        $20, .L001C4CC4
/* 0C4DBC 001C4CBC 00000000 */   nop
/* 0C4DC0 001C4CC0 E000A0AF */  sw          $0, 0xE0($29)
.L001C4CC4:
/* 0C4DC4 001C4CC4 3D000424 */  addiu       $4, $0, 0x3D
/* 0C4DC8 001C4CC8 E000ACC7 */  lwc1        $f12, 0xE0($29)
/* 0C4DCC 001C4CCC 282E0070 */  paddub      $5, $0, $0
/* 0C4DD0 001C4CD0 AC6A050C */  jal         SndSetSeVolf__Fifi
/* 0C4DD4 001C4CD4 00000000 */   nop
/* 0C4DD8 001C4CD8 3D000424 */  addiu       $4, $0, 0x3D
/* 0C4DDC 001C4CDC E400ACC7 */  lwc1        $f12, 0xE4($29)
/* 0C4DE0 001C4CE0 282E0070 */  paddub      $5, $0, $0
/* 0C4DE4 001C4CE4 C46A050C */  jal         SndSetSePanf__Fifi
/* 0C4DE8 001C4CE8 00000000 */   nop
/* 0C4DEC 001C4CEC 2A000010 */  b           .L001C4D98
/* 0C4DF0 001C4CF0 00000000 */   nop
.L001C4CF4:
/* 0C4DF4 001C4CF4 3D000424 */  addiu       $4, $0, 0x3D
/* 0C4DF8 001C4CF8 282E0070 */  paddub      $5, $0, $0
/* 0C4DFC 001C4CFC 28360070 */  paddub      $6, $0, $0
/* 0C4E00 001C4D00 406A050C */  jal         SndSetSeVol__Fiii
/* 0C4E04 001C4D04 00000000 */   nop
/* 0C4E08 001C4D08 23000010 */  b           .L001C4D98
/* 0C4E0C 001C4D0C 00000000 */   nop
.L001C4D10:
/* 0C4E10 001C4D10 9643023C */  lui         $2, (0x43960000 >> 16)
/* 0C4E14 001C4D14 00688244 */  mtc1        $2, $f13
/* 0C4E18 001C4D18 00000000 */  nop
/* 0C4E1C 001C4D1C 34A80D46 */  c.lt.s      $f21, $f13
/* 0C4E20 001C4D20 00000000 */  nop
/* 0C4E24 001C4D24 17000045 */  bc1f        .L001C4D84
/* 0C4E28 001C4D28 00000000 */   nop
/* 0C4E2C 001C4D2C 4842023C */  lui         $2, (0x42480000 >> 16)
/* 0C4E30 001C4D30 00608244 */  mtc1        $2, $f12
/* 0C4E34 001C4D34 E800A427 */  addiu       $4, $29, 0xE8
/* 0C4E38 001C4D38 EC00A527 */  addiu       $5, $29, 0xEC
/* 0C4E3C 001C4D3C D000A627 */  addiu       $6, $29, 0xD0
/* 0C4E40 001C4D40 006B050C */  jal         SndGetVolPan__FPfPfPfff
/* 0C4E44 001C4D44 00000000 */   nop
/* 0C4E48 001C4D48 02008012 */  beqz        $20, .L001C4D54
/* 0C4E4C 001C4D4C 00000000 */   nop
/* 0C4E50 001C4D50 E800A0AF */  sw          $0, 0xE8($29)
.L001C4D54:
/* 0C4E54 001C4D54 34000424 */  addiu       $4, $0, 0x34
/* 0C4E58 001C4D58 E800ACC7 */  lwc1        $f12, 0xE8($29)
/* 0C4E5C 001C4D5C 282E0070 */  paddub      $5, $0, $0
/* 0C4E60 001C4D60 AC6A050C */  jal         SndSetSeVolf__Fifi
/* 0C4E64 001C4D64 00000000 */   nop
/* 0C4E68 001C4D68 34000424 */  addiu       $4, $0, 0x34
/* 0C4E6C 001C4D6C EC00ACC7 */  lwc1        $f12, 0xEC($29)
/* 0C4E70 001C4D70 282E0070 */  paddub      $5, $0, $0
/* 0C4E74 001C4D74 C46A050C */  jal         SndSetSePanf__Fifi
/* 0C4E78 001C4D78 00000000 */   nop
/* 0C4E7C 001C4D7C 06000010 */  b           .L001C4D98
/* 0C4E80 001C4D80 00000000 */   nop
.L001C4D84:
/* 0C4E84 001C4D84 34000424 */  addiu       $4, $0, 0x34
/* 0C4E88 001C4D88 282E0070 */  paddub      $5, $0, $0
/* 0C4E8C 001C4D8C 28360070 */  paddub      $6, $0, $0
/* 0C4E90 001C4D90 406A050C */  jal         SndSetSeVol__Fiii
/* 0C4E94 001C4D94 00000000 */   nop
.L001C4D98:
/* 0C4E98 001C4D98 A000BF7B */  lq          $31, 0xA0($29)
/* 0C4E9C 001C4D9C 9000BE7B */  lq          $30, 0x90($29)
/* 0C4EA0 001C4DA0 8000B77B */  lq          $23, 0x80($29)
/* 0C4EA4 001C4DA4 7000B67B */  lq          $22, 0x70($29)
/* 0C4EA8 001C4DA8 6000B57B */  lq          $21, 0x60($29)
/* 0C4EAC 001C4DAC 5000B47B */  lq          $20, 0x50($29)
/* 0C4EB0 001C4DB0 4000B37B */  lq          $19, 0x40($29)
/* 0C4EB4 001C4DB4 3000B27B */  lq          $18, 0x30($29)
/* 0C4EB8 001C4DB8 2000B17B */  lq          $17, 0x20($29)
/* 0C4EBC 001C4DBC 1000B07B */  lq          $16, 0x10($29)
/* 0C4EC0 001C4DC0 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0C4EC4 001C4DC4 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0C4EC8 001C4DC8 F000BD27 */  addiu       $29, $29, 0xF0
/* 0C4ECC 001C4DCC 0800E003 */  jr          $31
/* 0C4ED0 001C4DD0 00000000 */   nop
/* 0C4ED4 001C4DD4 00000000 */  nop
/* 0C4ED8 001C4DD8 00000000 */  nop
/* 0C4EDC 001C4DDC 00000000 */  nop
