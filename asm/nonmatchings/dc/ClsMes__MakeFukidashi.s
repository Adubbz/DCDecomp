.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MakeFukidashi__6ClsMesFP13sceVif1Packet
/* 51BD0 00151AD0 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 51BD4 00151AD4 5000BF7F */  sq         $31, 0x50($sp)
/* 51BD8 00151AD8 4000B47F */  sq         $20, 0x40($sp)
/* 51BDC 00151ADC 3000B37F */  sq         $19, 0x30($sp)
/* 51BE0 00151AE0 2000B27F */  sq         $18, 0x20($sp)
/* 51BE4 00151AE4 1000B17F */  sq         $17, 0x10($sp)
/* 51BE8 00151AE8 0000B07F */  sq         $16, 0x0($sp)
/* 51BEC 00151AEC 288E8070 */  paddub     $17, $4, $0
/* 51BF0 00151AF0 2886A070 */  paddub     $16, $5, $0
/* 51BF4 00151AF4 9000A427 */  addiu      $4, $sp, 0x90
/* 51BF8 00151AF8 4CBC040C */  jal        MGGetFBuffTex__FP9sceGsTex0
/* 51BFC 00151AFC 00000000 */   nop
/* 51C00 00151B00 28260072 */  paddub     $4, $16, $0
/* 51C04 00151B04 282E0070 */  paddub     $5, $0, $0
/* 51C08 00151B08 2083040C */  jal        sceVif1PkCnt
/* 51C0C 00151B0C 00000000 */   nop
/* 51C10 00151B10 28260072 */  paddub     $4, $16, $0
/* 51C14 00151B14 282E0070 */  paddub     $5, $0, $0
/* 51C18 00151B18 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 51C1C 00151B1C 00000000 */   nop
/* 51C20 00151B20 C701023C */  lui        $2, %hi(GiftagAD)
/* 51C24 00151B24 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 51C28 00151B28 28260072 */  paddub     $4, $16, $0
/* 51C2C 00151B2C 00004578 */  lq         $5, 0x0($2)
/* 51C30 00151B30 B083040C */  jal        sceVif1PkOpenGifTag
/* 51C34 00151B34 00000000 */   nop
/* 51C38 00151B38 28260072 */  paddub     $4, $16, $0
/* 51C3C 00151B3C 3F000524 */  addiu      $5, $0, 0x3F
/* 51C40 00151B40 28360070 */  paddub     $6, $0, $0
/* 51C44 00151B44 0A84040C */  jal        sceVif1PkAddGsAD
/* 51C48 00151B48 00000000 */   nop
/* 51C4C 00151B4C C701023C */  lui        $2, %hi(TexManager)
/* 51C50 00151B50 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 51C54 00151B54 2A00023C */  lui        $2, %hi(_1556)
/* 51C58 00151B58 789A4524 */  addiu      $5, $2, %lo(_1556)
/* 51C5C 00151B5C FFFF0624 */  addiu      $6, $0, -0x1
/* 51C60 00151B60 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 51C64 00151B64 00000000 */   nop
/* 51C68 00151B68 9800A327 */  addiu      $3, $sp, 0x98
/* 51C6C 00151B6C 280042DC */  ld         $2, 0x28($2)
/* 51C70 00151B70 000062FC */  sd         $2, 0x0($3)
/* 51C74 00151B74 9800A297 */  lhu        $2, 0x98($sp)
/* 51C78 00151B78 FF3F4330 */  andi       $3, $2, 0x3FFF
/* 51C7C 00151B7C 9800A2DF */  ld         $2, 0x98($sp)
/* 51C80 00151B80 3C130200 */  dsll32     $2, $2, 12
/* 51C84 00151B84 BE260200 */  dsrl32     $4, $2, 26
/* 51C88 00151B88 9A00A297 */  lhu        $2, 0x9A($sp)
/* 51C8C 00151B8C BC150200 */  dsll32     $2, $2, 22
/* 51C90 00151B90 BE2E0200 */  dsrl32     $5, $2, 26
/* 51C94 00151B94 42110300 */  srl        $2, $3, 5
/* 51C98 00151B98 3C180200 */  dsll32     $3, $2, 0
/* 51C9C 00151B9C 3E180300 */  dsrl32     $3, $3, 0
/* 51CA0 00151BA0 3C100400 */  dsll32     $2, $4, 0
/* 51CA4 00151BA4 3F100200 */  dsra32     $2, $2, 0
/* 51CA8 00151BA8 3C100200 */  dsll32     $2, $2, 0
/* 51CAC 00151BAC 3E100200 */  dsrl32     $2, $2, 0
/* 51CB0 00151BB0 38140200 */  dsll       $2, $2, 16
/* 51CB4 00151BB4 25186200 */  or         $3, $3, $2
/* 51CB8 00151BB8 3C100500 */  dsll32     $2, $5, 0
/* 51CBC 00151BBC 3E100200 */  dsrl32     $2, $2, 0
/* 51CC0 00151BC0 38160200 */  dsll       $2, $2, 24
/* 51CC4 00151BC4 25304300 */  or         $6, $2, $3
/* 51CC8 00151BC8 28260072 */  paddub     $4, $16, $0
/* 51CCC 00151BCC 4C000524 */  addiu      $5, $0, 0x4C
/* 51CD0 00151BD0 0A84040C */  jal        sceVif1PkAddGsAD
/* 51CD4 00151BD4 00000000 */   nop
/* 51CD8 00151BD8 28260072 */  paddub     $4, $16, $0
/* 51CDC 00151BDC B683040C */  jal        sceVif1PkCloseGifTag
/* 51CE0 00151BE0 00000000 */   nop
/* 51CE4 00151BE4 28260072 */  paddub     $4, $16, $0
/* 51CE8 00151BE8 A483040C */  jal        sceVif1PkCloseDirectCode
/* 51CEC 00151BEC 00000000 */   nop
/* 51CF0 00151BF0 28260072 */  paddub     $4, $16, $0
/* 51CF4 00151BF4 0A83040C */  jal        sceVif1PkTerminate
/* 51CF8 00151BF8 00000000 */   nop
/* 51CFC 00151BFC A000A427 */  addiu      $4, $sp, 0xA0
/* 51D00 00151C00 F08B82DF */  ld         $2, -0x7410($gp)
/* 51D04 00151C04 000082FC */  sd         $2, 0x0($4)
/* 51D08 00151C08 A800A327 */  addiu      $3, $sp, 0xA8
/* 51D0C 00151C0C E88B82DF */  ld         $2, -0x7418($gp)
/* 51D10 00151C10 000062FC */  sd         $2, 0x0($3)
/* 51D14 00151C14 A400B327 */  addiu      $19, $sp, 0xA4
/* 51D18 00151C18 00006592 */  lbu        $5, 0x0($19)
/* 51D1C 00151C1C 01000364 */  daddiu     $3, $0, 0x1
/* 51D20 00151C20 FEFF0224 */  addiu      $2, $0, -0x2
/* 51D24 00151C24 2410A200 */  and        $2, $5, $2
/* 51D28 00151C28 25104300 */  or         $2, $2, $3
/* 51D2C 00151C2C 000062A2 */  sb         $2, 0x0($19)
/* 51D30 00151C30 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* 51D34 00151C34 00000000 */   nop
/* 51D38 00151C38 A800A293 */  lbu        $2, 0xA8($sp)
/* 51D3C 00151C3C 01000330 */  andi       $3, $0, 0x1
/* 51D40 00151C40 FEFF0524 */  addiu      $5, $0, -0x2
/* 51D44 00151C44 24104500 */  and        $2, $2, $5
/* 51D48 00151C48 25104300 */  or         $2, $2, $3
/* 51D4C 00151C4C A800A2A3 */  sb         $2, 0xA8($sp)
/* 51D50 00151C50 A900B427 */  addiu      $20, $sp, 0xA9
/* 51D54 00151C54 00008492 */  lbu        $4, 0x0($20)
/* 51D58 00151C58 80190300 */  sll        $3, $3, 6
/* 51D5C 00151C5C BFFF0224 */  addiu      $2, $0, -0x41
/* 51D60 00151C60 24108200 */  and        $2, $4, $2
/* 51D64 00151C64 25104300 */  or         $2, $2, $3
/* 51D68 00151C68 000082A2 */  sb         $2, 0x0($20)
/* 51D6C 00151C6C AA00B227 */  addiu      $18, $sp, 0xAA
/* 51D70 00151C70 00004292 */  lbu        $2, 0x0($18)
/* 51D74 00151C74 01000364 */  daddiu     $3, $0, 0x1
/* 51D78 00151C78 24104500 */  and        $2, $2, $5
/* 51D7C 00151C7C 25104300 */  or         $2, $2, $3
/* 51D80 00151C80 000042A2 */  sb         $2, 0x0($18)
/* 51D84 00151C84 00004492 */  lbu        $4, 0x0($18)
/* 51D88 00151C88 02000364 */  daddiu     $3, $0, 0x2
/* 51D8C 00151C8C F9FF0224 */  addiu      $2, $0, -0x7
/* 51D90 00151C90 24108200 */  and        $2, $4, $2
/* 51D94 00151C94 25104300 */  or         $2, $2, $3
/* 51D98 00151C98 000042A2 */  sb         $2, 0x0($18)
/* 51D9C 00151C9C A800A427 */  addiu      $4, $sp, 0xA8
/* 51DA0 00151CA0 7CBB040C */  jal        MGSetGsTEST__FP9sceGsTest
/* 51DA4 00151CA4 00000000 */   nop
/* 51DA8 00151CA8 6000A0AF */  sw         $0, 0x60($sp)
/* 51DAC 00151CAC 6400A0AF */  sw         $0, 0x64($sp)
/* 51DB0 00151CB0 00280224 */  addiu      $2, $0, 0x2800
/* 51DB4 00151CB4 6800A2AF */  sw         $2, 0x68($sp)
/* 51DB8 00151CB8 000E0224 */  addiu      $2, $0, 0xE00
/* 51DBC 00151CBC 6C00A2AF */  sw         $2, 0x6C($sp)
/* 51DC0 00151CC0 6000A427 */  addiu      $4, $sp, 0x60
/* 51DC4 00151CC4 282E0070 */  paddub     $5, $0, $0
/* 51DC8 00151CC8 28360070 */  paddub     $6, $0, $0
/* 51DCC 00151CCC 283E0070 */  paddub     $7, $0, $0
/* 51DD0 00151CD0 28460070 */  paddub     $8, $0, $0
/* 51DD4 00151CD4 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 51DD8 00151CD8 00000000 */   nop
/* 51DDC 00151CDC A000A427 */  addiu      $4, $sp, 0xA0
/* 51DE0 00151CE0 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* 51DE4 00151CE4 00000000 */   nop
/* 51DE8 00151CE8 A800A427 */  addiu      $4, $sp, 0xA8
/* 51DEC 00151CEC 7CBB040C */  jal        MGSetGsTEST__FP9sceGsTest
/* 51DF0 00151CF0 00000000 */   nop
/* 51DF4 00151CF4 28260072 */  paddub     $4, $16, $0
/* 51DF8 00151CF8 282E0070 */  paddub     $5, $0, $0
/* 51DFC 00151CFC 2083040C */  jal        sceVif1PkCnt
/* 51E00 00151D00 00000000 */   nop
/* 51E04 00151D04 28260072 */  paddub     $4, $16, $0
/* 51E08 00151D08 282E0070 */  paddub     $5, $0, $0
/* 51E0C 00151D0C 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 51E10 00151D10 00000000 */   nop
/* 51E14 00151D14 C701023C */  lui        $2, %hi(GiftagAD)
/* 51E18 00151D18 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 51E1C 00151D1C 28260072 */  paddub     $4, $16, $0
/* 51E20 00151D20 00004578 */  lq         $5, 0x0($2)
/* 51E24 00151D24 B083040C */  jal        sceVif1PkOpenGifTag
/* 51E28 00151D28 00000000 */   nop
/* 51E2C 00151D2C 28262072 */  paddub     $4, $17, $0
/* 51E30 00151D30 282E0072 */  paddub     $5, $16, $0
/* 51E34 00151D34 01000624 */  addiu      $6, $0, 0x1
/* 51E38 00151D38 D443050C */  jal        MakeFukidashi_sub__6ClsMesFP13sceVif1Packeti
/* 51E3C 00151D3C 00000000 */   nop
/* 51E40 00151D40 28262072 */  paddub     $4, $17, $0
/* 51E44 00151D44 282E0072 */  paddub     $5, $16, $0
/* 51E48 00151D48 28360070 */  paddub     $6, $0, $0
/* 51E4C 00151D4C D443050C */  jal        MakeFukidashi_sub__6ClsMesFP13sceVif1Packeti
/* 51E50 00151D50 00000000 */   nop
/* 51E54 00151D54 28260072 */  paddub     $4, $16, $0
/* 51E58 00151D58 3F000524 */  addiu      $5, $0, 0x3F
/* 51E5C 00151D5C 28360070 */  paddub     $6, $0, $0
/* 51E60 00151D60 0A84040C */  jal        sceVif1PkAddGsAD
/* 51E64 00151D64 00000000 */   nop
/* 51E68 00151D68 28260072 */  paddub     $4, $16, $0
/* 51E6C 00151D6C B683040C */  jal        sceVif1PkCloseGifTag
/* 51E70 00151D70 00000000 */   nop
/* 51E74 00151D74 28260072 */  paddub     $4, $16, $0
/* 51E78 00151D78 A483040C */  jal        sceVif1PkCloseDirectCode
/* 51E7C 00151D7C 00000000 */   nop
/* 51E80 00151D80 28260072 */  paddub     $4, $16, $0
/* 51E84 00151D84 0A83040C */  jal        sceVif1PkTerminate
/* 51E88 00151D88 00000000 */   nop
/* 51E8C 00151D8C 00006492 */  lbu        $4, 0x0($19)
/* 51E90 00151D90 01000364 */  daddiu     $3, $0, 0x1
/* 51E94 00151D94 FEFF0224 */  addiu      $2, $0, -0x2
/* 51E98 00151D98 24108200 */  and        $2, $4, $2
/* 51E9C 00151D9C 25104300 */  or         $2, $2, $3
/* 51EA0 00151DA0 000062A2 */  sb         $2, 0x0($19)
/* 51EA4 00151DA4 A000A427 */  addiu      $4, $sp, 0xA0
/* 51EA8 00151DA8 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* 51EAC 00151DAC 00000000 */   nop
/* 51EB0 00151DB0 A800A293 */  lbu        $2, 0xA8($sp)
/* 51EB4 00151DB4 01000330 */  andi       $3, $0, 0x1
/* 51EB8 00151DB8 FEFF0524 */  addiu      $5, $0, -0x2
/* 51EBC 00151DBC 24104500 */  and        $2, $2, $5
/* 51EC0 00151DC0 25104300 */  or         $2, $2, $3
/* 51EC4 00151DC4 A800A2A3 */  sb         $2, 0xA8($sp)
/* 51EC8 00151DC8 00008492 */  lbu        $4, 0x0($20)
/* 51ECC 00151DCC 40000364 */  daddiu     $3, $0, 0x40
/* 51ED0 00151DD0 BFFF0224 */  addiu      $2, $0, -0x41
/* 51ED4 00151DD4 24108200 */  and        $2, $4, $2
/* 51ED8 00151DD8 25104300 */  or         $2, $2, $3
/* 51EDC 00151DDC 000082A2 */  sb         $2, 0x0($20)
/* 51EE0 00151DE0 00004292 */  lbu        $2, 0x0($18)
/* 51EE4 00151DE4 01000364 */  daddiu     $3, $0, 0x1
/* 51EE8 00151DE8 24104500 */  and        $2, $2, $5
/* 51EEC 00151DEC 25104300 */  or         $2, $2, $3
/* 51EF0 00151DF0 000042A2 */  sb         $2, 0x0($18)
/* 51EF4 00151DF4 00004492 */  lbu        $4, 0x0($18)
/* 51EF8 00151DF8 02000364 */  daddiu     $3, $0, 0x2
/* 51EFC 00151DFC F9FF0224 */  addiu      $2, $0, -0x7
/* 51F00 00151E00 24108200 */  and        $2, $4, $2
/* 51F04 00151E04 25104300 */  or         $2, $2, $3
/* 51F08 00151E08 000042A2 */  sb         $2, 0x0($18)
/* 51F0C 00151E0C 00008492 */  lbu        $4, 0x0($20)
/* 51F10 00151E10 80000364 */  daddiu     $3, $0, 0x80
/* 51F14 00151E14 7FFF0224 */  addiu      $2, $0, -0x81
/* 51F18 00151E18 24108200 */  and        $2, $4, $2
/* 51F1C 00151E1C 25104300 */  or         $2, $2, $3
/* 51F20 00151E20 000082A2 */  sb         $2, 0x0($20)
/* 51F24 00151E24 A800A427 */  addiu      $4, $sp, 0xA8
/* 51F28 00151E28 7CBB040C */  jal        MGSetGsTEST__FP9sceGsTest
/* 51F2C 00151E2C 00000000 */   nop
/* 51F30 00151E30 C701023C */  lui        $2, %hi(TexManager)
/* 51F34 00151E34 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 51F38 00151E38 2A00023C */  lui        $2, %hi(_1557)
/* 51F3C 00151E3C 889A4524 */  addiu      $5, $2, %lo(_1557)
/* 51F40 00151E40 FFFF0624 */  addiu      $6, $0, -0x1
/* 51F44 00151E44 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 51F48 00151E48 00000000 */   nop
/* 51F4C 00151E4C 28964070 */  paddub     $18, $2, $0
/* 51F50 00151E50 289E0070 */  paddub     $19, $0, $0
/* 51F54 00151E54 24000010 */  b          .L00151EE8
/* 51F58 00151E58 00000000 */   nop
.L00151E5C:
/* 51F5C 00151E5C 28A60070 */  paddub     $20, $0, $0
/* 51F60 00151E60 1D000010 */  b          .L00151ED8
/* 51F64 00151E64 00000000 */   nop
.L00151E68:
/* 51F68 00151E68 D416238E */  lw         $3, 0x16D4($17)
/* 51F6C 00151E6C 80006128 */  slti       $at, $3, 0x80
/* 51F70 00151E70 03002010 */  beqz       $at, .L00151E80
/* 51F74 00151E74 00000000 */   nop
/* 51F78 00151E78 02000010 */  b          .L00151E84
/* 51F7C 00151E7C 00000000 */   nop
.L00151E80:
/* 51F80 00151E80 80000324 */  addiu      $3, $0, 0x80
.L00151E84:
/* 51F84 00151E84 8000A0AF */  sw         $0, 0x80($sp)
/* 51F88 00151E88 8400A0AF */  sw         $0, 0x84($sp)
/* 51F8C 00151E8C 80000824 */  addiu      $8, $0, 0x80
/* 51F90 00151E90 8800A8AF */  sw         $8, 0x88($sp)
/* 51F94 00151E94 8C00A8AF */  sw         $8, 0x8C($sp)
/* 51F98 00151E98 C0111400 */  sll        $2, $20, 7
/* 51F9C 00151E9C 7000A2AF */  sw         $2, 0x70($sp)
/* 51FA0 00151EA0 C0111300 */  sll        $2, $19, 7
/* 51FA4 00151EA4 7400A2AF */  sw         $2, 0x74($sp)
/* 51FA8 00151EA8 7800A8AF */  sw         $8, 0x78($sp)
/* 51FAC 00151EAC 7C00A8AF */  sw         $8, 0x7C($sp)
/* 51FB0 00151EB0 FF006B30 */  andi       $11, $3, 0xFF
/* 51FB4 00151EB4 D48B848F */  lw         $4, -0x742C($gp)
/* 51FB8 00151EB8 282E4072 */  paddub     $5, $18, $0
/* 51FBC 00151EBC 7000A627 */  addiu      $6, $sp, 0x70
/* 51FC0 00151EC0 8000A727 */  addiu      $7, $sp, 0x80
/* 51FC4 00151EC4 284E0071 */  paddub     $9, $8, $0
/* 51FC8 00151EC8 28560071 */  paddub     $10, $8, $0
/* 51FCC 00151ECC 6033050C */  jal        Myset2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 51FD0 00151ED0 00000000 */   nop
/* 51FD4 00151ED4 01009426 */  addiu      $20, $20, 0x1
.L00151ED8:
/* 51FD8 00151ED8 0500822A */  slti       $2, $20, 0x5
/* 51FDC 00151EDC E2FF4014 */  bnez       $2, .L00151E68
/* 51FE0 00151EE0 00000000 */   nop
/* 51FE4 00151EE4 01007326 */  addiu      $19, $19, 0x1
.L00151EE8:
/* 51FE8 00151EE8 0400622A */  slti       $2, $19, 0x4
/* 51FEC 00151EEC DBFF4014 */  bnez       $2, .L00151E5C
/* 51FF0 00151EF0 00000000 */   nop
/* 51FF4 00151EF4 28260072 */  paddub     $4, $16, $0
/* 51FF8 00151EF8 282E0070 */  paddub     $5, $0, $0
/* 51FFC 00151EFC 2083040C */  jal        sceVif1PkCnt
/* 52000 00151F00 00000000 */   nop
/* 52004 00151F04 28260072 */  paddub     $4, $16, $0
/* 52008 00151F08 282E0070 */  paddub     $5, $0, $0
/* 5200C 00151F0C 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 52010 00151F10 00000000 */   nop
/* 52014 00151F14 C701023C */  lui        $2, %hi(GiftagAD)
/* 52018 00151F18 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 5201C 00151F1C 28260072 */  paddub     $4, $16, $0
/* 52020 00151F20 00004578 */  lq         $5, 0x0($2)
/* 52024 00151F24 B083040C */  jal        sceVif1PkOpenGifTag
/* 52028 00151F28 00000000 */   nop
/* 5202C 00151F2C 28260072 */  paddub     $4, $16, $0
/* 52030 00151F30 3F000524 */  addiu      $5, $0, 0x3F
/* 52034 00151F34 28360070 */  paddub     $6, $0, $0
/* 52038 00151F38 0A84040C */  jal        sceVif1PkAddGsAD
/* 5203C 00151F3C 00000000 */   nop
/* 52040 00151F40 9000A297 */  lhu        $2, 0x90($sp)
/* 52044 00151F44 FF3F4230 */  andi       $2, $2, 0x3FFF
/* 52048 00151F48 43110200 */  sra        $2, $2, 5
/* 5204C 00151F4C 3C180200 */  dsll32     $3, $2, 0
/* 52050 00151F50 3F180300 */  dsra32     $3, $3, 0
/* 52054 00151F54 9000A2DF */  ld         $2, 0x90($sp)
/* 52058 00151F58 3C130200 */  dsll32     $2, $2, 12
/* 5205C 00151F5C BE160200 */  dsrl32     $2, $2, 26
/* 52060 00151F60 38140200 */  dsll       $2, $2, 16
/* 52064 00151F64 25186200 */  or         $3, $3, $2
/* 52068 00151F68 9200A297 */  lhu        $2, 0x92($sp)
/* 5206C 00151F6C BC150200 */  dsll32     $2, $2, 22
/* 52070 00151F70 BE160200 */  dsrl32     $2, $2, 26
/* 52074 00151F74 38160200 */  dsll       $2, $2, 24
/* 52078 00151F78 25304300 */  or         $6, $2, $3
/* 5207C 00151F7C 28260072 */  paddub     $4, $16, $0
/* 52080 00151F80 4C000524 */  addiu      $5, $0, 0x4C
/* 52084 00151F84 0A84040C */  jal        sceVif1PkAddGsAD
/* 52088 00151F88 00000000 */   nop
/* 5208C 00151F8C E88B8227 */  addiu      $2, $gp, -0x7418
/* 52090 00151F90 28260072 */  paddub     $4, $16, $0
/* 52094 00151F94 47000524 */  addiu      $5, $0, 0x47
/* 52098 00151F98 000046DC */  ld         $6, 0x0($2)
/* 5209C 00151F9C 0A84040C */  jal        sceVif1PkAddGsAD
/* 520A0 00151FA0 00000000 */   nop
/* 520A4 00151FA4 F08B8227 */  addiu      $2, $gp, -0x7410
/* 520A8 00151FA8 28260072 */  paddub     $4, $16, $0
/* 520AC 00151FAC 4E000524 */  addiu      $5, $0, 0x4E
/* 520B0 00151FB0 000046DC */  ld         $6, 0x0($2)
/* 520B4 00151FB4 0A84040C */  jal        sceVif1PkAddGsAD
/* 520B8 00151FB8 00000000 */   nop
/* 520BC 00151FBC F88B8227 */  addiu      $2, $gp, -0x7408
/* 520C0 00151FC0 28260072 */  paddub     $4, $16, $0
/* 520C4 00151FC4 42000524 */  addiu      $5, $0, 0x42
/* 520C8 00151FC8 000046DC */  ld         $6, 0x0($2)
/* 520CC 00151FCC 0A84040C */  jal        sceVif1PkAddGsAD
/* 520D0 00151FD0 00000000 */   nop
/* 520D4 00151FD4 28260072 */  paddub     $4, $16, $0
/* 520D8 00151FD8 B683040C */  jal        sceVif1PkCloseGifTag
/* 520DC 00151FDC 00000000 */   nop
/* 520E0 00151FE0 28260072 */  paddub     $4, $16, $0
/* 520E4 00151FE4 A483040C */  jal        sceVif1PkCloseDirectCode
/* 520E8 00151FE8 00000000 */   nop
/* 520EC 00151FEC 5000BF7B */  lq         $31, 0x50($sp)
/* 520F0 00151FF0 4000B47B */  lq         $20, 0x40($sp)
/* 520F4 00151FF4 3000B37B */  lq         $19, 0x30($sp)
/* 520F8 00151FF8 2000B27B */  lq         $18, 0x20($sp)
/* 520FC 00151FFC 1000B17B */  lq         $17, 0x10($sp)
/* 52100 00152000 0000B07B */  lq         $16, 0x0($sp)
/* 52104 00152004 B000BD27 */  addiu      $sp, $sp, 0xB0
/* 52108 00152008 0800E003 */  jr         $31
/* 5210C 0015200C 00000000 */   nop
