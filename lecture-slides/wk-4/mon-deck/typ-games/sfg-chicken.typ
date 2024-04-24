#import "@local/sgame:0.1.0": *
#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )

#sgamex(
  names: ("1", "2"),
  strats1: ("R", "S"),
  strats2: ([SG, SG], [SG, RD], [RD, SG], [RD, RD]),
  [$-10,-20$], [$-10,-20$], [$20,0$], [$20,0$],
  [$0,20$], [$-5,-5$], [$0,20$], [$-5,-5$]
)