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
      "e",
      "c"
    )

    let tree-struct = (
      "1", 
      [$2,0$],
      ("2", [$1,3$], ("1", [$4, 2$], ("2", [$3, 5$], [])))
    )

    let gamepath = none
    
    tree(
      tree-struct,
      grow: 3,
      spread: 3,
      direction: "right",
      parent-position: "end",
    
      draw-node: (node, par-node, ..) => {
        //if !(terminal node), draw circle
        if(node.children != ()) {
          circle((), name: "node" + node.name)
          content((), node.content)
        } else {
          let pname = node.name.trim("g").trim(repeat: false, at: end, regex("-\d"))
          // move-to((rel: (0, -3), to: pname))
          content((rel: (0, -3), to: pname), node.content)
      }},
    
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
        if(to.trim("g0-").ends-with("1")) {
          line(
          (from, node-rad, to), 
          (to, node-rad, from),
          name: "cont")
          content((from, 1.5, to), padding: .2, anchor: "south", [c])
        } else {
          let foo = (rel: (0,-3), to: from)
          line(
            (from, node-rad, foo),
            (foo, node-rad, from), 
            name: "end")
          content((from, 1.4, foo), padding: .2, anchor: "east", [e])
          // line(from, (0,4))
        }
      }, //end draw-edge
      name: "tr"
  ) //end tree!

  content((rel: (1,-1), to: "tr.0-1-1-1-1"), text(size: 2em, "..."))
  
  set-origin((3,-3))

  let tree-struct = (
      // "1", 
      // [$98,96$],
      ("2", [$97,99$], ("1", [$100, 98$], ("2", [$99, 101$], [$100, 100$])))
    )
  
  tree(
      tree-struct,
      grow: 3,
      spread: 3,
      direction: "right",
      parent-position: "end",
    
      draw-node: (node, par-node, ..) => {
        //if !(terminal node), draw circle
        if(node.children != ()) {
          circle((), name: "node" + node.name)
          content((), node.content)
        } else if(node.name.split("-").len() == 4 and node.name.ends-with("1")) {
          content((rel: (0.5,0), to: node.name), node.content)
        } else {
          let pname = node.name.trim("g").trim(repeat: false, at: end, regex("-\d"))
          // move-to((rel: (0, -3), to: pname))
          content((rel: (0, -3), to: pname), node.content)
      }},
    
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

        if(from == "g0") {
          let bar = (rel: (-2,0), to: from)
          
          line((from, node-rad, bar), (bar, node-rad, from))
        }
        
        //// draw line/edge 
        if(to.trim("g0-").ends-with("1")) {
          line(
          (from, node-rad, to), 
          (to, node-rad, from),
          name: linename)
          content((from, 1.5, to), padding: .2, anchor: "south", [c])
        } else {
          let foo = (rel: (0,-3), to: from)
          line(
            (from, node-rad, foo),
            (foo, node-rad, from), 
            name: "end")
          content((from, 1.4, foo), padding: .2, anchor: "east", [e])
        }
      }, //end draw-edge
      name: "tree"
  ) //end tree!

  content((rel: (-3.1,-1), to: "tree.0"), text(size: 2em, "..."))

  
}) //end canvas