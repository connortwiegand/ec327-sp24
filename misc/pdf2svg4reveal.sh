#! bin/bash

# Takes pdf files from `tex-games`
# converts to qmds, renders to pdfs in `pdf-games`
# then converts to svg files in `svg-games`
## cleans qmds/pdfs after files

#@TODO: figure out how to get the psttricks strikes to work

cd lecture-slides/week-2/deck-4/;
mkdir pdf-games;

for f in tex-games/*.tex; 
do echo -e '---\n format: pdf\n---\n' | cat - ${f} > ${f%.tex}.qmd;
mv ${f%.tex}.qmd pdf-games/;
done


quarto render pdf-games/*.qmd --to pdf;
rm pdf-games/*.qmd

for f in pdf-games/*.pdf;
do pdf2svg "${f}" "${f%.pdf}.svg";
mv "${f%.pdf}.svg" svg-games/;
done

rm -r pdf-games/
