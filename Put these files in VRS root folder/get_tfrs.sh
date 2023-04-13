#!/bin/bash
VRS_EXTENSION_DIR="/home/osmc/dockerstuff/vrs2/data/CustomContent/CustomInjectedFiles"
TFR_BACKUP_FILE="tfrs.backup.$(date +%Y%m%d-%H%M%S).geojson"
TFR_LOG="tfrs.update.log"
echo -e "----------------------------------------------------------------------------------------" | tee -a ${TFR_LOG}
echo -e "\tBegin TFR update at $(date +%Y%m%d-%H%M%S)" | tee -a ${TFR_LOG}
echo -e "\tBacking up existing tfrs.geojson to ${TFR_BACKUP_FILE}" | tee -a ${TFR_LOG}
/usr/bin/cp ${VRS_EXTENSION_DIR}/tfrs.geojson ${VRS_EXTENSION_DIR}/"${TFR_BACKUP_FILE}"
echo -e "\tgzipping ${TFR_BACKUP_FILE}" | tee -a ${TFR_LOG}
/usr/bin/gzip "${TFR_BACKUP_FILE}"
echo -e "\tDownloading latest tfrs.geojson to tfrs.temp" | tee -a ${TFR_LOG}
/usr/bin/curl --compressed -L -s https://raw.githubusercontent.com/airframesio/data/master/json/faa/tfrs.geojson -o ${VRS_EXTENSION_DIR}/tfrs.temp

if command -v jq >/dev/null 2>&1; then
  echo -e "\tMinifying with jq" | tee -a ${TFR_LOG}
  /usr/bin/jq -c . tfrs.temp > tfrs.temp1
  /usr/bin/mv tfrs.temp1 tfrs.temp
else
  echo -e "\tjq not installed, continuing" | tee -a ${TFR_LOG}
fi

echo -e "\tWriting header and copying in tfrs.temp" | tee -a ${TFR_LOG}
echo "var tfrs = $(cat tfrs.temp)" > tfrs.geojson
echo -e "\tRemoving temp file" | tee -a ${TFR_LOG}
/usr/bin/rm tfrs.temp
echo -e "\tDone at $(date +%Y%m%d-%H%M%S)" | tee -a ${TFR_LOG}
