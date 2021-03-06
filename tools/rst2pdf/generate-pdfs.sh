#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "usage: `basename $0` <output-dir>"
    echo "   <output-dir> - dir that will contain the pdfs"
    exit 1
fi

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ABI_ROOT=${CURR_DIR}/../..
OUTPUT_DIR=$1

mkdir -p ${OUTPUT_DIR}
rst2pdf ${ABI_ROOT}/aapcs64/aapcs64.rst -s ${CURR_DIR}/rst2pdf-abi.style \
        --repeat-table-rows --default-dpi=110 --footer="###Page###" -o ${OUTPUT_DIR}/aapcs64.pdf
rst2pdf ${ABI_ROOT}/vfabia64/vfabia64.rst -s ${CURR_DIR}/rst2pdf-abi.style \
        --repeat-table-rows --footer="###Page###" -o ${OUTPUT_DIR}/vfabia64.pdf
