#set page(width: auto, height: auto)
#import table: cell
#set cell(fill: none)
#set page(margin: (rest:0.5em), fill: rgb(255,255,255,0%))

#let blank_cells = {
  cell(colspan: 2, [])
}

#let p1(name, col: red, rspn: 3) = {
  cell(
    rowspan: rspn, 
    text(
      fill: col, 
      weight: "semibold",
      name)
  )
}

#let strf(x,y) = {
  if x < 2 or y < 2 {
      none
  } else {
      1pt + black
  }
}

#let alif(x,y) = {
  if x == 0 and y >= 2 { //p1
      horizon 
  } else if y == 0 and x >= 2 { //p2
      center + top
  } else if x == 1 and y >= 2 { //S1
      left + horizon
  } else if y == 1 and x >= 2 { // S2
      bottom + center
  } else { //payoffs, blank cells
      center + horizon
  }
}

#let p2(name, col: blue, cspn: 3) = {
  table.header(blank_cells, cell(colspan: cspn, text(fill: col, weight: "semibold", name)))
}

#let sgamex(
  names: ("A", "B"),
  strats1: ($x$, $y$),
  strats2: ($a$, $b$),
  ..args
) = context {
    let nrow = strats1.len()
    let ncol = strats2.len()

    // Equalize Cell Widths
    let intLengths = (0,)
    let ptLenths = (0pt,)
    for i in range(0, args.pos().len()) {
      let wpt = measure(args.pos().at(i)).width
      let wint = wpt.pt()
      intLengths.push(calc.round(wint, digits: 2))
      ptLenths.push(wpt)
    }
    let which = intLengths.position(x => {
      x == calc.max(..intLengths)
    })
    let cw = ptLenths.at(which) + 10pt

    table(
      stroke: (x,y) => {strf(x,y)},
      align: (x,y) => {alif(x,y)},
      rows: ((2.5% + 1.5em, auto), ((auto,) * nrow)).join(),
      columns: ((2.5% + (0.66em * names.at(0).len()), auto), ((cw,) * ncol)).join(),
      p2(names.at(1), cspn: ncol),
      blank_cells, ..range(0, strats2.len()).map(x => strats2.at(x)),
      p1(names.at(0), rspn: nrow),
      ..for i in range(0, nrow) {
        (strats1.at(i), ..range(0, ncol).map(j => args.pos().at(i * ncol + j)))
      }
    )
}

#sgamex(
  names: ("Jack", "Diane"),
  strats2: ($x$, $y$, $z$),
  strats1: ($a$, $b$),
  [$0,0$], [$1,1$], [$2,2$],
  [$3,3$], [$4,4$], [$5,5$],
)
