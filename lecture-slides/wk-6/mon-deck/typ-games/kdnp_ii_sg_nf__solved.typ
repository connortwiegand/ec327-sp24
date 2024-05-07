#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )
#import "@local/sgame:0.1.0": *

#show regex("\d,\d"): txt => {
  let (n1, n2) = txt.split(",")
  [#text(fill: red, n1), #text(fill: blue, n2)]
}

#sgamex(
  names: ("C", [W]),
  strats2: ([P], [NP]),
  strats1: ([m], [r]),
  [$4,1$], [$hul(2),vul(2)$], 
  [$hul(5),3$], [$1,vul(4)$]
)