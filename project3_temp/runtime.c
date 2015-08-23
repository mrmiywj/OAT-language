#include <stdio.h>
#include <stdlib.h>

extern int program();

int main(int argc, char* argv[]) {
  int arg = 0;
  if (argc > 2) {
    printf("runtime: program expects at most one argument (which is ignored)\n");
    exit(-1);
  }
  int result = program();
  printf("%d\n", result);
  return result;
}
