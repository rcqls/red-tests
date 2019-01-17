Red [
	Title: "wallet"
	Needs: 'View
]

wallet: context [	
	list-font: make font! [name: get 'font-fixed size: 11]

	do-resize: function [delta [pair!]][
		ref: as-pair btn-send/offset/x - 10 ui/extra/y / 2
		foreach-face ui [
			pos: face/offset
			case [
				all [pos/x > ref/x pos/y < ref/y][face/offset/x: pos/x + delta/x]
				all [pos/x < ref/x pos/y > ref/y][face/offset/y: pos/y + delta/y]
				all [pos/x > ref/x pos/y > ref/y][face/offset: pos + delta]
			]
		]
		addr-list/size: addr-list/size + delta
	]

	ui: layout compose [
		title "RED Wallet"
		text 50 "Device:" ;dev: drop-list 125 :do-select-device
		btn-send: button "Send" ;:do-send disabled
		token-list: drop-list data ["ETH" "RED"] 60 ;select 1 :do-select-token
		net-list:   drop-list data ["mainnet" "rinkeby" "kovan" "ropsten"] ;select 1 :do-select-network
		btn-reload: button "Reload" ;:do-reload disabled
		return
		
		text bold "My Addresses" pad 280x0 
		text bold "Balances" right return pad 0x-10
		
		addr-list: text-list font list-font 520x100 return middle
		
		info-msg: text 285x20
		text right 50 "Page:" tight
		page-info: drop-list 40 
			data collect [repeat p 10 [keep form p]]
			;select (page + 1)
			;:do-page
		btn-prev: button "Prev" ;disabled :do-prev-addr 
		btn-more: button "More" ;:do-more-addr
	]

	setup-actors: does [
		ui/actors: context [
			on-close: func [face event][
				keys/close
				unview/all
			]
			on-resizing: function [face event] [
				if any [event/offset/x < min-size/x event/offset/y < min-size/y][exit]
				do-resize event/offset - face/extra
				face/extra: event/offset
			]
		]
	]

	run: does [
		min-size: ui/extra: ui/size
		setup-actors
		;monitor-devices
		;do-auto-size addr-list
		view/flags ui 'resize
	]
]

wallet/run