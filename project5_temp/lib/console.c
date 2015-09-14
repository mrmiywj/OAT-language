#include "console.h"

/* Much of the ncurses initialization comes from the robotfindskitten
 * POSIX C implementation. */

#include <ncurses.h>

/* Print str at the cursor location. */
void con_print(int str) {
  unsigned int x;
  for (x = 0; x < (unsigned int)((int*)str)[-1]; ++x)
    addch(((char*)str)[x]);
}

void con_printch(int ch) {
  addch(ch);
}

void con_sleep(int duration) {
  delay_output(duration * 1000);
}

/* Move the cursor to a new location. */
void con_move(int x, int y) {
  move(y,x);
}

/* Set attributes for printing. */
int con_attrset(int attr) {
  static short dummy;
  int old;
  attr_get(&old,&dummy,0);
  attrset(attr);
  return old;
}

/* Returns current attributes. */
int con_attrget() {
  static short dummy;
  int old;
  attr_get(&old,&dummy,0);
  return old;
}

/* Clear the current line. */
void con_clrtoeol() {
  clrtoeol();
}

/* Refresh the console. */
void con_refresh() {
  refresh();
}

/* Wait for keyboard input. */
int con_getch() {
  int kc = getch();
  switch (kc) {
  case KEY_LEFT: kc = 4; break;
  case KEY_RIGHT: kc = 5; break;
  case KEY_UP: kc = 3; break;
  case KEY_DOWN: kc = 2; break;
  }
  return kc;
}

/* Clear the console screen. */
void con_clear() {
  clear();
}

/* Get an attribute set to a particular color. */
int con_color(int c) {
  return COLOR_PAIR(c);
}

/* Get the bold version of an attribute. */
int con_bold(int a) {
  return a | A_BOLD;
}

/* Initialize drawing with some useful defaults and hook termination to
 * clean up the terminal. */
void con_init() {
  initscr();
  keypad(stdscr, TRUE);
  nonl();
  intrflush(stdscr, FALSE);
  noecho();
  cbreak();
  if (has_colors()) {
    start_color();
    init_pair(COLOR_BLACK, COLOR_BLACK, COLOR_BLACK);
    init_pair(COLOR_GREEN, COLOR_GREEN, COLOR_BLACK);
    init_pair(COLOR_RED, COLOR_RED, COLOR_BLACK);
    init_pair(COLOR_CYAN, COLOR_CYAN, COLOR_BLACK);
    init_pair(COLOR_WHITE, COLOR_WHITE, COLOR_BLACK);
    init_pair(COLOR_MAGENTA, COLOR_MAGENTA, COLOR_BLACK);
    init_pair(COLOR_BLUE, COLOR_BLUE, COLOR_BLACK);
    init_pair(COLOR_YELLOW, COLOR_YELLOW, COLOR_BLACK);
  }
}

int con_halfdelay(int t) {
  return halfdelay(t);
}

int con_width() {
  return COLS;
}

int con_height() {
  return LINES;
}

void con_cleanup() {
  endwin();
}
