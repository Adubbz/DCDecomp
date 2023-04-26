BASENAME := SCUS_971.11

# Directories
ASM_DIR         := asm
SRC_DIR         := src
ASSETS_DIR      := assets
INCLUDE_DIR     := include
BUILD_DIR       := build
TOOLS_DIR       := tools
SCRIPTS_DIR     := scripts
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
EE      := $(TOOLS_DIR)/ee/gcc/bin/ee-
PS2DEV  := $(TOOLS_DIR)/mips64r5900el-ps2-elf-
MW      := $(TOOLS_DIR)/mw/2.3.1.01
CC_MW   := $(MW)/mwccmips.exe
CC_GCC  := $(EE)gcc295.exe
AS      := $(EE)as.exe
LD      := $(PS2DEV)ld.exe
OBJCOPY := $(PS2DEV)objcopy.exe
PYTHON  := python

# Files
LD_SCRIPT  := $(CONFIG_DIR)/$(BASENAME).ld
PRELIM_ELF := $(addprefix $(BUILD_DIR)/,$(BASENAME).prelim.elf)
FINAL_ELF  := $(addprefix $(BUILD_DIR)/,$(BASENAME))

ASM_FILES           := $(shell find $(ASM_DIR) -type f -iname '*.s' 2> /dev/null)
C_FILES             := $(shell find $(SRC_DIR) -type f -iname '*.c' 2> /dev/null)
CPP_FILES           := $(shell find $(SRC_DIR) -type f -iname '*.cpp' 2> /dev/null)
BIN_FILES           := $(shell find $(ASSETS_DIR) -type f -iname '*.bin' 2> /dev/null)
ASM_OBJs            := $(addprefix $(BUILD_DIR)/,$(ASM_FILES:.s=.s.o))
C_OBJS              := $(addprefix $(BUILD_DIR)/,$(C_FILES:.c=.c.o))
CPP_OBJS            := $(addprefix $(BUILD_DIR)/,$(CPP_FILES:.cpp=.cpp.o))
BIN_OBJS            := $(addprefix $(BUILD_DIR)/,$(BIN_FILES:.bin=.bin.o))
ALL_OBJS            := $(C_OBJS) $(CPP_OBJS) $(ASM_OBJs) $(BIN_OBJS)

# Build folders
ALL_BUILD_DIRS := $(sort $(dir $(ALL_OBJS)))

# Compiler flags
AS_FLAGS     := -c -EL -mcpu=5900 -32 -g2 -non_shared -G0 -I include
CC_MW_FLAGS  := -O2 -c -i include
CC_GCC_FLAGS := -c -EL -mcpu=5900 -g2 -non_shared -I include
LD_FLAGS     := -G0 -b elf32-littlemips -m elf32lr5900 -e _start -z max-page-size=0x100 -Map $(PRELIM_ELF:.elf=.map) -T $(LD_SCRIPT) -T $(CONFIG_DIR)/undefined_funcs_auto.txt -T $(CONFIG_DIR)/undefined_syms_auto.txt -T $(CONFIG_DIR)/temporary_additional_syms.txt
BIN_FLAGS    := -B mips:5900 -I binary -O elf32-littlemips

all: build

build: dirs $(PRELIM_ELF)

dirs:
	$(foreach dir,$(ALL_BUILD_DIRS),$(shell mkdir -p $(dir)))

clean:
	@$(RM) -rf $(BUILD_DIR)
	@$(RM) -rf $(NONMATCHING_DIR)
	@$(RM) -rf $(ASSETS_DIR)
	@$(RM) -rf $(ASM_DIR)/data
	@$(RM) -f $(CONFIG_DIR)/undefined_syms_auto* $(CONFIG_DIR)/undefined_funcs_auto* $(CONFIG_DIR)/*.auto.ld

extract:
	@$(PYTHON) $(SCRIPTS_DIR)/dump_symbols.py
	@$(PYTHON) $(TOOLS_DIR)/splat/split.py $(CONFIG_DIR)/$(BASENAME).yaml

$(BUILD_DIR)/%.bin.o: %.bin
	$(OBJCOPY) $(BIN_FLAGS) $< $@ 

$(BUILD_DIR)/%.s.o: %.s
	$(AS) $(AS_FLAGS) -o $@ $<

$(BUILD_DIR)/%.c.o: %.c
	$(CC_MW) $(CC_MW_FLAGS) -o $@ $<

$(BUILD_DIR)/%.cpp.o: %.cpp
	$(CC_MW) $(CC_MW_FLAGS) -o $@ $<

$(PRELIM_ELF): $(ALL_OBJS)
	$(LD) $(LD_FLAGS) -o $@

$(FINAL_ELF): $(PRELIM_ELF)
	$(OBJCOPY) $< $@ -O binary

# Phony targets
.PHONY: all clean extract