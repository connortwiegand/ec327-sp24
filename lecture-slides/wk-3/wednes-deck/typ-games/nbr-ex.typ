#import "@local/sgame:0.1.0": *
#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )

#sgamex(
    names: ("A", "B"),
    strats1: ("Chop", "Dice", "Hit", "Shoot"),
    strats2: ("Potato", "Tomato"),
      [$1, 2$] , [$2, -3$],
      [$4, -3$] , [$2, -1$],
      [$2,-3$] , [$3,-4$],
      [$1,-4$] , [$4,-2$],
    )