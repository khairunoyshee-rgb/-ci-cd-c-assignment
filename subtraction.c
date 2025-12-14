#include <stdlib.h>
#include <string.h>
#include <stdio.h>

char* string_subtraction(const char* word1, const char* word2) {
    if (!word1) return NULL;

    size_t len1 = strlen(word1);
    size_t len2 = word2 ? strlen(word2) : 0;
    
    char* result = (char*)malloc(len1 + len2 + 1);
    if (result == NULL) return NULL;
    
    strcpy(result, word1);
    if (word2) {
        strcat(result, word2);
    }

    return result;
}

int main() {
    char* result = string_subtraction("Hello", "CI/CD");
    if (result) {
        printf("Application run successful. Result: %s\n", result);
        free(result);
    } else {
        return 1;
    }
    return 0;
}
