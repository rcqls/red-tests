Red [
	Needs: 'View
]

live?: system/view/auto-sync?: no

recycle/off
 

font-A: make font! [
	name: "Comic Sans MS"
	size: 10
	color: blue
	style: [bold italic underline]
	anti-alias?: yes
]
 
win: make face! [
	type: 'window text: "Red View" size: 800x400
	 
	actors: object [
		on-close: func [face [object!] event [event!]][
			print "closing window"
		]
		on-key: func [face [object!] event [event!]][
			if event/key = 'F5 [
				print "F5 key caught by window face!" 
				'stop
			]
		]
	]
]
  
win/pane: reduce [

	drop-down: make face! [
		type: 'drop-down
		text: "type"
		offset: 100x120
		size: 80x24
		font: font-A
		color: 240.230.140
		data: [
			"opt 1"		11
			"opt 2"		22
			"opt 3"		33
			"opt 4"		44
		]
		actors: object [
			on-select: func [face [object!] event [event!]][
				probe face/text
			]
			on-change: func [face [object!] event [event!]][
				print ["changed:" mold face/text]
			]
		]
	]
 
	drop-list: make face! [
		type: 'drop-list
		offset: 200x220
		size: 80x24
		data: [
			"option 10"		110
			"option 20"		220
			"option 30"		330
			"option 40"		440
			"option 50"		550
		]
		actors: object [
			on-create: func [face [object!]][
				face/selected: 2
			]
			on-select: func [face [object!] event [event!]][
				print ["selected:" face/selected]
			]
			on-change: func [face [object!] event [event!]][
				print ["changed:" face/selected]
			]
		]
	]
	make face! [
		type: 'button text: "Set option 3" offset: 300x120 size: 80x24
		actors: object [
			on-click: func [face [object!] event [event!]][
				drop-list/selected: 3
				drop-down/selected: 3
				unless live? [show drop-list show drop-down]
			]
		]
	]
	
]

view/flags win [resize]
system/view/auto-sync?: yes

recycle/on