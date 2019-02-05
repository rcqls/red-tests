Red [
	Needs: 'View
]

live?: system/view/auto-sync?: no

recycle/off

win: make face! [
	type: 'window text: "Red View" size: 1100x800
	; menu: [
	; 	;popup						;-- forces context menu for window
	; 	"File" [
	; 		"New"				new
	; 		"Open...	F1" 	open
	; 		"Close	F2"			close 
	; 		---
	; 		"Save..."			save
	; 		"Save as..."		save-as
	; 		"Save All"			save-all
	; 		---
	; 		"Print..."			print
	; 		"Preview"			preview
	; 		"Page Setup..."		page-setup
	; 		---
	; 		"Exit"				exit
	; 	]
	; 	"Edit" [
	; 		"Undo"				undo
	; 		"Redo"				redo
	; 		---
	; 		"Copy	Ctrl+C"		copy
	; 		"Cut	Ctrl+X"		cut
	; 		"Paste	Ctrl+V"		paste
	; 		---
	; 		"Sub1" [
	; 			"Sub-menu1"		sub-m1
	; 		]
	; 		"Sub2" [
	; 			"Sub-menu2"		sub-m2
	; 		]
	; 	]
	; 	"Search" [
	; 		"Find..."			find
	; 		"Find Next"			find-next
	; 		"Find Previous"		find-prev
	; 		---
	; 		"Replace..."		replace
	; 		"Replace Next"		replace-next
	; 	]
	; 	"Deep" [
	; 		"Item 2"			item2
	; 		"Deep 2" [
	; 			"Item 3"		item3
	; 			"Deep 3" [
	; 				"End"		end
	; 			]
	; 		]
	; 	]
	; ]
	actors: object [
		on-menu: func [face [object!] event [event!]][
			print ["menu selected:" event/picked]
			switch event/picked [
				exit [
					print "calling unview"
					unview/all
				]
				sub-m1 [
					;just to test change of a button's text..
					win/pane/1/text: "Hello"
					show win/pane/1
				]
			]
		]
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
	tab-panel: make face! [
		type: 'tab-panel offset: 10x320 size: 250x130
		data: [
			"tab 1"
			"tab 2"
			"tab 3"
		]
		pane: reduce [
			make face! [
				type: 'panel
				pane: reduce [
					make face! [
						type: 'button text: "Panel 1" offset: 20x20 size: 60x30
					]
				]
				menu: [
					"Context menu 1"	menu1
					"Context menu 2"	menu2
					"Context menu 3"	[
						"sub 1"		sub1
						"sub 2"		sub2
					]
				]
				actors: object [
					on-menu: func [face [object!] event [event!]][
						print ["context menu selected:" event/picked]
					]
				]
			]
			make face! [
				type: 'panel
				pane: reduce [
					make face! [
						type: 'text text: "Panel 2" offset: 80x80 size: 60x30
					]
				]
			]
			make face! [
				type: 'panel
				pane: reduce [
					make face! [
						type: 'text text: "Panel 3" offset: 90x40 size: 60x30
					]
				]
			]
		]
		actors: object [
			on-change: func [face [object!] event [event!]][
				print ["Switched to:" pick face/data event/picked]
			]
		]
	]
	make face! [
		type: 'button text: "Set page 2" offset: 300x120 size: 80x24
		actors: object [
			on-click: func [face [object!] event [event!]][
				tab-panel/selected: 2
				unless live? [show tab-panel]
			]
		]
	]
]

view/flags win [resize]
system/view/auto-sync?: yes

recycle/on