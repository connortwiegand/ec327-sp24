#import "@local/sgame:0.1.1": *
#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )

#sgamex(
  names: ([#text(black, [MJ])], [#text(black, [Prince])]),
  strats2: ([R\&B], [Funk]),
  strats1: ([R\&B], [Funk]),
  [$3,#text(red)[2]$], [$1,#text(blue)[1]$],
  [$0,#text(red)[0]$], [$2,#text(blue)[3]$]
)
