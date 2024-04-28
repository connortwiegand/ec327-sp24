#import "@preview/cetz:0.2.2": tree, draw, canvas
#set page(
  width: auto, 
  height: auto,
  margin: (rest:0.25em),
  fill: rgb(255,255,255,0%)
  )


#canvas({
  import draw: *
  import tree: *
  let node-rad = .5
  set-style(
    content: (padding: .1),
    circle: (radius: node-rad)
  )
  
  
  let strats = (
    p1: ([$a$], [$b$]),
    p2: (
      "0": ([$A$], [$B$]),
      "1": ([$X$], [$Y$], [$Z$])
      )
  )

  let pis = (
    "0-0": [$0,3$], 
    "0-1": [$1,3$], 
    "1-0": [$1,-1$],
    "1-1": [$2,1$],
    "1-2": [$2,1$]
  )

  let tree-struct = (
    "1",
    ("2", pis.at("0-0"), pis.at("0-1")),
    ("2", pis.at("1-0"), pis.at("1-1"), pis.at("1-2"))
  ) 

  let gamepath = ([$b$], [$A$], [$Y$])
  
    tree(
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
        //linename might get passed to circle or line
        //  --depending on implementation
        let get_linename = from + " -> " + to
        
        //draw line/edge
        line(
          (from, node-rad, to), (to, node-rad, from)
        )

        //Invisible circle to draw content on edge
        //  --rm if using line-only impl.
        circle((from, 55%, to), radius: 1.25 * node-rad, stroke: 0.0pt, name: get_linename)
        
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
          mark(from, (name: get_linename, anchor: "center"), symbol: "stealth", stroke: red, scale: 2)
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
          (name: get_linename, anchor: sanchor),
          get_strat_content
        )
      } //end draw-edge
  ) //end tree!
})
