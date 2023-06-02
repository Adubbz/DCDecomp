.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadInfoMode
/* 20040 0011FF40 2D408000 */  daddu      $8, $4, $0
/* 20044 0011FF44 70000324 */  addiu      $3, $0, 0x70
/* 20048 0011FF48 1C000424 */  addiu      $4, $0, 0x1C
/* 2004C 0011FF4C 18180371 */  mult1      $3, $8, $3
/* 20050 0011FF50 1820A400 */  mult       $4, $5, $4
/* 20054 0011FF54 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 20058 0011FF58 2B00023C */  lui        $2, %hi(D_002A9C90)
/* 2005C 0011FF5C 1000B1FF */  sd         $17, 0x10($sp)
/* 20060 0011FF60 0000B0FF */  sd         $16, 0x0($sp)
/* 20064 0011FF64 909C4224 */  addiu      $2, $2, %lo(D_002A9C90)
/* 20068 0011FF68 2000BFFF */  sd         $31, 0x20($sp)
/* 2006C 0011FF6C 2D80C000 */  daddu      $16, $6, $0
/* 20070 0011FF70 21208300 */  addu       $4, $4, $3
/* 20074 0011FF74 21104400 */  addu       $2, $2, $4
/* 20078 0011FF78 1000438C */  lw         $3, 0x10($2)
/* 2007C 0011FF7C 38006010 */  beqz       $3, .L00120060
/* 20080 0011FF80 2D88E000 */   daddu     $17, $7, $0
/* 20084 0011FF84 8C7E040C */  jal        scePadGetDmaStr
/* 20088 0011FF88 2D200001 */   daddu     $4, $8, $0
/* 2008C 0011FF8C 2D204000 */  daddu      $4, $2, $0
/* 20090 0011FF90 72008390 */  lbu        $3, 0x72($4)
/* 20094 0011FF94 01000224 */  addiu      $2, $0, 0x1
/* 20098 0011FF98 32006214 */  bne        $3, $2, .L00120064
/* 2009C 0011FF9C 2D100000 */   daddu     $2, $0, $0
/* 200A0 0011FFA0 71008290 */  lbu        $2, 0x71($4)
/* 200A4 0011FFA4 02000524 */  addiu      $5, $0, 0x2
/* 200A8 0011FFA8 2E004510 */  beq        $2, $5, .L00120064
/* 200AC 0011FFAC 2D100000 */   daddu     $2, $0, $0
/* 200B0 0011FFB0 13000512 */  beq        $16, $5, .L00120000
/* 200B4 0011FFB4 0300022A */   slti      $2, $16, 0x3
/* 200B8 0011FFB8 05004010 */  beqz       $2, .L0011FFD0
/* 200BC 0011FFBC 03000224 */   addiu     $2, $0, 0x3
/* 200C0 0011FFC0 09000312 */  beq        $16, $3, .L0011FFE8
/* 200C4 0011FFC4 2D100000 */   daddu     $2, $0, $0
/* 200C8 0011FFC8 27000010 */  b          .L00120068
/* 200CC 0011FFCC 2000BFDF */   ld        $31, 0x20($sp)
.L0011FFD0:
/* 200D0 0011FFD0 11000212 */  beq        $16, $2, .L00120018
/* 200D4 0011FFD4 04000224 */   addiu     $2, $0, 0x4
/* 200D8 0011FFD8 14000212 */  beq        $16, $2, .L0012002C
/* 200DC 0011FFDC 2D100000 */   daddu     $2, $0, $0
/* 200E0 0011FFE0 21000010 */  b          .L00120068
/* 200E4 0011FFE4 2000BFDF */   ld        $31, 0x20($sp)
.L0011FFE8:
/* 200E8 0011FFE8 65008390 */  lbu        $3, 0x65($4)
/* 200EC 0011FFEC F3000224 */  addiu      $2, $0, 0xF3
/* 200F0 0011FFF0 1B006210 */  beq        $3, $2, .L00120060
/* 200F4 0011FFF4 02110300 */   srl       $2, $3, 4
/* 200F8 0011FFF8 1B000010 */  b          .L00120068
/* 200FC 0011FFFC 2000BFDF */   ld        $31, 0x20($sp)
.L00120000:
/* 20100 00120000 64008290 */  lbu        $2, 0x64($4)
/* 20104 00120004 17004310 */  beq        $2, $3, .L00120064
/* 20108 00120008 2D100000 */   daddu     $2, $0, $0
/* 2010C 0012000C 69008390 */  lbu        $3, 0x69($4)
/* 20110 00120010 10000010 */  b          .L00120054
/* 20114 00120014 40180300 */   sll       $3, $3, 1
.L00120018:
/* 20118 00120018 64008290 */  lbu        $2, 0x64($4)
/* 2011C 0012001C 11004310 */  beq        $2, $3, .L00120064
/* 20120 00120020 2D100000 */   daddu     $2, $0, $0
/* 20124 00120024 0F000010 */  b          .L00120064
/* 20128 00120028 69008290 */   lbu       $2, 0x69($4)
.L0012002C:
/* 2012C 0012002C 64008290 */  lbu        $2, 0x64($4)
/* 20130 00120030 0B004310 */  beq        $2, $3, .L00120060
/* 20134 00120034 FFFF0224 */   addiu     $2, $0, -0x1
/* 20138 00120038 03002216 */  bne        $17, $2, .L00120048
/* 2013C 0012003C 68008290 */   lbu       $2, 0x68($4)
/* 20140 00120040 09000010 */  b          .L00120068
/* 20144 00120044 2000BFDF */   ld        $31, 0x20($sp)
.L00120048:
/* 20148 00120048 2A102202 */  slt        $2, $17, $2
/* 2014C 0012004C 04004010 */  beqz       $2, .L00120060
/* 20150 00120050 40181100 */   sll       $3, $17, 1
.L00120054:
/* 20154 00120054 21188300 */  addu       $3, $4, $3
/* 20158 00120058 02000010 */  b          .L00120064
/* 2015C 0012005C 50006294 */   lhu       $2, 0x50($3)
.L00120060:
/* 20160 00120060 2D100000 */  daddu      $2, $0, $0
.L00120064:
/* 20164 00120064 2000BFDF */  ld         $31, 0x20($sp)
.L00120068:
/* 20168 00120068 1000B1DF */  ld         $17, 0x10($sp)
/* 2016C 0012006C 0000B0DF */  ld         $16, 0x0($sp)
/* 20170 00120070 0800E003 */  jr         $31
/* 20174 00120074 3000BD27 */   addiu     $sp, $sp, 0x30