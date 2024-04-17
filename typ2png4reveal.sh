#! bin/bash

# Compiles .typ files from `typ-games` to .png
# place in sub-dir `/png-games/`, then
# IM-convert to transparent and place in `imgs/`
## cleans pdfs that might be hanging around in `typ-games/` 


# cd lecture-slides/wk-3/mon-deck/;
cd lecture-slides/wk-3/wednes-deck/typ-games/;

for f in ./*.typ; 
do typst c -f png --ppi 600 ${f} ${f%.typ}.png;
mv ${f%.typ}.png ./png-games/;
done

for f in ./*.pdf; do
if [ -f ${f} ]; then
rm ${f}; 
fi
done

for f in png-games/*.png;
do convert "${f#/}" -transparent white "../imgs/${f#*/}";
done