#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "subtraction.h"

int run_test(const char* name, const char* word1, const char* word2, const char* expected) {
    char* result = string_subtraction(word1, word2);
    // Assertion: Checks if the function's result matches the expected result
    int passed = (result != NULL && strcmp(result, expected) == 0);
    
    printf("Test '%s': %s\n", name, passed ? "PASSED" : "FAILED");
    
    if (result) free(result);
    return passed;
}

int main() {
    int passed_count = 0;
    int total_tests = 2;

    // Test cases that must pass
    passed_count += run_test("Test 1: Normal Strings Concatenation", "Apple", "Pie", "ApplePie");
    passed_count += run_test("Test 2: Empty Second String", "Test", "", "Test");
    
    printf("\nSummary: %d / %d tests passed.\n", passed_count, total_tests);
    
    // Returns 0 on total success, 1 on failure. CI pipeline depends on this.
    return (passed_count == total_tests) ? 0 : 1; 
}
