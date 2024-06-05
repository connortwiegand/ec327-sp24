#import "@local/sgame:0.1.1": *
#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )

#sgamex(
  names: ("Pim", "Charlie"),
  strats2: ([Grin], [Frown]),
  strats1: ([Smile], [Yell]),
  [$16,-7$], [$10,5$],
  [$-3,18$], [$17,8$]
)