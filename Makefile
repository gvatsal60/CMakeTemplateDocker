# Commands
CMAKE:=cmake
MKDIR:=mkdir -p
RMDIR:=rm -rf

# Executables
DEBUG_EXEC:=debugBin
RELEASE_EXEC:=releaseBin

# Build Directory
BUILD:=build

# Docker/Podman Specific
DOCKER_HOST:=podman
DOCKER_IMG_NAME:=cpp_template
DOCKER_IMG_VER:=1
DOCKER_IMG_FULL_NAME:=$(DOCKER_IMG_NAME):$(DOCKER_IMG_VER)
DOCKER_WORK_DIR:=/app
DOCKER_VOL:= --mount type=bind,source=.,target=$(DOCKER_WORK_DIR)
DOCKER_ARG = --rm -it $(DOCKER_VOL) -w $(DOCKER_WORK_DIR)/$(BUILD)

# Build Command (i.e. Used to build project)
BUILD_CMD:="$(CMAKE) .. && $(MAKE)"

# Targets
all: buildImg debug

# To build image
buildImg:
	@$(DOCKER_HOST) image build -t $(DOCKER_IMG_FULL_NAME) .

# To build Alpine Image
buildAlpine:
	@$(DOCKER_HOST) image build -t $(DOCKER_IMG_FULL_NAME) -f Dockerfile.alpine .
	@$(MAKE) debug

# Code Compilation
debug:
	@$(MKDIR) $(BUILD)
	@$(DOCKER_HOST) container run $(DOCKER_ARG) $(DOCKER_IMG_FULL_NAME) sh -c $(BUILD_CMD)

# Code Run
run:
	@./$(BUILD)/$(DEBUG_EXEC)

# Code Test
test: debug

# Code Cleanup
clean:
	$(RMDIR) $(BUILD)/*