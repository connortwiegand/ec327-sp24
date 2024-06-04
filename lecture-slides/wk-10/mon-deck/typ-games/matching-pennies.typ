#import "@local/sgame:0.1.1": *
#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )

#sgamex(
  names: ("Sean", "Bean"),
  strats2: ($H$, $T$),
  strats1: ($H$, $T$),
  [$1,-1$], [$-1,1$],
  [$-1,1$], [$1,-1$]
)