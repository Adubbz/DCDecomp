#include "language.h"

#include "mainselect.hpp"

// LOW CONFIDENCE: this file's name is a guess (see include/mainselect.hpp).
char main_select_param[256];

#ifdef PAL
s32 LanguageCode = LANG_ENGLISH_UK;
#else
s32 LanguageCode = LANG_ENGLISH_US;
#endif
s32 old_main_mode = -1;
#ifdef PAL
s32 DebugMode = 1;
#endif
