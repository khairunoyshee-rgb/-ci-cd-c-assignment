# Compiler and Flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -g
APP_NAME = app_artifact
TEST_NAME = unit_tests

# --- Primary Targets ---

# Default target: builds the main application artifact
all: $(APP_NAME)

# 1. Build the Main Application Artifact (Uses only subtraction.o as main() is inside subtraction.c)
$(APP_NAME): subtraction.o
	$(CC) $(CFLAGS) subtraction.o -o $(APP_NAME)
	@echo "Successfully compiled application artifact: $(APP_NAME)"

# 2. Build the Unit Test Executable
$(TEST_NAME): test_main.o subtraction.o
	$(CC) $(CFLAGS) test_main.o subtraction.o -o $(TEST_NAME)
	@echo "Successfully compiled unit test executable: $(TEST_NAME)"

# --- Object File Compilation ---

# Rule to compile subtraction.c into subtraction.o
# Dependency: subtraction.h
subtraction.o: subtraction.c subtraction.h
	$(CC) $(CFLAGS) -c subtraction.c

# Rule to compile test_main.c into test_main.o
# Dependency: subtraction.h
test_main.o: test_main.c subtraction.h
	$(CC) $(CFLAGS) -c test_main.c

# --- Utility Targets ---
.PHONY: clean
clean:
	rm -f *.o $(APP_NAME) $(TEST_NAME)
	@echo "Cleaned up object files and executables."
