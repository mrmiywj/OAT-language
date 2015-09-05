#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>

/* These functions are defined by compiling a well-formed Oat source 
 * program. */
extern int program(int argc, int* argv);
extern void oat_init();


/************************
 * Oat Internal Functions
 ************************/

int* oat_malloc(int size) {
  return (int*)malloc(size);
}

int* oat_alloc_array (int size) {
  assert (size >= 0);
  int *arr = (int*)malloc(sizeof(int) * (size+1));
  arr[0] = size;
  return arr;
}	

void oat_array_bounds_check(int bound, int index) {
  if ((0 <= index) && (index < bound)) return;
  fprintf(stderr, "Array bounds violation: bound = %d index = %d.\n", bound, index);
  exit(-1);
}


/************************
 * Oat Builtin Functions 
 ************************/
int* array_of_string (char *str) {
  int len, i, *arr;
  char *p;

  assert (NULL != str);

  len = strlen(str);
  assert (len >= 0);

  arr = (int*)malloc(sizeof(int) * (len+1));
  arr[0] = len;
  for (i=0; i<len; i++) {
    arr[i+1]=(int)str[i];
  }

  return arr; 
}


int* string_of_array (int *arr) {
  int len, i;
  char *str;

  assert (NULL != arr);

  len = arr[0];
  assert (len >= 0);

  str = malloc(sizeof(char) * (len+1));
  
  for (i=0; i<len; i++) {
    str[i] = (char)arr[i+1];
    assert (0 != str[i]);
  }
  str[len] = 0;

  return (int*)(str);
}

void print_string (int* str) {
  assert (NULL != str);
  printf ("%s", (char*)str);
}

void print_int (int i) {
  printf ("%d", i);
}

void print_bool (int i) {
  printf ("%d", i);
}


/* 
 * Convert the argv array into an Oat array of 
 * type string[]
 * Invoke the Oat 'program' entry point after
 * initializing the global variables.
 * Prints the results of the Oat program call 
 * to the terminal.
 */
int main(int argc, char* argv[]) {
  int *oargv, i, result;

  oargv = oat_alloc_array(argc); 

  /* Copy the string pointers to the correct places. */
  for (i=0; i<argc; i++){
    oargv[i+1] = (int)argv[i];
  }

  /* Call the initialization code. */
  oat_init();
  result = program(argc, oargv);
  printf("%d\n", result);
  return result;
}
