.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Init__13CSHOT_FIREBARFPfPfii
/* AEC20 001AEB20 80FFBD27 */  addiu      $sp, $sp, -0x80
/* AEC24 001AEB24 6000BF7F */  sq         $31, 0x60($sp)
/* AEC28 001AEB28 5000B57F */  sq         $21, 0x50($sp)
/* AEC2C 001AEB2C 4000B47F */  sq         $20, 0x40($sp)
/* AEC30 001AEB30 3000B37F */  sq         $19, 0x30($sp)
/* AEC34 001AEB34 2000B27F */  sq         $18, 0x20($sp)
/* AEC38 001AEB38 1000B17F */  sq         $17, 0x10($sp)
/* AEC3C 001AEB3C 0000B07F */  sq         $16, 0x0($sp)
/* AEC40 001AEB40 28AE8070 */  paddub     $21, $4, $0
/* AEC44 001AEB44 28A6A070 */  paddub     $20, $5, $0
/* AEC48 001AEB48 289EC070 */  paddub     $19, $6, $0
/* AEC4C 001AEB4C 2896E070 */  paddub     $18, $7, $0
/* AEC50 001AEB50 288E0071 */  paddub     $17, $8, $0
/* AEC54 001AEB54 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AEC58 001AEB58 0C00C2AC */  sw         $2, 0xC($6)
/* AEC5C 001AEB5C 28266072 */  paddub     $4, $19, $0
/* AEC60 001AEB60 282E6072 */  paddub     $5, $19, $0
/* AEC64 001AEB64 9285040C */  jal        sceVu0Normalize
/* AEC68 001AEB68 00000000 */   nop
/* AEC6C 001AEB6C 0040023C */  lui        $2, (0x40000000 >> 16)
/* AEC70 001AEB70 00608244 */  mtc1       $2, $f12
/* AEC74 001AEB74 7000A427 */  addiu      $4, $sp, 0x70
/* AEC78 001AEB78 282E6072 */  paddub     $5, $19, $0
/* AEC7C 001AEB7C 4688040C */  jal        sceVu0ScaleVectorXYZ
/* AEC80 001AEB80 00000000 */   nop
/* AEC84 001AEB84 28860070 */  paddub     $16, $0, $0
/* AEC88 001AEB88 5C000010 */  b          .L001AECFC
/* AEC8C 001AEB8C 00000000 */   nop
.L001AEB90:
/* AEC90 001AEB90 000DA28E */  lw         $2, 0xD00($21)
/* AEC94 001AEB94 21100202 */  addu       $2, $16, $2
/* AEC98 001AEB98 00110200 */  sll        $2, $2, 4
/* AEC9C 001AEB9C 2120A202 */  addu       $4, $21, $2
/* AECA0 001AEBA0 282E8072 */  paddub     $5, $20, $0
/* AECA4 001AEBA4 0C86040C */  jal        sceVu0CopyVector
/* AECA8 001AEBA8 00000000 */   nop
/* AECAC 001AEBAC 000081C6 */  lwc1       $f1, 0x0($20)
/* AECB0 001AEBB0 00009044 */  mtc1       $16, $f0
/* AECB4 001AEBB4 00000000 */  nop
/* AECB8 001AEBB8 A0008046 */  cvt.s.w    $f2, $f0
/* AECBC 001AEBBC 7000A0C7 */  lwc1       $f0, 0x70($sp)
/* AECC0 001AEBC0 02000246 */  mul.s      $f0, $f0, $f2
/* AECC4 001AEBC4 00080046 */  add.s      $f0, $f1, $f0
/* AECC8 001AEBC8 000DA28E */  lw         $2, 0xD00($21)
/* AECCC 001AEBCC 21100202 */  addu       $2, $16, $2
/* AECD0 001AEBD0 00110200 */  sll        $2, $2, 4
/* AECD4 001AEBD4 2110A202 */  addu       $2, $21, $2
/* AECD8 001AEBD8 000040E4 */  swc1       $f0, 0x0($2)
/* AECDC 001AEBDC 040081C6 */  lwc1       $f1, 0x4($20)
/* AECE0 001AEBE0 7400A0C7 */  lwc1       $f0, 0x74($sp)
/* AECE4 001AEBE4 02000246 */  mul.s      $f0, $f0, $f2
/* AECE8 001AEBE8 00080046 */  add.s      $f0, $f1, $f0
/* AECEC 001AEBEC 000DA28E */  lw         $2, 0xD00($21)
/* AECF0 001AEBF0 21100202 */  addu       $2, $16, $2
/* AECF4 001AEBF4 00110200 */  sll        $2, $2, 4
/* AECF8 001AEBF8 21105500 */  addu       $2, $2, $21
/* AECFC 001AEBFC 040040E4 */  swc1       $f0, 0x4($2)
/* AED00 001AEC00 080081C6 */  lwc1       $f1, 0x8($20)
/* AED04 001AEC04 7800A0C7 */  lwc1       $f0, 0x78($sp)
/* AED08 001AEC08 02000246 */  mul.s      $f0, $f0, $f2
/* AED0C 001AEC0C 00080046 */  add.s      $f0, $f1, $f0
/* AED10 001AEC10 000DA28E */  lw         $2, 0xD00($21)
/* AED14 001AEC14 21100202 */  addu       $2, $16, $2
/* AED18 001AEC18 00110200 */  sll        $2, $2, 4
/* AED1C 001AEC1C 21105500 */  addu       $2, $2, $21
/* AED20 001AEC20 080040E4 */  swc1       $f0, 0x8($2)
/* AED24 001AEC24 148481C7 */  lwc1       $f1, -0x7BEC($gp)
/* AED28 001AEC28 000060C6 */  lwc1       $f0, 0x0($19)
/* AED2C 001AEC2C 02080046 */  mul.s      $f0, $f1, $f0
/* AED30 001AEC30 000DA28E */  lw         $2, 0xD00($21)
/* AED34 001AEC34 21100202 */  addu       $2, $16, $2
/* AED38 001AEC38 00110200 */  sll        $2, $2, 4
/* AED3C 001AEC3C 21105500 */  addu       $2, $2, $21
/* AED40 001AEC40 000440E4 */  swc1       $f0, 0x400($2)
/* AED44 001AEC44 148481C7 */  lwc1       $f1, -0x7BEC($gp)
/* AED48 001AEC48 040060C6 */  lwc1       $f0, 0x4($19)
/* AED4C 001AEC4C 02080046 */  mul.s      $f0, $f1, $f0
/* AED50 001AEC50 000DA28E */  lw         $2, 0xD00($21)
/* AED54 001AEC54 21100202 */  addu       $2, $16, $2
/* AED58 001AEC58 00110200 */  sll        $2, $2, 4
/* AED5C 001AEC5C 21105500 */  addu       $2, $2, $21
/* AED60 001AEC60 040440E4 */  swc1       $f0, 0x404($2)
/* AED64 001AEC64 148481C7 */  lwc1       $f1, -0x7BEC($gp)
/* AED68 001AEC68 080060C6 */  lwc1       $f0, 0x8($19)
/* AED6C 001AEC6C 02080046 */  mul.s      $f0, $f1, $f0
/* AED70 001AEC70 000DA28E */  lw         $2, 0xD00($21)
/* AED74 001AEC74 21100202 */  addu       $2, $16, $2
/* AED78 001AEC78 00110200 */  sll        $2, $2, 4
/* AED7C 001AEC7C 21105500 */  addu       $2, $2, $21
/* AED80 001AEC80 080440E4 */  swc1       $f0, 0x408($2)
/* AED84 001AEC84 908280C7 */  lwc1       $f0, -0x7D70($gp)
/* AED88 001AEC88 42000246 */  mul.s      $f1, $f0, $f2
/* AED8C 001AEC8C 4040023C */  lui        $2, (0x40400000 >> 16)
/* AED90 001AEC90 00008244 */  mtc1       $2, $f0
/* AED94 001AEC94 00000000 */  nop
/* AED98 001AEC98 00000146 */  add.s      $f0, $f0, $f1
/* AED9C 001AEC9C 000DA28E */  lw         $2, 0xD00($21)
/* AEDA0 001AECA0 21100202 */  addu       $2, $16, $2
/* AEDA4 001AECA4 80100200 */  sll        $2, $2, 2
/* AEDA8 001AECA8 21105500 */  addu       $2, $2, $21
/* AEDAC 001AECAC 000840E4 */  swc1       $f0, 0x800($2)
/* AEDB0 001AECB0 0041023C */  lui        $2, (0x41000000 >> 16)
/* AEDB4 001AECB4 00008244 */  mtc1       $2, $f0
/* AEDB8 001AECB8 00000000 */  nop
/* AEDBC 001AECBC 42000246 */  mul.s      $f1, $f0, $f2
/* AEDC0 001AECC0 3443023C */  lui        $2, (0x43340000 >> 16)
/* AEDC4 001AECC4 00008244 */  mtc1       $2, $f0
/* AEDC8 001AECC8 00000000 */  nop
/* AEDCC 001AECCC 01000146 */  sub.s      $f0, $f0, $f1
/* AEDD0 001AECD0 000DA28E */  lw         $2, 0xD00($21)
/* AEDD4 001AECD4 21100202 */  addu       $2, $16, $2
/* AEDD8 001AECD8 80100200 */  sll        $2, $2, 2
/* AEDDC 001AECDC 21105500 */  addu       $2, $2, $21
/* AEDE0 001AECE0 000940E4 */  swc1       $f0, 0x900($2)
/* AEDE4 001AECE4 000DA28E */  lw         $2, 0xD00($21)
/* AEDE8 001AECE8 21100202 */  addu       $2, $16, $2
/* AEDEC 001AECEC 80100200 */  sll        $2, $2, 2
/* AEDF0 001AECF0 21105500 */  addu       $2, $2, $21
/* AEDF4 001AECF4 000C40AC */  sw         $0, 0xC00($2)
/* AEDF8 001AECF8 01001026 */  addiu      $16, $16, 0x1
.L001AECFC:
/* AEDFC 001AECFC 1800022A */  slti       $2, $16, 0x18
/* AEE00 001AED00 A3FF4014 */  bnez       $2, .L001AEB90
/* AEE04 001AED04 00000000 */   nop
/* AEE08 001AED08 FC09B2AE */  sw         $18, 0x9FC($21)
/* AEE0C 001AED0C FC0AB1AE */  sw         $17, 0xAFC($21)
/* AEE10 001AED10 FFFF0224 */  addiu      $2, $0, -0x1
/* AEE14 001AED14 6000BF7B */  lq         $31, 0x60($sp)
/* AEE18 001AED18 5000B57B */  lq         $21, 0x50($sp)
/* AEE1C 001AED1C 4000B47B */  lq         $20, 0x40($sp)
/* AEE20 001AED20 3000B37B */  lq         $19, 0x30($sp)
/* AEE24 001AED24 2000B27B */  lq         $18, 0x20($sp)
/* AEE28 001AED28 1000B17B */  lq         $17, 0x10($sp)
/* AEE2C 001AED2C 0000B07B */  lq         $16, 0x0($sp)
/* AEE30 001AED30 8000BD27 */  addiu      $sp, $sp, 0x80
/* AEE34 001AED34 0800E003 */  jr         $31
/* AEE38 001AED38 00000000 */   nop
/* AEE3C 001AED3C 00000000 */  nop
