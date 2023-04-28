APP_NAME = geometry
LIB_NAME = libgeometry

CPPFLAGS = -I src -MMD
CC = g++

BIN_ = bin
BIN_DIR = bin/geometry
OBJ_DIR = obj
SRC_DIR = src
TEST_OUT_DIR = bin/geometry-test

TARGET_OUT_NAME = geometry
TARGET = main

THIRDPARTY_DIR = thirdparty

TEST_SRC_DIR = test
TEST_OUT_NAME = geometry-test
TEST_OBJ_DIR = $(OBJ_DIR)/$(TEST_OUT_NAME)
TEST_OBJECTS = $(TEST_OBJ_DIR)/ctest.o $(TEST_OBJ_DIR)/main.o

APP_PATH = $(BIN_DIR)/$(APP_NAME)
LIB_PATH = $(BIN_DIR)/libgeometry.a
LIB_OBJ_DIR = obj/src/libgeometry
LIB_HEADERS_DIR = $(SRC_DIR)/libgeometry

SRC_EXT = cpp

APP_SOURCES = $(shell find $(SRC_DIR)/$(APP_NAME) -name '*.$(SRC_EXT)')
APP_OBJECTS = $(APP_SOURCES:$(SRC_DIR)/%.$(SRC_EXT)=$(OBJ_DIR)/$(SRC_DIR)/%.o)

LIB_SOURCES = $(shell find $(SRC_DIR)/$(LIB_NAME) -name '*.$(SRC_EXT)')
LIB_OBJECTS = $(LIB_SOURCES:$(SRC_DIR)/%.$(SRC_EXT)=$(OBJ_DIR)/$(SRC_DIR)/%.o)

DEPS = -MMD

SRCS := $(shell find . -type f -name '*.cpp')
HDRS := $(shell find . -type f -name '*.h')

all: clean format $(LIB_PATH) test $(APP_PATH)  

$(APP_PATH): $(APP_OBJECTS) $(LIB_PATH)
	$(CC) $(CFLAGS) $(CPPFLAGS) $^ -o $@ $(LDFLAGS) $(LDLIBS)

$(LIB_PATH): $(LIB_OBJECTS)
	ar rcs $@ $^

$(OBJ_DIR)/%.o: %.cpp
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@


$(BIN_)/$(TEST_OUT_NAME)/$(TEST_OUT_NAME): $(TEST_OBJECTS)
	$(CC) $(TEST_OBJECTS) -I$(THIRDPARTY_DIR) -I$(LIB_HEADERS_DIR) -L$(BIN_)/$(TARGET_OUT_NAME) -l$(TARGET_OUT_NAME) -w -o $@

$(TEST_OBJ_DIR)/%.o: $(TEST_SRC_DIR)/%.cpp
	$(CC) $(DEPS) -I$(THIRDPARTY_DIR) -I$(LIB_HEADERS_DIR) -L$(BIN_)/$(TARGET_OUT_NAME) -l$(TARGET_OUT_NAME) -c $< -w -o $@

test: $(BIN_)/geometry-test/geometry-test
	./$<

clean:
	$(RM) $(APP_PATH) $(LIB_PATH) $(BIN_DIR)/$(APP_NAME)
	find $(OBJ_DIR) -name '*.o' -exec $(RM) '{}' \;
	find $(OBJ_DIR) -name '*.d' -exec $(RM) '{}' \;
	rm -rf $(OBJ_DIR)/geometry/*.o $(OBJ_DIR)/geometry/*.d
	rm -rf $(OBJ_DIR)/geometry-test/*.o $(OBJ_DIR)/geometry-test/*.d
	rm -rf $(TEST_OBJ_DIR)/*.o $(TEST_OBJ_DIR)/*.d
	rm -rf $(LIB_OBJ_DIR)/*.o $(LIB_OBJ_DIR)/*.d

	
format:
	clang-format -i $(SRCS) $(HDRS)
	

.PHONY: all clean format test