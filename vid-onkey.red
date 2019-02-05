Red [
	Needs:	 'View
]
system/view/debug?: no ;yes

view [
	title "VID key test"
	
	field 120 on-enter [probe do face/text clear face/text print "ici"] on-key [print [ "(type=" event/type ")(flags=" event/flags ")(key="  event/key ")(shift?=" event/shift? ")(ctrl?=" event/ctrl? ")" lf] ]
]
