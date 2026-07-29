.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* 0ADE60 001ADD60 10FFBD27 */  addiu       $29, $29, -0xF0
/* 0ADE64 001ADD64 9000BF7F */  sq          $31, 0x90($29)
/* 0ADE68 001ADD68 8000BE7F */  sq          $30, 0x80($29)
/* 0ADE6C 001ADD6C 7000B77F */  sq          $23, 0x70($29)
/* 0ADE70 001ADD70 6000B67F */  sq          $22, 0x60($29)
/* 0ADE74 001ADD74 5000B57F */  sq          $21, 0x50($29)
/* 0ADE78 001ADD78 4000B47F */  sq          $20, 0x40($29)
/* 0ADE7C 001ADD7C 3000B37F */  sq          $19, 0x30($29)
/* 0ADE80 001ADD80 2000B27F */  sq          $18, 0x20($29)
/* 0ADE84 001ADD84 1000B17F */  sq          $17, 0x10($29)
/* 0ADE88 001ADD88 0000B07F */  sq          $16, 0x0($29)
/* 0ADE8C 001ADD8C 28AE8070 */  paddub      $21, $4, $0
/* 0ADE90 001ADD90 28A6A070 */  paddub      $20, $5, $0
/* 0ADE94 001ADD94 28F6E070 */  paddub      $30, $7, $0
/* 0ADE98 001ADD98 AC00A8AF */  sw          $8, 0xAC($29)
/* 0ADE9C 001ADD9C A800A9AF */  sw          $9, 0xA8($29)
/* 0ADEA0 001ADDA0 289E4071 */  paddub      $19, $10, $0
/* 0ADEA4 001ADDA4 FFFF1024 */  addiu       $16, $0, -0x1
/* 0ADEA8 001ADDA8 0100013C */  lui         $1, (0x10000 >> 16)
/* 0ADEAC 001ADDAC 21088100 */  addu        $1, $4, $1
/* 0ADEB0 001ADDB0 50A130AC */  sw          $16, -0x5EB0($1)
/* 0ADEB4 001ADDB4 0000858C */  lw          $5, 0x0($4)
/* 0ADEB8 001ADDB8 0700A014 */  bnez        $5, .L001ADDD8
/* 0ADEBC 001ADDBC 00000000 */   nop
/* 0ADEC0 001ADDC0 2A00023C */  lui         $2, %hi(LIT_977__2)
/* 0ADEC4 001ADDC4 00B54424 */  addiu       $4, $2, %lo(LIT_977__2)
/* 0ADEC8 001ADDC8 A611040C */  jal         printf
/* 0ADECC 001ADDCC 00000000 */   nop
/* 0ADED0 001ADDD0 EC000010 */  b           .L001AE184
/* 0ADED4 001ADDD4 00000000 */   nop
.L001ADDD8:
/* 0ADED8 001ADDD8 28260070 */  paddub      $4, $0, $0
/* 0ADEDC 001ADDDC 0C000010 */  b           .L001ADE10
/* 0ADEE0 001ADDE0 00000000 */   nop
.L001ADDE4:
/* 0ADEE4 001ADDE4 40180400 */  sll         $3, $4, 1
/* 0ADEE8 001ADDE8 21187500 */  addu        $3, $3, $21
/* 0ADEEC 001ADDEC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0ADEF0 001ADDF0 21086100 */  addu        $1, $3, $1
/* 0ADEF4 001ADDF4 00A02384 */  lh          $3, -0x6000($1)
/* 0ADEF8 001ADDF8 04006014 */  bnez        $3, .L001ADE0C
/* 0ADEFC 001ADDFC 00000000 */   nop
/* 0ADF00 001ADE00 28868070 */  paddub      $16, $4, $0
/* 0ADF04 001ADE04 08000010 */  b           .L001ADE28
/* 0ADF08 001ADE08 00000000 */   nop
.L001ADE0C:
/* 0ADF0C 001ADE0C 01008424 */  addiu       $4, $4, 0x1
.L001ADE10:
/* 0ADF10 001ADE10 0100013C */  lui         $1, (0x10000 >> 16)
/* 0ADF14 001ADE14 2108A102 */  addu        $1, $21, $1
/* 0ADF18 001ADE18 4CA1238C */  lw          $3, -0x5EB4($1)
/* 0ADF1C 001ADE1C 2A188300 */  slt         $3, $4, $3
/* 0ADF20 001ADE20 F0FF6014 */  bnez        $3, .L001ADDE4
/* 0ADF24 001ADE24 00000000 */   nop
.L001ADE28:
/* 0ADF28 001ADE28 FFFF0324 */  addiu       $3, $0, -0x1
/* 0ADF2C 001ADE2C D5000312 */  beq         $16, $3, .L001AE184
/* 0ADF30 001ADE30 00000000 */   nop
/* 0ADF34 001ADE34 28260070 */  paddub      $4, $0, $0
/* 0ADF38 001ADE38 4C00A284 */  lh          $2, 0x4C($5)
/* 0ADF3C 001ADE3C 02004314 */  bne         $2, $3, .L001ADE48
/* 0ADF40 001ADE40 00000000 */   nop
/* 0ADF44 001ADE44 01008424 */  addiu       $4, $4, 0x1
.L001ADE48:
/* 0ADF48 001ADE48 40B81000 */  sll         $23, $16, 1
/* 0ADF4C 001ADE4C 2110F502 */  addu        $2, $23, $21
/* 0ADF50 001ADE50 F81F5124 */  addiu       $17, $2, 0x1FF8
/* 0ADF54 001ADE54 F87F3126 */  addiu       $17, $17, 0x7FF8
/* 0ADF58 001ADE58 000024A6 */  sh          $4, 0x0($17)
/* 0ADF5C 001ADE5C FFFF0224 */  addiu       $2, $0, -0x1
/* 0ADF60 001ADE60 02006211 */  beq         $11, $2, .L001ADE6C
/* 0ADF64 001ADE64 00000000 */   nop
/* 0ADF68 001ADE68 00002BA6 */  sh          $11, 0x0($17)
.L001ADE6C:
/* 0ADF6C 001ADE6C 0000A28E */  lw          $2, 0x0($21)
/* 0ADF70 001ADE70 1000428C */  lw          $2, 0x10($2)
/* 0ADF74 001ADE74 4E004014 */  bnez        $2, .L001ADFB0
/* 0ADF78 001ADE78 00000000 */   nop
/* 0ADF7C 001ADE7C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0ADF80 001ADE80 0C0082AE */  sw          $2, 0xC($20)
/* 0ADF84 001ADE84 0C00C2AC */  sw          $2, 0xC($6)
/* 0ADF88 001ADE88 00111000 */  sll         $2, $16, 4
/* 0ADF8C 001ADE8C 2110A202 */  addu        $2, $21, $2
/* 0ADF90 001ADE90 481F5224 */  addiu       $18, $2, 0x1F48
/* 0ADF94 001ADE94 F87F5226 */  addiu       $18, $18, 0x7FF8
/* 0ADF98 001ADE98 28264072 */  paddub      $4, $18, $0
/* 0ADF9C 001ADE9C 282EC070 */  paddub      $5, $6, $0
/* 0ADFA0 001ADEA0 28368072 */  paddub      $6, $20, $0
/* 0ADFA4 001ADEA4 EE85040C */  jal         sceVu0SubVector
/* 0ADFA8 001ADEA8 00000000 */   nop
/* 0ADFAC 001ADEAC 28264072 */  paddub      $4, $18, $0
/* 0ADFB0 001ADEB0 282E4072 */  paddub      $5, $18, $0
/* 0ADFB4 001ADEB4 9285040C */  jal         sceVu0Normalize
/* 0ADFB8 001ADEB8 00000000 */   nop
/* 0ADFBC 001ADEBC 18006016 */  bnez        $19, .L001ADF20
/* 0ADFC0 001ADEC0 00000000 */   nop
/* 0ADFC4 001ADEC4 0000A28E */  lw          $2, 0x0($21)
/* 0ADFC8 001ADEC8 1400428C */  lw          $2, 0x14($2)
/* 0ADFCC 001ADECC 0C004010 */  beqz        $2, .L001ADF00
/* 0ADFD0 001ADED0 00000000 */   nop
/* 0ADFD4 001ADED4 B000A427 */  addiu       $4, $29, 0xB0
/* 0ADFD8 001ADED8 282E4072 */  paddub      $5, $18, $0
/* 0ADFDC 001ADEDC B48D040C */  jal         LookAtMatrixZ__FPA4_fPf
/* 0ADFE0 001ADEE0 00000000 */   nop
/* 0ADFE4 001ADEE4 B0110224 */  addiu       $2, $0, 0x11B0
/* 0ADFE8 001ADEE8 18100202 */  mult        $2, $16, $2
/* 0ADFEC 001ADEEC 21105500 */  addu        $2, $2, $21
/* 0ADFF0 001ADEF0 7C12448C */  lw          $4, 0x127C($2)
/* 0ADFF4 001ADEF4 B000A527 */  addiu       $5, $29, 0xB0
/* 0ADFF8 001ADEF8 58A1040C */  jal         SetTransMatrix__6CFrameFPA4_f
/* 0ADFFC 001ADEFC 00000000 */   nop
.L001ADF00:
/* 0AE000 001ADF00 B0110224 */  addiu       $2, $0, 0x11B0
/* 0AE004 001ADF04 18100202 */  mult        $2, $16, $2
/* 0AE008 001ADF08 21105500 */  addu        $2, $2, $21
/* 0AE00C 001ADF0C 7C12448C */  lw          $4, 0x127C($2)
/* 0AE010 001ADF10 68A0040C */  jal         DeleteReference__6CFrameFv
/* 0AE014 001ADF14 00000000 */   nop
/* 0AE018 001ADF18 1C000010 */  b           .L001ADF8C
/* 0AE01C 001ADF1C 00000000 */   nop
.L001ADF20:
/* 0AE020 001ADF20 B0110224 */  addiu       $2, $0, 0x11B0
/* 0AE024 001ADF24 18B00202 */  mult        $22, $16, $2
/* 0AE028 001ADF28 2110D502 */  addu        $2, $22, $21
/* 0AE02C 001ADF2C 7C12448C */  lw          $4, 0x127C($2)
/* 0AE030 001ADF30 282E6072 */  paddub      $5, $19, $0
/* 0AE034 001ADF34 60A0040C */  jal         SetReference__6CFrameFP6CFrame
/* 0AE038 001ADF38 00000000 */   nop
/* 0AE03C 001ADF3C 00608044 */  mtc1        $0, $f12
/* 0AE040 001ADF40 00000000 */  nop
/* 0AE044 001ADF44 46630046 */  mov.s       $f13, $f12
/* 0AE048 001ADF48 2110B602 */  addu        $2, $21, $22
/* 0AE04C 001ADF4C C0115624 */  addiu       $22, $2, 0x11C0
/* 0AE050 001ADF50 86630046 */  mov.s       $f14, $f12
/* 0AE054 001ADF54 2826C072 */  paddub      $4, $22, $0
/* 0AE058 001ADF58 6012598C */  lw          $25, 0x1260($2)
/* 0AE05C 001ADF5C 1800398F */  lw          $25, 0x18($25)
/* 0AE060 001ADF60 09F82003 */  jalr        $25
/* 0AE064 001ADF64 00000000 */   nop
/* 0AE068 001ADF68 00708044 */  mtc1        $0, $f14
/* 0AE06C 001ADF6C 00000000 */  nop
/* 0AE070 001ADF70 06730046 */  mov.s       $f12, $f14
/* 0AE074 001ADF74 2826C072 */  paddub      $4, $22, $0
/* 0AE078 001ADF78 F8828DC7 */  lwc1        $f13, -0x7D08($28)
/* 0AE07C 001ADF7C A000D98E */  lw          $25, 0xA0($22)
/* 0AE080 001ADF80 3000398F */  lw          $25, 0x30($25)
/* 0AE084 001ADF84 09F82003 */  jalr        $25
/* 0AE088 001ADF88 00000000 */   nop
.L001ADF8C:
/* 0AE08C 001ADF8C 0000A38E */  lw          $3, 0x0($21)
/* 0AE090 001ADF90 00002286 */  lh          $2, 0x0($17)
/* 0AE094 001ADF94 80100200 */  sll         $2, $2, 2
/* 0AE098 001ADF98 21104300 */  addu        $2, $2, $3
/* 0AE09C 001ADF9C 28264072 */  paddub      $4, $18, $0
/* 0AE0A0 001ADFA0 282E4072 */  paddub      $5, $18, $0
/* 0AE0A4 001ADFA4 18004CC4 */  lwc1        $f12, 0x18($2)
/* 0AE0A8 001ADFA8 4688040C */  jal         sceVu0ScaleVectorXYZ
/* 0AE0AC 001ADFAC 00000000 */   nop
.L001ADFB0:
/* 0AE0B0 001ADFB0 00002286 */  lh          $2, 0x0($17)
/* 0AE0B4 001ADFB4 15004014 */  bnez        $2, .L001AE00C
/* 0AE0B8 001ADFB8 00000000 */   nop
/* 0AE0BC 001ADFBC 0000A28E */  lw          $2, 0x0($21)
/* 0AE0C0 001ADFC0 4C004384 */  lh          $3, 0x4C($2)
/* 0AE0C4 001ADFC4 B0110224 */  addiu       $2, $0, 0x11B0
/* 0AE0C8 001ADFC8 18100202 */  mult        $2, $16, $2
/* 0AE0CC 001ADFCC 21205500 */  addu        $4, $2, $21
/* 0AE0D0 001ADFD0 281E83AC */  sw          $3, 0x1E28($4)
/* 0AE0D4 001ADFD4 06000224 */  addiu       $2, $0, 0x6
/* 0AE0D8 001ADFD8 241E82AC */  sw          $2, 0x1E24($4)
/* 0AE0DC 001ADFDC 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0AE0E0 001ADFE0 201E82AC */  sw          $2, 0x1E20($4)
/* 0AE0E4 001ADFE4 0000A28E */  lw          $2, 0x0($21)
/* 0AE0E8 001ADFE8 4C004284 */  lh          $2, 0x4C($2)
/* 0AE0EC 001ADFEC 00190200 */  sll         $3, $2, 4
/* 0AE0F0 001ADFF0 0415828C */  lw          $2, 0x1504($4)
/* 0AE0F4 001ADFF4 21104300 */  addu        $2, $2, $3
/* 0AE0F8 001ADFF8 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AE0FC 001ADFFC 20008046 */  cvt.s.w     $f0, $f0
/* 0AE100 001AE000 B01480E4 */  swc1        $f0, 0x14B0($4)
/* 0AE104 001AE004 13000010 */  b           .L001AE054
/* 0AE108 001AE008 00000000 */   nop
.L001AE00C:
/* 0AE10C 001AE00C 0000A28E */  lw          $2, 0x0($21)
/* 0AE110 001AE010 4E004384 */  lh          $3, 0x4E($2)
/* 0AE114 001AE014 B0110224 */  addiu       $2, $0, 0x11B0
/* 0AE118 001AE018 18100202 */  mult        $2, $16, $2
/* 0AE11C 001AE01C 21205500 */  addu        $4, $2, $21
/* 0AE120 001AE020 281E83AC */  sw          $3, 0x1E28($4)
/* 0AE124 001AE024 04000224 */  addiu       $2, $0, 0x4
/* 0AE128 001AE028 241E82AC */  sw          $2, 0x1E24($4)
/* 0AE12C 001AE02C 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0AE130 001AE030 201E82AC */  sw          $2, 0x1E20($4)
/* 0AE134 001AE034 0000A28E */  lw          $2, 0x0($21)
/* 0AE138 001AE038 4E004284 */  lh          $2, 0x4E($2)
/* 0AE13C 001AE03C 00190200 */  sll         $3, $2, 4
/* 0AE140 001AE040 0415828C */  lw          $2, 0x1504($4)
/* 0AE144 001AE044 21104300 */  addu        $2, $2, $3
/* 0AE148 001AE048 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AE14C 001AE04C 20008046 */  cvt.s.w     $f0, $f0
/* 0AE150 001AE050 B01480E4 */  swc1        $f0, 0x14B0($4)
.L001AE054:
/* 0AE154 001AE054 0A006016 */  bnez        $19, .L001AE080
/* 0AE158 001AE058 00000000 */   nop
/* 0AE15C 001AE05C B0110224 */  addiu       $2, $0, 0x11B0
/* 0AE160 001AE060 18100202 */  mult        $2, $16, $2
/* 0AE164 001AE064 2110A202 */  addu        $2, $21, $2
/* 0AE168 001AE068 C0114424 */  addiu       $4, $2, 0x11C0
/* 0AE16C 001AE06C 282E8072 */  paddub      $5, $20, $0
/* 0AE170 001AE070 6012598C */  lw          $25, 0x1260($2)
/* 0AE174 001AE074 1400398F */  lw          $25, 0x14($25)
/* 0AE178 001AE078 09F82003 */  jalr        $25
/* 0AE17C 001AE07C 00000000 */   nop
.L001AE080:
/* 0AE180 001AE080 0000A28E */  lw          $2, 0x0($21)
/* 0AE184 001AE084 3C00428C */  lw          $2, 0x3C($2)
/* 0AE188 001AE088 80181000 */  sll         $3, $16, 2
/* 0AE18C 001AE08C 21287500 */  addu        $5, $3, $21
/* 0AE190 001AE090 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE194 001AE094 2108A100 */  addu        $1, $5, $1
/* 0AE198 001AE098 10A022AC */  sw          $2, -0x5FF0($1)
/* 0AE19C 001AE09C 0000A28E */  lw          $2, 0x0($21)
/* 0AE1A0 001AE0A0 3800428C */  lw          $2, 0x38($2)
/* 0AE1A4 001AE0A4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE1A8 001AE0A8 2108A100 */  addu        $1, $5, $1
/* 0AE1AC 001AE0AC D09F22AC */  sw          $2, -0x6030($1)
/* 0AE1B0 001AE0B0 01000324 */  addiu       $3, $0, 0x1
/* 0AE1B4 001AE0B4 2120F502 */  addu        $4, $23, $21
/* 0AE1B8 001AE0B8 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE1BC 001AE0BC 21088100 */  addu        $1, $4, $1
/* 0AE1C0 001AE0C0 00A023A4 */  sh          $3, -0x6000($1)
/* 0AE1C4 001AE0C4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE1C8 001AE0C8 21088100 */  addu        $1, $4, $1
/* 0AE1CC 001AE0CC 50A03EA4 */  sh          $30, -0x5FB0($1)
/* 0AE1D0 001AE0D0 AC00A28F */  lw          $2, 0xAC($29)
/* 0AE1D4 001AE0D4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE1D8 001AE0D8 2108A100 */  addu        $1, $5, $1
/* 0AE1DC 001AE0DC 70A022AC */  sw          $2, -0x5F90($1)
/* 0AE1E0 001AE0E0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE1E4 001AE0E4 2108A100 */  addu        $1, $5, $1
/* 0AE1E8 001AE0E8 30A023AC */  sw          $3, -0x5FD0($1)
/* 0AE1EC 001AE0EC A800A28F */  lw          $2, 0xA8($29)
/* 0AE1F0 001AE0F0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE1F4 001AE0F4 21088100 */  addu        $1, $4, $1
/* 0AE1F8 001AE0F8 C09F22A4 */  sh          $2, -0x6040($1)
/* 0AE1FC 001AE0FC FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE200 001AE100 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE204 001AE104 2108A100 */  addu        $1, $5, $1
/* 0AE208 001AE108 B0A023AC */  sw          $3, -0x5F50($1)
/* 0AE20C 001AE10C 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0AE210 001AE110 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE214 001AE114 2108A100 */  addu        $1, $5, $1
/* 0AE218 001AE118 D0A022AC */  sw          $2, -0x5F30($1)
/* 0AE21C 001AE11C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE220 001AE120 2108A100 */  addu        $1, $5, $1
/* 0AE224 001AE124 F0A023AC */  sw          $3, -0x5F10($1)
/* 0AE228 001AE128 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE22C 001AE12C 2108A102 */  addu        $1, $21, $1
/* 0AE230 001AE130 48A120AC */  sw          $0, -0x5EB8($1)
/* 0AE234 001AE134 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE238 001AE138 2108A102 */  addu        $1, $21, $1
/* 0AE23C 001AE13C 50A130AC */  sw          $16, -0x5EB0($1)
/* 0AE240 001AE140 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE244 001AE144 21088100 */  addu        $1, $4, $1
/* 0AE248 001AE148 60A023A4 */  sh          $3, -0x5FA0($1)
/* 0AE24C 001AE14C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE250 001AE150 2108A100 */  addu        $1, $5, $1
/* 0AE254 001AE154 10A123AC */  sw          $3, -0x5EF0($1)
/* 0AE258 001AE158 21101502 */  addu        $2, $16, $21
/* 0AE25C 001AE15C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE260 001AE160 21084100 */  addu        $1, $2, $1
/* 0AE264 001AE164 30A120A0 */  sb          $0, -0x5ED0($1)
/* 0AE268 001AE168 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE26C 001AE16C 21084100 */  addu        $1, $2, $1
/* 0AE270 001AE170 38A120A0 */  sb          $0, -0x5EC8($1)
/* 0AE274 001AE174 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE278 001AE178 21084100 */  addu        $1, $2, $1
/* 0AE27C 001AE17C 40A120A0 */  sb          $0, -0x5EC0($1)
/* 0AE280 001AE180 28160072 */  paddub      $2, $16, $0
.L001AE184:
/* 0AE284 001AE184 9000BF7B */  lq          $31, 0x90($29)
/* 0AE288 001AE188 8000BE7B */  lq          $30, 0x80($29)
/* 0AE28C 001AE18C 7000B77B */  lq          $23, 0x70($29)
/* 0AE290 001AE190 6000B67B */  lq          $22, 0x60($29)
/* 0AE294 001AE194 5000B57B */  lq          $21, 0x50($29)
/* 0AE298 001AE198 4000B47B */  lq          $20, 0x40($29)
/* 0AE29C 001AE19C 3000B37B */  lq          $19, 0x30($29)
/* 0AE2A0 001AE1A0 2000B27B */  lq          $18, 0x20($29)
/* 0AE2A4 001AE1A4 1000B17B */  lq          $17, 0x10($29)
/* 0AE2A8 001AE1A8 0000B07B */  lq          $16, 0x0($29)
/* 0AE2AC 001AE1AC F000BD27 */  addiu       $29, $29, 0xF0
/* 0AE2B0 001AE1B0 0800E003 */  jr          $31
/* 0AE2B4 001AE1B4 00000000 */   nop
/* 0AE2B8 001AE1B8 00000000 */  nop
/* 0AE2BC 001AE1BC 00000000 */  nop
