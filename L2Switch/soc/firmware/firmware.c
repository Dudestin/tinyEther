/*
 *  PicoSoC - A simple example SoC using PicoRV32
 *
 *  Copyright (C) 2017  Claire Xenia Wolf <claire@yosyshq.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

#include <stdint.h>
#include <stdbool.h>

#define MEM_TOTAL 16384

// Terminal graphic macro
#define CLS print("\033[2J"); // clear screen
#define RED print("\033[31m");
#define GRN print("\033[32m");
#define YEL print("\033[33m");
#define BLU print("\033[34m");
#define RES_COL print("\033[39m"); // restore color
#define LOC(X, Y) print("\033[ ## X;# ## YH");

// a pointer to this is a null pointer, but the compiler does not
// know that because "sram" is a linker symbol from sections.lds.
extern uint32_t sram;

#define reg_uart_clkdiv (*(volatile uint32_t*)0x02000004)
#define reg_uart_data (*(volatile uint32_t*)0x02000008)

// PHY Stats Memory-mapped Interface
#define reg_phy0_rx_succ_count_gray (*(volatile uint16_t*)0x03000000)
#define reg_phy0_rx_OF_count_gray   (*(volatile uint16_t*)0x03000004)
#define reg_phy0_tx_succ_count_gray (*(volatile uint16_t*)0x03000008)
#define reg_phy0_tx_fail_count_gray (*(volatile uint16_t*)0x0300000C)

#define reg_phy1_rx_succ_count_gray (*(volatile uint16_t*)0x03000100)
#define reg_phy1_rx_OF_count_gray   (*(volatile uint16_t*)0x03000104)
#define reg_phy1_tx_succ_count_gray (*(volatile uint16_t*)0x03000108)
#define reg_phy1_tx_fail_count_gray (*(volatile uint16_t*)0x0300010C)

#define reg_phy2_rx_succ_count_gray (*(volatile uint16_t*)0x03000200)
#define reg_phy2_rx_OF_count_gray   (*(volatile uint16_t*)0x03000204)
#define reg_phy2_tx_succ_count_gray (*(volatile uint16_t*)0x03000208)
#define reg_phy2_tx_fail_count_gray (*(volatile uint16_t*)0x0300020C)

#define reg_phy3_rx_succ_count_gray (*(volatile uint16_t*)0x03000300)
#define reg_phy3_rx_OF_count_gray   (*(volatile uint16_t*)0x03000304)
#define reg_phy3_tx_succ_count_gray (*(volatile uint16_t*)0x03000308)
#define reg_phy3_tx_fail_count_gray (*(volatile uint16_t*)0x0300030C)

#define PHY0_ADDR   (volatile uint16_t*)0x07000000
#define PHY1_ADDR   (volatile uint16_t*)0x07000100
#define PHY2_ADDR   (volatile uint16_t*)0x07000200
#define PHY3_ADDR   (volatile uint16_t*)0x07000300

#define REG0_OFFSET  (0x00000000)
#define REG1_OFFSET  (0x00000004)
#define REG2_OFFSET  (0x00000008)
#define REG3_OFFSET  (0x0000000C)
#define REG4_OFFSET  (0x00000010)
#define REG5_OFFSET  (0x00000014)
#define REG6_OFFSET  (0x00000018)
#define REG7_OFFSET  (0x0000001C)
#define REG8_OFFSET  (0x00000020)
#define REG9_OFFSET  (0x00000024)
#define REG10_OFFSET (0x00000028)
#define REG11_OFFSET (0x0000002C)

#define HOGEFUGA (*(volatile uint16_t*)0x07000008)

// --------------------------------------------------------

void putchar(char c)
{
        if (c == '\n')
                putchar('\r');
        reg_uart_data = c;
}

void print(const char *p)
{
        while (*p)
                putchar(*(p++));
}

void print_hex(uint32_t v, int digits)
{
        for (int i = 7; i >= 0; i--) {
                char c = "0123456789abcdef"[(v >> (4*i)) & 15];
                if (c == '0' && i >= digits) continue;
                putchar(c);
                digits = i;
        }
}

void print_dec(uint32_t v)
{
        if (v >= 1000) {
                print(">=1000");
                return;
        }

        if      (v >= 900) { putchar('9'); v -= 900; }
        else if (v >= 800) { putchar('8'); v -= 800; }
        else if (v >= 700) { putchar('7'); v -= 700; }
        else if (v >= 600) { putchar('6'); v -= 600; }
        else if (v >= 500) { putchar('5'); v -= 500; }
        else if (v >= 400) { putchar('4'); v -= 400; }
        else if (v >= 300) { putchar('3'); v -= 300; }
        else if (v >= 200) { putchar('2'); v -= 200; }
        else if (v >= 100) { putchar('1'); v -= 100; }

        if      (v >= 90) { putchar('9'); v -= 90; }
        else if (v >= 80) { putchar('8'); v -= 80; }
        else if (v >= 70) { putchar('7'); v -= 70; }
        else if (v >= 60) { putchar('6'); v -= 60; }
        else if (v >= 50) { putchar('5'); v -= 50; }
        else if (v >= 40) { putchar('4'); v -= 40; }
        else if (v >= 30) { putchar('3'); v -= 30; }
        else if (v >= 20) { putchar('2'); v -= 20; }
        else if (v >= 10) { putchar('1'); v -= 10; }

        if      (v >= 9) { putchar('9'); v -= 9; }
        else if (v >= 8) { putchar('8'); v -= 8; }
        else if (v >= 7) { putchar('7'); v -= 7; }
        else if (v >= 6) { putchar('6'); v -= 6; }
        else if (v >= 5) { putchar('5'); v -= 5; }
        else if (v >= 4) { putchar('4'); v -= 4; }
        else if (v >= 3) { putchar('3'); v -= 3; }
        else if (v >= 2) { putchar('2'); v -= 2; }
        else if (v >= 1) { putchar('1'); v -= 1; }
        else putchar('0');
}

char getchar_prompt(char *prompt)
{
        int32_t c = -1;

        uint32_t cycles_begin, cycles_now, cycles;
        __asm__ volatile ("rdcycle %0" : "=r"(cycles_begin));

        if (prompt)
                print(prompt);

        while (c == -1) {
                __asm__ volatile ("rdcycle %0" : "=r"(cycles_now));
                cycles = cycles_now - cycles_begin;
                if (cycles > 12000000) {
                        if (prompt)
                                print(prompt);
                        cycles_begin = cycles_now;
                }
                c = reg_uart_data;
        }

        return c;
}

char getchar()
{
        return getchar_prompt(0);
}

uint16_t gray2bin(uint16_t n) {
        uint16_t mask = n;
        while (mask) {
                mask >>= 1;
                n ^= mask;
        }
        return n;
}

void print_phy_regs()
{
        uint32_t cycles_begin, cycles_now, cycles;
        __asm__ volatile ("rdcycle %0" : "=r"(cycles_begin));

        while (1) {
                __asm__ volatile ("rdcycle %0" : "=r"(cycles_now));
                cycles = cycles_now - cycles_begin;
                if (cycles > 48000000) { // per sec.
                        CLS
                        LOC(1,1)
                        GRN print("PHY0_RX_SUCCESS_COUNT:\t");
                        print_hex(gray2bin(reg_phy0_rx_succ_count_gray), 16);
                        RED print("\nPHY0_RX_OVERFLOW_COUNT:\t");
                        print_hex(gray2bin(reg_phy0_rx_OF_count_gray) ,  16);
                        GRN print("\nPHY0_TX_SUCCESS_COUNT:\t");
                        print_hex(gray2bin(reg_phy0_tx_succ_count_gray), 16);
                        RED print("\nPHY0_TX_FAIL_COUNT:\t");
                        print_hex(gray2bin(reg_phy0_tx_fail_count_gray), 16);
                        putchar('\n');

                        GRN print("\nPHY1_RX_SUCCESS_COUNT:\t");
                        print_hex(gray2bin(reg_phy1_rx_succ_count_gray), 16);
                        RED print("\nPHY1_RX_OVERFLOW_COUNT:\t");
                        print_hex(gray2bin(reg_phy1_rx_OF_count_gray) ,  16);
                        GRN print("\nPHY1_TX_SUCCESS_COUNT:\t");
                        print_hex(gray2bin(reg_phy1_tx_succ_count_gray), 16);
                        RED print("\nPHY1_TX_FAIL_COUNT:\t");
                        print_hex(gray2bin(reg_phy1_tx_fail_count_gray), 16);
                        putchar('\n');

                        GRN print("\nPHY2_RX_SUCCESS_COUNT:\t");
                        print_hex(gray2bin(reg_phy2_rx_succ_count_gray), 16);
                        RED print("\nPHY2_RX_OVERFLOW_COUNT:\t");
                        print_hex(gray2bin(reg_phy2_rx_OF_count_gray) ,  16);
                        GRN print("\nPHY2_TX_SUCCESS_COUNT:\t");
                        print_hex(gray2bin(reg_phy2_tx_succ_count_gray), 16);
                        RED print("\nPHY2_TX_FAIL_COUNT:\t");
                        print_hex(gray2bin(reg_phy2_tx_fail_count_gray), 16);
                        putchar('\n');

                        GRN print("\nPHY3_RX_SUCCESS_COUNT:\t");
                        print_hex(gray2bin(reg_phy3_rx_succ_count_gray), 16);
                        RED print("\nPHY3_RX_OVERFLOW_COUNT:\t");
                        print_hex(gray2bin(reg_phy3_rx_OF_count_gray) ,  16);
                        GRN print("\nPHY3_TX_SUCCESS_COUNT:\t");
                        print_hex(gray2bin(reg_phy3_tx_succ_count_gray), 16);
                        RED print("\nPHY3_TX_FAIL_COUNT:\t");
                        print_hex(gray2bin(reg_phy3_tx_fail_count_gray), 16);
                        RES_COL

                        cycles_begin = cycles_now;
                }
        }

        return ;
}

void main()
{
        reg_uart_clkdiv = 104;

        while (getchar_prompt("Press ENTER to continue..\n") != '\r') { /* wait */ }

        print("\n");
        print("  ____  _          ____         ____\n");
        print(" |  _ \\(_) ___ ___/ ___|  ___  / ___|\n");
        print(" | |_) | |/ __/ _ \\___ \\ / _ \\| |\n");
        print(" |  __/| | (_| (_) |__) | (_) | |___\n");
        print(" |_|   |_|\\___\\___/____/ \\___/ \\____|\n");
        print("\n");

        print_hex(HOGEFUGA, 16);

        // print_phy_regs();
}
