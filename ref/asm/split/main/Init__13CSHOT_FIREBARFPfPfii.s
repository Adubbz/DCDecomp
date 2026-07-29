.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Init__13CSHOT_FIREBARFPfPfii
/* 0AEC20 001AEB20 80FFBD27 */  addiu       $29, $29, -0x80
/* 0AEC24 001AEB24 6000BF7F */  sq          $31, 0x60($29)
/* 0AEC28 001AEB28 5000B57F */  sq          $21, 0x50($29)
/* 0AEC2C 001AEB2C 4000B47F */  sq          $20, 0x40($29)
/* 0AEC30 001AEB30 3000B37F */  sq          $19, 0x30($29)
/* 0AEC34 001AEB34 2000B27F */  sq          $18, 0x20($29)
/* 0AEC38 001AEB38 1000B17F */  sq          $17, 0x10($29)
/* 0AEC3C 001AEB3C 0000B07F */  sq          $16, 0x0($29)
/* 0AEC40 001AEB40 28AE8070 */  paddub      $21, $4, $0
/* 0AEC44 001AEB44 28A6A070 */  paddub      $20, $5, $0
/* 0AEC48 001AEB48 289EC070 */  paddub      $19, $6, $0
/* 0AEC4C 001AEB4C 2896E070 */  paddub      $18, $7, $0
/* 0AEC50 001AEB50 288E0071 */  paddub      $17, $8, $0
/* 0AEC54 001AEB54 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0AEC58 001AEB58 0C00C2AC */  sw          $2, 0xC($6)
/* 0AEC5C 001AEB5C 28266072 */  paddub      $4, $19, $0
/* 0AEC60 001AEB60 282E6072 */  paddub      $5, $19, $0
/* 0AEC64 001AEB64 9285040C */  jal         sceVu0Normalize
/* 0AEC68 001AEB68 00000000 */   nop
/* 0AEC6C 001AEB6C 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0AEC70 001AEB70 00608244 */  mtc1        $2, $f12
/* 0AEC74 001AEB74 7000A427 */  addiu       $4, $29, 0x70
/* 0AEC78 001AEB78 282E6072 */  paddub      $5, $19, $0
/* 0AEC7C 001AEB7C 4688040C */  jal         sceVu0ScaleVectorXYZ
/* 0AEC80 001AEB80 00000000 */   nop
/* 0AEC84 001AEB84 28860070 */  paddub      $16, $0, $0
/* 0AEC88 001AEB88 5C000010 */  b           .L001AECFC
/* 0AEC8C 001AEB8C 00000000 */   nop
.L001AEB90:
/* 0AEC90 001AEB90 000DA28E */  lw          $2, 0xD00($21)
/* 0AEC94 001AEB94 21100202 */  addu        $2, $16, $2
/* 0AEC98 001AEB98 00110200 */  sll         $2, $2, 4
/* 0AEC9C 001AEB9C 2120A202 */  addu        $4, $21, $2
/* 0AECA0 001AEBA0 282E8072 */  paddub      $5, $20, $0
/* 0AECA4 001AEBA4 0C86040C */  jal         sceVu0CopyVector
/* 0AECA8 001AEBA8 00000000 */   nop
/* 0AECAC 001AEBAC 000081C6 */  lwc1        $f1, 0x0($20)
/* 0AECB0 001AEBB0 00009044 */  mtc1        $16, $f0
/* 0AECB4 001AEBB4 00000000 */  nop
/* 0AECB8 001AEBB8 A0008046 */  cvt.s.w     $f2, $f0
/* 0AECBC 001AEBBC 7000A0C7 */  lwc1        $f0, 0x70($29)
/* 0AECC0 001AEBC0 02000246 */  mul.s       $f0, $f0, $f2
/* 0AECC4 001AEBC4 00080046 */  add.s       $f0, $f1, $f0
/* 0AECC8 001AEBC8 000DA28E */  lw          $2, 0xD00($21)
/* 0AECCC 001AEBCC 21100202 */  addu        $2, $16, $2
/* 0AECD0 001AEBD0 00110200 */  sll         $2, $2, 4
/* 0AECD4 001AEBD4 2110A202 */  addu        $2, $21, $2
/* 0AECD8 001AEBD8 000040E4 */  swc1        $f0, 0x0($2)
/* 0AECDC 001AEBDC 040081C6 */  lwc1        $f1, 0x4($20)
/* 0AECE0 001AEBE0 7400A0C7 */  lwc1        $f0, 0x74($29)
/* 0AECE4 001AEBE4 02000246 */  mul.s       $f0, $f0, $f2
/* 0AECE8 001AEBE8 00080046 */  add.s       $f0, $f1, $f0
/* 0AECEC 001AEBEC 000DA28E */  lw          $2, 0xD00($21)
/* 0AECF0 001AEBF0 21100202 */  addu        $2, $16, $2
/* 0AECF4 001AEBF4 00110200 */  sll         $2, $2, 4
/* 0AECF8 001AEBF8 21105500 */  addu        $2, $2, $21
/* 0AECFC 001AEBFC 040040E4 */  swc1        $f0, 0x4($2)
/* 0AED00 001AEC00 080081C6 */  lwc1        $f1, 0x8($20)
/* 0AED04 001AEC04 7800A0C7 */  lwc1        $f0, 0x78($29)
/* 0AED08 001AEC08 02000246 */  mul.s       $f0, $f0, $f2
/* 0AED0C 001AEC0C 00080046 */  add.s       $f0, $f1, $f0
/* 0AED10 001AEC10 000DA28E */  lw          $2, 0xD00($21)
/* 0AED14 001AEC14 21100202 */  addu        $2, $16, $2
/* 0AED18 001AEC18 00110200 */  sll         $2, $2, 4
/* 0AED1C 001AEC1C 21105500 */  addu        $2, $2, $21
/* 0AED20 001AEC20 080040E4 */  swc1        $f0, 0x8($2)
/* 0AED24 001AEC24 148481C7 */  lwc1        $f1, -0x7BEC($28)
/* 0AED28 001AEC28 000060C6 */  lwc1        $f0, 0x0($19)
/* 0AED2C 001AEC2C 02080046 */  mul.s       $f0, $f1, $f0
/* 0AED30 001AEC30 000DA28E */  lw          $2, 0xD00($21)
/* 0AED34 001AEC34 21100202 */  addu        $2, $16, $2
/* 0AED38 001AEC38 00110200 */  sll         $2, $2, 4
/* 0AED3C 001AEC3C 21105500 */  addu        $2, $2, $21
/* 0AED40 001AEC40 000440E4 */  swc1        $f0, 0x400($2)
/* 0AED44 001AEC44 148481C7 */  lwc1        $f1, -0x7BEC($28)
/* 0AED48 001AEC48 040060C6 */  lwc1        $f0, 0x4($19)
/* 0AED4C 001AEC4C 02080046 */  mul.s       $f0, $f1, $f0
/* 0AED50 001AEC50 000DA28E */  lw          $2, 0xD00($21)
/* 0AED54 001AEC54 21100202 */  addu        $2, $16, $2
/* 0AED58 001AEC58 00110200 */  sll         $2, $2, 4
/* 0AED5C 001AEC5C 21105500 */  addu        $2, $2, $21
/* 0AED60 001AEC60 040440E4 */  swc1        $f0, 0x404($2)
/* 0AED64 001AEC64 148481C7 */  lwc1        $f1, -0x7BEC($28)
/* 0AED68 001AEC68 080060C6 */  lwc1        $f0, 0x8($19)
/* 0AED6C 001AEC6C 02080046 */  mul.s       $f0, $f1, $f0
/* 0AED70 001AEC70 000DA28E */  lw          $2, 0xD00($21)
/* 0AED74 001AEC74 21100202 */  addu        $2, $16, $2
/* 0AED78 001AEC78 00110200 */  sll         $2, $2, 4
/* 0AED7C 001AEC7C 21105500 */  addu        $2, $2, $21
/* 0AED80 001AEC80 080440E4 */  swc1        $f0, 0x408($2)
/* 0AED84 001AEC84 908280C7 */  lwc1        $f0, -0x7D70($28)
/* 0AED88 001AEC88 42000246 */  mul.s       $f1, $f0, $f2
/* 0AED8C 001AEC8C 4040023C */  lui         $2, (0x40400000 >> 16)
/* 0AED90 001AEC90 00008244 */  mtc1        $2, $f0
/* 0AED94 001AEC94 00000000 */  nop
/* 0AED98 001AEC98 00000146 */  add.s       $f0, $f0, $f1
/* 0AED9C 001AEC9C 000DA28E */  lw          $2, 0xD00($21)
/* 0AEDA0 001AECA0 21100202 */  addu        $2, $16, $2
/* 0AEDA4 001AECA4 80100200 */  sll         $2, $2, 2
/* 0AEDA8 001AECA8 21105500 */  addu        $2, $2, $21
/* 0AEDAC 001AECAC 000840E4 */  swc1        $f0, 0x800($2)
/* 0AEDB0 001AECB0 0041023C */  lui         $2, (0x41000000 >> 16)
/* 0AEDB4 001AECB4 00008244 */  mtc1        $2, $f0
/* 0AEDB8 001AECB8 00000000 */  nop
/* 0AEDBC 001AECBC 42000246 */  mul.s       $f1, $f0, $f2
/* 0AEDC0 001AECC0 3443023C */  lui         $2, (0x43340000 >> 16)
/* 0AEDC4 001AECC4 00008244 */  mtc1        $2, $f0
/* 0AEDC8 001AECC8 00000000 */  nop
/* 0AEDCC 001AECCC 01000146 */  sub.s       $f0, $f0, $f1
/* 0AEDD0 001AECD0 000DA28E */  lw          $2, 0xD00($21)
/* 0AEDD4 001AECD4 21100202 */  addu        $2, $16, $2
/* 0AEDD8 001AECD8 80100200 */  sll         $2, $2, 2
/* 0AEDDC 001AECDC 21105500 */  addu        $2, $2, $21
/* 0AEDE0 001AECE0 000940E4 */  swc1        $f0, 0x900($2)
/* 0AEDE4 001AECE4 000DA28E */  lw          $2, 0xD00($21)
/* 0AEDE8 001AECE8 21100202 */  addu        $2, $16, $2
/* 0AEDEC 001AECEC 80100200 */  sll         $2, $2, 2
/* 0AEDF0 001AECF0 21105500 */  addu        $2, $2, $21
/* 0AEDF4 001AECF4 000C40AC */  sw          $0, 0xC00($2)
/* 0AEDF8 001AECF8 01001026 */  addiu       $16, $16, 0x1
.L001AECFC:
/* 0AEDFC 001AECFC 1800022A */  slti        $2, $16, 0x18
/* 0AEE00 001AED00 A3FF4014 */  bnez        $2, .L001AEB90
/* 0AEE04 001AED04 00000000 */   nop
/* 0AEE08 001AED08 FC09B2AE */  sw          $18, 0x9FC($21)
/* 0AEE0C 001AED0C FC0AB1AE */  sw          $17, 0xAFC($21)
/* 0AEE10 001AED10 FFFF0224 */  addiu       $2, $0, -0x1
/* 0AEE14 001AED14 6000BF7B */  lq          $31, 0x60($29)
/* 0AEE18 001AED18 5000B57B */  lq          $21, 0x50($29)
/* 0AEE1C 001AED1C 4000B47B */  lq          $20, 0x40($29)
/* 0AEE20 001AED20 3000B37B */  lq          $19, 0x30($29)
/* 0AEE24 001AED24 2000B27B */  lq          $18, 0x20($29)
/* 0AEE28 001AED28 1000B17B */  lq          $17, 0x10($29)
/* 0AEE2C 001AED2C 0000B07B */  lq          $16, 0x0($29)
/* 0AEE30 001AED30 8000BD27 */  addiu       $29, $29, 0x80
/* 0AEE34 001AED34 0800E003 */  jr          $31
/* 0AEE38 001AED38 00000000 */   nop
/* 0AEE3C 001AED3C 00000000 */  nop
