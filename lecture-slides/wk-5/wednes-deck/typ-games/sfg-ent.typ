#import "@local/sgame:0.1.0": *
#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )

#sgamex(
  names: ("1", "2"),
  strats1: ("In", "Out"),
  strats2: ([Fight], [Acc.]),
  [$hul(0),-1$], [$hul(2),vul(1)$],
  [$hul(0),#text(fill: white.transparentize(100%), [--])vul(3)$], [$0,vul(3)$]
)