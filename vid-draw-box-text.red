Red [Needs: View]


tx: make face! [type: 'text]
c0: 0x0 sz: 0x0
;f: make font! [name: "Arial" size: 20]	
make-box: does [
	tx/text: "test-text"
	c0: 100x100
	sz: (size-text tx) / 2
	print ["at " c0 - sz " " tx/text lf]
	repend box1/draw [
		'pen black
		'fill-pen white
		;'line 0x0 c0
		'box c0 - sz - 2 c0 + sz + 2
		'text c0 - sz tx/text
	]
]
view [
	box1: box with [
			size: 300x300
			draw: []
		]
	do [make-box probe box1/draw]
]