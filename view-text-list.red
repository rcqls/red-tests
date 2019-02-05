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
	text-list: make face! [
		type: 'text-list offset: 400x20 size: 165x100
		font: font-A
		data: [
			"Book 1"
			"Book 2"
			"Book 3"
			"Book 4"
			"Book 5"
			"Red Programming Language"
			"Red编程语言"
			"FullStack Programming Language"
			"全栈编程语言"
			"hahahaha~"
			"哈哈哈哈~"
		]
		actors: object [
			on-select: func [face [object!] event [event!]][
				print ["text-list selected:" face/selected]
				face/text: pick face/data face/selected
				print ["text-list selected:" mold face/text]
			]
			on-change: func [face [object!] event [event!]][
				print ["text-list changed:" face/selected]
				face/text: pick face/data face/selected
				print ["text-list changed:" mold face/text]
			]
		]
	]
	make face! [
		type: 'button text: "Set text 2" offset: 300x120 size: 80x24
		actors: object [
			on-click: func [face [object!] event [event!]][
				text-list/selected: 2
				unless live? [show text-list]
			]
		]
	]
]

view/flags win [resize]
system/view/auto-sync?: yes

recycle/on