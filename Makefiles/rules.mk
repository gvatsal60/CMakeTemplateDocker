include cfg/.env

# Targets
.PHONY: all test clean

# Commands
CMAKE := cmake
MKDIR := mkdir -p
RMDIR := rm -r

# Build Commands
BUILD_TOOL_CMD := $(MKDIR)/$(BUILD_DIR); $(CMAKE) --build $(BUILD_DIR) --parallel $(shell nproc)
BUILD_CMD := $(BUILD_TOOL_CMD)
TEST_CMD := $(BUILD_TOOL_CMD) && ./$(TEST_DIR)/$(TEST_EXEC)
RUN_CMD := $(BUILD_TOOL_CMD) && ./$(BUILD_DIR)/$(DEBUG_EXEC)
CLEAN_CMD := $(BUILD_TOOL_CMD) && $(RMDIR) $(BUILD_DIR)/**
# SONAR_CMD := $(BUILD_TOOL_CMD) sonar
