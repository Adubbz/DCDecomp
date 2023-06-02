.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel NowWeaponStatusValue__FP11WEAPON_HAVE
/* FBFB0 001FBEB0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* FBFB4 001FBEB4 3000BF7F */  sq         $31, 0x30($sp)
/* FBFB8 001FBEB8 2000B27F */  sq         $18, 0x20($sp)
/* FBFBC 001FBEBC 1000B17F */  sq         $17, 0x10($sp)
/* FBFC0 001FBEC0 0000B07F */  sq         $16, 0x0($sp)
/* FBFC4 001FBEC4 28968070 */  paddub     $18, $4, $0
/* FBFC8 001FBEC8 04004016 */  bnez       $18, .L001FBEDC
/* FBFCC 001FBECC 00000000 */   nop
/* FBFD0 001FBED0 28160070 */  paddub     $2, $0, $0
/* FBFD4 001FBED4 36000010 */  b          .L001FBFB0
/* FBFD8 001FBED8 00000000 */   nop
.L001FBEDC:
/* FBFDC 001FBEDC 28860070 */  paddub     $16, $0, $0
/* FBFE0 001FBEE0 14005186 */  lh         $17, 0x14($18)
/* FBFE4 001FBEE4 20C8080C */  jal        GetWeaponMaxExp__FP11WEAPON_HAVE
/* FBFE8 001FBEE8 00000000 */   nop
/* FBFEC 001FBEEC 2A082202 */  slt        $at, $17, $2
/* FBFF0 001FBEF0 07002010 */  beqz       $at, .L001FBF10
/* FBFF4 001FBEF4 00000000 */   nop
/* FBFF8 001FBEF8 B2000424 */  addiu      $4, $0, 0xB2
/* FBFFC 001FBEFC 6095858F */  lw         $5, -0x6AA0($gp)
/* FC000 001FBF00 4CC8080C */  jal        GetNowItemNum__FsP9ITEM_PACK
/* FC004 001FBF04 00000000 */   nop
/* FC008 001FBF08 02004018 */  blez       $2, .L001FBF14
/* FC00C 001FBF0C 00000000 */   nop
.L001FBF10:
/* FC010 001FBF10 02001036 */  ori        $16, $16, 0x2
.L001FBF14:
/* FC014 001FBF14 28264072 */  paddub     $4, $18, $0
/* FC018 001FBF18 8C33080C */  jal        WeaponStatusBreakEnable__FP11WEAPON_HAVE
/* FC01C 001FBF1C 00000000 */   nop
/* FC020 001FBF20 02004010 */  beqz       $2, .L001FBF2C
/* FC024 001FBF24 00000000 */   nop
/* FC028 001FBF28 04001036 */  ori        $16, $16, 0x4
.L001FBF2C:
/* FC02C 001FBF2C 08001036 */  ori        $16, $16, 0x8
/* FC030 001FBF30 4C00A0AF */  sw         $0, 0x4C($sp)
/* FC034 001FBF34 28264072 */  paddub     $4, $18, $0
/* FC038 001FBF38 4C00A527 */  addiu      $5, $sp, 0x4C
/* FC03C 001FBF3C 9C33080C */  jal        WeaponStatusBuildUp__FP11WEAPON_HAVERi
/* FC040 001FBF40 00000000 */   nop
/* FC044 001FBF44 0A004018 */  blez       $2, .L001FBF70
/* FC048 001FBF48 00000000 */   nop
/* FC04C 001FBF4C 28264072 */  paddub     $4, $18, $0
/* FC050 001FBF50 F4C7080C */  jal        GetNowWeaponAttachNum__FP11WEAPON_HAVE
/* FC054 001FBF54 00000000 */   nop
/* FC058 001FBF58 05004014 */  bnez       $2, .L001FBF70
/* FC05C 001FBF5C 00000000 */   nop
/* FC060 001FBF60 4C00A28F */  lw         $2, 0x4C($sp)
/* FC064 001FBF64 02004018 */  blez       $2, .L001FBF70
/* FC068 001FBF68 00000000 */   nop
/* FC06C 001FBF6C 10001036 */  ori        $16, $16, 0x10
.L001FBF70:
/* FC070 001FBF70 00004486 */  lh         $4, 0x0($18)
/* FC074 001FBF74 B0D4080C */  jal        IsNotBuildUpWeapon__Fi
/* FC078 001FBF78 00000000 */   nop
/* FC07C 001FBF7C 0B004010 */  beqz       $2, .L001FBFAC
/* FC080 001FBF80 00000000 */   nop
/* FC084 001FBF84 08000232 */  andi       $2, $16, 0x8
/* FC088 001FBF88 03004010 */  beqz       $2, .L001FBF98
/* FC08C 001FBF8C 00000000 */   nop
/* FC090 001FBF90 F7FF0224 */  addiu      $2, $0, -0x9
/* FC094 001FBF94 24800202 */  and        $16, $16, $2
.L001FBF98:
/* FC098 001FBF98 10000232 */  andi       $2, $16, 0x10
/* FC09C 001FBF9C 03004010 */  beqz       $2, .L001FBFAC
/* FC0A0 001FBFA0 00000000 */   nop
/* FC0A4 001FBFA4 EFFF0224 */  addiu      $2, $0, -0x11
/* FC0A8 001FBFA8 24800202 */  and        $16, $16, $2
.L001FBFAC:
/* FC0AC 001FBFAC 28160072 */  paddub     $2, $16, $0
.L001FBFB0:
/* FC0B0 001FBFB0 3000BF7B */  lq         $31, 0x30($sp)
/* FC0B4 001FBFB4 2000B27B */  lq         $18, 0x20($sp)
/* FC0B8 001FBFB8 1000B17B */  lq         $17, 0x10($sp)
/* FC0BC 001FBFBC 0000B07B */  lq         $16, 0x0($sp)
/* FC0C0 001FBFC0 5000BD27 */  addiu      $sp, $sp, 0x50
/* FC0C4 001FBFC4 0800E003 */  jr         $31
/* FC0C8 001FBFC8 00000000 */   nop
/* FC0CC 001FBFCC 00000000 */  nop
