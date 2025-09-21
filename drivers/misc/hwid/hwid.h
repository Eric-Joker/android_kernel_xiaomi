/*
 * Copyright (C) 2021 XiaoMi, Inc.
 *               2022 The LineageOS Project
 *               2025 Eric-Joker
 *
 * SPDX-License-Identifier: GPL-2.0
 */

#ifndef __HWID_H__
#define __HWID_H__

#include <linux/types.h>

#define HARDWARE_PROJECT_UNKNOWN    0
#define HARDWARE_PROJECT_N2 		2
#define HARDWARE_PROJECT_N11U		3

// HARDWARE_PROJECT_N3 value determination:
// 
// The original decompiled code checks for multiple platform IDs using a bitmask (0xC84):
// - hw_version_platform <= 0xB (11 decimal)
// - ANDed with bitmask 0xC84 (binary: 1100 1000 0100)
// Valid platform IDs that satisfy this condition: 2, 7, 10, 11
//
// The source code specifically checks for HARDWARE_PROJECT_N3 only, 
// Given the BIT(10) operation aligns naturally with platform ID 10,
// HARDWARE_PROJECT_N3 is assigned value 10.
#define HARDWARE_PROJECT_N3 		10
#define HARDWARE_PROJECT_7		7
#define HARDWARE_PROJECT_11		11

typedef enum {
	CountryCN = 0x00,
	CountryGlobal = 0x01,
	CountryIndia = 0x02,
	CountryJapan = 0x03,
	INVALID = 0x04,
	CountryIDMax = 0x7FFFFFFF
} CountryType;

uint32_t get_hw_project_adc(void);
uint32_t get_hw_build_adc(void);
uint32_t get_hw_version_platform(void);
uint32_t get_hw_id_value(void);
uint32_t get_hw_country_version(void);
uint32_t get_hw_version_major(void);
uint32_t get_hw_version_minor(void);
uint32_t get_hw_version_build(void);
char* product_name_get(void);

#endif /* __HWID_H__ */