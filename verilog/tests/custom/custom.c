#include <stdbool.h>
#include <stdint.h>
#include "../../include/console.h"

// -----------------------------------------------------------------------------
// UART / Console helper functions
// -----------------------------------------------------------------------------

// The UART write function is implemented in ../../lib/console.c
extern void potato_uart_write(char c);

// Single character output
static void console_putc(char c)
{
    potato_uart_write(c);
}

// Print a string via UART
void console_puts(const char *s)
{
    while (*s) {
        console_putc(*s++);
    }
}

// Print an unsigned integer in decimal
void console_putn(unsigned long n)
{
    char buf[32];
    int i = 0;

    if (n == 0) {
        console_putc('0');
        return;
    }

    while (n > 0 && i < (int)(sizeof(buf) - 1)) {
        buf[i++] = '0' + (n % 10);
        n /= 10;
    }

    while (i--) {
        console_putc(buf[i]);
    }
}

// -----------------------------------------------------------------------------
// Custom instruction macros (dummy encodings for Microwatt custom ops)
// -----------------------------------------------------------------------------

// In real Microwatt hardware, you'd encode your actual custom instruction opcode here.
#define CUSTOM_OPCODE 22  // placeholder opcode for testing

// Inline assembly macros (currently no real effect, just placeholders)
#define custom_add_i8(rt, ra, rb) \
    __asm__ volatile("/* custom add i8: rt=%0 ra=%1 rb=%2 */" :: "r"(rt), "r"(ra), "r"(rb))

#define custom_sub_i8(rt, ra, rb) \
    __asm__ volatile("/* custom sub i8: rt=%0 ra=%1 rb=%2 */" :: "r"(rt), "r"(ra), "r"(rb))

#define custom_fp8_add(rt, ra, rb) \
    __asm__ volatile("/* custom fp8 add: rt=%0 ra=%1 rb=%2 */" :: "r"(rt), "r"(ra), "r"(rb))

#define custom_fp8_mul(rt, ra, rb) \
    __asm__ volatile("/* custom fp8 mul: rt=%0 ra=%1 rb=%2 */" :: "r"(rt), "r"(ra), "r"(rb))

// -----------------------------------------------------------------------------
// Main test program
// -----------------------------------------------------------------------------
int main(void)
{
    console_puts("\n--- Microwatt Custom Instruction Test ---\n");

    uint8_t a = 5, b = 3;
    uint8_t result_add = 0, result_sub = 0;
    uint8_t result_fpadd = 0, result_fpmul = 0;

    // Placeholder software simulation (replace later with real custom instruction calls)
    result_add = a + b;
    result_sub = a - b;
    result_fpadd = a + b; // Simulated FP8 add
    result_fpmul = a * b; // Simulated FP8 mul

    console_puts("Input A = "); console_putn(a); console_puts("\n");
    console_puts("Input B = "); console_putn(b); console_puts("\n");

    console_puts("ADD_I8  Result = "); console_putn(result_add); console_puts("\n");
    console_puts("SUB_I8  Result = "); console_putn(result_sub); console_puts("\n");
    console_puts("FP8_ADD Result = "); console_putn(result_fpadd); console_puts("\n");
    console_puts("FP8_MUL Result = "); console_putn(result_fpmul); console_puts("\n");

    console_puts("--- End of Custom Test ---\n");

    return 0;
}

