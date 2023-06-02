.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GUARD_SEARCH__FP12RS_STACKDATAi
/* E6300 001E6200 90FFBD27 */  addiu      $sp, $sp, -0x70
/* E6304 001E6204 3000BF7F */  sq         $31, 0x30($sp)
/* E6308 001E6208 2000B17F */  sq         $17, 0x20($sp)
/* E630C 001E620C 1000B07F */  sq         $16, 0x10($sp)
/* E6310 001E6210 0000B4E7 */  swc1       $f20, 0x0($sp)
/* E6314 001E6214 28868070 */  paddub     $16, $4, $0
/* E6318 001E6218 E09C828F */  lw         $2, -0x6320($gp)
/* E631C 001E621C 9000518C */  lw         $17, 0x90($2)
/* E6320 001E6220 4000A427 */  addiu      $4, $sp, 0x40
/* E6324 001E6224 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* E6328 001E6228 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* E632C 001E622C 0C86040C */  jal        sceVu0CopyVector
/* E6330 001E6230 00000000 */   nop
/* E6334 001E6234 10350224 */  addiu      $2, $0, 0x3510
/* E6338 001E6238 18182202 */  mult       $3, $17, $2
/* E633C 001E623C E09C828F */  lw         $2, -0x6320($gp)
/* E6340 001E6240 21104300 */  addu       $2, $2, $3
/* E6344 001E6244 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E6348 001E6248 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E634C 001E624C 21204100 */  addu       $4, $2, $at
/* E6350 001E6250 5000A527 */  addiu      $5, $sp, 0x50
/* E6354 001E6254 A000998C */  lw         $25, 0xA0($4)
/* E6358 001E6258 A000398F */  lw         $25, 0xA0($25)
/* E635C 001E625C 09F82003 */  jalr       $25
/* E6360 001E6260 00000000 */   nop
/* E6364 001E6264 4000A427 */  addiu      $4, $sp, 0x40
/* E6368 001E6268 5000A527 */  addiu      $5, $sp, 0x50
/* E636C 001E626C 648D040C */  jal        DistVector__FPfPf
/* E6370 001E6270 00000000 */   nop
/* E6374 001E6274 06050046 */  mov.s      $f20, $f0
/* E6378 001E6278 5000A1C7 */  lwc1       $f1, 0x50($sp)
/* E637C 001E627C 4000A0C7 */  lwc1       $f0, 0x40($sp)
/* E6380 001E6280 01080046 */  sub.s      $f0, $f1, $f0
/* E6384 001E6284 6000A0E7 */  swc1       $f0, 0x60($sp)
/* E6388 001E6288 6400A0AF */  sw         $0, 0x64($sp)
/* E638C 001E628C 5800A1C7 */  lwc1       $f1, 0x58($sp)
/* E6390 001E6290 4800A0C7 */  lwc1       $f0, 0x48($sp)
/* E6394 001E6294 01080046 */  sub.s      $f0, $f1, $f0
/* E6398 001E6298 6800A0E7 */  swc1       $f0, 0x68($sp)
/* E639C 001E629C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* E63A0 001E62A0 6C00A2AF */  sw         $2, 0x6C($sp)
/* E63A4 001E62A4 6000A427 */  addiu      $4, $sp, 0x60
/* E63A8 001E62A8 282E8070 */  paddub     $5, $4, $0
/* E63AC 001E62AC 9285040C */  jal        sceVu0Normalize
/* E63B0 001E62B0 00000000 */   nop
/* E63B4 001E62B4 DC01023C */  lui        $2, %hi(D_1DC4540)
/* E63B8 001E62B8 40454424 */  addiu      $4, $2, %lo(D_1DC4540)
/* E63BC 001E62BC 6000A527 */  addiu      $5, $sp, 0x60
/* E63C0 001E62C0 8885040C */  jal        sceVu0InnerProduct
/* E63C4 001E62C4 00000000 */   nop
/* E63C8 001E62C8 06030046 */  mov.s      $f12, $f0
/* E63CC 001E62CC 9044040C */  jal        fptodp
/* E63D0 001E62D0 00000000 */   nop
/* E63D4 001E62D4 208085DF */  ld         $5, -0x7FE0($gp)
/* E63D8 001E62D8 28264070 */  paddub     $4, $2, $0
/* E63DC 001E62DC 6000040C */  jal        _dpfge
/* E63E0 001E62E0 00000000 */   nop
/* E63E4 001E62E4 04004010 */  beqz       $2, .L001E62F8
/* E63E8 001E62E8 00000000 */   nop
/* E63EC 001E62EC 100E0224 */  addiu      $2, $0, 0xE10
/* E63F0 001E62F0 DC01013C */  lui        $at, (0x1DC4560 >> 16)
/* E63F4 001E62F4 604522AC */  sw         $2, (0x1DC4560 & 0xFFFF)($at)
.L001E62F8:
/* E63F8 001E62F8 28260072 */  paddub     $4, $16, $0
/* E63FC 001E62FC 08009024 */  addiu      $16, $4, 0x8
/* E6400 001E6300 DC01013C */  lui        $at, (0x1DC4560 >> 16)
/* E6404 001E6304 6045258C */  lw         $5, (0x1DC4560 & 0xFFFF)($at)
/* E6408 001E6308 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E640C 001E630C 00000000 */   nop
/* E6410 001E6310 28260072 */  paddub     $4, $16, $0
/* E6414 001E6314 08009024 */  addiu      $16, $4, 0x8
/* E6418 001E6318 06A30046 */  mov.s      $f12, $f20
/* E641C 001E631C BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E6420 001E6320 00000000 */   nop
/* E6424 001E6324 789C828F */  lw         $2, -0x6388($gp)
/* E6428 001E6328 04004580 */  lb         $5, 0x4($2)
/* E642C 001E632C 28260072 */  paddub     $4, $16, $0
/* E6430 001E6330 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E6434 001E6334 00000000 */   nop
/* E6438 001E6338 01000224 */  addiu      $2, $0, 0x1
/* E643C 001E633C 3000BF7B */  lq         $31, 0x30($sp)
/* E6440 001E6340 2000B17B */  lq         $17, 0x20($sp)
/* E6444 001E6344 1000B07B */  lq         $16, 0x10($sp)
/* E6448 001E6348 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* E644C 001E634C 7000BD27 */  addiu      $sp, $sp, 0x70
/* E6450 001E6350 0800E003 */  jr         $31
/* E6454 001E6354 00000000 */   nop
/* E6458 001E6358 00000000 */  nop
/* E645C 001E635C 00000000 */  nop
