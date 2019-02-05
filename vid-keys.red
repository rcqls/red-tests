Red[Needs: View]

right: false
down: false
view [
    size 640x480
    on-key-up [right: false down: false]
    on-key-down [
    if event/key = 'right [right: true]
    if event/key = 'down [down: true]
    ]
    img0: image 200x200

    base 0x0 rate 30 on-time [
      print ["on-time:" lf]
      print ["right:" right " down: " down lf]
      if right and down [print 'both img0/offset/x: img0/offset/x + 1 img0/offset/y: img0/offset/y + 1]
      if right [img0/offset/x: img0/offset/x + 10]
      if down [img0/offset/y: img0/offset/y + 10]
    ]
]