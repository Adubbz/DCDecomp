# Item ids and their in-game names

How an item id becomes the text the player sees, and the resolved table.

## The lookup

`GetCommonItemInfo(id)` (src/itemdata.cpp) indexes `ComItemInfo`, folding two
id ranges onto one run of 296 entries: ids >= 81 at `id - 81`, ids 1..80 at
`id + 175`. Those two overlap on purpose -- weapon ids 1..80 and 257..336 are
the same entries, so either spelling reaches the same weapon.

The entry's `msg` field is the name's message id. `GetCommonItemDataSystemMsg`
returns `msg + 100`, which is the id the message system is asked for.

`msg` is **not** always the item id. It is for everything in the dungeon-item
range (132..255), which is why a flat `id + 100` guess produced correct names
there; it is wrong for 173 of the weapon and attachment ids.

## Where the text lives

DATA.DAT, at 0x58EC3807 (10397 bytes), as plain CRLF text:

```
id_offset=245
@0
Regular Water
@1
Tasty Water
```

`@k` under `id_offset=N` is message id `N + k`. That numbering runs one lower
than the runtime id, so a name is `msgs[msg + 100]`. A second copy at 0x58EC6B00
carries the same entries with the original Japanese `//` comments.

## Resolved names

| id | kind | msg | name |
| --- | --- | --- | --- |
| 81 | attach | 81 | Fire |
| 82 | attach | 82 | Ice |
| 83 | attach | 83 | Thunder |
| 84 | attach | 84 | Wind |
| 85 | attach | 85 | Holy |
| 91 | attach | 91 | Attack |
| 92 | attach | 92 | Endurance |
| 93 | attach | 93 | Speed |
| 94 | attach | 94 | Magical power |
| 95 | attach | 95 | Garnet |
| 96 | attach | 96 | Amethyst |
| 97 | attach | 97 | Aquamarine |
| 98 | attach | 98 | Diamond |
| 99 | attach | 99 | Emerald |
| 100 | attach | 100 | Pearl |
| 101 | attach | 101 | Ruby |
| 102 | attach | 102 | Peridot |
| 103 | attach | 103 | Sapphire |
| 104 | attach | 104 | Opal |
| 105 | attach | 105 | Topaz |
| 106 | attach | 106 | Turquoise |
| 107 | attach | 107 | Sun |
| 111 | attach | 111 | Dinoslayer |
| 112 | attach | 112 | Undead Buster |
| 113 | attach | 113 | Sea Killer |
| 114 | attach | 114 | Stone Breaker |
| 115 | attach | 115 | Plant Buster |
| 116 | attach | 116 | Beast Buster |
| 117 | attach | 117 | Sky Hunter |
| 118 | attach | 118 | MetalBreaker |
| 119 | attach | 119 | Mimic Breaker |
| 120 | attach | 120 | Mage Slayer |
| 132 | item | 132 | Anti Freeze Amulet |
| 133 | item | 133 | AntiCurseAmulet |
| 134 | item | 134 | Antigoo Amulet |
| 135 | item | 135 | Antidote Amulet |
| 136 | item | 136 | Fluffy Doughnut |
| 137 | item | 137 | Fish Candy |
| 138 | item | 138 | Grass Cake |
| 139 | item | 139 | Witch Parfait |
| 140 | item | 140 | Scorpion Jerky |
| 141 | item | 141 | Carrot Cookie |
| 142 | item | 142 | Dummy |
| 145 | item | 145 | Regular Water |
| 146 | item | 146 | Tasty Water |
| 147 | item | 147 | Premium Water |
| 148 | item | 148 | Bread |
| 149 | item | 149 | Premium Chicken |
| 150 | item | 150 | Stamina Drink |
| 151 | item | 151 | Antidote Drink |
| 152 | item | 152 | Holy Water |
| 153 | item | 153 | Soap |
| 154 | item | 154 | Mighty Healing |
| 155 | item | 155 | Cheese |
| 159 | item | 159 | Bomb |
| 160 | item | 160 | Stone |
| 161 | item | 161 | Fire Gem |
| 162 | item | 162 | Ice Gem |
| 163 | item | 163 | Thunder Gem |
| 164 | item | 164 | Wind Gem |
| 165 | item | 165 | Holy Gem |
| 166 | item | 166 | Throbbing Cherry |
| 167 | item | 167 | Gooey Peach |
| 168 | item | 168 | Bomb Nuts |
| 169 | item | 169 | Poisonous Apple |
| 170 | item | 170 | Mellow Banana |
| 171 | item | 171 | Medusa Powder |
| 172 | item | 172 | Hardening Powder |
| 173 | item | 173 | Warp Powder |
| 174 | item | 174 | Stand-in Powder |
| 175 | item | 175 | Escape Powder |
| 176 | item | 176 | Revival Powder |
| 177 | item | 177 | Repair Powder |
| 178 | item | 178 | Powerup Powder |
| 179 | item | 179 | Pocket |
| 180 | item | 180 | Fruit of Eden |
| 181 | item | 181 | Treasure Key |
| 182 | item | 182 | Gourd |
| 183 | item | 183 | Auto Repair Powder |
| 185 | item | 185 | Fishing Rod |
| 186 | item | 186 | Carrot |
| 187 | item | 187 | Potato cake |
| 188 | item | 188 | Minon |
| 189 | item | 189 | Battan |
| 190 | item | 190 | Petite Fish |
| 191 | item | 191 | Saving Book |
| 192 | item | 192 | Gold Bullion |
| 193 | item | 193 | Evy |
| 195 | item | 195 | Dran's Crest |
| 196 | item | 196 | Shiny Stone |
| 197 | item | 197 | Mimi |
| 198 | item | 198 | Red Berry |
| 199 | item | 199 | Prickly |
| 200 | item | 200 | Candy |
| 201 | item | 201 | Hook |
| 202 | item | 202 | King's Slate |
| 203 | item | 203 | Gun Powder |
| 204 | item | 204 | Clock Hands |
| 205 | item | 205 | Pointy Chestnut |
| 206 | item | 206 | Black Knight Crest |
| 207 | item | 207 | Horned Key |
| 208 | item | 208 | Moon Grass Seed |
| 209 | item | 209 | Music Box Key |
| 210 | item | 210 | Sun Signet |
| 211 | item | 211 | Moon Signet |
| 212 | item | 212 | Admission Ticket |
| 213 | item | 213 | Sun Sword |
| 216 | item | 216 | Bone Key |
| 217 | item | 217 | Moustache Key |
| 218 | item | 218 | Shipcabin Key |
| 219 | item | 219 | Stone Key |
| 220 | item | 220 | Handle |
| 221 | item | 221 | Pitchdark Key |
| 222 | item | 222 | Silver Key |
| 224 | item | 224 | Tram Oil |
| 225 | item | 225 | Sun Dew |
| 226 | item | 226 | Flapping Fish |
| 227 | item | 227 | Rotten Fish |
| 228 | item | 228 | Secret Path Key |
| 229 | item | 229 | Bravery Launch |
| 230 | item | 230 | Flapping Duster |
| 231 | item | 231 | Crystal Eyeball |
| 233 | item | 233 | Map |
| 234 | item | 234 | Magical Crystal |
| 235 | item | 235 | Dran's Feather |
| 236 | item | 236 | Cave Key |
| 237 | item | 237 | Changing Potion |
| 238 | item | 238 | Worldmap |
| 239 | item | 239 | Bone Pendant |
| 240 | item | 240 | Odd Tone Flute |
| 241 | item | 241 | Magical Lamp |
| 242 | item | 242 | Moon Orb |
| 243 | item | 243 | Shell Ring |
| 244 | item | 244 | Search Warrant |
| 245 | item | 245 | Ice Block |
| 246 | item | 246 | Small Ice |
| 247 | item | 247 | Tiny Ice |
| 248 | item | 248 | Flame Key |
| 249 | item | 249 | Hunter's Earring |
| 250 | item | 250 | Ointment Leaf |
| 251 | item | 251 | Foundation |
| 252 | item | 252 | Clay Doll |
| 253 | item | 253 | Manual |
| 254 | item | 254 | Sun Sphere |
| 255 | item | 255 | Almighty Pass |
| 257 | weapon | 1 | Dagger[broken1] |
| 258 | weapon | 2 | Dagger |
| 259 | weapon | 3 | Baselard |
| 260 | weapon | 4 | Gladius |
| 261 | weapon | 5 | Wise Owl Sword |
| 262 | weapon | 6 | Crysknife |
| 263 | weapon | 7 | Antique Sword |
| 264 | weapon | 8 | Buster Sword |
| 265 | weapon | 9 | Kitchen Knife |
| 266 | weapon | 10 | Tsukikage |
| 267 | weapon | 11 | Sun Sword |
| 268 | weapon | 12 | Serpent Sword |
| 269 | weapon | 13 | Macho Sword |
| 270 | weapon | 14 | Shamshir |
| 271 | weapon | 15 | Heaven's Cloud |
| 272 | weapon | 16 | Lamb's Sword |
| 273 | weapon | 17 | Dark Cloud |
| 274 | weapon | 18 | Brave Ark |
| 275 | weapon | 19 | Big Bang |
| 276 | weapon | 20 | Atlamillia Sword |
| 277 | weapon | 256 | weapon No.277 |
| 278 | weapon | 257 | Mardan Eins |
| 279 | weapon | 258 | Mardan Twei |
| 280 | weapon | 259 | Arise Mardan |
| 281 | weapon | 260 | Aga's Sword |
| 282 | weapon | 261 | Evilcise |
| 283 | weapon | 262 | Small Sword |
| 284 | weapon | 263 | Sand Breaker |
| 285 | weapon | 264 | Drain Seeker |
| 286 | weapon | 265 | Chopper |
| 287 | weapon | 266 | Choora |
| 288 | weapon | 267 | Claymore |
| 289 | weapon | 268 | Maneater |
| 290 | weapon | 269 | Bone Rapier |
| 291 | weapon | 270 | Sax |
| 292 | weapon | 271 | 7Branch Sword |
| 293 | weapon | 272 | Dusack |
| 294 | weapon | 273 | Cross Hinder |
| 295 | weapon | 284 | 7thHeaven |
| 296 | weapon | 285 | Sword Of Zeus |
| 297 | weapon | 286 | Chronicle Sword |
| 298 | weapon | 287 | Chronicle2 |
| 299 | weapon | 21 | WoodenSlingshot[broken1] |
| 300 | weapon | 22 | Wooden Slingshot |
| 301 | weapon | 23 | Steel Slingshot |
| 302 | weapon | 24 | Bandit Slingshot |
| 303 | weapon | 25 | Steve |
| 304 | weapon | 26 | Bone Slingshot |
| 305 | weapon | 27 | Hardshooter |
| 306 | weapon | 28 | Double Impact |
| 307 | weapon | 29 | Dragon's Y |
| 308 | weapon | 30 | DivineBeastTitle |
| 309 | weapon | 31 | Angel Shooter |
| 310 | weapon | 274 | Flamingo |
| 311 | weapon | 275 | Matador |
| 312 | weapon | 288 | Super Steve |
| 313 | weapon | 289 | Ange Gear |
| 314 | weapon | 33 | Mallet[broken1] |
| 315 | weapon | 34 | Mallet |
| 316 | weapon | 35 | Steel Hammer |
| 317 | weapon | 36 | Magical Hammer |
| 318 | weapon | 37 | Battle Ax |
| 319 | weapon | 38 | Turtle Shell |
| 320 | weapon | 39 | Big Bucks Hammer |
| 321 | weapon | 40 | Frozen Tuna |
| 322 | weapon | 41 | Gaia Hammer |
| 323 | weapon | 42 | Last Judgement |
| 324 | weapon | 43 | Tall Hammer |
| 325 | weapon | 44 | Satan's Ax |
| 326 | weapon | 45 | 12 |
| 327 | weapon | 276 | Plate Hammer |
| 328 | weapon | 277 | Trial Hammer |
| 329 | weapon | 290 | Inferno |
| 331 | weapon | 46 | Gold Ring[broken1] |
| 332 | weapon | 47 | Gold Ring |
| 333 | weapon | 48 | Bandit's Ring |
| 334 | weapon | 49 | Crystal Ring |
| 335 | weapon | 50 | Platinum Ring |
| 336 | weapon | 51 | Goddess Ring |
| 337 | weapon | 52 | Fairy's Ring |
| 338 | weapon | 53 | Destruction Ring |
| 339 | weapon | 54 | Satan's Ring |
| 340 | weapon | 55 | Athena's Armlet |
| 341 | weapon | 56 | Mobius Ring |
| 342 | weapon | 57 | 11 |
| 343 | weapon | 278 | Pocklekul |
| 344 | weapon | 279 | Thorn Armlet |
| 345 | weapon | 291 | Secret Armlet |
| 347 | weapon | 58 | Fighting Stick[broken1] |
| 348 | weapon | 59 | Fighting Stick |
| 349 | weapon | 60 | Javelin |
| 350 | weapon | 61 | Halbert |
| 351 | weapon | 62 | De Sanga |
| 352 | weapon | 63 | Scorpion |
| 353 | weapon | 64 | Partisan |
| 354 | weapon | 65 | Mirage |
| 355 | weapon | 66 | Terra Sword |
| 356 | weapon | 67 | Hercules' Wrath |
| 357 | weapon | 68 | Babel's Spear |
| 358 | weapon | 69 | 11 |
| 359 | weapon | 280 | 5 Foot Nail |
| 360 | weapon | 281 | Cactus |
| 363 | weapon | 70 | Machine Gun[broken1] |
| 364 | weapon | 71 | Machine Gun |
| 365 | weapon | 72 | Jackal |
| 366 | weapon | 73 | Launcher |
| 367 | weapon | 74 | LauncherV2 |
| 368 | weapon | 75 | Blessing Gun |
| 369 | weapon | 76 | Skunk |
| 370 | weapon | 77 | G CRUSHER |
| 371 | weapon | 78 | Hexa Blaster |
| 372 | weapon | 79 | Star Breaker |
| 373 | weapon | 80 | Supernova |
| 374 | weapon | 282 | Snail |
| 375 | weapon | 283 | Swallow |

## Ids with an entry but no message text

These are unused slots, not items whose names live elsewhere. Two independent
pieces of evidence say so.

**The asset table.** `0x27E80C` is an array of model-name pointers indexed by
`COM_ITEM_INFO.index` -- the same numbering `ITEM_LIST` and `AttachList` use,
attachments at 0..50 and items at 51..175. Alignment is fixed by four
independent matches: index 1 -> `atfire` (Fire), 21 -> `juelruby` (Ruby),
27 -> `taiyou` (Sun, Japanese), 150 -> `patapata` (Flapping Duster, and
*patapata* is the Japanese for flapping). All 144 named attach/item slots have
a real asset name. All 31 unnamed ones point at the **same** address,
`0x29C748`, which holds the empty string -- an explicit "no model" sentinel
rather than a null or a gap.

**The five unnamed weapons are different.** 330, 346, 361, 362 and 376 carry
full stat rows, and their `msg` is explicitly `0` rather than an id that
happens to be missing. Their sixth field (514, 515, 516, 517) groups each with
the tail of a character's chain -- Goro, Ruby, Ungaga, Osmond -- so they read
as finished-but-nameless weapon entries at the end of each chain.

Fifteen of the attachment slots and four of the item slots additionally have an
all-zero or id-only data row, which is consistent with the same conclusion.

| id | kind | msg |
| --- | --- | --- |
| 256 | item | -1 |

| id | kind | msg | icon |
| --- | --- | --- | --- |
| 86 | attach | 86 | 125 |
| 87 | attach | 87 | 126 |
| 88 | attach | 88 | 127 |
| 89 | attach | 89 | 128 |
| 90 | attach | 90 | 129 |
| 108 | attach | 108 | 147 |
| 109 | attach | 109 | 148 |
| 110 | attach | 110 | 149 |
| 121 | attach | 121 | 160 |
| 122 | attach | 122 | 161 |
| 123 | attach | 123 | 162 |
| 124 | attach | 124 | 163 |
| 125 | attach | 125 | 164 |
| 126 | attach | 126 | 165 |
| 127 | attach | 127 | 166 |
| 128 | attach | 128 | 167 |
| 129 | attach | 129 | 0 |
| 130 | attach | 130 | 1 |
| 131 | attach | 131 | 2 |
| 143 | item | 143 | 14 |
| 144 | item | 144 | 15 |
| 156 | item | 156 | 27 |
| 157 | item | 157 | 28 |
| 158 | item | 158 | 29 |
| 184 | item | 184 | 55 |
| 194 | item | 194 | 65 |
| 214 | item | 214 | 85 |
| 215 | item | 215 | 86 |
| 223 | item | 223 | 94 |
| 232 | item | 232 | 103 |
| 256 | item | -1 | 127 |
| 330 | weapon | 0 | 73 |
| 346 | weapon | 0 | 89 |
| 361 | weapon | 0 | 104 |
| 362 | weapon | 0 | 105 |
| 376 | weapon | 0 | 119 |
