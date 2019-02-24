Red[Needs: View]

view compose/deep [
    rich-text 400x200 draw [
        text 10x10 (rt: rtd-layout [i/blue ["Hello " red/b [font 24 "Red " /font] "World! lalalalaal"]])
        line-width 5 pen gold
        line ; Let's draw line under words using a pair of above helper functions
			(as-pair 10 h: 10 + rich-text/line-height? rt 1) ; Starting-point y -> 10 + line-height
			(as-pair 10 + pick size-text rt 1 h) ; End-point x -> 10 + length-of-text-size
    ]
]