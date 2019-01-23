Red [
	Purpose: "Test the GUI auto-update mode"
	Needs: 'View
]

system/view/debug?: yes
live?: system/view/auto-sync?: no

workstation?: system/view/platform/product = 1
os-version: system/view/platform/version
recycle/off

#switch config/OS [
	Windows [
		print [
			"Windows" switch os-version [
				10.0.0	[pick ["10"			 "10 Server"	 ] workstation?]
				6.3.0	[pick ["8.1"		 "Server 2012 R2"] workstation?]
				6.2.0	[pick ["8"			 "Server 2012"	 ] workstation?]
				6.1.0	[pick ["7"			 "Server 2008 R1"] workstation?]
				6.0.0	[pick ["Vista"		 "Server 2008"	 ] workstation?]
				5.2.0	[pick ["Server 2003" "Server 2003 R2"] workstation?]
				5.1.0	["XP"]
				5.0.0	["2000"]
			] 
			"build" system/view/platform/build
		]
	]
	macOS [
		print [
			"macOS" switch os-version and 255.255.0 [
				10.11.0	["El Capitan"]
				10.10.0	["Yosemite"]
				10.9.0	["Mavericks"]
				10.8.0	["Mountain Lion"]
				10.7.0	["Lion"]
				10.6.0	["Snow Leopard"]
			] os-version
			"build" system/view/platform/build
		]
	]
	Linux [0]
]

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
 
	make face! [
		type: 'check text: "Debug?" offset: 300x270 size: 80x24
		font: font-A
		data: system/view/debug?
		actors: object [
			on-change: func [face [object!] event [event!]][
				system/view/debug?: face/data
			]
		]
	] 
	drop-list: make face! [
		type: 'drop-list
		offset: 200x120
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
		type: 'button text: "Set option 5" offset: 300x120 size: 80x24
		actors: object [
			on-click: func [face [object!] event [event!]][
				drop-list/selected: 5
				unless live? [show drop-list]
			]
		]
	]
	
	check-face: make face! [
		type: 'check text: "check box" offset: 300x170 size: 90x24
		data: on
		actors: object [
			on-change: func [face [object!] event [event!]][
				probe face/data
			]
		]
	]
	make face! [
		type: 'radio text: "radio 1" offset: 300x200 size: 90x24
		font: font-A
		options: [drag-on: 'down]
		;data: on
		actors: object [
			on-change: func [face [object!] event [event!]][
				print "radio 1 set"
			]
		]
	]
	make face! [
		type: 'radio text: "radio 2" offset: 300x230 size: 90x24
		data: on
		actors: object [
			on-change: func [face [object!] event [event!]][
				print "radio 2 set"
			]
		]
	]
]

dump-face win
view/flags win [resize]
system/view/debug?: no
system/view/auto-sync?: yes

recycle/on