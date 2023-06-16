#include <std/mem.pat>

struct MWOverlayHeader {       
    char identifier[3]; /* 'MWo'*/ 
    u8 version;
    u32 overlay_id;
    u32 load_address;
    u32 text_size;
    u32 data_size;
    u32 bss_size;   
    u32 static_init_address;
    u32 static_init_end_address;
    char overlay_name[32];
};

struct MWOverlay {
    MWOverlayHeader header;
    u8 text[header.text_size];
    u8 data[header.data_size];
};

MWOverlay overlay @ 0x0;