Red[Needs: View]
p1: 60x70
view [
	base 800x600 draw [
		pen yellow
		line-width 3
		shape [
			move p1
			arc 230x70 120 50 0
			move 60x120
			arc 230x120 120 50 0 sweep
			move 270x70
			arc 450x70 120 50 0 large
			move 530x150
			arc 710x150 120 50 0 sweep large
		]
	]
]