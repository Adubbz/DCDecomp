#ifdef NON_MATCHING
#include "cloth.hpp"
STATIC_ASSERT((int) &((CCloth *) 0)->num_i == 0x2C);
STATIC_ASSERT((int) &((CCloth *) 0)->num_j == 0x30);
STATIC_ASSERT((int) &((CCloth *) 0)->frame == 0x3C);
STATIC_ASSERT((int) &((CCloth *) 0)->position[0] == 0x100);
STATIC_ASSERT((int) &((CCloth *) 0)->last_position[0] == 0xF0);
STATIC_ASSERT((int) &((CCloth *) 0)->home[0][0][0] == 0x110);
STATIC_ASSERT((int) &((CCloth *) 0)->point[0][0][0] == 0x1110);
STATIC_ASSERT((int) &((CCloth *) 0)->last[0][0][0] == 0x2110);
STATIC_ASSERT((int) &((CCloth *) 0)->rest[0][0][0] == 0x3110);
STATIC_ASSERT((int) &((CCloth *) 0)->speed[0][0][0] == 0x4110);
STATIC_ASSERT((int) &((CCloth *) 0)->normal_grid[0][0][0] == 0x5110);
STATIC_ASSERT((int) &((CCloth *) 0)->texture_coord[0][0][0] == 0x6110);
#endif
