#import "@local/sgame:0.1.0": *
#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )

#sgamex(
    names: ("Krabs", "Plankton"),
    strats1: ([C], [D]), 
    strats2: ([C], [D]),
    [$10,10$], [$20,2$], 
    [$2,20$], [$5,5$], 
)