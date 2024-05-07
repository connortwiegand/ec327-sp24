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
  strats1: ([Dm], [Dr], [Km], [Kr]),
  [$3,vul(5)$], table.cell(fill: yellow.lighten(50%), [$hul(3),vul(5)$]), 
  
  [$3,vul(5)$], table.cell(fill: yellow.lighten(50%), [$hul(3),vul(5)$]),
  
  [$4,1$], [$2,vul(2)$],
  
  table.cell(fill: yellow.lighten(50%), [$hul(5),vul(3)$]), [$1,4$]
)