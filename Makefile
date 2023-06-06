BASENAME := SCUS_971.11

# Directories
ASM_DIR         := asm
SRC_DIR         := src
INCLUDE_DIR     := include
BUILD_DIR       := build
TOOLS_DIR       := tools
SCRIPTS_DIR     := scripts
ROM_DIR         := rom

# System tools
MKDIR     := mkdir
CP        := cp
CD        := cd
RM        := rm
CAT       := cat
DIFF      := diff
SHA256SUM := sha256sum

# Build tools
EE       := $(PRODG)/ee/gcc/bin/ee-
MW       := $(TOOLS_DIR)/compilers/mw/2.3.1.01/
PS2DEV   := mips64r5900el-ps2-elf-
CC_MW    := wibo $(MW)mwccmips.exe
LD_MW    := wine $(MW)mwldmips.exe
AS_PRODG := wine $(EE)as.exe
LD_GNU   := $(PS2DEV)ld
OBJCOPY  := $(PS2DEV)objcopy
PYTHON   := python

# Files
LD_SCRIPT  := $(BASENAME).lcf
OUTPUT     := $(addprefix $(BUILD_DIR)/,$(BASENAME))

include obj_files.mk
ALL_OBJS := $(TEXT_O_FILES) $(DATA_O_FILES) $(BSS_O_FILES) $(ADDITIONAL_O_FILES)

# Build folders
ALL_BUILD_DIRS := $(sort $(dir $(ALL_OBJS)))

# Compiler flags
AS_FLAGS     := -c -EL -mcpu=5900 -32 -g2 -non_shared -G0 -I include
CC_MW_FLAGS  := -O2 -c -Cpp_exceptions off -i include -g
CC_GCC_FLAGS := -c -EL -mcpu=5900 -g2 -non_shared -I include
LD_GNU_FLAGS := -G0 -b elf32-littlemips -m elf32lr5900
LD_MW_FLAGS  := -map -nostdlib -m _start -nodead -g
BIN_FLAGS    := -B mips:5900 -I binary -O elf32-littlemips

all: build

build: build_setup $(OUTPUT)

build_setup:
	$(foreach dir,$(ALL_BUILD_DIRS),$(shell mkdir -p $(dir)))
	@$(PYTHON) $(SCRIPTS_DIR)/extract.py verify

clean:
	@$(RM) -rf $(BUILD_DIR)

extract:
	@$(CD) $(ROM_DIR); $(SHA256SUM) -c checksum.sha256
	@$(PYTHON) $(SCRIPTS_DIR)/extract.py iso

$(BUILD_DIR)/%.bin.o: %.bin
	$(OBJCOPY) $(BIN_FLAGS) $< $@ 

# NB: This is unfortunately rather slow due to the Python script, though is sadly a necessity as MW will not tolerate empty sections.
$(BUILD_DIR)/%.s.o: %.s
	$(AS_PRODG) $(AS_FLAGS) -o $@ $<
	@$(PYTHON) $(SCRIPTS_DIR)/section_stripper.py $@

$(BUILD_DIR)/%.c.o: %.c
	$(CC_MW) $(CC_MW_FLAGS) -o $@ $<

$(BUILD_DIR)/%.cpp.o: %.cpp
	$(CC_MW) $(CC_MW_FLAGS) -o $@ $<

$(OUTPUT): $(ALL_OBJS)
	$(file >build/o_files, $(ALL_OBJS))
	$(LD_MW) $(LD_MW_FLAGS) -o $@ $(LD_SCRIPT) @build/o_files

# Phony targets
.PHONY: all clean extract