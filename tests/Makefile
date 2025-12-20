TARGET_TRIPLE = loongarch64-unknown-linux-gnu
CLANG_FLAGS = -Wl,-Ttext=0x0,--nmagic,-no-pie -nostdlib -fpic
OBJCOPY_FLAGS = -O binary

SRC_DIR = src
BIN_DIR = bin

# --- 1. 查找源文件 (ASMS) ---
# 查找 src/ 目录下所有 .s 文件，例如：src/test1.s src/test2.s
ASMS = $(wildcard $(SRC_DIR)/*.s)

# --- 2. 定义目标文件 (BINS) ---
# 1. 移除 src/ 前缀 (src/test1.s -> test1.s)
SRC_ASMS_NO_DIR = $(notdir $(ASMS))
# 2. 转换后缀并添加 bin/ 前缀 (test1.s -> bin/test1.bin)
BINS = $(patsubst %.s,$(BIN_DIR)/%.bin,$(SRC_ASMS_NO_DIR))


.PHONY: all clean

# 默认目标：构建所有 .bin 文件
all: $(BINS)
	@echo "All finished"

$(BIN_DIR)/%.bin: $(SRC_DIR)/%.s
	mkdir -p $(BIN_DIR)
	@echo "Processing $<"
	clang --target=$(TARGET_TRIPLE) $(CLANG_FLAGS) $< -o $(basename $@)
	llvm-objcopy $(OBJCOPY_FLAGS) $(basename $@) $@
	rm -f $(basename $@)
	@echo "Done"

clean:
	@echo "Clean the bin dir"
	rm -r $(BIN_DIR)