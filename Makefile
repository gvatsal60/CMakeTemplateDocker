# Include configuration files
include cfg/docker.mk

# Commands
CMAKE := cmake
MKDIR := mkdir -p
RMDIR := rm -r

# Define the path to the Dockerfile
DOCKER_FILE_PATH := dockerfiles/Dockerfile.alpine

# Executables
DEBUG_EXEC := debugBin
RELEASE_EXEC := releaseBin
TEST_EXEC := testBin

# Build Directory
BUILD := build
TEST := test

# Build Command (i.e. Used to build project)
CMAKE_BUILD_CMD := cd $(BUILD) && $(CMAKE) .. && $(MAKE)
BUILD_CMD := "$(CMAKE_BUILD_CMD)"
TEST_CMD := "$(CMAKE_BUILD_CMD) && ./$(TEST)/$(TEST_EXEC)"
RUN_CMD := "./$(BUILD)/$(DEBUG_EXEC)"
CLEAN_CMD := "$(RMDIR) $(BUILD)/**"

# Targets
all: build-image

# Target: build-image
# Description: Builds the Docker image using the specified Dockerfile
.PHONY: build-image
build-image:
	@$(DOCKER_HOST) image build -t $(DOCKER_IMG_NAME) -f $(DOCKER_FILE_PATH) $(DOCKER_BUILD_CONTEXT)

# Code Build
docker-build: build-image
	@$(MKDIR) $(BUILD)
	@$(DOCKER_HOST) container run $(DOCKER_ARG) $(DOCKER_IMG_NAME) $(BUILD_CMD)

# Test code
docker-test: build-image
	@$(MKDIR) $(BUILD)
	@$(DOCKER_HOST) container run $(DOCKER_ARG) $(DOCKER_IMG_NAME) $(TEST_CMD)

# Run code
docker-run: build-image
	@$(DOCKER_HOST) container run $(DOCKER_ARG) $(DOCKER_IMG_NAME) $(RUN_CMD)

# Clean
docker-clean: build-image
	@$(DOCKER_HOST) container run $(DOCKER_ARG) $(DOCKER_IMG_NAME) $(CLEAN_CMD)

# Code Cleanup
clean:
	@$(RMDIR) $(BUILD)/**