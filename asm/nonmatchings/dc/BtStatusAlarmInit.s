.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtStatusAlarmInit__Fv
/* B0360 001B0260 80000524 */  addiu      $5, $0, 0x80
/* B0364 001B0264 A09385AF */  sw         $5, -0x6C60($gp)
/* B0368 001B0268 A49380AF */  sw         $0, -0x6C5C($gp)
/* B036C 001B026C 40000324 */  addiu      $3, $0, 0x40
/* B0370 001B0270 A89383A3 */  sb         $3, -0x6C58($gp)
/* B0374 001B0274 C1000324 */  addiu      $3, $0, 0xC1
/* B0378 001B0278 A99383A3 */  sb         $3, -0x6C57($gp)
/* B037C 001B027C 82000324 */  addiu      $3, $0, 0x82
/* B0380 001B0280 AA9383A3 */  sb         $3, -0x6C56($gp)
/* B0384 001B0284 AB9385A3 */  sb         $5, -0x6C55($gp)
/* B0388 001B0288 FF000424 */  addiu      $4, $0, 0xFF
/* B038C 001B028C AC9384A3 */  sb         $4, -0x6C54($gp)
/* B0390 001B0290 AD9385A3 */  sb         $5, -0x6C53($gp)
/* B0394 001B0294 AE9380A3 */  sb         $0, -0x6C52($gp)
/* B0398 001B0298 AF9385A3 */  sb         $5, -0x6C51($gp)
/* B039C 001B029C B09384A3 */  sb         $4, -0x6C50($gp)
/* B03A0 001B02A0 B19380A3 */  sb         $0, -0x6C4F($gp)
/* B03A4 001B02A4 C6000324 */  addiu      $3, $0, 0xC6
/* B03A8 001B02A8 B29383A3 */  sb         $3, -0x6C4E($gp)
/* B03AC 001B02AC B39385A3 */  sb         $5, -0x6C4D($gp)
/* B03B0 001B02B0 B49384A3 */  sb         $4, -0x6C4C($gp)
/* B03B4 001B02B4 B59380A3 */  sb         $0, -0x6C4B($gp)
/* B03B8 001B02B8 B69380A3 */  sb         $0, -0x6C4A($gp)
/* B03BC 001B02BC B79385A3 */  sb         $5, -0x6C49($gp)
/* B03C0 001B02C0 B89380A3 */  sb         $0, -0x6C48($gp)
/* B03C4 001B02C4 81000324 */  addiu      $3, $0, 0x81
/* B03C8 001B02C8 B99383A3 */  sb         $3, -0x6C47($gp)
/* B03CC 001B02CC BA9384A3 */  sb         $4, -0x6C46($gp)
/* B03D0 001B02D0 BB9385A3 */  sb         $5, -0x6C45($gp)
/* B03D4 001B02D4 BC9384A3 */  sb         $4, -0x6C44($gp)
/* B03D8 001B02D8 20000324 */  addiu      $3, $0, 0x20
/* B03DC 001B02DC BD9383A3 */  sb         $3, -0x6C43($gp)
/* B03E0 001B02E0 BE9380A3 */  sb         $0, -0x6C42($gp)
/* B03E4 001B02E4 BF9385A3 */  sb         $5, -0x6C41($gp)
/* B03E8 001B02E8 3F000424 */  addiu      $4, $0, 0x3F
/* B03EC 001B02EC C09384A3 */  sb         $4, -0x6C40($gp)
/* B03F0 001B02F0 C19380A3 */  sb         $0, -0x6C3F($gp)
/* B03F4 001B02F4 31000324 */  addiu      $3, $0, 0x31
/* B03F8 001B02F8 C29383A3 */  sb         $3, -0x6C3E($gp)
/* B03FC 001B02FC C39385A3 */  sb         $5, -0x6C3D($gp)
/* B0400 001B0300 C49384A3 */  sb         $4, -0x6C3C($gp)
/* B0404 001B0304 C59380A3 */  sb         $0, -0x6C3B($gp)
/* B0408 001B0308 C69380A3 */  sb         $0, -0x6C3A($gp)
/* B040C 001B030C C79385A3 */  sb         $5, -0x6C39($gp)
/* B0410 001B0310 0800E003 */  jr         $31
/* B0414 001B0314 00000000 */   nop
/* B0418 001B0318 00000000 */  nop
/* B041C 001B031C 00000000 */  nop
