#import "@local/sgame:0.1.0": *
#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )


#sgamex(
  names: ("Billybob", "Jimmyjoe"),
  strats2: ("Remain", "Swerve"),
  strats1: ("Stand Ground", "Roll dodge"),
  [$-2000,-1000$], [$hul(100),vul(0)$],
  [$hul(-5),vul(20)$], [$-10,-10$]
)