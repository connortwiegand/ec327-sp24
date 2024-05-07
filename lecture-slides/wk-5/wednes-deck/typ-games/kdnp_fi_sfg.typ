#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )
#import "@local/sgame:0.1.0": *

#sgamex(
  names: ("Criminal", "Wife"),
  strats2: ([Pay], [Not Pay]),
  strats1: ([Dmm], [Dmr], [Drm], [Drr], [Kmm], [Kmr], [Krm], [Krr]),
  [$3,5$], [$3,5$], 
  [$3,5$], [$3,5$],
  [$3,5$], [$3,5$],
  [$3,5$], [$3,5$],
  [$4,1$], [$2,2$],
  [$4,1$], [$1,4$],
  [$5,3$], [$2,2$],
  [$5,3$], [$1,4$]
)
