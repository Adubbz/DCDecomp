.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawVu1__9CFrameVu1FP13sceVif1PacketP10RenderInfo
/* 2A210 0012A110 C0FDBD27 */  addiu      $sp, $sp, -0x240
/* 2A214 0012A114 3000BF7F */  sq         $31, 0x30($sp)
/* 2A218 0012A118 2000B27F */  sq         $18, 0x20($sp)
/* 2A21C 0012A11C 1000B17F */  sq         $17, 0x10($sp)
/* 2A220 0012A120 0000B07F */  sq         $16, 0x0($sp)
/* 2A224 0012A124 28968070 */  paddub     $18, $4, $0
/* 2A228 0012A128 288EA070 */  paddub     $17, $5, $0
/* 2A22C 0012A12C 2886C070 */  paddub     $16, $6, $0
/* 2A230 0012A130 28262072 */  paddub     $4, $17, $0
/* 2A234 0012A134 0A83040C */  jal        sceVif1PkTerminate
/* 2A238 0012A138 00000000 */   nop
/* 2A23C 0012A13C 28264072 */  paddub     $4, $18, $0
/* 2A240 0012A140 0000258E */  lw         $5, 0x0($17)
/* 2A244 0012A144 28360072 */  paddub     $6, $16, $0
/* 2A248 0012A148 5002598E */  lw         $25, 0x250($18)
/* 2A24C 0012A14C 0800398F */  lw         $25, 0x8($25)
/* 2A250 0012A150 09F82003 */  jalr       $25
/* 2A254 0012A154 00000000 */   nop
/* 2A258 0012A158 28864070 */  paddub     $16, $2, $0
/* 2A25C 0012A15C 28262072 */  paddub     $4, $17, $0
/* 2A260 0012A160 282E0072 */  paddub     $5, $16, $0
/* 2A264 0012A164 DE83040C */  jal        sceVif1PkReserve
/* 2A268 0012A168 00000000 */   nop
/* 2A26C 0012A16C 28160072 */  paddub     $2, $16, $0
/* 2A270 0012A170 3000BF7B */  lq         $31, 0x30($sp)
/* 2A274 0012A174 2000B27B */  lq         $18, 0x20($sp)
/* 2A278 0012A178 1000B17B */  lq         $17, 0x10($sp)
/* 2A27C 0012A17C 0000B07B */  lq         $16, 0x0($sp)
/* 2A280 0012A180 4002BD27 */  addiu      $sp, $sp, 0x240
/* 2A284 0012A184 0800E003 */  jr         $31
/* 2A288 0012A188 00000000 */   nop
/* 2A28C 0012A18C 00000000 */  nop
