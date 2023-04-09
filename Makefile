# Directories
ASM_DIR         := asm
SRC_DIR         := src
ASSETS_DIR      := assets
INCLUDE_DIR     := include
BUILD_DIR       := build
TOOLS_DIR       := tools
CONFIG_DIR      := config
NONMATCHING_DIR := $(ASM_DIR)/nonmatchings

# System tools
MKDIR := mkdir
CP    := cp
CD    := cd
RM    := rm
CAT   := cat
DIFF  := diff

# Build tools
CROSS := mips64r5900el-ps2-elf-
MW    := $(TOOLS_DIR)/mw/2.3.1.01
CC    := $(MW)/mwccmips
AS    := $(TOOLS_DIR)/ee-as

# Compiler flags
AS_FLAGS := -mcpu=5900 -I include
CC_FLAGS := -O2 -c -i include

# Files
ASM_FILES := $(shell find $(ASM_DIR) -type f -iname '*.s' 2> /dev/null)
C_FILES   := $(shell find $(SRC_DIR) -type f -iname '*.c' 2> /dev/null)
ASM_OBJs  := $(addprefix $(BUILD_DIR)/,$(ASM_FILES:.s=.s.o))
C_OBJS    := $(addprefix $(BUILD_DIR)/,$(C_FILES:.c=.c.o))
ALL_OBJS  := $(C_OBJS) $(ASM_OBJs) 

# Build folders
ASM_DIRS := $(sort $(dir $(ASM_FILES)))
C_DIRS := $(sort $(dir $(C_FILES)))
ASM_BUILD_DIRS := $(addprefix $(BUILD_DIR)/,$(ASM_DIRS))
C_BUILD_DIRS := $(addprefix $(BUILD_DIR)/,$(C_DIRS))
ALL_BUILD_DIRS := $(C_BUILD_DIRS) $(ASM_BUILD_DIRS) $(BUILD_DIR)

all: dirs $(ALL_OBJS)

dirs:
	$(foreach dir,$(ALL_BUILD_DIRS),$(shell mkdir -p $(dir)))

clean:
	@$(RM) -rf $(BUILD_DIR)
	@$(RM) -rf $(NONMATCHING_DIR)
	@$(RM) -rf $(ASSETS_DIR)
	@$(RM) -rf $(ASM_DIR)/data
	@$(RM) -f $(CONFIG_DIR)/undefined_syms_auto* $(CONFIG_DIR)/undefined_funcs_auto* $(CONFIG_DIR)/*.ld

$(BUILD_DIR)/%.s.o: %.s
	$(AS) $(AS_FLAGS) -o $@ $<

$(BUILD_DIR)/%.c.o: %.c
	$(CC) $(CC_FLAGS) -o $@ $<

# Phony targets
.PHONY: all clean