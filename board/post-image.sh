#!/usr/bin/env bash
set -eo pipefail

GENIMAGE_CFG_IN="${BR2_EXTERNAL_IOT_BLE_SERVER_PATH}/board/genimage.cfg.in"
GENIMAGE_CFG="${BINARIES_DIR}/genimage.cfg"

FILES=(
  "Image.gz"
)

for i in "${BINARIES_DIR}"/*.dtb "${BINARIES_DIR}"/rpi-firmware/*; do
  FILES+=("${i#${BINARIES_DIR}/}")
done

BOOT_FILES=$(printf '\\t\\t\\t"%s",\\n' "${FILES[@]}")
sed "s|#BOOT_FILES#|${BOOT_FILES}|" "${GENIMAGE_CFG_IN}" \
  >"${GENIMAGE_CFG}"

support/scripts/genimage.sh -c "${GENIMAGE_CFG}"

