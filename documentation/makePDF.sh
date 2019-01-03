#!/bin/bash

if [ $# -ne 2 ]; then
    echo ""
    echo "Script usage: "
    echo "   ./makeBook.sh <\"title.md chap1.md chap2.md chap3.md\"> <book.pdf>"
    echo ""
    exit 1
fi

# PDF via latex
pandoc -N -s ${PANDOC_TEMPLATES}/cross_references.yaml ${1} -o ${2}\
       --template ${PANDOC_TEMPLATES}/document_template.tex \
       --filter ${PANDOC_FILTERS}/pandoc-crossref\
       --filter pandoc-citeproc\
       --variable geometry="a4paper, total={6in,9in}"\
       -V linestretch="1.2" -V fontsize="11pt" -V documentclass="article"\
       --highlight-style tango\
       --toc --toc-depth=2 -V fancypage\
       -V display-abstract
