#import "@local/sgame:0.1.0": *
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
  [$hul(1),-1$], [$-1,vul(1)$],
  [$-1,vul(1)$], [$hul(1),-1$]
)