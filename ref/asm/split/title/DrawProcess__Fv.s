.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawProcess__Fv
/* 004A80 01DB0780 60FEBD27 */  addiu       $29, $29, -0x1A0
/* 004A84 01DB0784 1000BF7F */  sq          $31, 0x10($29)
/* 004A88 01DB0788 0000B07F */  sq          $16, 0x0($29)
/* 004A8C 01DB078C E101023C */  lui         $2, %hi(OP_MainCamera)
/* 004A90 01DB0790 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 004A94 01DB0794 2000A527 */  addiu       $5, $29, 0x20
/* 004A98 01DB0798 9C91040C */  jal         GetPos__7CCameraFPf
/* 004A9C 01DB079C 00000000 */   nop
/* 004AA0 01DB07A0 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 004AA4 01DB07A4 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 004AA8 01DB07A8 BC65050C */  jal         SndSetCamera__FP7CCamera
/* 004AAC 01DB07AC 00000000 */   nop
/* 004AB0 01DB07B0 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 004AB4 01DB07B4 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 004AB8 01DB07B8 3000A527 */  addiu       $5, $29, 0x30
/* 004ABC 01DB07BC F890040C */  jal         GetCameraMatrix__7CCameraFPA4_f
/* 004AC0 01DB07C0 00000000 */   nop
/* 004AC4 01DB07C4 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 004AC8 01DB07C8 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 004ACC 01DB07CC 05000224 */  addiu       $2, $0, 0x5
/* 004AD0 01DB07D0 04006210 */  beq         $3, $2, .L01DB07E4_2B5FE4
/* 004AD4 01DB07D4 00000000 */   nop
/* 004AD8 01DB07D8 08000224 */  addiu       $2, $0, 0x8
/* 004ADC 01DB07DC 06006214 */  bne         $3, $2, .L01DB07F8_2B5FF8
/* 004AE0 01DB07E0 00000000 */   nop
.L01DB07E4_2B5FE4:
/* 004AE4 01DB07E4 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 004AE8 01DB07E8 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 004AEC 01DB07EC 01000524 */  addiu       $5, $0, 0x1
/* 004AF0 01DB07F0 F491040C */  jal         Step__13CCameraFollowFi
/* 004AF4 01DB07F4 00000000 */   nop
.L01DB07F8_2B5FF8:
/* 004AF8 01DB07F8 B000A427 */  addiu       $4, $29, 0xB0
/* 004AFC 01DB07FC 2A86040C */  jal         sceVu0UnitMatrix
/* 004B00 01DB0800 00000000 */   nop
/* 004B04 01DB0804 7000A427 */  addiu       $4, $29, 0x70
/* 004B08 01DB0808 B000A527 */  addiu       $5, $29, 0xB0
/* 004B0C 01DB080C 3000A627 */  addiu       $6, $29, 0x30
/* 004B10 01DB0810 6E85040C */  jal         sceVu0MulMatrix
/* 004B14 01DB0814 00000000 */   nop
/* 004B18 01DB0818 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 004B1C 01DB081C 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 004B20 01DB0820 01000224 */  addiu       $2, $0, 0x1
/* 004B24 01DB0824 07006210 */  beq         $3, $2, .L01DB0844_2B6044
/* 004B28 01DB0828 00000000 */   nop
/* 004B2C 01DB082C 7000A427 */  addiu       $4, $29, 0x70
/* 004B30 01DB0830 2000A527 */  addiu       $5, $29, 0x20
/* 004B34 01DB0834 E8B7040C */  jal         MGSetViewMatrix__FPA4_fPf
/* 004B38 01DB0838 00000000 */   nop
/* 004B3C 01DB083C 04000010 */  b           .L01DB0850_2B6050
/* 004B40 01DB0840 00000000 */   nop
.L01DB0844_2B6044:
/* 004B44 01DB0844 7000A427 */  addiu       $4, $29, 0x70
/* 004B48 01DB0848 DCB7040C */  jal         MGSetViewMatrix__FPA4_f
/* 004B4C 01DB084C 00000000 */   nop
.L01DB0850_2B6050:
/* 004B50 01DB0850 2400023C */  lui         $2, %hi(Vu_prog0f)
/* 004B54 01DB0854 00614524 */  addiu       $5, $2, %lo(Vu_prog0f)
/* 004B58 01DB0858 D48B848F */  lw          $4, -0x742C($28)
/* 004B5C 01DB085C 28360070 */  paddub      $6, $0, $0
/* 004B60 01DB0860 5C83040C */  jal         sceVif1PkCall
/* 004B64 01DB0864 00000000 */   nop
/* 004B68 01DB0868 D48B848F */  lw          $4, -0x742C($28)
/* 004B6C 01DB086C 0A83040C */  jal         sceVif1PkTerminate
/* 004B70 01DB0870 00000000 */   nop
/* 004B74 01DB0874 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 004B78 01DB0878 181B248C */  lw          $4, %lo(CScript__2 + 0x18)($1)
/* 004B7C 01DB087C 0A00812C */  sltiu       $1, $4, 0xA
/* 004B80 01DB0880 2E002010 */  beqz        $1, .L01DB093C_2B613C
/* 004B84 01DB0884 00000000 */   nop
/* 004B88 01DB0888 DE01023C */  lui         $2, %hi(LIT_915__3)
/* 004B8C 01DB088C 00D84324 */  addiu       $3, $2, %lo(LIT_915__3)
/* 004B90 01DB0890 80100400 */  sll         $2, $4, 2
/* 004B94 01DB0894 21104300 */  addu        $2, $2, $3
/* 004B98 01DB0898 0000428C */  lw          $2, 0x0($2)
/* 004B9C 01DB089C 08004000 */  jr          $2
/* 004BA0 01DB08A0 00000000 */   nop
/* 004BA4 01DB08A4 74D6760C */  jal         OpA_DrawProcess__Fv
/* 004BA8 01DB08A8 00000000 */   nop
/* 004BAC 01DB08AC 23000010 */  b           .L01DB093C_2B613C
/* 004BB0 01DB08B0 00000000 */   nop
/* 004BB4 01DB08B4 88EC760C */  jal         OpB_DrawProcess__Fv
/* 004BB8 01DB08B8 00000000 */   nop
/* 004BBC 01DB08BC 1F000010 */  b           .L01DB093C_2B613C
/* 004BC0 01DB08C0 00000000 */   nop
/* 004BC4 01DB08C4 88EC760C */  jal         OpB_DrawProcess__Fv
/* 004BC8 01DB08C8 00000000 */   nop
/* 004BCC 01DB08CC 1B000010 */  b           .L01DB093C_2B613C
/* 004BD0 01DB08D0 00000000 */   nop
/* 004BD4 01DB08D4 5401770C */  jal         OpC_DrawProcess__Fv
/* 004BD8 01DB08D8 00000000 */   nop
/* 004BDC 01DB08DC 17000010 */  b           .L01DB093C_2B613C
/* 004BE0 01DB08E0 00000000 */   nop
/* 004BE4 01DB08E4 5401770C */  jal         OpC_DrawProcess__Fv
/* 004BE8 01DB08E8 00000000 */   nop
/* 004BEC 01DB08EC 13000010 */  b           .L01DB093C_2B613C
/* 004BF0 01DB08F0 00000000 */   nop
/* 004BF4 01DB08F4 5401770C */  jal         OpC_DrawProcess__Fv
/* 004BF8 01DB08F8 00000000 */   nop
/* 004BFC 01DB08FC 0F000010 */  b           .L01DB093C_2B613C
/* 004C00 01DB0900 00000000 */   nop
/* 004C04 01DB0904 5401770C */  jal         OpC_DrawProcess__Fv
/* 004C08 01DB0908 00000000 */   nop
/* 004C0C 01DB090C 0B000010 */  b           .L01DB093C_2B613C
/* 004C10 01DB0910 00000000 */   nop
/* 004C14 01DB0914 5401770C */  jal         OpC_DrawProcess__Fv
/* 004C18 01DB0918 00000000 */   nop
/* 004C1C 01DB091C 07000010 */  b           .L01DB093C_2B613C
/* 004C20 01DB0920 00000000 */   nop
/* 004C24 01DB0924 D816770C */  jal         OpD_DrawProcess__Fv
/* 004C28 01DB0928 00000000 */   nop
/* 004C2C 01DB092C 03000010 */  b           .L01DB093C_2B613C
/* 004C30 01DB0930 00000000 */   nop
/* 004C34 01DB0934 D816770C */  jal         OpD_DrawProcess__Fv
/* 004C38 01DB0938 00000000 */   nop
.L01DB093C_2B613C:
/* 004C3C 01DB093C B8C2760C */  jal         DrawMess__Fv
/* 004C40 01DB0940 00000000 */   nop
/* 004C44 01DB0944 0898838F */  lw          $3, -0x67F8($28)
/* 004C48 01DB0948 01000224 */  addiu       $2, $0, 0x1
/* 004C4C 01DB094C 36006214 */  bne         $3, $2, .L01DB0A28_2B6228
/* 004C50 01DB0950 00000000 */   nop
/* 004C54 01DB0954 28260070 */  paddub      $4, $0, $0
/* 004C58 01DB0958 046F050C */  jal         setbilinear__Fi
/* 004C5C 01DB095C 00000000 */   nop
/* 004C60 01DB0960 4001A0AF */  sw          $0, 0x140($29)
/* 004C64 01DB0964 4401A0AF */  sw          $0, 0x144($29)
/* 004C68 01DB0968 00280224 */  addiu       $2, $0, 0x2800
/* 004C6C 01DB096C 4801A2AF */  sw          $2, 0x148($29)
/* 004C70 01DB0970 000E0224 */  addiu       $2, $0, 0xE00
/* 004C74 01DB0974 4C01A2AF */  sw          $2, 0x14C($29)
/* 004C78 01DB0978 4001A427 */  addiu       $4, $29, 0x140
/* 004C7C 01DB097C 282E0070 */  paddub      $5, $0, $0
/* 004C80 01DB0980 28360070 */  paddub      $6, $0, $0
/* 004C84 01DB0984 283E0070 */  paddub      $7, $0, $0
/* 004C88 01DB0988 40000824 */  addiu       $8, $0, 0x40
/* 004C8C 01DB098C 9CBE040C */  jal         MGFillBox__FRC8CRect_i_UcUcUcUc
/* 004C90 01DB0990 00000000 */   nop
/* 004C94 01DB0994 C701023C */  lui         $2, %hi(TexManager)
/* 004C98 01DB0998 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 004C9C 01DB099C D48B858F */  lw          $5, -0x742C($28)
/* 004CA0 01DB09A0 13000624 */  addiu       $6, $0, 0x13
/* 004CA4 01DB09A4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 004CA8 01DB09A8 00000000 */   nop
/* 004CAC 01DB09AC 6001A0AF */  sw          $0, 0x160($29)
/* 004CB0 01DB09B0 6401A0AF */  sw          $0, 0x164($29)
/* 004CB4 01DB09B4 80000324 */  addiu       $3, $0, 0x80
/* 004CB8 01DB09B8 6801A3AF */  sw          $3, 0x168($29)
/* 004CBC 01DB09BC 6C01A3AF */  sw          $3, 0x16C($29)
/* 004CC0 01DB09C0 00010224 */  addiu       $2, $0, 0x100
/* 004CC4 01DB09C4 5001A2AF */  sw          $2, 0x150($29)
/* 004CC8 01DB09C8 A0000224 */  addiu       $2, $0, 0xA0
/* 004CCC 01DB09CC 5401A2AF */  sw          $2, 0x154($29)
/* 004CD0 01DB09D0 5801A3AF */  sw          $3, 0x158($29)
/* 004CD4 01DB09D4 5C01A3AF */  sw          $3, 0x15C($29)
/* 004CD8 01DB09D8 A0B8040C */  jal         GetVif1Packet__Fv
/* 004CDC 01DB09DC 00000000 */   nop
/* 004CE0 01DB09E0 28864070 */  paddub      $16, $2, $0
/* 004CE4 01DB09E4 C701023C */  lui         $2, %hi(TexManager)
/* 004CE8 01DB09E8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 004CEC 01DB09EC DE01023C */  lui         $2, %hi(LIT_914__3)
/* 004CF0 01DB09F0 F8D74524 */  addiu       $5, $2, %lo(LIT_914__3)
/* 004CF4 01DB09F4 FFFF0624 */  addiu       $6, $0, -0x1
/* 004CF8 01DB09F8 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 004CFC 01DB09FC 00000000 */   nop
/* 004D00 01DB0A00 28260072 */  paddub      $4, $16, $0
/* 004D04 01DB0A04 282E4070 */  paddub      $5, $2, $0
/* 004D08 01DB0A08 5001A627 */  addiu       $6, $29, 0x150
/* 004D0C 01DB0A0C 6001A727 */  addiu       $7, $29, 0x160
/* 004D10 01DB0A10 80000824 */  addiu       $8, $0, 0x80
/* 004D14 01DB0A14 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 004D18 01DB0A18 00000000 */   nop
/* 004D1C 01DB0A1C 01000424 */  addiu       $4, $0, 0x1
/* 004D20 01DB0A20 046F050C */  jal         setbilinear__Fi
/* 004D24 01DB0A24 00000000 */   nop
.L01DB0A28_2B6228:
/* 004D28 01DB0A28 9801A427 */  addiu       $4, $29, 0x198
/* 004D2C 01DB0A2C 68BC040C */  jal         MGGetFBuffBackTex__FP9sceGsTex0
/* 004D30 01DB0A30 00000000 */   nop
/* 004D34 01DB0A34 F000A427 */  addiu       $4, $29, 0xF0
/* 004D38 01DB0A38 BCC3040C */  jal         __ct__8CTextureFv
/* 004D3C 01DB0A3C 00000000 */   nop
/* 004D40 01DB0A40 9801A227 */  addiu       $2, $29, 0x198
/* 004D44 01DB0A44 000042DC */  ld          $2, 0x0($2)
/* 004D48 01DB0A48 1801A2FF */  sd          $2, 0x118($29)
/* 004D4C 01DB0A4C 8001A0AF */  sw          $0, 0x180($29)
/* 004D50 01DB0A50 8401A0AF */  sw          $0, 0x184($29)
/* 004D54 01DB0A54 80020324 */  addiu       $3, $0, 0x280
/* 004D58 01DB0A58 8801A3AF */  sw          $3, 0x188($29)
/* 004D5C 01DB0A5C E0000224 */  addiu       $2, $0, 0xE0
/* 004D60 01DB0A60 8C01A2AF */  sw          $2, 0x18C($29)
/* 004D64 01DB0A64 7001A0AF */  sw          $0, 0x170($29)
/* 004D68 01DB0A68 7401A0AF */  sw          $0, 0x174($29)
/* 004D6C 01DB0A6C 7801A3AF */  sw          $3, 0x178($29)
/* 004D70 01DB0A70 C0010224 */  addiu       $2, $0, 0x1C0
/* 004D74 01DB0A74 7C01A2AF */  sw          $2, 0x17C($29)
/* 004D78 01DB0A78 D48B848F */  lw          $4, -0x742C($28)
/* 004D7C 01DB0A7C F000A527 */  addiu       $5, $29, 0xF0
/* 004D80 01DB0A80 7001A627 */  addiu       $6, $29, 0x170
/* 004D84 01DB0A84 8001A727 */  addiu       $7, $29, 0x180
/* 004D88 01DB0A88 80000824 */  addiu       $8, $0, 0x80
/* 004D8C 01DB0A8C 284E0071 */  paddub      $9, $8, $0
/* 004D90 01DB0A90 28560071 */  paddub      $10, $8, $0
/* 004D94 01DB0A94 23000B24 */  addiu       $11, $0, 0x23
/* 004D98 01DB0A98 8C71050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 004D9C 01DB0A9C 00000000 */   nop
/* 004DA0 01DB0AA0 E101023C */  lui         $2, %hi(DispFade)
/* 004DA4 01DB0AA4 B0E54424 */  addiu       $4, $2, %lo(DispFade)
/* 004DA8 01DB0AA8 D48B858F */  lw          $5, -0x742C($28)
/* 004DAC 01DB0AAC 0CB5760C */  jal         FadeIn__9CDispFadeFP13sceVif1Packet
/* 004DB0 01DB0AB0 00000000 */   nop
/* 004DB4 01DB0AB4 E101023C */  lui         $2, %hi(DispFade)
/* 004DB8 01DB0AB8 B0E54424 */  addiu       $4, $2, %lo(DispFade)
/* 004DBC 01DB0ABC D48B858F */  lw          $5, -0x742C($28)
/* 004DC0 01DB0AC0 94B4760C */  jal         FadeOut__9CDispFadeFP13sceVif1Packet
/* 004DC4 01DB0AC4 00000000 */   nop
/* 004DC8 01DB0AC8 1000BF7B */  lq          $31, 0x10($29)
/* 004DCC 01DB0ACC 0000B07B */  lq          $16, 0x0($29)
/* 004DD0 01DB0AD0 A001BD27 */  addiu       $29, $29, 0x1A0
/* 004DD4 01DB0AD4 0800E003 */  jr          $31
/* 004DD8 01DB0AD8 00000000 */   nop
/* 004DDC 01DB0ADC 00000000 */  nop
