#include "common.h"

INCLUDE_ASM("main", _setlocale_r);
INCLUDE_ASM("main", _localeconv_r);
INCLUDE_ASM("main", setlocale);
INCLUDE_ASM("main", localeconv);
