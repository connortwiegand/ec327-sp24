#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )

#import "@preview/cetz:0.2.2": tree, draw, canvas

#show math.equation: nums => {
  let foo = nums.body.children.first()
  let (n1, n2) = (nums.body.children.first(), nums.body.children.last())
  [#text(fill: red, n1), #text(fill: blue, n2)]
}

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
      lvl2: ( [Pay], [Not Pay] ),
      lvl3: ([murder], [release])
    )

    let tree-struct = (
      text(fill: red, "C"), (text(fill: blue, "W"), [$4, 1$], [$5, 3$]), (text(fill: blue, "W"), [$2, 2$], [$1, 4$]),
    )

    let gamepath = none
    
    tree(
      tree-struct,
      grow: 3.5,
      spread: 3,
    
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
          radius: 1.66 * node-rad,
          stroke: 0.0pt, 
          name: circname)
        
        // Get strategy content
        let get_strat_content = {
          let spath = to.trim("g0-").split("-")
          if (spath.len() == 1) {
            strats.lvl2.at(int(spath.last()))
          } else if (spath.len() == 2){
            strats.lvl3.at(int(spath.last()))
          } 
        }  
        
        if(gamepath != none and (get_strat_content in gamepath)) {
          mark(from, (name: get_linename, anchor: "center"), symbol: "stealth", stroke: red, scale: 2)
        }

        // Anchor calcs
        // let max-depth = pis.keys().map(ky => {ky.find(regex("\d$"))}).map(x => {int(x)}).sorted().last()
        let max-depth = 4
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
      }, //end draw-edge
      name: "tr"
  ) //end tree!

  let (a, b) = ("tr.0-0", "tr.0-1")
  line((a, .5, b), (b, .5, a), stroke: (thickness: 1.5pt, dash: "dashed"))

  // rect(
  //   (rel: (-0.75,-0.5), to: ("tr.0-0-0")),
  //   (rel: (0.75,8), to: ("tr.0-1-1")), radius: (north: 50%, south: 10%), stroke: (dash: "dashed", paint: red), name: "r-rect")
  // content((rel: (-2,1.5), to: (name: "r-rect", anchor: 45deg)), text(size: 1.33em, fill: red, [SG 1]))
}) //end canvas