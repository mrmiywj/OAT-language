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
  return (int*)calloc(size, sizeof(char));
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

void oat_abort(int errno) { 
  if (-1 == errno) {}	
  else if (0 == errno) fprintf(stderr, "Out-of-bound.\n");
  else if (1 == errno) fprintf(stderr, "Uninitialized non-null vars.\n");
  else fprintf(stderr, "Unknown error: %d.\n", errno);
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

int length_of_array (int *arr) {
  assert (NULL != arr);
  return arr[0];	  
}

int length_of_string (int *str) {
  assert (NULL != str);
  return strlen((char*)str);
}

int* string_of_int(int i) {
  static char buf[128];
  static int len;
  len = sprintf(buf,"%d",i);
  char* str = (char*) malloc(sizeof(char) * (len + 1));
  memcpy(str, buf, len);
  str[len] = 0;
  return (int*)str;
}

int* string_cat(int* l, int* r) {
  size_t ll = strlen((char*)l);
  size_t lr = strlen((char*)r);
  char* new = (char*) malloc(sizeof(char) * (ll + lr + 1));
  memcpy(new, (char*)l, ll);
  memcpy(new + ll, (char*)r, lr);
  new[ll + lr] = 0;
  return (int*)new;
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
 * A few math routines, declared in lib/math.oat
 */
int random_int() { return (rand() & 0x8FFFFFFF); }

int oat_div (int a, int b) {
  return a / b;
}

int oat_mod (int a, int b) {
  return a % b;
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
