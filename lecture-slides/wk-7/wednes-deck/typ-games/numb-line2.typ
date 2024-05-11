#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )

#import "@preview/cetz:0.2.2": draw, canvas

#canvas({
  import draw: *

  let ep = 10

  line((0,0), (ep,0))

  // for n in range(ep + 1) {
  //   line((n, 0.1), (n, -0.1))
  // }

  for n in (0, 1/4, 1/3, 1/2, 2/3, 3/4, 1) {
    line((n * ep, 0.1), (n * ep, -0.1))
    content((n * ep, -0.5), [#calc.round(n, digits: 2)])
  }

  line((0, 0.25), (0, -0.25))
  line((ep, 0.25), (ep, -0.25))

  set-style(mark: (end: ">"), fill: red)
  line((2/3 * ep, 0.75), (0,0.75), stroke: red)
  set-style(mark: (end: none), fill: red)
  line((2/3 * ep, 0.6), (2/3 * ep, .9), stroke: red)
  line((0, 0.6), (0,.9), stroke: red)
  // content(((2/3 * ep, 1.1), 50%, (0,1.1)), text(fill: red, $delta <= 2/3$))

  set-style(mark: (symbol: ">"), fill: blue)
  line((1/4 * ep, 1.5), (3/4 * ep, 1.5), stroke: blue)
  set-style(mark: (symbol: none), fill: blue)
  line((1/4 * ep, 1.35), (1/4 * ep, 1.65), stroke: blue)
  line((3/4 * ep, 1.35), (3/4 * ep, 1.65), stroke: blue)
  // content(((1/4 * ep, 1.85), 50%, (3/4 * ep,1.85)), text(fill: red, $1/4 <= delta <= 3/4$))


  set-style(mark: (symbol: ">"), fill: purple)
  line((1/4 * ep, 0), (2/3 * ep, 0), stroke: purple)
  set-style(mark: (symbol: none), fill: purple)
  line((1/4 * ep, -.1), (1/4 * ep, .1), stroke: purple)
  line((2/3 * ep, -.1), (2/3 * ep, .1), stroke: purple)

  content(((1/4 * ep, -1), 50%, (2/3 * ep, -1)), text(fill: purple, $1/4 <= delta <= 2/3$), padding: 0.2)





})