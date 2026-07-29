.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawtargetCursor__FPffff
/* 0141D0 01DBFED0 10FFBD27 */  addiu       $29, $29, -0xF0
/* 0141D4 01DBFED4 4000BF7F */  sq          $31, 0x40($29)
/* 0141D8 01DBFED8 3000B27F */  sq          $18, 0x30($29)
/* 0141DC 01DBFEDC 2000B17F */  sq          $17, 0x20($29)
/* 0141E0 01DBFEE0 1000B07F */  sq          $16, 0x10($29)
/* 0141E4 01DBFEE4 0800B6E7 */  swc1        $f22, 0x8($29)
/* 0141E8 01DBFEE8 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0141EC 01DBFEEC 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0141F0 01DBFEF0 288E8070 */  paddub      $17, $4, $0
/* 0141F4 01DBFEF4 86650046 */  mov.s       $f22, $f12
/* 0141F8 01DBFEF8 466D0046 */  mov.s       $f21, $f13
/* 0141FC 01DBFEFC 06750046 */  mov.s       $f20, $f14
/* 014200 01DBFF00 C701023C */  lui         $2, %hi(TexManager)
/* 014204 01DBFF04 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 014208 01DBFF08 DC01023C */  lui         $2, %hi(LIT_6367)
/* 01420C 01DBFF0C C8334524 */  addiu       $5, $2, %lo(LIT_6367)
/* 014210 01DBFF10 FFFF0624 */  addiu       $6, $0, -0x1
/* 014214 01DBFF14 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 014218 01DBFF18 00000000 */   nop
/* 01421C 01DBFF1C 28864070 */  paddub      $16, $2, $0
/* 014220 01DBFF20 28260070 */  paddub      $4, $0, $0
/* 014224 01DBFF24 046F050C */  jal         setbilinear__Fi
/* 014228 01DBFF28 00000000 */   nop
/* 01422C 01DBFF2C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 014230 01DBFF30 0C0022AE */  sw          $2, 0xC($17)
/* 014234 01DBFF34 5000A427 */  addiu       $4, $29, 0x50
/* 014238 01DBFF38 6000A527 */  addiu       $5, $29, 0x60
/* 01423C 01DBFF3C 28362072 */  paddub      $6, $17, $0
/* 014240 01DBFF40 06B30046 */  mov.s       $f12, $f22
/* 014244 01DBFF44 46AB0046 */  mov.s       $f13, $f21
/* 014248 01DBFF48 283E0070 */  paddub      $7, $0, $0
/* 01424C 01DBFF4C D0B9040C */  jal         MGRotTransPers3DSprite__FPiPiPfffi
/* 014250 01DBFF50 00000000 */   nop
/* 014254 01DBFF54 71004010 */  beqz        $2, .L01DC011C_2FB71C
/* 014258 01DBFF58 00000000 */   nop
/* 01425C 01DBFF5C 5000A28F */  lw          $2, 0x50($29)
/* 014260 01DBFF60 F8934224 */  addiu       $2, $2, -0x6C08
/* 014264 01DBFF64 5000A2AF */  sw          $2, 0x50($29)
/* 014268 01DBFF68 5400B127 */  addiu       $17, $29, 0x54
/* 01426C 01DBFF6C 0000228E */  lw          $2, 0x0($17)
/* 014270 01DBFF70 F8864224 */  addiu       $2, $2, -0x7908
/* 014274 01DBFF74 000022AE */  sw          $2, 0x0($17)
/* 014278 01DBFF78 6000A28F */  lw          $2, 0x60($29)
/* 01427C 01DBFF7C F8934224 */  addiu       $2, $2, -0x6C08
/* 014280 01DBFF80 6000A2AF */  sw          $2, 0x60($29)
/* 014284 01DBFF84 6400B227 */  addiu       $18, $29, 0x64
/* 014288 01DBFF88 0000428E */  lw          $2, 0x0($18)
/* 01428C 01DBFF8C F8864224 */  addiu       $2, $2, -0x7908
/* 014290 01DBFF90 000042AE */  sw          $2, 0x0($18)
/* 014294 01DBFF94 5000A28F */  lw          $2, 0x50($29)
/* 014298 01DBFF98 03110200 */  sra         $2, $2, 4
/* 01429C 01DBFF9C 5000A2AF */  sw          $2, 0x50($29)
/* 0142A0 01DBFFA0 0000228E */  lw          $2, 0x0($17)
/* 0142A4 01DBFFA4 C3100200 */  sra         $2, $2, 3
/* 0142A8 01DBFFA8 000022AE */  sw          $2, 0x0($17)
/* 0142AC 01DBFFAC 6000A28F */  lw          $2, 0x60($29)
/* 0142B0 01DBFFB0 03110200 */  sra         $2, $2, 4
/* 0142B4 01DBFFB4 6000A2AF */  sw          $2, 0x60($29)
/* 0142B8 01DBFFB8 0000428E */  lw          $2, 0x0($18)
/* 0142BC 01DBFFBC C3100200 */  sra         $2, $2, 3
/* 0142C0 01DBFFC0 000042AE */  sw          $2, 0x0($18)
/* 0142C4 01DBFFC4 EC9E8283 */  lb          $2, -0x6114($28)
/* 0142C8 01DBFFC8 0A004014 */  bnez        $2, .L01DBFFF4_2FB5F4
/* 0142CC 01DBFFCC 00000000 */   nop
/* 0142D0 01DBFFD0 8041023C */  lui         $2, (0x41800000 >> 16)
/* 0142D4 01DBFFD4 00008244 */  mtc1        $2, $f0
/* 0142D8 01DBFFD8 00000000 */  nop
/* 0142DC 01DBFFDC 02031446 */  mul.s       $f12, $f0, $f20
/* 0142E0 01DBFFE0 2C44040C */  jal         fptosi
/* 0142E4 01DBFFE4 00000000 */   nop
/* 0142E8 01DBFFE8 E89E82AF */  sw          $2, -0x6118($28)
/* 0142EC 01DBFFEC 01000224 */  addiu       $2, $0, 0x1
/* 0142F0 01DBFFF0 EC9E82A3 */  sb          $2, -0x6114($28)
.L01DBFFF4_2FB5F4:
/* 0142F4 01DBFFF4 8000A0AF */  sw          $0, 0x80($29)
/* 0142F8 01DBFFF8 20000224 */  addiu       $2, $0, 0x20
/* 0142FC 01DBFFFC 8400A2AF */  sw          $2, 0x84($29)
/* 014300 01DC0000 10000324 */  addiu       $3, $0, 0x10
/* 014304 01DC0004 8800A3AF */  sw          $3, 0x88($29)
/* 014308 01DC0008 8C00A3AF */  sw          $3, 0x8C($29)
/* 01430C 01DC000C 0000248E */  lw          $4, 0x0($17)
/* 014310 01DC0010 5000A28F */  lw          $2, 0x50($29)
/* 014314 01DC0014 7000A2AF */  sw          $2, 0x70($29)
/* 014318 01DC0018 7400A4AF */  sw          $4, 0x74($29)
/* 01431C 01DC001C 7800A3AF */  sw          $3, 0x78($29)
/* 014320 01DC0020 7C00A3AF */  sw          $3, 0x7C($29)
/* 014324 01DC0024 E89E8893 */  lbu         $8, -0x6118($28)
/* 014328 01DC0028 D48B848F */  lw          $4, -0x742C($28)
/* 01432C 01DC002C 282E0072 */  paddub      $5, $16, $0
/* 014330 01DC0030 7000A627 */  addiu       $6, $29, 0x70
/* 014334 01DC0034 8000A727 */  addiu       $7, $29, 0x80
/* 014338 01DC0038 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01433C 01DC003C 00000000 */   nop
/* 014340 01DC0040 A000A0AF */  sw          $0, 0xA0($29)
/* 014344 01DC0044 A400A0AF */  sw          $0, 0xA4($29)
/* 014348 01DC0048 10000324 */  addiu       $3, $0, 0x10
/* 01434C 01DC004C A800A3AF */  sw          $3, 0xA8($29)
/* 014350 01DC0050 AC00A3AF */  sw          $3, 0xAC($29)
/* 014354 01DC0054 0000248E */  lw          $4, 0x0($17)
/* 014358 01DC0058 6000A28F */  lw          $2, 0x60($29)
/* 01435C 01DC005C 9000A2AF */  sw          $2, 0x90($29)
/* 014360 01DC0060 9400A4AF */  sw          $4, 0x94($29)
/* 014364 01DC0064 9800A3AF */  sw          $3, 0x98($29)
/* 014368 01DC0068 9C00A3AF */  sw          $3, 0x9C($29)
/* 01436C 01DC006C E89E8893 */  lbu         $8, -0x6118($28)
/* 014370 01DC0070 D48B848F */  lw          $4, -0x742C($28)
/* 014374 01DC0074 282E0072 */  paddub      $5, $16, $0
/* 014378 01DC0078 9000A627 */  addiu       $6, $29, 0x90
/* 01437C 01DC007C A000A727 */  addiu       $7, $29, 0xA0
/* 014380 01DC0080 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 014384 01DC0084 00000000 */   nop
/* 014388 01DC0088 C000A0AF */  sw          $0, 0xC0($29)
/* 01438C 01DC008C 30000224 */  addiu       $2, $0, 0x30
/* 014390 01DC0090 C400A2AF */  sw          $2, 0xC4($29)
/* 014394 01DC0094 10000324 */  addiu       $3, $0, 0x10
/* 014398 01DC0098 C800A3AF */  sw          $3, 0xC8($29)
/* 01439C 01DC009C CC00A3AF */  sw          $3, 0xCC($29)
/* 0143A0 01DC00A0 0000448E */  lw          $4, 0x0($18)
/* 0143A4 01DC00A4 5000A28F */  lw          $2, 0x50($29)
/* 0143A8 01DC00A8 B000A2AF */  sw          $2, 0xB0($29)
/* 0143AC 01DC00AC B400A4AF */  sw          $4, 0xB4($29)
/* 0143B0 01DC00B0 B800A3AF */  sw          $3, 0xB8($29)
/* 0143B4 01DC00B4 BC00A3AF */  sw          $3, 0xBC($29)
/* 0143B8 01DC00B8 E89E8893 */  lbu         $8, -0x6118($28)
/* 0143BC 01DC00BC D48B848F */  lw          $4, -0x742C($28)
/* 0143C0 01DC00C0 282E0072 */  paddub      $5, $16, $0
/* 0143C4 01DC00C4 B000A627 */  addiu       $6, $29, 0xB0
/* 0143C8 01DC00C8 C000A727 */  addiu       $7, $29, 0xC0
/* 0143CC 01DC00CC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0143D0 01DC00D0 00000000 */   nop
/* 0143D4 01DC00D4 E000A0AF */  sw          $0, 0xE0($29)
/* 0143D8 01DC00D8 10000324 */  addiu       $3, $0, 0x10
/* 0143DC 01DC00DC E400A3AF */  sw          $3, 0xE4($29)
/* 0143E0 01DC00E0 E800A3AF */  sw          $3, 0xE8($29)
/* 0143E4 01DC00E4 EC00A3AF */  sw          $3, 0xEC($29)
/* 0143E8 01DC00E8 0000448E */  lw          $4, 0x0($18)
/* 0143EC 01DC00EC 6000A28F */  lw          $2, 0x60($29)
/* 0143F0 01DC00F0 D000A2AF */  sw          $2, 0xD0($29)
/* 0143F4 01DC00F4 D400A4AF */  sw          $4, 0xD4($29)
/* 0143F8 01DC00F8 D800A3AF */  sw          $3, 0xD8($29)
/* 0143FC 01DC00FC DC00A3AF */  sw          $3, 0xDC($29)
/* 014400 01DC0100 E89E8893 */  lbu         $8, -0x6118($28)
/* 014404 01DC0104 D48B848F */  lw          $4, -0x742C($28)
/* 014408 01DC0108 282E0072 */  paddub      $5, $16, $0
/* 01440C 01DC010C D000A627 */  addiu       $6, $29, 0xD0
/* 014410 01DC0110 E000A727 */  addiu       $7, $29, 0xE0
/* 014414 01DC0114 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 014418 01DC0118 00000000 */   nop
.L01DC011C_2FB71C:
/* 01441C 01DC011C 01000424 */  addiu       $4, $0, 0x1
/* 014420 01DC0120 046F050C */  jal         setbilinear__Fi
/* 014424 01DC0124 00000000 */   nop
/* 014428 01DC0128 44FF760C */  jal         DrawTargetLife__Fv
/* 01442C 01DC012C 00000000 */   nop
/* 014430 01DC0130 4000BF7B */  lq          $31, 0x40($29)
/* 014434 01DC0134 3000B27B */  lq          $18, 0x30($29)
/* 014438 01DC0138 2000B17B */  lq          $17, 0x20($29)
/* 01443C 01DC013C 1000B07B */  lq          $16, 0x10($29)
/* 014440 01DC0140 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 014444 01DC0144 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 014448 01DC0148 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 01444C 01DC014C F000BD27 */  addiu       $29, $29, 0xF0
/* 014450 01DC0150 0800E003 */  jr          $31
/* 014454 01DC0154 00000000 */   nop
/* 014458 01DC0158 00000000 */  nop
/* 01445C 01DC015C 00000000 */  nop
