#include "frame.h"

/* return : BPDS : 1, PAUSE : 2, NO MATCH : 0 */
unsigned char get_frame_type (volatile struct FRAME_RX* frame)
{
    switch (frame->exp_header.orig_header.DST_MAC[5])
    {
        case 0x0: // is BPDS
            return 1;
        case 0x1: // is PAUSE
            return 2;
        default : 
            return 0;
    }
}

