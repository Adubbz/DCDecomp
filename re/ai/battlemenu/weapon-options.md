# Weapon option message display

Retail `MenuMes` is LOCAL at 0x1D903F0 with size 0x20. The six
MenuClsMes methods access fields through 0x1C; no base or vtable is present.
InitData sets +8/+C to 366/166, clears mode (+0 byte), option flags
(+0x10 word), option count (+4 halfword), and the unknown halfword +6.
NowWeaponStatus stores WEAPON_HAVE* at +0x14, merges the base +0xEE flags
with six attachment +4 flags at 0x20 stride, and cancels opposed options
through CheckWeaponOptionStatus. Bits 1 through 13 become system messages
70 through 82 in ClsMes::mes_no. Changed messages rebuild window 422.
Draw1 uses +2 as sprite alpha and writes it to ClsMes::edge_alpha; Step reads
signed-byte mode 1 or 2 to update the weapon and advance the window.
InitMes stores the address of GLOBAL EastKingMsgCls (0x1DA9080, 0x17B8
bytes) at +0x1C. Its owning declaration belongs in eastking.hpp.

The initial targeted sweep rejected InitData, InitMes, NowWeaponStatus,
Step, DrawBtlAtoraSelect and BtlDrawOption for missing fields/includes.

## Judged candidates and outstanding dependencies

InitMes produces objdiff 100% but checker BLOCKED: one relocation low half
references shifted EastKingMsgCls BSS. Retain the assembly marker. Its entire
candidate body is `message = &EastKingMsgCls;`; the future defining-unit
header declaration is `extern ClsMes EastKingMsgCls;` in eastking.hpp, with
ClsMes forward declared. The unused declaration is omitted until migration
can preserve the linked address.

NowWeaponStatus's best candidate below produces 97.07865% object similarity.
The remaining differences include attachment indexing load/shift order,
message slot address addition operand order and loop temporary registers.
The final clearing loop counter must be int: m2c incorrectly guesses short,
which inserts narrowing instructions. The function stays assembly-backed.
ATTACH_LIST::unk_04 is demonstrably option_flags (signed halfword):
NowWeaponStatus loads attachment+4 and ORs it with the weapon's flags before
CheckWeaponOptionStatus cancels opposing bits. A future shared-header rename
should call it `option_flags` and describe these contributed weapon options.

WhoIsWeaponEquip's retail body returns either -1 or a sign-extended owner
byte from WEAPON_DATA+0xA. Its existing s8 contract made the new battle-menu
caller emit an additional sign extension absent from retail. The int return
contract preserves WhoIsWeaponEquip's PERFECT match and lets
EnableWeaponElemNone match. The header describes the weapon-definition
owner, rather than currently equipped character, to match its implementation.

## Compiler comparison spelling

MWCC emits different temporary registers for equivalent comparisons.
KastumSelectDown's `row < 7` uses $3, whereas `row <= 6` emits the retail
$at comparison. GetMenuIconPos similarly needs `next > 4` rather than
`next >= 5`. EnableWeaponElemNone uses unsigned difference `<= 1U` rather
than `< 2U`. These forms preserve the same arithmetic and retail behavior.
MenuClsMes::Step needs switch cases in order 0, 1, 2; reversing them changes
comparison order. The two customization helpers retain the unchecked shift
counts and row bounds present in retail.

## Near-match source for the next pass

```cpp
void MenuClsMes::NowWeaponStatus(WEAPON_HAVE *selected_weapon) {
    weapon = selected_weapon;
    option_flags = 1;
    option_count = 0;
    if (selected_weapon != NULL) {
        option_flags = selected_weapon->flags;
        for (int slot = 0; slot < 6; slot++) {
            s16 attachment_flags = weapon->attach[slot].unk_04;
            if (attachment_flags != 0 && attachment_flags != 1) {
                option_flags |= attachment_flags;
            }
        }
        option_flags = CheckWeaponOptionStatus(option_flags);
        option_count = 0;
        int changed = 0;
        for (int bit = 1; bit < 14; bit++) {
            if (option_flags & (1 << bit)) {
                int message_no = bit + 69;
                ClsMes *window = message;
                int &slot = window->mes_no[option_count];
                if (message_no != slot) {
                    changed = 1;
                }
                slot = message_no;
                option_count++;
            }
        }
        for (int slot = option_count; slot < 10; slot++) {
            message->mes_no[slot] = 0;
        }
        if (changed != 0) {
            message->mes_made = -1;
            message->MakeMesWin(422);
        }
    }
}

```
