Red [
	Needs: 'View
]

live?: system/view/auto-sync?: no

workstation?: system/view/platform/product = 1
os-version: system/view/platform/version
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
	
	check-face: make face! [
		type: 'check text: "check box" offset: 300x170 size: 90x24
		data: on
		options: [drag-on: 'down]
		actors: object [
			on-change: func [face [object!] event [event!]][
				print "check box set"
				probe face/data
			]
		]
	]
	make face! [
		type: 'radio text: "radio 1" offset: 300x200 size: 90x24
		font: font-A
		options: [drag-on: 'down]
		data: on
		actors: object [
			on-change: func [face [object!] event [event!]][
				print "radio 1 set"
				probe face/data
			]
		]
	]
	make face! [
		type: 'radio text: "radio 2" offset: 300x230 size: 90x24
		; data: on
		actors: object [
			on-change: func [face [object!] event [event!]][
				print "radio 2 set"
				probe face/data
			]
		]
	]
	make face! [
		type: 'radio text: "radio 3" offset: 300x260 size: 90x24
		; data: on
		actors: object [
			on-change: func [face [object!] event [event!]][
				print "radio 3 set"
				probe face/data
			]
		]
	]
]

view/flags win [resize]
system/view/auto-sync?: yes

recycle/on