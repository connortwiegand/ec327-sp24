#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )
#import "@preview/cetz:0.2.2": tree, draw, canvas

#canvas({
    import draw: *
    import tree: *
    let node-rad = .5
    set-style(
      content: (padding: .1),
      circle: (radius: node-rad, stroke: 1.33pt),
      line: (stroke: 1.33pt)
    )

    let strats = (
      p1: ([Out], [Enter]),
      p2: (
        "1": ([Fight], [Acc.])
      )
    )

    let tree-struct = (
      "1",
      ([$0, 3$], ),
      ("2", [$1, -1$], [$2, 1$])
    )

    let gamepath = none
    
    tree(
      name: "tr",
      tree-struct,
      grow: 3.5,
      spread: 3.5,
    
      draw-node: (node, ..) => {
        //if !(terminal node), draw circle
        if(node.children != ()) {
          circle(())
        }
        content((), node.content)
      },
    
      draw-edge: (from, to, node,..) => {
             let (nf, nt) = {
          (from, to).map(x => {
            x.trim("g")
        })}
        
        ////line + circ names
        let (linename, circname) = (
          nf + " --- " + nt, 
          nf + " --( )-- " + nt
        )
        
        //// draw line/edge 
        line(
          (from, node-rad, to), 
          (to, node-rad, from),
          name: linename)

        //Invisible circle to draw content on edge
        circle(
          (from, 55%, to), 
          radius: 1.25 * node-rad,
          stroke: 0.0pt, 
          name: circname)
        
        // Get strategy content
        let get_strat_content = {
          let spath = to.trim("g0-")
          if (spath.len() == 1) {
            strats.p1.at(int(spath))
          } else {
            let arr = to.trim("g0-").split("-")
            let fst = arr.first()
            let lst = arr.last()
            strats.p2.at(fst).at(int(lst))
          }
        }  
        
        if(gamepath != none and (get_strat_content in gamepath)) {
          mark(from, (name: circname, anchor: "center"), symbol: "stealth", stroke: red, scale: 2)
        }

        // Anchor calcs
        // let max-depth = pis.keys().map(ky => {ky.find(regex("\d$"))}).map(x => {int(x)}).sorted().last()
        let max-depth = tree-struct.map(ent => {ent.len()}).sorted().last()
        let split = (max-depth / 2) - 1

        // Get anchor for drawing strats
        let lr = to.split("-").last()
        let sanchor = {
          if(int(lr) < split) {
            135deg
          } else {
            45deg
          }
        }
        // Finally draw strategies
        content(
          (name: circname, anchor: sanchor),
          get_strat_content
        )
      } //end draw-edge
  ) //end tree!

  // circle((rel: (0,-2), to: ("tr.0-1")), radius: 2.5, stroke: (dash: "dashed", paint: red) )
  rect(
    (rel: (-0.75,-0.5), to: ("tr.0-1-0")),
    (rel: (2.5,0.75), to: ("tr.0-1")), radius: 15%, stroke: (dash: "dashed", paint: red), name: "r-rect")
  content((rel: (-1,0.5), to: (name: "r-rect", anchor: 45deg)), text(size: 1.33em, fill: red, [SG 1]))
  // circle((rel: (0,0), to: ("tr.center")), radius: 6, stroke: (dash: "dashed", paint: gray) )
  rect((rel: (-1,-4.5), to: ("tr.0-0")), (rel: (9,9)), radius: (north: 25%), stroke: (dash: "dashed", paint: gray), name: "g-rect")
  content((rel: (-0.75,0), to: (name: "g-rect", anchor: 45deg)), text(size: 1.33em, fill: gray, [SG 0]))
}) //end canvas
