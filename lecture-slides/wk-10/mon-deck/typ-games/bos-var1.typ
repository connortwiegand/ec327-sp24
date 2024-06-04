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
  [$#text(red)[3],2$], [$#text(red)[1],1$],
  [$#text(blue)[0],0$], [$#text(blue)[2],3$]
)
