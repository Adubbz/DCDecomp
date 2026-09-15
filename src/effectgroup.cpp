#include "effectgroup.hpp"

#include "effect.hpp"

#ifdef NON_MATCHING
int CEffectGroup::EnterEffect(CEffectParam *parameters) {
    for (int i = 0; i < capacity; i++) {
        if (effect_table[i].active == 0) {
            effect_table[i].SetEffect(parameters);
            return 1;
        }
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/effectgroup", EnterEffect__12CEffectGroupFP12CEffectParam);
#endif

#ifdef NON_MATCHING
void CEffectGroup::Step(int unused) {
    for (int i = 0; i < capacity; i++) {
        effect_table[i].Step(1);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/effectgroup", Step__12CEffectGroupFi);
#endif

#ifdef NON_MATCHING
void CEffectGroup::Draw(void) {
    for (int i = 0; i < capacity; i++) {
        effect_table[i].Draw();
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/effectgroup", Draw__12CEffectGroupFv);
#endif

#ifdef NON_MATCHING
void CEffectGroup::Clear(void) {
    for (int i = 0; i < capacity; i++) {
        effect_table[i].Initialize();
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/effectgroup", Clear__12CEffectGroupFv);
#endif

#ifdef NON_MATCHING
void CEffectGroup::Initialize(CEffect *table, int count) {
    effect_table = table;
    capacity = count;
}
#else
INCLUDE_ASM("asm/nonmatchings/effectgroup", Initialize__12CEffectGroupFP7CEffecti);
#endif
