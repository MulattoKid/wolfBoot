#!/bin/bash

# Copy binaries
cp ../wolfboot.elf .
cp ../wolfboot.bin .
cp ../wolfboot_signing_private_key.der .
cp ../test-app/image* .

# Remove first 256 bytes from binary (dummy header)
dd if=image.bin of=image_without_dummy_header.bin bs=1 skip=256

# Sign image v1
../tools/keytools/sign --ecc256 image_without_dummy_header.bin ./wolfboot_signing_private_key.der 1
mv image_without_dummy_header_v1_signed.bin image_with_header_v1_signed.bin

# Extract header from signed binary
dd if=image_with_header_v1_signed.bin of=header_v1.bin bs=256 count=1

# Update .fw_header section in ELF
arm-none-eabi-objcopy -I elf32-littlearm -O elf32-littlearm --update-section .fw_header=header_v1.bin image.elf image_with_header_v1_signed.elf


# Sign image v2
../tools/keytools/sign --ecc256 image_without_dummy_header.bin ./wolfboot_signing_private_key.der 2
mv image_without_dummy_header_v2_signed.bin image_with_header_v2_signed.bin

# Extract header from signed binary
dd if=image_with_header_v2_signed.bin of=header_v2.bin bs=256 count=1

# Update .fw_header section in ELF
arm-none-eabi-objcopy -I elf32-littlearm -O elf32-littlearm --update-section .fw_header=header_v2.bin image.elf image_with_header_v2_signed.elf