/*
*   main.c
*/

#include "types.h"
#include "sdmmc.h"
#include "cache.h"

void main(void)
{
    //Initialize sdcard and nand
    sdmmc_sdcard_init();

    sdmmc_nand_readsectors(0x5C008, 30, (u8 *)0x08007000);

    flushCaches();

    //Jump to tertiary payload
    ((void (*)())0x08007000)();
}
