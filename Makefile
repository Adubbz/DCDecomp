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
LD      := $(MW)/mwldmips.exe
LD_GNU  := $(PS2DEV)ld.exe
OBJCOPY := $(PS2DEV)objcopy.exe
PYTHON  := python

# Files
LD_SCRIPT  := $(CONFIG_DIR)/$(BASENAME).lcf
PRELIM_ELF := $(addprefix $(BUILD_DIR)/,$(BASENAME).prelim.elf)
FINAL_ELF  := $(addprefix $(BUILD_DIR)/,$(BASENAME))

include obj_files.mk
ALL_OBJS := $(TEXT_O_FILES) $(DATA_O_FILES) $(BSS_O_FILES) $(ADDITIONAL_O_FILES)

# Build folders
ALL_BUILD_DIRS := $(sort $(dir $(ALL_OBJS)))

# Compiler flags
AS_FLAGS     := -c -EL -mcpu=5900 -32 -g2 -non_shared -G0 -I include
CC_MW_FLAGS  := -O2 -c -Cpp_exceptions off -i include
CC_GCC_FLAGS := -c -EL -mcpu=5900 -g2 -non_shared -I include
LD_GNU_FLAGS := -G0 -b elf32-littlemips -m elf32lr5900
LD_MW_FLAGS  := -map -nostdlib -m _start -nodead
BIN_FLAGS    := -B mips:5900 -I binary -O elf32-littlemips

all: build

build: dirs $(PRELIM_ELF)

dirs:
	$(foreach dir,$(ALL_BUILD_DIRS),$(shell mkdir "$(dir)"))

clean:
	@$(RM) -rf $(BUILD_DIR)
	@$(RM) -rf $(ASSETS_DIR)
	@$(RM) -f $(CONFIG_DIR)/undefined_syms_auto* $(CONFIG_DIR)/undefined_funcs_auto* $(CONFIG_DIR)/*.auto.ld

extract:
	@$(PYTHON) $(SCRIPTS_DIR)/dump_symbols.py
	@$(PYTHON) $(TOOLS_DIR)/splat/split.py $(CONFIG_DIR)/$(BASENAME).yaml

$(BUILD_DIR)/%.gcc.c.o: %.gcc.c
	$(CC_GCC) $(CC_GCC_FLAGS) -o $@ $<

$(BUILD_DIR)/%.bin.o: %.bin
	$(OBJCOPY) $(BIN_FLAGS) $< $@ 

# NB: This is unfortunately rather slow due to the Python script, though is sadly a necessity as MW will not tolerate empty sections.
$(BUILD_DIR)/%.s.o: %.s
	$(AS) $(AS_FLAGS) -o $@ $<
	@$(PYTHON) $(SCRIPTS_DIR)/section_stripper.py $@

$(BUILD_DIR)/%.c.o: %.c
	$(CC_MW) $(CC_MW_FLAGS) -o $@ $<

$(BUILD_DIR)/%.cpp.o: %.cpp
	$(CC_MW) $(CC_MW_FLAGS) -o $@ $<

$(PRELIM_ELF): $(ALL_OBJS)
	$(file >build/o_files, $(ALL_OBJS))
	$(LD) $(LD_MW_FLAGS) -o $@ $(LD_SCRIPT) @build/o_files

$(FINAL_ELF): $(PRELIM_ELF)
	$(OBJCOPY) $< $@ -O binary

# Phony targets
.PHONY: all clean extract