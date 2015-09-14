/** console.h
  * Very tiny curses. */

#ifndef __CONSOLE_H__
#define __CONSOLE_H__

/******************************************************************************/
/* Drawing to the console. */
/******************************************************************************/

/* Sleep for some number of seconds. */
void con_sleep(int duration);

/* Print str at the cursor location. */
void con_print(int str);

/* Print ch at the cursor location. */
void con_printch(int ch);

/* Move the cursor to a new location. */
void con_move(int x, int y);

/* Set attributes for printing. Returns old attributes. */
int con_attrset(int attr);

/* Returns current attributes. */
int con_attrget();

/* Clear the current line. */
void con_clrtoeol();

/* Clear the screen. */
void con_clear();

/* Refresh the console. */
void con_refresh();

/* Initialize drawing with some useful defaults and hook termination to
 * clean up the terminal. */
void con_init();

/* Clean up drawing. */
void con_cleanup();

/* Wait for keyboard input. */
int con_getch();

/* Get an attribute set to a particular color. */
int con_color(int c);

/* Get the bold version of an attribute. */
int con_bold(int a);

/* Get the width of the terminal. */
int con_width();

/* Get the height of the terminal. */
int con_height();

#endif
