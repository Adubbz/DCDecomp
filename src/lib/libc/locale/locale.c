#include "common.h"

INCLUDE_ASM("asm/nonmatchings/lib/libc/locale/locale", _setlocale_r);
INCLUDE_ASM("asm/nonmatchings/lib/libc/locale/locale", _localeconv_r);
INCLUDE_ASM("asm/nonmatchings/lib/libc/locale/locale", setlocale);
INCLUDE_ASM("asm/nonmatchings/lib/libc/locale/locale", localeconv);
