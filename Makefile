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
DOCKER_UID ?= $(shell id -u)
DOCKER_GID ?= $(shell id -g)
DOCKER_IMG_NAME:=cpp_template
DOCKER_IMG_VER:=1
DOCKER_IMG_FULL_NAME:=$(DOCKER_IMG_NAME):$(DOCKER_IMG_VER)
DOCKER_WORK_DIR:=/app
DOCKER_VOL:= --mount type=bind,source=.,target=$(DOCKER_WORK_DIR)
DOCKER_USER_ARG:= --user $(DOCKER_UID):$(DOCKER_GID)
DOCKER_ARG:= --init --rm -it $(DOCKER_VOL) -w $(DOCKER_WORK_DIR)/$(BUILD)

# Build Command (i.e. Used to build project)
BUILD_CMD:="$(CMAKE) .. && $(MAKE)"

# Targets
# all: buildImg debug
all: buildAlpine debug

# To build image
buildImg:
	@$(DOCKER_HOST) image build -t $(DOCKER_IMG_FULL_NAME) .

# To build Alpine Image
buildAlpine:
	@$(DOCKER_HOST) image build -t $(DOCKER_IMG_FULL_NAME) -f Dockerfile.alpine .

# Code Compilation
debug:
	@$(MKDIR) $(BUILD)
	@$(DOCKER_HOST) container run $(DOCKER_ARG) $(DOCKER_IMG_FULL_NAME) $(BUILD_CMD)

# Code Run
run:
	@./$(BUILD)/$(DEBUG_EXEC)

# Code Test
test: debug

# Code Cleanup
clean:
	$(RMDIR) $(BUILD)/**