#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <tinyubsan.h>

UBSAN_HANDLER void tinyubsan_log(const char *fmt) {
    printf("%s", fmt);
} 

[[noreturn]] UBSAN_HANDLER void tinyubsan_trap() {
    abort();
}

int main() {

  int *ptr = NULL;

  printf("%d", *ptr);

  return 0;
}
