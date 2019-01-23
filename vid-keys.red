Red[Needs: View]
view [
    size 640x480
    on-key-up [ right: false down: false]
    on-key-down [
    if event/key = 'right [right: true]
    if event/key = 'down [down: true]
    ]
    img0: image 

    base 0x0 rate 30 on-time [
    if right and down [print 'both img0/offset/x: img0/offset/x + 1 img0/offset/y: img0/offset/y + 1]
    if right [img0/offset/x: img0/offset/x + 1]
    if down [img0/offset/y: img0/offset/y + 1]
  ]
]