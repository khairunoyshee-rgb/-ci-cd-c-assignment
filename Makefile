# Compiler and Flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -g
APP_NAME = app_artifact
TEST_NAME = unit_tests

# Default target: builds the main application artifact
all: $(APP_NAME)

# Target for the Build Stage
$(APP_NAME): subtraction.o # main.o is not strictly necessary as main() is in subtraction.c
	$(CC) $(CFLAGS) subtraction.o -o $(APP_NAME)
	@echo "Successfully compiled application artifact: $(APP_NAME)"

# Target for the Test Stage
$(TEST_NAME): test_main.o subtraction.o
	$(CC) $(CFLAGS) test_main.o subtraction.o -o $(TEST_NAME)
	@echo "Successfully compiled unit test executable: $(TEST_NAME)"

# Object file dependencies
subtraction.o: subtraction.c subtraction.h
	$(CC) $(CFLAGS) -c subtraction.c

test_main.o: test_main.c subtraction.h
	$(CC) $(CFLAGS) -c test_main.c

# Clean up utility
.PHONY: clean
clean:
	rm -f *.o $(APP_NAME) $(TEST_NAME)
	@echo "Cleaned up object files and executables."
