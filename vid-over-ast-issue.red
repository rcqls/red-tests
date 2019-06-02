Red [
	Title: "Red syntax tree explorer"
	Date: 29-Mar-2019
	Last: 14-Apr-2019
	Author: "Toomas Vooglaid"
][
context [
	extend system/view/VID/styles [
		graph: [
			template: [
				type: 'panel
				size 500x500
				flags: 'all-over
				actors: [
					on-down: func [face event][
					]

					on-over: func [face event][
					 
					]

				]
			]
		]
		node: [
			template: [
				type: 'base 
				size: min-size 
				color: transparent
				flags: 'all-over 
				draw: [fill-pen white rotate 0 box 0x0 24x24 3 text 0x0 ""]
				data: copy []
				actors: [
					on-down: func [face event /local lay labl] [
					]
					 
					on-over: func [face event /local edge found] [ 
					]
					 
					
					;on-time: func [face event][face/extra/true?: not face/extra/true?]
				]
			]
		]
	]
]
]