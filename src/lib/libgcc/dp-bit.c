#include "common.h"

INCLUDE_ASM("main", __pack_d);
INCLUDE_ASM("main", __unpack_d);
INCLUDE_ASM("main", _fpadd_parts);
INCLUDE_ASM("main", dpadd);
INCLUDE_ASM("main", dpsub);
INCLUDE_ASM("main", dpmul);
INCLUDE_ASM("main", dpdiv);
INCLUDE_ASM("main", __fpcmp_parts_d);
INCLUDE_ASM("main", dpcmp);
INCLUDE_ASM("main", litodp);
INCLUDE_ASM("main", dptoli);
INCLUDE_ASM("main", dptoul);
INCLUDE_ASM("main", __negdf2);
INCLUDE_ASM("main", __make_dp);
INCLUDE_ASM("main", dptofp);
