#pragma once

/* In-game item ids, recovered from the game's own commenu/meswin/system_1.mes
 * string table (see docs/RE/item_ids.md). NOT exhaustive: ids with no
 * recovered name are absent, so an id's absence here is not proof it is
 * invalid. */
enum Item {
    ITEM_ATTACH_START         = 81,
    ITEM_ATTACH_RESERVED_81   = 81,  /* flat +100 name lookup collides with an unrelated weapon name; likely an unused/reserved sentinel slot, not a real obtainable item */
    ITEM_ATTACH_FIRE          = 82,
    ITEM_ATTACH_ICE           = 83,
    ITEM_ATTACH_THUNDER       = 84,
    ITEM_ATTACH_WIND          = 85,
    /* 86-90: no recovered name in system_1.mes -- see Open Questions */
    ITEM_ATTACH_HOLY          = 91,
    ITEM_ATTACH_ATTACK        = 92,
    ITEM_ATTACH_ENDURANCE     = 93,
    ITEM_ATTACH_SPEED         = 94,
    ITEM_ATTACH_MAGICAL_POWER = 95,
    ITEM_GEM_GARNET           = 96,
    ITEM_GEM_AMETHYST         = 97,
    ITEM_GEM_AQUAMARINE       = 98,
    ITEM_GEM_DIAMOND          = 99,
    ITEM_GEM_EMERALD          = 100,
    ITEM_GEM_PEARL            = 101,
    ITEM_GEM_RUBY             = 102, /* gemstone -- distinct from the playable character "Ruby" */
    ITEM_GEM_PERIDOT          = 103,
    ITEM_GEM_SAPPHIRE         = 104,
    ITEM_GEM_OPAL             = 105,
    ITEM_GEM_TOPAZ            = 106,
    ITEM_GEM_TURQUOISE        = 107,
    /* 108-110: no recovered name in system_1.mes -- see Open Questions */
    ITEM_ENCHANT_SUN           = 111,
    ITEM_ENCHANT_DINOSLAYER    = 112,
    ITEM_ENCHANT_UNDEAD_BUSTER = 113,
    ITEM_ENCHANT_SEA_KILLER    = 114,
    ITEM_ENCHANT_STONE_BREAKER = 115,
    ITEM_ENCHANT_PLANT_BUSTER  = 116,
    ITEM_ENCHANT_BEAST_BUSTER  = 117,
    ITEM_ENCHANT_SKY_HUNTER    = 118,
    ITEM_ENCHANT_METAL_BREAKER = 119,
    ITEM_ENCHANT_MIMIC_BREAKER = 120,
    /* 121-131: no recovered name in system_1.mes -- see Open Questions */

    /* [132, 257): general dungeon inventory (CDngStatusData::dungeon_items).
     * Food/healing consumables, dungeon "gimmick" materials, and unique
     * key/puzzle items. Coverage below is a representative sample, not
     * exhaustive -- see docs/RE/item_ids.md for how to recover the rest. */
    ITEM_DUNGEON_START       = 132,
    ITEM_ENCHANT_MAGE_SLAYER = 132, /* right at the [81,132)/[132,257) boundary */
    ITEM_AMULET_ANTI_FREEZE  = 133,
    ITEM_AMULET_ANTI_CURSE   = 134,
    ITEM_AMULET_ANTI_GOO     = 135,
    ITEM_AMULET_ANTIDOTE     = 136,
    ITEM_FLUFFY_DOUGHNUT     = 137,
    ITEM_FISH_CANDY          = 138,
    ITEM_GRASS_CAKE          = 139,
    ITEM_WITCH_PARFAIT       = 140,
    ITEM_SCORPION_JERKY      = 141,
    ITEM_CARROT_COOKIE       = 142,
    ITEM_REGULAR_WATER       = 146,
    ITEM_TASTY_WATER         = 147,
    ITEM_PREMIUM_WATER       = 148,
    ITEM_BREAD               = 149,
    ITEM_PREMIUM_CHICKEN     = 150,
    ITEM_STAMINA_DRINK       = 151,
    ITEM_ANTIDOTE_DRINK      = 152,
    ITEM_HOLY_WATER          = 153,
    ITEM_SOAP                = 154,
    ITEM_MIGHTY_HEALING      = 155,
    ITEM_CHEESE              = 159,
    ITEM_BOMB                = 160,
    ITEM_STONE               = 161,
    ITEM_FIRE_GEM            = 162, /* throwable elemental bomb; distinct item family from ITEM_ATTACH_FIRE etc. */
    ITEM_ICE_GEM             = 163,
    ITEM_THUNDER_GEM         = 164,
    ITEM_WIND_GEM            = 165,
    ITEM_HOLY_GEM            = 166,
    ITEM_WARP_POWDER         = 174,
    ITEM_STAND_IN_POWDER     = 175,
    ITEM_ESCAPE_POWDER       = 176,
    ITEM_REVIVAL_POWDER      = 177,
    ITEM_REPAIR_POWDER       = 178,
    ITEM_POWERUP_POWDER      = 179,
    ITEM_TREASURE_KEY        = 182,
    ITEM_EVY                 = 195, /* LostGateKey group -- fetch/trade item, not literally a key; see docs/RE/item_ids.md */
    ITEM_DRANS_CREST         = 196, /* LostGateKey group */
    ITEM_SHINY_STONE         = 197,
    ITEM_MIMI                = 198, /* LostGateKey group */
    ITEM_RED_BERRY           = 199,
    ITEM_PRICKLY             = 200,
    ITEM_CANDY               = 201, /* LostGateKey group */
    ITEM_HOOK                = 202, /* LostGateKey group */
    ITEM_KINGS_SLATE         = 203, /* LostGateKey group */
    ITEM_GUN_POWDER          = 204, /* LostGateKey group */
    ITEM_CLOCK_HANDS         = 205, /* LostGateKey group */
    ITEM_POINTY_CHESTNUT     = 206, /* LostGateKey group */
    ITEM_BLACK_KNIGHT_CREST  = 207,
    ITEM_HORNED_KEY          = 208,
    ITEM_MUSIC_BOX_KEY       = 210,
    ITEM_SUN_SIGNET          = 211,
    ITEM_MOON_SIGNET         = 212,
    ITEM_ADMISSION_TICKET    = 213,
    ITEM_BONE_KEY            = 217,
    ITEM_MOUSTACHE_KEY       = 218,
    ITEM_SHIPCABIN_KEY       = 219,
    ITEM_STONE_KEY           = 220,
    ITEM_PITCHDARK_KEY       = 222,
    ITEM_SILVER_KEY          = 224,
    ITEM_SECRET_PATH_KEY     = 229,
    ITEM_CRYSTAL_EYEBALL     = 233, /* scripted/story item, never stored in dungeon_items -- see GetItem's special-casing */
    ITEM_MAP                 = 234, /* scripted/story item, never stored in dungeon_items */
    ITEM_CAVE_KEY            = 237,
    ITEM_CHANGING_POTION     = 238, /* scripted/story item, never stored -- sets CDngStatusData::special_flag_238 instead */
    ITEM_FLAME_KEY           = 249,
    ITEM_DUNGEON_END         = 255,

    /* [257, +): weapons (CDngStatusData::chara_weapons), split into 6
     * per-character categories by CheckWeaponUser. Only the two boundary
     * ids below are individually confirmed; a weapon's *displayed* name
     * changes as it's combined/upgraded while keeping the same item id
     * (e.g. Toan's Dagger becomes Baselard, Gladius, ... Atlamillia Sword),
     * so the bulk of this range intentionally has no fixed name-to-id
     * mapping here -- see docs/RE/item_ids.md for the recovered per-
     * category weapon-name chains (high confidence for Toan/swords,
     * moderate-high but not individually id-verified for the rest). */
    ITEM_WEAPON_START       = 257,
    ITEM_WEAPON_SLOT_EMPTY  = 257, /* reserved/placeholder "empty weapon slot" sentinel, not a real weapon */
    ITEM_WEAPON_TOAN_DAGGER = 258, /* Toan's starting weapon -- see CDngStatusData::Initialize's GetItem(258, 0) */
    /* [257, 299): Toan   (Boy from Norune)   -- Swords */
    /* [299, 314): Xiao   (Cat girl)          -- Slingshots */
    /* [314, 331): Goro   (Hellion of Woods)  -- Mallets/Hammers/Axes */
    /* [331, 347): Ruby   (Genie)             -- Rings/Armlets */
    /* [347, 363): Ungaga (Desert Warrior)    -- Spears/Polearms */
    /* [363, 377): Osmond (Moon Inventor)     -- Guns */
};

inline int GetDungeonItemStart() {
    return ITEM_ENCHANT_MAGE_SLAYER;
}

inline int GetDungeonItemEnd() {
    return ITEM_WEAPON_SLOT_EMPTY;
}
