.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGInit__Fv
/* 02C320 0012C220 E0FFBD27 */  addiu       $29, $29, -0x20
/* 02C324 0012C224 1000BF7F */  sq          $31, 0x10($29)
/* 02C328 0012C228 0C00B7E7 */  swc1        $f23, 0xC($29)
/* 02C32C 0012C22C 0800B6E7 */  swc1        $f22, 0x8($29)
/* 02C330 0012C230 0400B5E7 */  swc1        $f21, 0x4($29)
/* 02C334 0012C234 0000B4E7 */  swc1        $f20, 0x0($29)
/* 02C338 0012C238 C08B80AF */  sw          $0, -0x7440($28)
/* 02C33C 0012C23C C48B80AF */  sw          $0, -0x743C($28)
/* 02C340 0012C240 C801023C */  lui         $2, %hi(vifpacket)
/* 02C344 0012C244 80A74224 */  addiu       $2, $2, %lo(vifpacket)
/* 02C348 0012C248 D48B82AF */  sw          $2, -0x742C($28)
/* 02C34C 0012C24C 01000424 */  addiu       $4, $0, 0x1
/* 02C350 0012C250 EA30040C */  jal         sceDmaGetChan
/* 02C354 0012C254 00000000 */   nop
/* 02C358 0012C258 C88B82AF */  sw          $2, -0x7438($28)
/* 02C35C 0012C25C 02000424 */  addiu       $4, $0, 0x2
/* 02C360 0012C260 EA30040C */  jal         sceDmaGetChan
/* 02C364 0012C264 00000000 */   nop
/* 02C368 0012C268 CC8B82AF */  sw          $2, -0x7434($28)
/* 02C36C 0012C26C 08000424 */  addiu       $4, $0, 0x8
/* 02C370 0012C270 EA30040C */  jal         sceDmaGetChan
/* 02C374 0012C274 00000000 */   nop
/* 02C378 0012C278 D08B82AF */  sw          $2, -0x7430($28)
/* 02C37C 0012C27C C88B858F */  lw          $5, -0x7438($28)
/* 02C380 0012C280 0000A490 */  lbu         $4, 0x0($5)
/* 02C384 0012C284 40000364 */  daddiu      $3, $0, 0x40
/* 02C388 0012C288 BFFF0224 */  addiu       $2, $0, -0x41
/* 02C38C 0012C28C 24108200 */  and         $2, $4, $2
/* 02C390 0012C290 25104300 */  or          $2, $2, $3
/* 02C394 0012C294 0000A2A0 */  sb          $2, 0x0($5)
/* 02C398 0012C298 C701023C */  lui         $2, %hi(GiftagAD)
/* 02C39C 0012C29C C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 02C3A0 0012C2A0 0000407C */  sq          $0, 0x0($2)
/* 02C3A4 0012C2A4 C701013C */  lui         $1, %hi(GiftagAD + 0x1)
/* 02C3A8 0012C2A8 C1522490 */  lbu         $4, %lo(GiftagAD + 0x1)($1)
/* 02C3AC 0012C2AC 80000364 */  daddiu      $3, $0, 0x80
/* 02C3B0 0012C2B0 7FFF0224 */  addiu       $2, $0, -0x81
/* 02C3B4 0012C2B4 24108200 */  and         $2, $4, $2
/* 02C3B8 0012C2B8 25104300 */  or          $2, $2, $3
/* 02C3BC 0012C2BC C701013C */  lui         $1, %hi(GiftagAD + 0x1)
/* 02C3C0 0012C2C0 C15222A0 */  sb          $2, %lo(GiftagAD + 0x1)($1)
/* 02C3C4 0012C2C4 C701013C */  lui         $1, %hi(GiftagAD + 0x7)
/* 02C3C8 0012C2C8 C7522490 */  lbu         $4, %lo(GiftagAD + 0x7)($1)
/* 02C3CC 0012C2CC 10000364 */  daddiu      $3, $0, 0x10
/* 02C3D0 0012C2D0 0FFF0224 */  addiu       $2, $0, -0xF1
/* 02C3D4 0012C2D4 24108200 */  and         $2, $4, $2
/* 02C3D8 0012C2D8 25104300 */  or          $2, $2, $3
/* 02C3DC 0012C2DC C701013C */  lui         $1, %hi(GiftagAD + 0x7)
/* 02C3E0 0012C2E0 C75222A0 */  sb          $2, %lo(GiftagAD + 0x7)($1)
/* 02C3E4 0012C2E4 C701013C */  lui         $1, %hi(GiftagAD + 0x8)
/* 02C3E8 0012C2E8 C8522490 */  lbu         $4, %lo(GiftagAD + 0x8)($1)
/* 02C3EC 0012C2EC 0E000364 */  daddiu      $3, $0, 0xE
/* 02C3F0 0012C2F0 F0FF0224 */  addiu       $2, $0, -0x10
/* 02C3F4 0012C2F4 24108200 */  and         $2, $4, $2
/* 02C3F8 0012C2F8 25104300 */  or          $2, $2, $3
/* 02C3FC 0012C2FC C701013C */  lui         $1, %hi(GiftagAD + 0x8)
/* 02C400 0012C300 C85222A0 */  sb          $2, %lo(GiftagAD + 0x8)($1)
/* 02C404 0012C304 28260070 */  paddub      $4, $0, $0
/* 02C408 0012C308 01000524 */  addiu       $5, $0, 0x1
/* 02C40C 0012C30C 02000624 */  addiu       $6, $0, 0x2
/* 02C410 0012C310 283EA070 */  paddub      $7, $5, $0
/* 02C414 0012C314 AC48040C */  jal         sceGsResetGraph
/* 02C418 0012C318 00000000 */   nop
/* 02C41C 0012C31C C701023C */  lui         $2, %hi(mgDBuff)
/* 02C420 0012C320 D0524424 */  addiu       $4, $2, %lo(mgDBuff)
/* 02C424 0012C324 282E0070 */  paddub      $5, $0, $0
/* 02C428 0012C328 80020624 */  addiu       $6, $0, 0x280
/* 02C42C 0012C32C E0000724 */  addiu       $7, $0, 0xE0
/* 02C430 0012C330 02000824 */  addiu       $8, $0, 0x2
/* 02C434 0012C334 31000924 */  addiu       $9, $0, 0x31
/* 02C438 0012C338 28560070 */  paddub      $10, $0, $0
/* 02C43C 0012C33C 024B040C */  jal         sceGsSetDefDBuff
/* 02C440 0012C340 00000000 */   nop
/* 02C444 0012C344 C701013C */  lui         $1, %hi(mgWindowRect)
/* 02C448 0012C348 105520AC */  sw          $0, %lo(mgWindowRect)($1)
/* 02C44C 0012C34C C701013C */  lui         $1, %hi(mgWindowRect + 0x4)
/* 02C450 0012C350 145520AC */  sw          $0, %lo(mgWindowRect + 0x4)($1)
/* 02C454 0012C354 80020224 */  addiu       $2, $0, 0x280
/* 02C458 0012C358 C701013C */  lui         $1, %hi(mgWindowRect + 0x8)
/* 02C45C 0012C35C 185522AC */  sw          $2, %lo(mgWindowRect + 0x8)($1)
/* 02C460 0012C360 E0000224 */  addiu       $2, $0, 0xE0
/* 02C464 0012C364 C701013C */  lui         $1, %hi(mgWindowRect + 0xC)
/* 02C468 0012C368 1C5522AC */  sw          $2, %lo(mgWindowRect + 0xC)($1)
/* 02C46C 0012C36C C701013C */  lui         $1, %hi(mgBackColor)
/* 02C470 0012C370 005520AC */  sw          $0, %lo(mgBackColor)($1)
/* 02C474 0012C374 C701013C */  lui         $1, %hi(mgBackColor + 0x4)
/* 02C478 0012C378 045520AC */  sw          $0, %lo(mgBackColor + 0x4)($1)
/* 02C47C 0012C37C C701013C */  lui         $1, %hi(mgBackColor + 0x8)
/* 02C480 0012C380 085520AC */  sw          $0, %lo(mgBackColor + 0x8)($1)
/* 02C484 0012C384 0043023C */  lui         $2, (0x43000000 >> 16)
/* 02C488 0012C388 C701013C */  lui         $1, %hi(mgBackColor + 0xC)
/* 02C48C 0012C38C 0C5522AC */  sw          $2, %lo(mgBackColor + 0xC)($1)
/* 02C490 0012C390 01000224 */  addiu       $2, $0, 0x1
/* 02C494 0012C394 DC8B82AF */  sw          $2, -0x7424($28)
/* 02C498 0012C398 C701013C */  lui         $1, %hi(mgBackColor)
/* 02C49C 0012C39C 005534C4 */  lwc1        $f20, %lo(mgBackColor)($1)
/* 02C4A0 0012C3A0 06A30046 */  mov.s       $f12, $f20
/* 02C4A4 0012C3A4 2C44040C */  jal         fptosi
/* 02C4A8 0012C3A8 00000000 */   nop
/* 02C4AC 0012C3AC C701013C */  lui         $1, %hi(mgDBuff + 0x100)
/* 02C4B0 0012C3B0 D05322A0 */  sb          $2, %lo(mgDBuff + 0x100)($1)
/* 02C4B4 0012C3B4 C701013C */  lui         $1, %hi(mgBackColor + 0x4)
/* 02C4B8 0012C3B8 045535C4 */  lwc1        $f21, %lo(mgBackColor + 0x4)($1)
/* 02C4BC 0012C3BC 06AB0046 */  mov.s       $f12, $f21
/* 02C4C0 0012C3C0 2C44040C */  jal         fptosi
/* 02C4C4 0012C3C4 00000000 */   nop
/* 02C4C8 0012C3C8 C701013C */  lui         $1, %hi(mgDBuff + 0x101)
/* 02C4CC 0012C3CC D15322A0 */  sb          $2, %lo(mgDBuff + 0x101)($1)
/* 02C4D0 0012C3D0 C701013C */  lui         $1, %hi(mgBackColor + 0x8)
/* 02C4D4 0012C3D4 085536C4 */  lwc1        $f22, %lo(mgBackColor + 0x8)($1)
/* 02C4D8 0012C3D8 06B30046 */  mov.s       $f12, $f22
/* 02C4DC 0012C3DC 2C44040C */  jal         fptosi
/* 02C4E0 0012C3E0 00000000 */   nop
/* 02C4E4 0012C3E4 C701013C */  lui         $1, %hi(mgDBuff + 0x102)
/* 02C4E8 0012C3E8 D25322A0 */  sb          $2, %lo(mgDBuff + 0x102)($1)
/* 02C4EC 0012C3EC C701013C */  lui         $1, %hi(mgBackColor + 0xC)
/* 02C4F0 0012C3F0 0C5537C4 */  lwc1        $f23, %lo(mgBackColor + 0xC)($1)
/* 02C4F4 0012C3F4 06BB0046 */  mov.s       $f12, $f23
/* 02C4F8 0012C3F8 2C44040C */  jal         fptosi
/* 02C4FC 0012C3FC 00000000 */   nop
/* 02C500 0012C400 C701013C */  lui         $1, %hi(mgDBuff + 0x103)
/* 02C504 0012C404 D35322A0 */  sb          $2, %lo(mgDBuff + 0x103)($1)
/* 02C508 0012C408 06A30046 */  mov.s       $f12, $f20
/* 02C50C 0012C40C 2C44040C */  jal         fptosi
/* 02C510 0012C410 00000000 */   nop
/* 02C514 0012C414 C701013C */  lui         $1, %hi(mgDBuff + 0x1F0)
/* 02C518 0012C418 C05422A0 */  sb          $2, %lo(mgDBuff + 0x1F0)($1)
/* 02C51C 0012C41C 06AB0046 */  mov.s       $f12, $f21
/* 02C520 0012C420 2C44040C */  jal         fptosi
/* 02C524 0012C424 00000000 */   nop
/* 02C528 0012C428 C701013C */  lui         $1, %hi(mgDBuff + 0x1F1)
/* 02C52C 0012C42C C15422A0 */  sb          $2, %lo(mgDBuff + 0x1F1)($1)
/* 02C530 0012C430 06B30046 */  mov.s       $f12, $f22
/* 02C534 0012C434 2C44040C */  jal         fptosi
/* 02C538 0012C438 00000000 */   nop
/* 02C53C 0012C43C C701013C */  lui         $1, %hi(mgDBuff + 0x1F2)
/* 02C540 0012C440 C25422A0 */  sb          $2, %lo(mgDBuff + 0x1F2)($1)
/* 02C544 0012C444 06BB0046 */  mov.s       $f12, $f23
/* 02C548 0012C448 2C44040C */  jal         fptosi
/* 02C54C 0012C44C 00000000 */   nop
/* 02C550 0012C450 C701013C */  lui         $1, %hi(mgDBuff + 0x1F3)
/* 02C554 0012C454 C35422A0 */  sb          $2, %lo(mgDBuff + 0x1F3)($1)
/* 02C558 0012C458 E08B8293 */  lbu         $2, -0x7420($28)
/* 02C55C 0012C45C 01000564 */  daddiu      $5, $0, 0x1
/* 02C560 0012C460 FEFF0424 */  addiu       $4, $0, -0x2
/* 02C564 0012C464 24104400 */  and         $2, $2, $4
/* 02C568 0012C468 25104500 */  or          $2, $2, $5
/* 02C56C 0012C46C E08B82A3 */  sb          $2, -0x7420($28)
/* 02C570 0012C470 E08B8693 */  lbu         $6, -0x7420($28)
/* 02C574 0012C474 07000230 */  andi        $2, $0, 0x7
/* 02C578 0012C478 80180200 */  sll         $3, $2, 2
/* 02C57C 0012C47C E3FF0224 */  addiu       $2, $0, -0x1D
/* 02C580 0012C480 2410C200 */  and         $2, $6, $2
/* 02C584 0012C484 25104300 */  or          $2, $2, $3
/* 02C588 0012C488 E08B82A3 */  sb          $2, -0x7420($28)
/* 02C58C 0012C48C E08B8693 */  lbu         $6, -0x7420($28)
/* 02C590 0012C490 20000364 */  daddiu      $3, $0, 0x20
/* 02C594 0012C494 DFFF0224 */  addiu       $2, $0, -0x21
/* 02C598 0012C498 2410C200 */  and         $2, $6, $2
/* 02C59C 0012C49C 25104300 */  or          $2, $2, $3
/* 02C5A0 0012C4A0 E08B82A3 */  sb          $2, -0x7420($28)
/* 02C5A4 0012C4A4 E08B8697 */  lhu         $6, -0x7420($28)
/* 02C5A8 0012C4A8 40000364 */  daddiu      $3, $0, 0x40
/* 02C5AC 0012C4AC 3FFE0224 */  addiu       $2, $0, -0x1C1
/* 02C5B0 0012C4B0 2410C200 */  and         $2, $6, $2
/* 02C5B4 0012C4B4 25104300 */  or          $2, $2, $3
/* 02C5B8 0012C4B8 E08B82A7 */  sh          $2, -0x7420($28)
/* 02C5BC 0012C4BC E18B8793 */  lbu         $7, -0x741F($28)
/* 02C5C0 0012C4C0 02000664 */  daddiu      $6, $0, 0x2
/* 02C5C4 0012C4C4 FDFF0224 */  addiu       $2, $0, -0x3
/* 02C5C8 0012C4C8 2410E200 */  and         $2, $7, $2
/* 02C5CC 0012C4CC 25104600 */  or          $2, $2, $6
/* 02C5D0 0012C4D0 E18B82A3 */  sb          $2, -0x741F($28)
/* 02C5D4 0012C4D4 E28B8893 */  lbu         $8, -0x741E($28)
/* 02C5D8 0012C4D8 03000230 */  andi        $2, $0, 0x3
/* 02C5DC 0012C4DC C0380200 */  sll         $7, $2, 3
/* 02C5E0 0012C4E0 E7FF0624 */  addiu       $6, $0, -0x19
/* 02C5E4 0012C4E4 24300601 */  and         $6, $8, $6
/* 02C5E8 0012C4E8 2530C700 */  or          $6, $6, $7
/* 02C5EC 0012C4EC E28B86A3 */  sb          $6, -0x741E($28)
/* 02C5F0 0012C4F0 E48B8897 */  lhu         $8, -0x741C($28)
/* 02C5F4 0012C4F4 FF0F0730 */  andi        $7, $0, 0xFFF
/* 02C5F8 0012C4F8 00F00624 */  addiu       $6, $0, -0x1000
/* 02C5FC 0012C4FC 24300601 */  and         $6, $8, $6
/* 02C600 0012C500 2530C700 */  or          $6, $6, $7
/* 02C604 0012C504 E48B86A7 */  sh          $6, -0x741C($28)
/* 02C608 0012C508 C701063C */  lui         $6, %hi(mgDBuff + 0xD0)
/* 02C60C 0012C50C A053C624 */  addiu       $6, $6, %lo(mgDBuff + 0xD0)
/* 02C610 0012C510 0000C6DC */  ld          $6, 0x0($6)
/* 02C614 0012C514 E88B86FF */  sd          $6, -0x7418($28)
/* 02C618 0012C518 E88B8693 */  lbu         $6, -0x7418($28)
/* 02C61C 0012C51C 2420C400 */  and         $4, $6, $4
/* 02C620 0012C520 25208500 */  or          $4, $4, $5
/* 02C624 0012C524 E88B84A3 */  sb          $4, -0x7418($28)
/* 02C628 0012C528 E88B8693 */  lbu         $6, -0x7418($28)
/* 02C62C 0012C52C 0A000564 */  daddiu      $5, $0, 0xA
/* 02C630 0012C530 F1FF0424 */  addiu       $4, $0, -0xF
/* 02C634 0012C534 2420C400 */  and         $4, $6, $4
/* 02C638 0012C538 25208500 */  or          $4, $4, $5
/* 02C63C 0012C53C E88B84A3 */  sb          $4, -0x7418($28)
/* 02C640 0012C540 E88B8697 */  lhu         $6, -0x7418($28)
/* 02C644 0012C544 FF000430 */  andi        $4, $0, 0xFF
/* 02C648 0012C548 00290400 */  sll         $5, $4, 4
/* 02C64C 0012C54C 0FF00424 */  addiu       $4, $0, -0xFF1
/* 02C650 0012C550 2420C400 */  and         $4, $6, $4
/* 02C654 0012C554 25208500 */  or          $4, $4, $5
/* 02C658 0012C558 E88B84A7 */  sh          $4, -0x7418($28)
/* 02C65C 0012C55C E98B8493 */  lbu         $4, -0x7417($28)
/* 02C660 0012C560 00390200 */  sll         $7, $2, 4
/* 02C664 0012C564 CFFF0624 */  addiu       $6, $0, -0x31
/* 02C668 0012C568 24208600 */  and         $4, $4, $6
/* 02C66C 0012C56C 25208700 */  or          $4, $4, $7
/* 02C670 0012C570 E98B84A3 */  sb          $4, -0x7417($28)
/* 02C674 0012C574 C701043C */  lui         $4, %hi(mgDBuff + 0x70)
/* 02C678 0012C578 40538424 */  addiu       $4, $4, %lo(mgDBuff + 0x70)
/* 02C67C 0012C57C 000084DC */  ld          $4, 0x0($4)
/* 02C680 0012C580 F08B84FF */  sd          $4, -0x7410($28)
/* 02C684 0012C584 F88B8593 */  lbu         $5, -0x7408($28)
/* 02C688 0012C588 FCFF0424 */  addiu       $4, $0, -0x4
/* 02C68C 0012C58C 2420A400 */  and         $4, $5, $4
/* 02C690 0012C590 25108200 */  or          $2, $4, $2
/* 02C694 0012C594 F88B82A3 */  sb          $2, -0x7408($28)
/* 02C698 0012C598 F88B8593 */  lbu         $5, -0x7408($28)
/* 02C69C 0012C59C 04000464 */  daddiu      $4, $0, 0x4
/* 02C6A0 0012C5A0 F3FF0224 */  addiu       $2, $0, -0xD
/* 02C6A4 0012C5A4 2410A200 */  and         $2, $5, $2
/* 02C6A8 0012C5A8 25104400 */  or          $2, $2, $4
/* 02C6AC 0012C5AC F88B82A3 */  sb          $2, -0x7408($28)
/* 02C6B0 0012C5B0 F88B8293 */  lbu         $2, -0x7408($28)
/* 02C6B4 0012C5B4 24104600 */  and         $2, $2, $6
/* 02C6B8 0012C5B8 25104700 */  or          $2, $2, $7
/* 02C6BC 0012C5BC F88B82A3 */  sb          $2, -0x7408($28)
/* 02C6C0 0012C5C0 F88B8493 */  lbu         $4, -0x7408($28)
/* 02C6C4 0012C5C4 3FFF0224 */  addiu       $2, $0, -0xC1
/* 02C6C8 0012C5C8 24108200 */  and         $2, $4, $2
/* 02C6CC 0012C5CC 25104300 */  or          $2, $2, $3
/* 02C6D0 0012C5D0 F88B82A3 */  sb          $2, -0x7408($28)
/* 02C6D4 0012C5D4 FC8B80A3 */  sb          $0, -0x7404($28)
/* 02C6D8 0012C5D8 008C80A3 */  sb          $0, -0x7400($28)
/* 02C6DC 0012C5DC 048C80A3 */  sb          $0, -0x73FC($28)
/* 02C6E0 0012C5E0 018C8493 */  lbu         $4, -0x73FF($28)
/* 02C6E4 0012C5E4 80000364 */  daddiu      $3, $0, 0x80
/* 02C6E8 0012C5E8 7FFF0224 */  addiu       $2, $0, -0x81
/* 02C6EC 0012C5EC 24108200 */  and         $2, $4, $2
/* 02C6F0 0012C5F0 25104300 */  or          $2, $2, $3
/* 02C6F4 0012C5F4 018C82A3 */  sb          $2, -0x73FF($28)
/* 02C6F8 0012C5F8 C801013C */  lui         $1, %hi(mgZeroVector)
/* 02C6FC 0012C5FC C0A620AC */  sw          $0, %lo(mgZeroVector)($1)
/* 02C700 0012C600 C801013C */  lui         $1, %hi(mgZeroVector + 0x4)
/* 02C704 0012C604 C4A620AC */  sw          $0, %lo(mgZeroVector + 0x4)($1)
/* 02C708 0012C608 C801013C */  lui         $1, %hi(mgZeroVector + 0x8)
/* 02C70C 0012C60C C8A620AC */  sw          $0, %lo(mgZeroVector + 0x8)($1)
/* 02C710 0012C610 C801013C */  lui         $1, %hi(mgZeroVector + 0xC)
/* 02C714 0012C614 CCA620AC */  sw          $0, %lo(mgZeroVector + 0xC)($1)
/* 02C718 0012C618 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02C71C 0012C61C C801013C */  lui         $1, %hi(mgUnitVector)
/* 02C720 0012C620 D0A622AC */  sw          $2, %lo(mgUnitVector)($1)
/* 02C724 0012C624 C801013C */  lui         $1, %hi(mgUnitVector + 0x4)
/* 02C728 0012C628 D4A622AC */  sw          $2, %lo(mgUnitVector + 0x4)($1)
/* 02C72C 0012C62C C801013C */  lui         $1, %hi(mgUnitVector + 0x8)
/* 02C730 0012C630 D8A622AC */  sw          $2, %lo(mgUnitVector + 0x8)($1)
/* 02C734 0012C634 C801013C */  lui         $1, %hi(mgUnitVector + 0xC)
/* 02C738 0012C638 DCA622AC */  sw          $2, %lo(mgUnitVector + 0xC)($1)
/* 02C73C 0012C63C C801023C */  lui         $2, %hi(mgZeroVector2)
/* 02C740 0012C640 F0A64424 */  addiu       $4, $2, %lo(mgZeroVector2)
/* 02C744 0012C644 C801023C */  lui         $2, %hi(mgZeroVector)
/* 02C748 0012C648 C0A64524 */  addiu       $5, $2, %lo(mgZeroVector)
/* 02C74C 0012C64C 0C86040C */  jal         sceVu0CopyVector
/* 02C750 0012C650 00000000 */   nop
/* 02C754 0012C654 C801023C */  lui         $2, %hi(mgUnitVector2)
/* 02C758 0012C658 E0A64424 */  addiu       $4, $2, %lo(mgUnitVector2)
/* 02C75C 0012C65C C801023C */  lui         $2, %hi(mgUnitVector)
/* 02C760 0012C660 D0A64524 */  addiu       $5, $2, %lo(mgUnitVector)
/* 02C764 0012C664 0C86040C */  jal         sceVu0CopyVector
/* 02C768 0012C668 00000000 */   nop
/* 02C76C 0012C66C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02C770 0012C670 C801013C */  lui         $1, %hi(mgZeroVector2 + 0xC)
/* 02C774 0012C674 FCA622AC */  sw          $2, %lo(mgZeroVector2 + 0xC)($1)
/* 02C778 0012C678 C801013C */  lui         $1, %hi(mgUnitVector2 + 0xC)
/* 02C77C 0012C67C ECA620AC */  sw          $0, %lo(mgUnitVector2 + 0xC)($1)
/* 02C780 0012C680 C801023C */  lui         $2, %hi(mgUnitMatrix)
/* 02C784 0012C684 00A74424 */  addiu       $4, $2, %lo(mgUnitMatrix)
/* 02C788 0012C688 2A86040C */  jal         sceVu0UnitMatrix
/* 02C78C 0012C68C 00000000 */   nop
/* 02C790 0012C690 C801023C */  lui         $2, %hi(mgZeroMatrix)
/* 02C794 0012C694 40A74424 */  addiu       $4, $2, %lo(mgZeroMatrix)
/* 02C798 0012C698 2A86040C */  jal         sceVu0UnitMatrix
/* 02C79C 0012C69C 00000000 */   nop
/* 02C7A0 0012C6A0 C801013C */  lui         $1, %hi(mgZeroMatrix)
/* 02C7A4 0012C6A4 40A720AC */  sw          $0, %lo(mgZeroMatrix)($1)
/* 02C7A8 0012C6A8 C801013C */  lui         $1, %hi(mgZeroMatrix + 0x14)
/* 02C7AC 0012C6AC 54A720AC */  sw          $0, %lo(mgZeroMatrix + 0x14)($1)
/* 02C7B0 0012C6B0 C801013C */  lui         $1, %hi(mgZeroMatrix + 0x28)
/* 02C7B4 0012C6B4 68A720AC */  sw          $0, %lo(mgZeroMatrix + 0x28)($1)
/* 02C7B8 0012C6B8 C801013C */  lui         $1, %hi(mgZeroMatrix + 0x3C)
/* 02C7BC 0012C6BC 7CA720AC */  sw          $0, %lo(mgZeroMatrix + 0x3C)($1)
/* 02C7C0 0012C6C0 6C8F040C */  jal         CreateSinTable__Fv
/* 02C7C4 0012C6C4 00000000 */   nop
/* 02C7C8 0012C6C8 1300023C */  lui         $2, %hi(VSyncCallBack__Fi)
/* 02C7CC 0012C6CC 70C14424 */  addiu       $4, $2, %lo(VSyncCallBack__Fi)
/* 02C7D0 0012C6D0 7A4F040C */  jal         sceGsSyncVCallback
/* 02C7D4 0012C6D4 00000000 */   nop
/* 02C7D8 0012C6D8 188C80AF */  sw          $0, -0x73E8($28)
/* 02C7DC 0012C6DC 108C80AF */  sw          $0, -0x73F0($28)
/* 02C7E0 0012C6E0 1000BF7B */  lq          $31, 0x10($29)
/* 02C7E4 0012C6E4 0C00B7C7 */  lwc1        $f23, 0xC($29)
/* 02C7E8 0012C6E8 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 02C7EC 0012C6EC 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 02C7F0 0012C6F0 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 02C7F4 0012C6F4 2000BD27 */  addiu       $29, $29, 0x20
/* 02C7F8 0012C6F8 0800E003 */  jr          $31
/* 02C7FC 0012C6FC 00000000 */   nop
