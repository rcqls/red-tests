Red[Needs: View]
view [
	rich-text 300x300 data [font 16 "Select some text with your mouse" /font]
	on-down [
		bkg: reduce [ ; Background for selected text
			as-pair caret: offset-to-caret face event/offset 0
			'backdrop sky
		]
		either 2 = length? face/data [ ; On first selection
			pos: tail face/data
			append face/data bkg
		][ ; Changing starting pos on subsequent selections
			change pos bkg/1
		]
	] all-over
	on-over [
		if event/down? [ ; On dragging change only length
			pos/1/2: (offset-to-caret face event/offset) - caret
		]
	]
]