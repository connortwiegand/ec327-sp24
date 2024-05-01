#! bin/bash

# Compiles .typ files from `typ-games` to .png
# place in sub-dir `/png-games/`, then
# IM-convert to transparent and place in `imgs/`
## cleans pdfs that might be hanging around in `typ-games/` 

while getopts "n:mwk" opt; do
case $opt in
n) # week num
WEEK=$OPTARG;;
m) # mon, binary
wDECK="mon-deck";;
w) # wed, binary
wDECK="wednes-deck";;
k) # keep png-games/*?
KEEP=true;;
esac
done

: ${wDECK:="wednes-deck"}
: ${KEEP:=false}
: ${WEEK:=5}

# cd lecture-slides/wk-5/mon-deck/typ-games/;
# cd lecture-slides/wk-5/wednes-deck/typ-games/;

cd "lecture-slides/wk-${WEEK}/${wDECK}/typ-games/";


for f in ./*.typ; do
FNAME=${f%.typ};
if [ -f ${FNAME}.pdf ]; then
typst c -f png --ppi 600 ${f} ${FNAME}.png;
mv ${FNAME}.png ./png-games/;

convert "./png-games/${FNAME}.png" -transparent white "../imgs/${FNAME}.png";

rm ${FNAME}.pdf; 
fi
done


#  && -z "$(ls -A ./png-games/)"
if [ ! $(${KEEP}) ]; then
rm -f ./png-games/*;
fi



# for f in ./*.pdf; do
# if [ -f ${f} ]; then
# rm ${f}; 
# fi
# done

# for f in png-games/*.png;
# do convert "${f#/}" -transparent white "../imgs/${f#*/}";
# done