#include "fader.hpp"

#ifdef NON_MATCHING
int Fader::In(void) {
    if (this->value < 0x80) {
        this->value += 4;
        if (this->value > 0x80) {
            this->value = 0x80;
        }
        return 0;
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/fader", In__5FaderFv);
#endif

#ifdef NON_MATCHING
int Fader::Out(void) {
    if (this->value > 0) {
        this->value -= 4;
        return 0;
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/fader", Out__5FaderFv);
#endif

#ifdef NON_MATCHING
int Fader::Get(int maximum) {
    return (int) ((float) this->value / 128.0f * (float) maximum);
}
#else
INCLUDE_ASM("asm/nonmatchings/fader", Get__5FaderFi);
#endif
