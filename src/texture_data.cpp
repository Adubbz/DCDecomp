#include "common.h"

/* Storage for the texture arena, and nothing more. dataset.cpp's own static initialiser is what
   builds it, together with the six allocators standing beside it, so naming its type here would
   ask for a second constructor call that retail does not make. postprocess_object.py gives this
   block the name the rest of the game reaches it by. */
u_long128 TextureDataStore[1];
