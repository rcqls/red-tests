Red [
	Title:  "Red shape dialect test"
	Author: "Iosif Haidu"
    Tabs:   4
	File: 	%shape-test.red
	Needs:	View
]

drawings: [
	pen yellow
	line-width 4
	shape [
		move 100x100
		hline 300
		move 100x150
		hline 250
		move 100x200
		hline 200
	]
	pen yellow
	line-width 2
	translate 300x0
	shape [
		move 100x100
		'line 200x200
		'move -200x50
	]                
]

board: layout [
    below
    label: text "" 200 font [size: 16]
    canvas: base 700x400

    do [
        label/text: "HLINE"
        canvas/draw: drawings
    ]
]
board/text: "Shape sub dialect demo"
view board 