Red[Needs: View]

do %../../tmp/RedTest/Demos/Toosmas/rtd-simple.red
; view compose/deep [
;     rich-text 400x200 draw [
;         text 10x10 (rt: rtd-simple "Supercali\[b] fragilistic\ expialidocious")
;         line-width 5 pen gold
;         line ; Let's draw line under words using a pair of above helper functions
; 			(as-pair 10 h: 10 + rich-text/line-height? rt 1) ; Starting-point y -> 10 + line-height
; 			(as-pair 10 + pick size-text rt 1 h) ; End-point x -> 10 + length-of-text-size
;     ]
; ]
; do %rtd-simple.red
view compose/deep [
    rich-text 400x150 draw [
        text 50x30 (rtd-simple/width "\[f 18]  Supercali\[b]  fragilistic-\ ^/expialidocious\ " 300)
    ]
]

view compose/deep [
    rich-text 400x150 draw [
        text 50x50 (rtd-simple/width "\[f 18]  \[red]  The \[b i] Journey begins\b!\ \ " 300)
    ]
]

view compose/deep [
    rich-text 400x150 draw [
        text 50x50 (rtd-simple/width "\[f 18]  \i  Hello \[red] Red \b world! \ \ " 300)
    ]
]