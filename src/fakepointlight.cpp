#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "fakepointlight.hpp"

CFakePointLight::CFakePointLight() {
    this->unk_10[0] = this->unk_10[1] = this->unk_10[2] = this->unk_10[3] = 128.0f;
    this->unk_20 = 10.0f;
    this->unk_24 = 70.0f;
    this->unk_28 = 0;
}
