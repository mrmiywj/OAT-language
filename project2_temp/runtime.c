#include <stdio.h>
#include <stdlib.h>

extern int program();

int main(int argc, char* argv[]) {
  int arg = 0;
  if (argc > 2) {
    printf("runtime: program expected at most one argument\n");
    exit(-1);
  }
  if (argc == 2) {
    arg = atoi(argv[1]);
  }
  int result = program(arg);
  printf("%d\n", result);
  return result;
}
