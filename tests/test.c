#define TINYUBSAN_PRINT printf
#include <stdarg.h>
#include <stdio.h>
#include <tinyubsan.c>

int main() {

  int *ptr = NULL;

  printf("%d", *ptr);

  return 0;
}
