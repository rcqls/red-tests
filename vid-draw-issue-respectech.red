Red[]

img: make image! 100x50
random/seed now/time/precise

color-choice: 'random

color: does [
	case [
		color-choice = 'random [random 255.255.255.0]
		color-choice = 'red 	[255.0.0]
		color-choice = 'green 	[0.255.0]
		color-choice = 'blue 	[0.0.255]
	]
]

draw_box: does [
	draw_blk: compose [fill-pen (color) circle 50x25 10 circle 70x25 10]
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
	button "red" 	[color-choice: 'red]
	button "green" 	[color-choice: 'green]
	button "blue" 	[color-choice: 'blue]
	button "rand" 	[color-choice: 'random]

]