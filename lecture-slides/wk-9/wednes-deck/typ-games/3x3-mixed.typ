#import "@local/sgame:0.1.1": *
#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )

#sgamex(
  names: ("Joe Nathan", "Been Jamin"),
  strats2: ([Hit], [Run]),
  strats1: ($X$, $Y$, $Z$),
  [$0,-2$], [$1,1$], 
  [$5,5$], [$0,1$], 
  [$1,3$], [$2,3$]
)