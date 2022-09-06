#pragma once

#include <stdint.h>

#define MAC_ADDR (0xAA_AA_AA_AA_AA_AA) // system MAC address (not each port's MAC address)
#define BRIDGE_PRIORITY (32768)        // 0(high priority) to 65535, default : 32768
/* if you desire to use this switch as STP root-bridge, active following statements */
// #define BRIDGE_PRIORITY (0)

/* definition of Frame memory layout */

/* Ethernet Frame Header */
/* 14 Bytes */
struct HEADER {
    uint8_t  DST_MAC[6];  // 6-Bytes
    uint8_t  SRC_MAC[6];  // 6-Bytes
    uint16_t TYPE;        // 2-Bytes
} __attribute__((__packed__));

/* my original expanded header */
/* 16 Bytes */
/* used in RX only, don't use for TX !! */
struct EXPAND_HEADER {
    uint16_t PAD : 12;
    uint8_t  FCS_CORRECT : 1;
    uint8_t  IS_CTRL : 1;
    uint8_t  PORT : 2; // frame comming port
    struct HEADER orig_header;
} __attribute__((__packed__));

/* IEEE802.2 LLC */
/* 3 Bytes */
struct LLC {
    uint8_t DSAP;
    uint8_t SSAP;
    uint8_t CTRL;
} __attribute__((__packed__));

/* BPDU ver.0 format */
/* 38 + 8(PAD) = 46 Bytes */
struct BPDU_ver0 {
    struct LLC llc;
    uint16_t PROT_ID;  // 2-bytes
    uint8_t  PROT_VER;
    uint8_t  BPDU_TYPE;
    uint8_t  BPDU_FLAG;
    uint64_t ROOT_ID;  // 8-Bytes
    uint32_t ROOT_PATH_COST; // 4-Bytes
    uint64_t BRID_ID;  // 8-Bytes
    uint16_t PORT_IDEN;// 2-Bytes
    uint16_t MSG_AGE;  // 2-Bytes
    uint16_t MAX_AGE;  // 2-Bytes
    uint16_t HEL_TIME; // 2-Bytes
    uint16_t FRWD_DLY; // 2-Bytes    
    uint8_t  PAD[7];   // padding, 7-Bytes
} __attribute__((__packed__));

/* PAUSE defined as IEEE802.3X */
/* 4 + 42 = 46 Bytes (and Padding) */
struct PAUSE {
    uint16_t OPR_CODE; // 2-Bytes
    uint16_t ABT_TIME; // 2-Bytes
    uint8_t  PAD[42];  // 42-Bytes
} __attribute__((__packed__));

/* Payload memory layout */
union  PAYLOAD {
    struct BPDU_ver0 bpdu;
    struct PAUSE pause;
} __attribute__((__packed__)) body; // 46-Bytes

/* FRAME layout for TX module */
/* 14(HEADER) + 46(PAYLOAD) + 4(FCS) = 64 Bytes */
struct FRAME_TX {
    struct HEADER header; // 14-Bytes
    union  PAYLOAD payload; // 46-Bytes
    uint32_t FCS; // 4-Bytes
} __attribute__((__packed__));

/* FRAME layout for RX module */
/* 16(EXPAND_HEADER) + 46(PAYLOAD) + 4(FCS) = 66 Bytes */
/* exceed 64 Bytes, so half of FCS section will be cut off*/
/* But this is not a problem, FCS correct check is done by hardware at before */
/* you can check FCS-check result at EXPAND_HEADER.FCS_CORRECT */
struct FRAME_RX {
    struct EXPAND_HEADER exp_header; // 16-Bytes
    union  PAYLOAD payload; // 46-Bytes
    uint32_t FCS; // 4-Bytes
} __attribute__((__packed__));
