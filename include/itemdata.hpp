#pragma once

#include "common.h"

/**
 * @file
 * Item, weapon and attachment definitions, and their accessors.
 */

/**
 * In-game item ids.
 */
enum Item {
    ITEM_ATTACH_START                  = 81,
    ITEM_CONSUMABLE_START              = 81,
    ITEM_ATTACH_FIRE                   = 81,
    ITEM_ATTACH_ICE                    = 82,
    ITEM_ATTACH_THUNDER                = 83,
    ITEM_ATTACH_WIND                   = 84,
    ITEM_ATTACH_HOLY                   = 85,
    ITEM_ATTACH_ATTACK                 = 91,
    ITEM_ATTACH_ENDURANCE              = 92,
    ITEM_ATTACH_SPEED                  = 93,
    ITEM_ATTACH_MAGICAL_POWER          = 94,
    ITEM_ATTACH_GARNET                 = 95,
    ITEM_ATTACH_AMETHYST               = 96,
    ITEM_ATTACH_AQUAMARINE             = 97,
    ITEM_ATTACH_DIAMOND                = 98,
    ITEM_ATTACH_EMERALD                = 99,
    ITEM_ATTACH_PEARL                  = 100,
    ITEM_ATTACH_RUBY                   = 101,
    ITEM_ATTACH_PERIDOT                = 102,
    ITEM_ATTACH_SAPPHIRE               = 103,
    ITEM_ATTACH_OPAL                   = 104,
    ITEM_ATTACH_TOPAZ                  = 105,
    ITEM_ATTACH_TURQUOISE              = 106,
    ITEM_ATTACH_SUN                    = 107,
    ITEM_ATTACH_DINOSLAYER             = 111,
    ITEM_ATTACH_UNDEAD_BUSTER          = 112,
    ITEM_ATTACH_SEA_KILLER             = 113,
    ITEM_ATTACH_STONE_BREAKER          = 114,
    ITEM_ATTACH_PLANT_BUSTER           = 115,
    ITEM_ATTACH_BEAST_BUSTER           = 116,
    ITEM_ATTACH_SKY_HUNTER             = 117,
    ITEM_ATTACH_METALBREAKER           = 118,
    ITEM_ATTACH_MIMIC_BREAKER          = 119,
    ITEM_ATTACH_MAGE_SLAYER            = 120,
    ITEM_DUNGEON_START                 = 132,
    ITEM_ANTI_FREEZE_AMULET            = 132,
    ITEM_ANTICURSEAMULET               = 133,
    ITEM_ANTIGOO_AMULET                = 134,
    ITEM_ANTIDOTE_AMULET               = 135,
    ITEM_FLUFFY_DOUGHNUT               = 136,
    ITEM_FISH_CANDY                    = 137,
    ITEM_GRASS_CAKE                    = 138,
    ITEM_WITCH_PARFAIT                 = 139,
    ITEM_SCORPION_JERKY                = 140,
    ITEM_CARROT_COOKIE                 = 141,
    ITEM_DUMMY                         = 142,
    ITEM_REGULAR_WATER                 = 145,
    ITEM_TASTY_WATER                   = 146,
    ITEM_PREMIUM_WATER                 = 147,
    ITEM_BREAD                         = 148,
    ITEM_PREMIUM_CHICKEN               = 149,
    ITEM_STAMINA_DRINK                 = 150,
    ITEM_ANTIDOTE_DRINK                = 151,
    ITEM_HOLY_WATER                    = 152,
    ITEM_SOAP                          = 153,
    ITEM_MIGHTY_HEALING                = 154,
    ITEM_CHEESE                        = 155,
    ITEM_BOMB                          = 159,
    ITEM_STONE                         = 160,
    ITEM_FIRE_GEM                      = 161,
    ITEM_ICE_GEM                       = 162,
    ITEM_THUNDER_GEM                   = 163,
    ITEM_WIND_GEM                      = 164,
    ITEM_HOLY_GEM                      = 165,
    ITEM_THROBBING_CHERRY              = 166,
    ITEM_GOOEY_PEACH                   = 167,
    ITEM_BOMB_NUTS                     = 168,
    ITEM_POISONOUS_APPLE               = 169,
    ITEM_MELLOW_BANANA                 = 170,
    ITEM_MEDUSA_POWDER                 = 171,
    ITEM_HARDENING_POWDER              = 172,
    ITEM_WARP_POWDER                   = 173,
    ITEM_STAND_IN_POWDER               = 174,
    ITEM_ESCAPE_POWDER                 = 175,
    ITEM_REVIVAL_POWDER                = 176,
    ITEM_REPAIR_POWDER                 = 177,
    ITEM_POWERUP_POWDER                = 178,
    ITEM_POCKET                        = 179,
    ITEM_FRUIT_OF_EDEN                 = 180,
    ITEM_TREASURE_KEY                  = 181,
    ITEM_GOURD                         = 182,
    ITEM_AUTO_REPAIR_POWDER            = 183,
    ITEM_FISHING_ROD                   = 185,
    ITEM_CARROT                        = 186,
    ITEM_POTATO_CAKE                   = 187,
    ITEM_MINON                         = 188,
    ITEM_BATTAN                        = 189,
    ITEM_PETITE_FISH                   = 190,
    ITEM_SAVING_BOOK                   = 191,
    ITEM_GOLD_BULLION                  = 192,
    ITEM_EVY                           = 193,
    ITEM_DRAN_S_CREST                  = 195,
    ITEM_SHINY_STONE                   = 196,
    ITEM_MIMI                          = 197,
    ITEM_RED_BERRY                     = 198,
    ITEM_PRICKLY                       = 199,
    ITEM_CANDY                         = 200,
    ITEM_HOOK                          = 201,
    ITEM_KING_S_SLATE                  = 202,
    ITEM_GUN_POWDER                    = 203,
    ITEM_CLOCK_HANDS                   = 204,
    ITEM_POINTY_CHESTNUT               = 205,
    ITEM_BLACK_KNIGHT_CREST            = 206,
    ITEM_HORNED_KEY                    = 207,
    ITEM_MOON_GRASS_SEED               = 208,
    ITEM_MUSIC_BOX_KEY                 = 209,
    ITEM_SUN_SIGNET                    = 210,
    ITEM_MOON_SIGNET                   = 211,
    ITEM_ADMISSION_TICKET              = 212,
    ITEM_SUN_SWORD                     = 213,
    ITEM_BONE_KEY                      = 216,
    ITEM_MOUSTACHE_KEY                 = 217,
    ITEM_SHIPCABIN_KEY                 = 218,
    ITEM_STONE_KEY                     = 219,
    ITEM_HANDLE                        = 220,
    ITEM_PITCHDARK_KEY                 = 221,
    ITEM_SILVER_KEY                    = 222,
    ITEM_TRAM_OIL                      = 224,
    ITEM_SUN_DEW                       = 225,
    ITEM_FLAPPING_FISH                 = 226,
    ITEM_ROTTEN_FISH                   = 227,
    ITEM_SECRET_PATH_KEY               = 228,
    ITEM_BRAVERY_LAUNCH                = 229,
    ITEM_FLAPPING_DUSTER               = 230,
    ITEM_CRYSTAL_EYEBALL               = 231,
    ITEM_MAP                           = 233,
    ITEM_MAGICAL_CRYSTAL               = 234,
    ITEM_DRAN_S_FEATHER                = 235,
    ITEM_CAVE_KEY                      = 236,
    ITEM_CHANGING_POTION               = 237,
    ITEM_WORLDMAP                      = 238,
    ITEM_BONE_PENDANT                  = 239,
    ITEM_ODD_TONE_FLUTE                = 240,
    ITEM_MAGICAL_LAMP                  = 241,
    ITEM_MOON_ORB                      = 242,
    ITEM_SHELL_RING                    = 243,
    ITEM_SEARCH_WARRANT                = 244,
    ITEM_ICE_BLOCK                     = 245,
    ITEM_SMALL_ICE                     = 246,
    ITEM_TINY_ICE                      = 247,
    ITEM_FLAME_KEY                     = 248,
    ITEM_HUNTER_S_EARRING              = 249,
    ITEM_OINTMENT_LEAF                 = 250,
    ITEM_FOUNDATION                    = 251,
    ITEM_CLAY_DOLL                     = 252,
    ITEM_MANUAL                        = 253,
    ITEM_SUN_SPHERE                    = 254,
    ITEM_DUNGEON_END                   = 255,
    ITEM_ALMIGHTY_PASS                 = 255,
    ITEM_WEAPON_START                  = 257,
    ITEM_WEAPON_SLOT_EMPTY             = 257,
    ITEM_WEAPON_DAGGER_BROKEN          = 257,
    ITEM_WEAPON_DAGGER                 = 258,
    ITEM_WEAPON_BASELARD               = 259,
    ITEM_WEAPON_GLADIUS                = 260,
    ITEM_WEAPON_WISE_OWL_SWORD         = 261,
    ITEM_WEAPON_CRYSKNIFE              = 262,
    ITEM_WEAPON_ANTIQUE_SWORD          = 263,
    ITEM_WEAPON_BUSTER_SWORD           = 264,
    ITEM_WEAPON_KITCHEN_KNIFE          = 265,
    ITEM_WEAPON_TSUKIKAGE              = 266,
    ITEM_WEAPON_SUN_SWORD              = 267,
    ITEM_WEAPON_SERPENT_SWORD          = 268,
    ITEM_WEAPON_MACHO_SWORD            = 269,
    ITEM_WEAPON_SHAMSHIR               = 270,
    ITEM_WEAPON_HEAVEN_S_CLOUD         = 271,
    ITEM_WEAPON_LAMB_S_SWORD           = 272,
    ITEM_WEAPON_DARK_CLOUD             = 273,
    ITEM_WEAPON_BRAVE_ARK              = 274,
    ITEM_WEAPON_BIG_BANG               = 275,
    ITEM_WEAPON_ATLAMILLIA_SWORD       = 276,
    ITEM_WEAPON_WEAPON_NO_277          = 277,
    ITEM_WEAPON_MARDAN_EINS            = 278,
    ITEM_WEAPON_MARDAN_TWEI            = 279,
    ITEM_WEAPON_ARISE_MARDAN           = 280,
    ITEM_WEAPON_AGA_S_SWORD            = 281,
    ITEM_WEAPON_EVILCISE               = 282,
    ITEM_WEAPON_SMALL_SWORD            = 283,
    ITEM_WEAPON_SAND_BREAKER           = 284,
    ITEM_WEAPON_DRAIN_SEEKER           = 285,
    ITEM_WEAPON_CHOPPER                = 286,
    ITEM_WEAPON_CHOORA                 = 287,
    ITEM_WEAPON_CLAYMORE               = 288,
    ITEM_WEAPON_MANEATER               = 289,
    ITEM_WEAPON_BONE_RAPIER            = 290,
    ITEM_WEAPON_SAX                    = 291,
    ITEM_WEAPON_7BRANCH_SWORD          = 292,
    ITEM_WEAPON_DUSACK                 = 293,
    ITEM_WEAPON_CROSS_HINDER           = 294,
    ITEM_WEAPON_7THHEAVEN              = 295,
    ITEM_WEAPON_SWORD_OF_ZEUS          = 296,
    ITEM_WEAPON_CHRONICLE_SWORD        = 297,
    ITEM_WEAPON_CHRONICLE2             = 298,
    ITEM_WEAPON_WOODENSLINGSHOT_BROKEN = 299,
    ITEM_WEAPON_WOODEN_SLINGSHOT       = 300,
    ITEM_WEAPON_STEEL_SLINGSHOT        = 301,
    ITEM_WEAPON_BANDIT_SLINGSHOT       = 302,
    ITEM_WEAPON_STEVE                  = 303,
    ITEM_WEAPON_BONE_SLINGSHOT         = 304,
    ITEM_WEAPON_HARDSHOOTER            = 305,
    ITEM_WEAPON_DOUBLE_IMPACT          = 306,
    ITEM_WEAPON_DRAGON_S_Y             = 307,
    ITEM_WEAPON_DIVINEBEASTTITLE       = 308,
    ITEM_WEAPON_ANGEL_SHOOTER          = 309,
    ITEM_WEAPON_FLAMINGO               = 310,
    ITEM_WEAPON_MATADOR                = 311,
    ITEM_WEAPON_SUPER_STEVE            = 312,
    ITEM_WEAPON_ANGE_GEAR              = 313,
    ITEM_WEAPON_MALLET_BROKEN          = 314,
    ITEM_WEAPON_MALLET                 = 315,
    ITEM_WEAPON_STEEL_HAMMER           = 316,
    ITEM_WEAPON_MAGICAL_HAMMER         = 317,
    ITEM_WEAPON_BATTLE_AX              = 318,
    ITEM_WEAPON_TURTLE_SHELL           = 319,
    ITEM_WEAPON_BIG_BUCKS_HAMMER       = 320,
    ITEM_WEAPON_FROZEN_TUNA            = 321,
    ITEM_WEAPON_GAIA_HAMMER            = 322,
    ITEM_WEAPON_LAST_JUDGEMENT         = 323,
    ITEM_WEAPON_TALL_HAMMER            = 324,
    ITEM_WEAPON_SATAN_S_AX             = 325,
    ITEM_WEAPON_UNUSED_326             = 326,
    ITEM_WEAPON_PLATE_HAMMER           = 327,
    ITEM_WEAPON_TRIAL_HAMMER           = 328,
    ITEM_WEAPON_INFERNO                = 329,
    ITEM_WEAPON_GOLD_RING_BROKEN       = 331,
    ITEM_WEAPON_GOLD_RING              = 332,
    ITEM_WEAPON_BANDIT_S_RING          = 333,
    ITEM_WEAPON_CRYSTAL_RING           = 334,
    ITEM_WEAPON_PLATINUM_RING          = 335,
    ITEM_WEAPON_GODDESS_RING           = 336,
    ITEM_WEAPON_FAIRY_S_RING           = 337,
    ITEM_WEAPON_DESTRUCTION_RING       = 338,
    ITEM_WEAPON_SATAN_S_RING           = 339,
    ITEM_WEAPON_ATHENA_S_ARMLET        = 340,
    ITEM_WEAPON_MOBIUS_RING            = 341,
    ITEM_WEAPON_UNUSED_342             = 342,
    ITEM_WEAPON_POCKLEKUL              = 343,
    ITEM_WEAPON_THORN_ARMLET           = 344,
    ITEM_WEAPON_SECRET_ARMLET          = 345,
    ITEM_WEAPON_FIGHTING_STICK_BROKEN  = 347,
    ITEM_WEAPON_FIGHTING_STICK         = 348,
    ITEM_WEAPON_JAVELIN                = 349,
    ITEM_WEAPON_HALBERT                = 350,
    ITEM_WEAPON_DE_SANGA               = 351,
    ITEM_WEAPON_SCORPION               = 352,
    ITEM_WEAPON_PARTISAN               = 353,
    ITEM_WEAPON_MIRAGE                 = 354,
    ITEM_WEAPON_TERRA_SWORD            = 355,
    ITEM_WEAPON_HERCULES_WRATH         = 356,
    ITEM_WEAPON_BABEL_S_SPEAR          = 357,
    ITEM_WEAPON_UNUSED_358             = 358,
    ITEM_WEAPON_5_FOOT_NAIL            = 359,
    ITEM_WEAPON_CACTUS                 = 360,
    ITEM_WEAPON_MACHINE_GUN_BROKEN     = 363,
    ITEM_WEAPON_MACHINE_GUN            = 364,
    ITEM_WEAPON_JACKAL                 = 365,
    ITEM_WEAPON_LAUNCHER               = 366,
    ITEM_WEAPON_LAUNCHERV2             = 367,
    ITEM_WEAPON_BLESSING_GUN           = 368,
    ITEM_WEAPON_SKUNK                  = 369,
    ITEM_WEAPON_G_CRUSHER              = 370,
    ITEM_WEAPON_HEXA_BLASTER           = 371,
    ITEM_WEAPON_STAR_BREAKER           = 372,
    ITEM_WEAPON_SUPERNOVA              = 373,
    ITEM_WEAPON_SNAIL                  = 374,
    ITEM_WEAPON_SWALLOW                = 375,
};

/**
 * Per-weapon behaviour flags.
 */
enum WeaponFlag {
    WEAPONFLAG_QUENCH  = 0x0008, /**< Reduced thirst drain. */
    WEAPONFLAG_THIRST  = 0x0010, /**< Increases thirst drain. */
    WEAPONFLAG_FRAGILE = 0x0100, /**< Double durability loss. */
    WEAPONFLAG_DURABLE = 0x0200, /**< Halved durability loss. */
};

/**
 * The six playable characters.
 */
enum Character {
    CHARA_TOAN   = 0,
    CHARA_XIAO   = 1,
    CHARA_GORO   = 2,
    CHARA_RUBY   = 3,
    CHARA_UNGAGA = 4,
    CHARA_OSMOND = 5,
};

/**
 * The kind of an item.
 */
enum ItemKind {
    ITEMKIND_ATTACH = 0,
    ITEMKIND_ITEM   = 1,
    ITEMKIND_WEAPON = 2,
};

/**
 * Maps an item to its kind and indices.
 */
struct COM_ITEM_INFO {
    s8 kind;
    char unk_01;
    s16 index; /**< Index into the attach/item/weapon list. */
    s16 icon_index;
    s16 msg; /**< Message id for the item's name. */
};
STATIC_ASSERT(sizeof(COM_ITEM_INFO) == 0x8);

/** An entry in ITEM_LIST. */
struct ITEM_DATA {
    s16 sort_key;
    s16 unk_02;
    u32 use_flags;  /**< What using the item does. @see ItemUseFlag. */
    s16 kind_flags; /**< What kind of item it is. @see ItemKindFlag. */
    s16 vol;        /**< The volume a fresh copy starts with. */
    s16 vol_range;  /**< The range of random variation for the item's volume. */
    s16 unk_0E;
    s16 shop;
    s16 unk_12;
};
STATIC_ASSERT(sizeof(ITEM_DATA) == 0x14);

/**
 * What using an item does.
 */
enum ItemUseFlag {
    ITEMUSE_STATUS  = 0x0020, /**< Grants a status effect. */
    ITEMUSE_HEAL_HP = 0x0040, /**< Restores HP. */
    ITEMUSE_DRINK   = 0x0080, /**< Restores thirst. */
};

/**
 * Which menus and actions an item is eligible for.
 */
enum ItemKindFlag {
    ITEMKINDF_CONSUMABLE = 0x0004, /**< Item is consumed on use. */
    ITEMKINDF_THROWABLE  = 0x0010, /**< Item can be thrown. */
    ITEMKINDF_RANDOM     = 0x0020, /**< Item has random properties. */
};

/**
 * The stats an attachment adds to a weapon.
 */
struct ATTACH_DATA {
    s16 item_no;
    s16 unk_02;
    s16 unk_04;
    s16 stat_00;
    s16 attack;
    s16 endurance;
    s16 speed;
    s16 magic;
    u8 fire;
    u8 ice;
    u8 thunder;
    u8 wind;
    u8 holy;
    u8 dino;
    u8 undead;
    u8 sea;
    u8 stone;
    u8 plant;
    u8 beast;
    u8 sky;
    u8 metal;
    u8 mimic;
    u8 mage;
    u8 unk_1F;
};
STATIC_ASSERT(sizeof(ATTACH_DATA) == 0x20);

enum AttachStat {
    ATTACHSTAT_UNK0      = 0,
    ATTACHSTAT_ATTACK    = 1,
    ATTACHSTAT_ENDURANCE = 2,
    ATTACHSTAT_SPEED     = 3,
    ATTACHSTAT_MAGIC     = 4,
    ATTACHSTAT_FIRE      = 8,
    ATTACHSTAT_ICE       = 9,
    ATTACHSTAT_THUNDER   = 10,
    ATTACHSTAT_WIND      = 11,
    ATTACHSTAT_HOLY      = 12,
    ATTACHSTAT_DINO      = 14,
    ATTACHSTAT_UNDEAD    = 15,
    ATTACHSTAT_SEA       = 16,
    ATTACHSTAT_STONE     = 17,
    ATTACHSTAT_PLANT     = 18,
    ATTACHSTAT_BEAST     = 19,
    ATTACHSTAT_SKY       = 20,
    ATTACHSTAT_METAL     = 21,
    ATTACHSTAT_MIMIC     = 22,
    ATTACHSTAT_MAGE      = 23,
};

/**
 * A weapon definition.
 */
struct WEAPON_DATA {
    s16 durability;     /**< Current durability. */
    s16 attack;         /**< Current attack. */
    s16 endurance;      /**< Current endurance. */
    s16 speed;          /**< Current speed. */
    s16 magic;          /**< Current magic. */
    u8 owner;           /**< The character who owns this weapon. @see Character. */
    u8 hole[6];         /**< Attachment sockets. */
    u8 hole_num;        /**< The number of attachment sockets. */
    s16 elem[5];        /**< AttachStat order: fire, ice, thunder, wind, holy */
    s16 vs_monster[10]; /**< Monster effectiveness stats. */
    s16 exp_base;       /**< Base exp value. */
    s16 exp_per_level;  /**< Exp granted per level-up. */
    s16 unk_34;
    s16 unused_36;
    s16 flags; /**< Special weapon behaviour flags. @see WeaponFlag. */
    s16 unk_3A;
    u32 buildup_mask0;
    u32 buildup_mask1;
    s16 attack_max; /**< Max attack value. */
    s16 magic_max;  /**< Max magic value. */
    s16 chain_pos;  /**< This weapon's position within its owner's chain. */
    s16 unk_4A;
};
STATIC_ASSERT(sizeof(WEAPON_DATA) == 0x4C);

/**
 * Get the weapon data for an item, or null if invalid.
 *
 * @mangled GetWeaponDataInfo__Fi
 * @address 0x1D0D90
 * @size 0x40
 */
WEAPON_DATA *GetWeaponDataInfo(int weapon_no);

/**
 * Get the common item info for an id, or null if the id is not an item.
 *
 * @mangled GetCommonItemInfo__Fi
 * @address 0x1D0DD0
 * @size 0x60
 */
COM_ITEM_INFO *GetCommonItemInfo(int item_no);

/**
 * Get the type info for an item, or null if the id is not an item.
 *
 * @mangled GetItemTypeInfo__FiPc
 * @address 0x1D0E30
 * @size 0x50
 */
int GetItemTypeInfo(int item_no, s8 *kind);

/**
 * Get the item data for an id, or null if the id is not an item.
 *
 * @mangled GetItemData__Fi
 * @address 0x1D0E80
 * @size 0x70
 */
ITEM_DATA *GetItemData(int item_no);

/**
 * Get the attachment data for an id, or null if the id is not an attachment.
 *
 * @mangled GetAttachData__Fi
 * @address 0x1D0EF0
 * @size 0x60
 */
ATTACH_DATA *GetAttachData(int item_no);

/**
 * Get the weapon data for an item, or null if invalid.
 *
 * @mangled GetWeaponData__Fi
 * @address 0x1D0F50
 * @size 0x70
 */
WEAPON_DATA *GetWeaponData(int item_no);

/**
 * Gets the message id for an item, or zero if the id has no entry.
 *
 * @mangled GetCommonItemDataMsg__Fi
 * @address 0x1D0FC0
 * @size 0x40
 */
int GetCommonItemDataMsg(int item_no);

/**
 * Gets the system message id for an item, or zero if the id has no entry.
 *
 * @mangled GetCommonItemDataSystemMsg__Fi
 * @address 0x1D1000
 * @size 0x30
 */
int GetCommonItemDataSystemMsg(int item_no);

/** First id in the dungeon-item range. */
inline int GetDungeonItemStart() { return ITEM_DUNGEON_START; }

/** One past the last dungeon-item id. */
inline int GetDungeonItemEnd() { return ITEM_WEAPON_SLOT_EMPTY; }