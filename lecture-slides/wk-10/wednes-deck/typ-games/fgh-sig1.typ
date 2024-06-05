#import "@local/sgame:0.1.1": *
#import "@preview/pinit:0.1.4": *
#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )

#sgamex(
  names: ("Chet", "North"),
  strats2: ([$X$], [$Y$]),
  strats1: ($F$ + pin("0"), [#text(fill: rgb("#e64173"))[\[$p$\]]#h(0.66em) $G$], [#text(fill: rgb("#e64173"))[\[$1-p$\]]#h(0.66em) $H$]),
  [$7,3$], [$2,4$] + pin("1"), 
  [$5,2$], [$6,1$], 
  [$6,1$], [$5,4$]
)

#pinit-line(
  stroke: rgb("#e64173"), 
  start-dy: -3pt,
  end-dy: -3pt,
  start-dx: -10pt,
  end-dx: 7pt,
  "0","1"
)