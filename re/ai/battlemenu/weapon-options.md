# Weapon option message display

Retail `MenuMes` is LOCAL at 0x1D903F0 with size 0x20. The six
MenuClsMes methods access fields through 0x1C; no base or vtable is present.
InitData sets +8/+C to 366/166, clears mode (+0 byte), option flags
(+0x10 word), option count (+4 halfword), and the unknown halfword +6.
NowWeaponStatus stores WEAPON_HAVE* at +0x14, merges the base +0xEE flags
with six attachment +4 flags at 0x20 stride, and cancels opposed options
through CheckWeaponOptionStatus. Bits 1 through 13 become system messages
70 through 82 in ClsMes::mes_no. Changed messages rebuild window 422.
Draw1 uses +2 as sprite alpha and writes it to ClsMes::alpha; Step reads
signed-byte mode 1 or 2 to update the weapon and advance the window.
InitMes stores the address of GLOBAL EastKingMsgCls (0x1DA9080, 0x17B8
bytes) at +0x1C. Its owning declaration belongs in eastking.hpp.

The initial targeted sweep rejected InitData, InitMes, NowWeaponStatus,
Step, DrawBtlAtoraSelect and BtlDrawOption for missing fields/includes.
