#import "@local/sgame:0.1.1": *
#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )

#sgamex(
  names: ("Sean", "Bean"),
  strats2: ([H], [T]),
  strats1: ([#text(fill: rgb("#e64173"))[\[$p$\]]#h(0.66em) H], [#text(fill: rgb("#e64173"))[\[$1-p$\]]#h(0.66em) T]),
  [$1,-1$], [$-1,1$],
  [$-1,1$], [$1,-1$]
)