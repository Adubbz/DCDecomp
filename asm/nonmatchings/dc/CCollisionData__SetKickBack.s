.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetKickBack__14CCollisionDataFPfffi
/* B5BE0 001B5AE0 0000A0C4 */  lwc1       $f0, 0x0($5)
/* B5BE4 001B5AE4 803D878C */  lw         $7, 0x3D80($4)
/* B5BE8 001B5AE8 80180700 */  sll        $3, $7, 2
/* B5BEC 001B5AEC 21186700 */  addu       $3, $3, $7
/* B5BF0 001B5AF0 40190300 */  sll        $3, $3, 5
/* B5BF4 001B5AF4 21186400 */  addu       $3, $3, $4
/* B5BF8 001B5AF8 800060E4 */  swc1       $f0, 0x80($3)
/* B5BFC 001B5AFC 0400A0C4 */  lwc1       $f0, 0x4($5)
/* B5C00 001B5B00 803D878C */  lw         $7, 0x3D80($4)
/* B5C04 001B5B04 80180700 */  sll        $3, $7, 2
/* B5C08 001B5B08 21186700 */  addu       $3, $3, $7
/* B5C0C 001B5B0C 40190300 */  sll        $3, $3, 5
/* B5C10 001B5B10 21186400 */  addu       $3, $3, $4
/* B5C14 001B5B14 840060E4 */  swc1       $f0, 0x84($3)
/* B5C18 001B5B18 0800A0C4 */  lwc1       $f0, 0x8($5)
/* B5C1C 001B5B1C 803D858C */  lw         $5, 0x3D80($4)
/* B5C20 001B5B20 80180500 */  sll        $3, $5, 2
/* B5C24 001B5B24 21186500 */  addu       $3, $3, $5
/* B5C28 001B5B28 40190300 */  sll        $3, $3, 5
/* B5C2C 001B5B2C 21186400 */  addu       $3, $3, $4
/* B5C30 001B5B30 880060E4 */  swc1       $f0, 0x88($3)
/* B5C34 001B5B34 803D858C */  lw         $5, 0x3D80($4)
/* B5C38 001B5B38 80180500 */  sll        $3, $5, 2
/* B5C3C 001B5B3C 21186500 */  addu       $3, $3, $5
/* B5C40 001B5B40 40190300 */  sll        $3, $3, 5
/* B5C44 001B5B44 21186400 */  addu       $3, $3, $4
/* B5C48 001B5B48 90006CE4 */  swc1       $f12, 0x90($3)
/* B5C4C 001B5B4C 803D858C */  lw         $5, 0x3D80($4)
/* B5C50 001B5B50 80180500 */  sll        $3, $5, 2
/* B5C54 001B5B54 21186500 */  addu       $3, $3, $5
/* B5C58 001B5B58 40190300 */  sll        $3, $3, 5
/* B5C5C 001B5B5C 21186400 */  addu       $3, $3, $4
/* B5C60 001B5B60 94006DE4 */  swc1       $f13, 0x94($3)
/* B5C64 001B5B64 803D858C */  lw         $5, 0x3D80($4)
/* B5C68 001B5B68 80180500 */  sll        $3, $5, 2
/* B5C6C 001B5B6C 21186500 */  addu       $3, $3, $5
/* B5C70 001B5B70 40190300 */  sll        $3, $3, 5
/* B5C74 001B5B74 21186400 */  addu       $3, $3, $4
/* B5C78 001B5B78 980066AC */  sw         $6, 0x98($3)
/* B5C7C 001B5B7C 0800E003 */  jr         $31
/* B5C80 001B5B80 00000000 */   nop
/* B5C84 001B5B84 00000000 */  nop
/* B5C88 001B5B88 00000000 */  nop
/* B5C8C 001B5B8C 00000000 */  nop
