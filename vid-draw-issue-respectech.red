Red[]

img: make image! 100x50
random/seed now/time/precise

draw_box: does [
	draw_blk: compose [fill-pen (random 255.255.255.0) box 10x10 80x40]
	draw img draw_blk
]

view compose [
	below
 	i: image (draw_box)

	rate 32
	on-time [
		i/image: draw_box
		show i
	]
]