Red [Needs: View]

draw-chart: does [ print-line "draw"]
get-wave: does [ print-line "wave"]

lay: [
     below
      p: base 400x200
    f: field 400
     across 
     button "Test" [
         draw-chart
     ]
    button "Synth" [
        get-wave
     ]
     return
     text "Cuttof" slider [bafl/frequency: to float! face/data get-wave]
     text "resonance" slider [bafl/resonance: to float! face/data get-wave]
     return
     radio "Line" [chart-line?: true chart-style: 'line draw-chart]
     radio "Spline" [chart-line?: true chart-style: 'spline draw-chart]
      radio "Box" [chart-line?: false chart-style: 'box draw-chart]
      radio "Circle" [chart-line?: false chart-style: 'circle draw-chart]
    radio "Cross" [chart-line?: false chart-style: 'cross draw-chart]
 ]

 view lay