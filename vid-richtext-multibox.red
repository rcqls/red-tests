Red[Needs: View]
view compose/deep [
    rich-text 200x200 draw [
        text 10x10 (rt1: rtd-layout ["Some^/" b "text^/" /b "here"] rt1/size: 50x80 rt1)
        text 100x90 (rt2: rtd-layout [red "Other^/" b "text^/" /b "there"] rt1/size: 50x80 rt2)
        pen gold box 90x80 160x180
    ]
]