.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FaceChange__Fi__4
/* 01CC30 01DC8930 60FFBD27 */  addiu       $29, $29, -0xA0
/* 01CC34 01DC8934 7000BF7F */  sq          $31, 0x70($29)
/* 01CC38 01DC8938 6000B47F */  sq          $20, 0x60($29)
/* 01CC3C 01DC893C 5000B37F */  sq          $19, 0x50($29)
/* 01CC40 01DC8940 4000B27F */  sq          $18, 0x40($29)
/* 01CC44 01DC8944 3000B17F */  sq          $17, 0x30($29)
/* 01CC48 01DC8948 2000B07F */  sq          $16, 0x20($29)
/* 01CC4C 01DC894C 28A68070 */  paddub      $20, $4, $0
/* 01CC50 01DC8950 D48B848F */  lw          $4, -0x742C($28)
/* 01CC54 01DC8954 282E0070 */  paddub      $5, $0, $0
/* 01CC58 01DC8958 2083040C */  jal         sceVif1PkCnt
/* 01CC5C 01DC895C 00000000 */   nop
/* 01CC60 01DC8960 D48B848F */  lw          $4, -0x742C($28)
/* 01CC64 01DC8964 282E0070 */  paddub      $5, $0, $0
/* 01CC68 01DC8968 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 01CC6C 01DC896C 00000000 */   nop
/* 01CC70 01DC8970 C701023C */  lui         $2, %hi(GiftagAD)
/* 01CC74 01DC8974 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 01CC78 01DC8978 D48B848F */  lw          $4, -0x742C($28)
/* 01CC7C 01DC897C 00004578 */  lq          $5, 0x0($2)
/* 01CC80 01DC8980 B083040C */  jal         sceVif1PkOpenGifTag
/* 01CC84 01DC8984 00000000 */   nop
/* 01CC88 01DC8988 D48B848F */  lw          $4, -0x742C($28)
/* 01CC8C 01DC898C 3F000524 */  addiu       $5, $0, 0x3F
/* 01CC90 01DC8990 28360070 */  paddub      $6, $0, $0
/* 01CC94 01DC8994 0A84040C */  jal         sceVif1PkAddGsAD
/* 01CC98 01DC8998 00000000 */   nop
/* 01CC9C 01DC899C D48B848F */  lw          $4, -0x742C($28)
/* 01CCA0 01DC89A0 B683040C */  jal         sceVif1PkCloseGifTag
/* 01CCA4 01DC89A4 00000000 */   nop
/* 01CCA8 01DC89A8 D48B848F */  lw          $4, -0x742C($28)
/* 01CCAC 01DC89AC A483040C */  jal         sceVif1PkCloseDirectCode
/* 01CCB0 01DC89B0 00000000 */   nop
/* 01CCB4 01DC89B4 DE01013C */  lui         $1, %hi(face$1340)
/* 01CCB8 01DC89B8 F0B0258C */  lw          $5, %lo(face$1340)($1)
/* 01CCBC 01DC89BC 9A00A010 */  beqz        $5, .L01DC8C28_2CE428
/* 01CCC0 01DC89C0 00000000 */   nop
/* 01CCC4 01DC89C4 C701023C */  lui         $2, %hi(TexManager)
/* 01CCC8 01DC89C8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01CCCC 01DC89CC FFFF0624 */  addiu       $6, $0, -0x1
/* 01CCD0 01DC89D0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01CCD4 01DC89D4 00000000 */   nop
/* 01CCD8 01DC89D8 28864070 */  paddub      $16, $2, $0
/* 01CCDC 01DC89DC C701023C */  lui         $2, %hi(TexManager)
/* 01CCE0 01DC89E0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01CCE4 01DC89E4 DE01013C */  lui         $1, %hi(face$1340 + 0x4)
/* 01CCE8 01DC89E8 F4B0258C */  lw          $5, %lo(face$1340 + 0x4)($1)
/* 01CCEC 01DC89EC FFFF0624 */  addiu       $6, $0, -0x1
/* 01CCF0 01DC89F0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01CCF4 01DC89F4 00000000 */   nop
/* 01CCF8 01DC89F8 03000012 */  beqz        $16, .L01DC8A08_2CE208
/* 01CCFC 01DC89FC 00000000 */   nop
/* 01CD00 01DC8A00 03004014 */  bnez        $2, .L01DC8A10_2CE210
/* 01CD04 01DC8A04 00000000 */   nop
.L01DC8A08_2CE208:
/* 01CD08 01DC8A08 87000010 */  b           .L01DC8C28_2CE428
/* 01CD0C 01DC8A0C 00000000 */   nop
.L01DC8A10_2CE210:
/* 01CD10 01DC8A10 2800438C */  lw          $3, 0x28($2)
/* 01CD14 01DC8A14 FF3F7130 */  andi        $17, $3, 0x3FFF
/* 01CD18 01DC8A18 2800038E */  lw          $3, 0x28($16)
/* 01CD1C 01DC8A1C FF3F7230 */  andi        $18, $3, 0x3FFF
/* 01CD20 01DC8A20 280042DC */  ld          $2, 0x28($2)
/* 01CD24 01DC8A24 BA130200 */  dsrl        $2, $2, 14
/* 01CD28 01DC8A28 3F004230 */  andi        $2, $2, 0x3F
/* 01CD2C 01DC8A2C 3C980200 */  dsll32      $19, $2, 0
/* 01CD30 01DC8A30 3F981300 */  dsra32      $19, $19, 0
/* 01CD34 01DC8A34 280002DE */  ld          $2, 0x28($16)
/* 01CD38 01DC8A38 BA130200 */  dsrl        $2, $2, 14
/* 01CD3C 01DC8A3C 3F004230 */  andi        $2, $2, 0x3F
/* 01CD40 01DC8A40 3C800200 */  dsll32      $16, $2, 0
/* 01CD44 01DC8A44 3F801000 */  dsra32      $16, $16, 0
/* 01CD48 01DC8A48 40101400 */  sll         $2, $20, 1
/* 01CD4C 01DC8A4C 21105400 */  addu        $2, $2, $20
/* 01CD50 01DC8A50 80100200 */  sll         $2, $2, 2
/* 01CD54 01DC8A54 21105400 */  addu        $2, $2, $20
/* 01CD58 01DC8A58 80A00200 */  sll         $20, $2, 2
/* 01CD5C 01DC8A5C DE01023C */  lui         $2, %hi(CScript__2 + 0x44)
/* 01CD60 01DC8A60 441B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x44)
/* 01CD64 01DC8A64 21105400 */  addu        $2, $2, $20
/* 01CD68 01DC8A68 0000428C */  lw          $2, 0x0($2)
/* 01CD6C 01DC8A6C DE01013C */  lui         $1, %hi(face$1340 + 0x18)
/* 01CD70 01DC8A70 08B122AC */  sw          $2, %lo(face$1340 + 0x18)($1)
/* 01CD74 01DC8A74 DE01013C */  lui         $1, %hi(face$1340 + 0x18)
/* 01CD78 01DC8A78 08B1228C */  lw          $2, %lo(face$1340 + 0x18)($1)
/* 01CD7C 01DC8A7C 0A004128 */  slti        $1, $2, 0xA
/* 01CD80 01DC8A80 04002010 */  beqz        $1, .L01DC8A94_2CE294
/* 01CD84 01DC8A84 00000000 */   nop
/* 01CD88 01DC8A88 28260070 */  paddub      $4, $0, $0
/* 01CD8C 01DC8A8C 0A000010 */  b           .L01DC8AB8_2CE2B8
/* 01CD90 01DC8A90 00000000 */   nop
.L01DC8A94_2CE294:
/* 01CD94 01DC8A94 12004128 */  slti        $1, $2, 0x12
/* 01CD98 01DC8A98 05002010 */  beqz        $1, .L01DC8AB0_2CE2B0
/* 01CD9C 01DC8A9C 00000000 */   nop
/* 01CDA0 01DC8AA0 80000424 */  addiu       $4, $0, 0x80
/* 01CDA4 01DC8AA4 F6FF4224 */  addiu       $2, $2, -0xA
/* 01CDA8 01DC8AA8 03000010 */  b           .L01DC8AB8_2CE2B8
/* 01CDAC 01DC8AAC 00000000 */   nop
.L01DC8AB0_2CE2B0:
/* 01CDB0 01DC8AB0 00010424 */  addiu       $4, $0, 0x100
/* 01CDB4 01DC8AB4 EEFF4224 */  addiu       $2, $2, -0x12
.L01DC8AB8_2CE2B8:
/* 01CDB8 01DC8AB8 DE01013C */  lui         $1, %hi(face$1340 + 0xC)
/* 01CDBC 01DC8ABC FCB0258C */  lw          $5, %lo(face$1340 + 0xC)($1)
/* 01CDC0 01DC8AC0 01004224 */  addiu       $2, $2, 0x1
/* 01CDC4 01DC8AC4 1818A200 */  mult        $3, $5, $2
/* 01CDC8 01DC8AC8 DE01013C */  lui         $1, %hi(face$1340 + 0x20)
/* 01CDCC 01DC8ACC 10B1228C */  lw          $2, %lo(face$1340 + 0x20)($1)
/* 01CDD0 01DC8AD0 23104300 */  subu        $2, $2, $3
/* 01CDD4 01DC8AD4 8000A4AF */  sw          $4, 0x80($29)
/* 01CDD8 01DC8AD8 8400A2AF */  sw          $2, 0x84($29)
/* 01CDDC 01DC8ADC 80000224 */  addiu       $2, $0, 0x80
/* 01CDE0 01DC8AE0 8800A2AF */  sw          $2, 0x88($29)
/* 01CDE4 01DC8AE4 8C00A5AF */  sw          $5, 0x8C($29)
/* 01CDE8 01DC8AE8 0000A0FF */  sd          $0, 0x0($29)
/* 01CDEC 01DC8AEC 23184500 */  subu        $3, $2, $5
/* 01CDF0 01DC8AF0 DE01013C */  lui         $1, %hi(face$1340 + 0x8)
/* 01CDF4 01DC8AF4 F8B0228C */  lw          $2, %lo(face$1340 + 0x8)($1)
/* 01CDF8 01DC8AF8 23106200 */  subu        $2, $3, $2
/* 01CDFC 01DC8AFC 0800A2FF */  sd          $2, 0x8($29)
/* 01CE00 01DC8B00 1000A0FF */  sd          $0, 0x10($29)
/* 01CE04 01DC8B04 D48B848F */  lw          $4, -0x742C($28)
/* 01CE08 01DC8B08 282E2072 */  paddub      $5, $17, $0
/* 01CE0C 01DC8B0C 28366072 */  paddub      $6, $19, $0
/* 01CE10 01DC8B10 13000724 */  addiu       $7, $0, 0x13
/* 01CE14 01DC8B14 8000A827 */  addiu       $8, $29, 0x80
/* 01CE18 01DC8B18 284E4072 */  paddub      $9, $18, $0
/* 01CE1C 01DC8B1C 28560072 */  paddub      $10, $16, $0
/* 01CE20 01DC8B20 285EE070 */  paddub      $11, $7, $0
/* 01CE24 01DC8B24 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 01CE28 01DC8B28 00000000 */   nop
/* 01CE2C 01DC8B2C DE01023C */  lui         $2, %hi(CScript__2 + 0x4C)
/* 01CE30 01DC8B30 4C1B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x4C)
/* 01CE34 01DC8B34 21105400 */  addu        $2, $2, $20
/* 01CE38 01DC8B38 0000428C */  lw          $2, 0x0($2)
/* 01CE3C 01DC8B3C DE01013C */  lui         $1, %hi(face$1340 + 0x1C)
/* 01CE40 01DC8B40 0CB122AC */  sw          $2, %lo(face$1340 + 0x1C)($1)
/* 01CE44 01DC8B44 DE01013C */  lui         $1, %hi(face$1340 + 0x14)
/* 01CE48 01DC8B48 04B1248C */  lw          $4, %lo(face$1340 + 0x14)($1)
/* 01CE4C 01DC8B4C DE01013C */  lui         $1, %hi(face$1340 + 0x1C)
/* 01CE50 01DC8B50 0CB1228C */  lw          $2, %lo(face$1340 + 0x1C)($1)
/* 01CE54 01DC8B54 01004224 */  addiu       $2, $2, 0x1
/* 01CE58 01DC8B58 18188200 */  mult        $3, $4, $2
/* 01CE5C 01DC8B5C DE01013C */  lui         $1, %hi(face$1340 + 0x20)
/* 01CE60 01DC8B60 10B1228C */  lw          $2, %lo(face$1340 + 0x20)($1)
/* 01CE64 01DC8B64 23184300 */  subu        $3, $2, $3
/* 01CE68 01DC8B68 80010224 */  addiu       $2, $0, 0x180
/* 01CE6C 01DC8B6C 9000A2AF */  sw          $2, 0x90($29)
/* 01CE70 01DC8B70 9400A3AF */  sw          $3, 0x94($29)
/* 01CE74 01DC8B74 80000224 */  addiu       $2, $0, 0x80
/* 01CE78 01DC8B78 9800A2AF */  sw          $2, 0x98($29)
/* 01CE7C 01DC8B7C 9C00A4AF */  sw          $4, 0x9C($29)
/* 01CE80 01DC8B80 0000A0FF */  sd          $0, 0x0($29)
/* 01CE84 01DC8B84 23184400 */  subu        $3, $2, $4
/* 01CE88 01DC8B88 DE01013C */  lui         $1, %hi(face$1340 + 0x10)
/* 01CE8C 01DC8B8C 00B1228C */  lw          $2, %lo(face$1340 + 0x10)($1)
/* 01CE90 01DC8B90 23106200 */  subu        $2, $3, $2
/* 01CE94 01DC8B94 0800A2FF */  sd          $2, 0x8($29)
/* 01CE98 01DC8B98 1000A0FF */  sd          $0, 0x10($29)
/* 01CE9C 01DC8B9C D48B848F */  lw          $4, -0x742C($28)
/* 01CEA0 01DC8BA0 282E2072 */  paddub      $5, $17, $0
/* 01CEA4 01DC8BA4 28366072 */  paddub      $6, $19, $0
/* 01CEA8 01DC8BA8 13000724 */  addiu       $7, $0, 0x13
/* 01CEAC 01DC8BAC 9000A827 */  addiu       $8, $29, 0x90
/* 01CEB0 01DC8BB0 284E4072 */  paddub      $9, $18, $0
/* 01CEB4 01DC8BB4 28560072 */  paddub      $10, $16, $0
/* 01CEB8 01DC8BB8 285EE070 */  paddub      $11, $7, $0
/* 01CEBC 01DC8BBC 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 01CEC0 01DC8BC0 00000000 */   nop
/* 01CEC4 01DC8BC4 D48B848F */  lw          $4, -0x742C($28)
/* 01CEC8 01DC8BC8 282E0070 */  paddub      $5, $0, $0
/* 01CECC 01DC8BCC 2083040C */  jal         sceVif1PkCnt
/* 01CED0 01DC8BD0 00000000 */   nop
/* 01CED4 01DC8BD4 D48B848F */  lw          $4, -0x742C($28)
/* 01CED8 01DC8BD8 282E0070 */  paddub      $5, $0, $0
/* 01CEDC 01DC8BDC 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 01CEE0 01DC8BE0 00000000 */   nop
/* 01CEE4 01DC8BE4 C701023C */  lui         $2, %hi(GiftagAD)
/* 01CEE8 01DC8BE8 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 01CEEC 01DC8BEC D48B848F */  lw          $4, -0x742C($28)
/* 01CEF0 01DC8BF0 00004578 */  lq          $5, 0x0($2)
/* 01CEF4 01DC8BF4 B083040C */  jal         sceVif1PkOpenGifTag
/* 01CEF8 01DC8BF8 00000000 */   nop
/* 01CEFC 01DC8BFC D48B848F */  lw          $4, -0x742C($28)
/* 01CF00 01DC8C00 3F000524 */  addiu       $5, $0, 0x3F
/* 01CF04 01DC8C04 28360070 */  paddub      $6, $0, $0
/* 01CF08 01DC8C08 0A84040C */  jal         sceVif1PkAddGsAD
/* 01CF0C 01DC8C0C 00000000 */   nop
/* 01CF10 01DC8C10 D48B848F */  lw          $4, -0x742C($28)
/* 01CF14 01DC8C14 B683040C */  jal         sceVif1PkCloseGifTag
/* 01CF18 01DC8C18 00000000 */   nop
/* 01CF1C 01DC8C1C D48B848F */  lw          $4, -0x742C($28)
/* 01CF20 01DC8C20 A483040C */  jal         sceVif1PkCloseDirectCode
/* 01CF24 01DC8C24 00000000 */   nop
.L01DC8C28_2CE428:
/* 01CF28 01DC8C28 7000BF7B */  lq          $31, 0x70($29)
/* 01CF2C 01DC8C2C 6000B47B */  lq          $20, 0x60($29)
/* 01CF30 01DC8C30 5000B37B */  lq          $19, 0x50($29)
/* 01CF34 01DC8C34 4000B27B */  lq          $18, 0x40($29)
/* 01CF38 01DC8C38 3000B17B */  lq          $17, 0x30($29)
/* 01CF3C 01DC8C3C 2000B07B */  lq          $16, 0x20($29)
/* 01CF40 01DC8C40 A000BD27 */  addiu       $29, $29, 0xA0
/* 01CF44 01DC8C44 0800E003 */  jr          $31
/* 01CF48 01DC8C48 00000000 */   nop
/* 01CF4C 01DC8C4C 00000000 */  nop
