/* Flash_sections.s
 *
 * Custom configuration for wolfCrypt/wolfSSL.
 * Enabled via WOLFSSL_USER_SETTINGS.
 *
 *
 * Copyright (C) 2024 wolfSSL Inc.
 *
 * This file is part of wolfBoot.
 *
 * wolfBoot is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * wolfBoot is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1335, USA
 */
/* This file is used to include the application update image into
the loader project. */

.section .IMAGE_APP_FLASH_update, "ax", %progbits
/* To download the app v2, please remove comment out.  */
/* .incbin "../../app_RZ/Debug/app_RZ_v2.0_signed.bin" */
