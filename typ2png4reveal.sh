#! bin/bash

# Compiles .typ files from `typ-games` to .png
# place in sub-dir `/png-games/`, then
# IM-convert to transparent and place in `imgs/`
## cleans pdfs that might be hanging around in `typ-games/` 


cd lecture-slides/wk-5/mon-deck/typ-games/;
# cd lecture-slides/wk-4/wednes-deck/typ-games/;

for f in ./*.typ; do
FNAME=${f%.typ};
if [ -f ${FNAME}.pdf ]; then
typst c -f png --ppi 600 ${f} ${FNAME}.png;
mv ${FNAME}.png ./png-games/;

convert ./png-games/${FNAME}.png -transparent white "../imgs/${FNAME}.png";

rm ${FNAME}.pdf; 
fi
done

# for f in ./*.pdf; do
# if [ -f ${f} ]; then
# rm ${f}; 
# fi
# done

# for f in png-games/*.png;
# do convert "${f#/}" -transparent white "../imgs/${f#*/}";
# done