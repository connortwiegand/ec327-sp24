#import "@local/sgame:0.1.1": *
#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )

#sgamex(
  names: ("Chet", "North"),
  strats2: ([$X$], [$Y$]),
  strats1: ($F$, $G$, $H$),
  [$7,3$], [$2,4$], 
  [$5,2$], [$6,1$], 
  [$6,1$], [$5,4$]
)