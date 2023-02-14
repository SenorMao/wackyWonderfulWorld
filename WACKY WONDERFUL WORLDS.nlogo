turtles-own [ energy ]

breed [stars star]
breed [sun hotball]
breed [mercury hot]
breed [venus Lust]
breed [earth middleearth]
breed [mars elonmusk]
breed [jupiter jumanji ]
breed [saturn ring]
breed [uranus booty]
breed [neptune wetball]
breed [darkhole darky]
;;---------------------------------------------------------------------------------------------------------------------------------

to setup
clear-all ;; clear-all

  setup-patches
  setup-stars

  setup-sun

  create-darkhole 1  [setxy random-xcor random-ycor] ;; black hole was created
  set-default-shape darkhole "darkhole"
  ask darkhole [set size 8]
  ask darkhole [hide-turtle]
  reset-ticks
end

to GO

  ;;these pairs spawns a pair of planets in 200 ticks
  pair1
  pair2
  pair3
  pair4

   ask turtles [ ;;this checks the amount of gravitational force the planets, stars and black holes have
    if pcolor = black [
      set energy energy + 100
    ]
    ifelse show-gravity?
      [ set label energy ]
      [ set label "" ]
  ]



 ask stars ;;asked the stars to move in the background
  [move]


 ask darkhole ;;hides the black hole until planets collide
  [hide-turtle]

 ask mercury [ ;;ask if mercury exist then after it checks it commands jupiter to die
    if not any? turtles-on jupiter [die]]

 ask darkhole [ ;;asks that after jupiter dies, tells black hole if so? then show the black hole
    if not any? turtles-on jupiter  [show-turtle]
  ]

 ask darkhole [ ;;asks if the black hole doesn't exist then if turtles on mercury then show black hole
    if not any? turtles-on mercury [show-turtle]
  ]

 ask darkhole  ;;asks for black hole to move slowly
    [move2]

ask mercury ;;asks for mercury to move
  [move ]

  ask venus ;;asks for venus to move
  [move]

  ask earth ;;asks for earth to move
  [move]

  ask mars ;;asks for mars to move
  [move]

  ask jupiter ;;ask for jupiter to move
  [move]

  ask saturn ;;asks for saturn to move
  [move]

  ask uranus ;;asks for uranus to move
  [move]

  ask neptune ;;asks for neptune to move
  [move]

  ;;black hole absorbs the rest of the planets that are alive and gains energy

  ask turtles with [shape = "darkhole"] [if any? turtles with [shape = "mars"] in-radius 1.7 ;;mars got absorbed into darkhole
    [ask turtles with [shape = "mars" ] in-radius 1.7 [die] set energy energy + 5000 ] ]

  ask turtles with [shape = "darkhole"] [if any? turtles with [shape = "earth"] in-radius 1.7 ;;earth got absorbed into darkhole
    [ask turtles with [shape = "earth" ] in-radius 1.7 [die] set energy energy + 5000 ] ]


  ask turtles with [shape = "darkhole"] [if any? turtles with [shape = "venus"] in-radius 1.7 ;;venus got absorbed into darkhole
    [ask turtles with [shape = "venus" ] in-radius 1.7 [die] set energy energy + 5000 ] ]

  ask turtles with [shape = "darkhole"] [if any? turtles with [shape = "uranus"] in-radius 1.7 ;;uranus got absorbed into darkhole
    [ask turtles with [shape = "uranus" ] in-radius 1.7 [die] set energy energy + 5000 ] ]

  ask turtles with [shape = "darkhole"] [if any? turtles with [shape = "saturn"] in-radius 1.7 ;;saturn got absorbed into darkhole
    [ask turtles with [shape = "saturn" ] in-radius 1.7 [die] set energy energy + 5000 ] ]

    ask turtles with [shape = "darkhole"] [if any? turtles with [shape = "neptune"] in-radius 1.7 ;;neptune got absorbed into darkhole
    [ask turtles with [shape = "neptune" ] in-radius 1.7 [die] set energy energy + 5000 ] ]

    if ticks >= 800 [
    ask darkhole [die]] ;;black hole has stopped and disappeared

   tick
  if ticks >= 900 [ stop ] ;; Everything completely stops
end

;;-----------------------------------------------------------------------------------------------------------------------------------

to pair1   ;; made a procedure that contains 2 planets to collide and have a black hole appear as said in the "GO" procedure
 if ticks = 0 [
setup-mercury
setup-jupiter
  ]

ask turtles with [shape = "mercury"] [if any? turtles with [shape = "jupiter"] in-radius 1.7
    [ask turtles with [shape = "jupiter" ] in-radius 1.7 [die] set energy energy - 250 ] ;;asking if mercury and jupiter collide, jupiter dies

  ]

end

to pair2  ;; made a procedure that contains 2 planets to collide and have 1 planet to survive after the collision
if ticks = 200[
setup-mars
setup-earth
  ]
ask turtles with [shape = "mars"] [if any? turtles with [shape = "earth"] in-radius 1.7
    [ask turtles with [shape = "earth" ] in-radius 1.7 [die] set energy energy - 250]] ;;asking if mars and earth collide, earth dies

end

to pair3  ;; made a procedure that contains 2 planets to collide and have 1 planet to survive after the collision
if ticks = 400[
setup-uranus
setup-venus
  ]
ask turtles with [shape = "venus"] [if any? turtles with [shape = "uranus"] in-radius 1.7
    [ask turtles with [shape = "uranus" ] in-radius 1.7 [die] set energy energy - 250]] ;;asking if venus and uranus collide, uranus dies


end

to pair4  ;; made a procedure that contains 2 planets to collide and have 1 planet to survive after the collision
if ticks = 600 [
setup-neptune
setup-saturn
  ]
ask turtles with [shape = "saturn"] [if any? turtles with [shape = "neptune"] in-radius 1.7
    [ask turtles with [shape = "saturn" ] in-radius 1.7 [die] set energy energy - 250]] ;;asking if saturn and neptune collide, neptune dies

end
;;---------------------------------------------------------------------------------------------
to move
  rt random 50
  lt random 50
  fd 1
end

to move2 ;;slows down movement for the black hole
ask darkhole
  [ rt random 90
    lt random 90
    fd 0.05
  ]
end
to setup-patches
  ask patches [set pcolor black]

end

;;Setting up our planets, stars, the sun and the black hole

to setup-stars ;;created the stars
  create-stars 10
  set-default-shape stars "star"
  ask stars [set color white]
  ask stars [set size 1]
end

to setup-sun ;;created the sun
  create-sun 1
  set-default-shape sun "sun"

  ask sun [set size 5]

end

to setup-mercury ;;created planet mercury
  create-mercury 1 [setxy random-xcor random-ycor]
  set-default-shape mercury "mercury"
  ask mercury [set color gray]
  ask mercury [set size 4]

end

to setup-venus ;;created planet venus
  create-venus 1 [setxy random-xcor random-ycor]
  set-default-shape venus "venus"
  ask venus [set size 4]
end

to setup-earth ;;created planet earth
  create-earth 1 [setxy random-xcor random-ycor]
  set-default-shape earth "earth"
  ask earth [set size 4]
end

to setup-mars ;;created planet mars
  create-mars 1 [setxy random-xcor random-ycor]
  set-default-shape mars "mars"
  ask mars [set size 3]
end


to setup-jupiter ;;created planet jupiter
  create-jupiter 1 [setxy random-xcor random-ycor]
  set-default-shape jupiter "jupiter"
  ask jupiter [set size 10]
end


to setup-saturn ;;created planet saturn
  create-saturn 1 [setxy random-xcor random-ycor]
  set-default-shape saturn "saturn"
  ask saturn [set size 9]
end

to setup-uranus ;;created planet uranus
  create-uranus 1 [setxy random-xcor random-ycor]
  set-default-shape uranus "uranus"
  ask uranus [set size 4]
end

to setup-neptune ;;created planet neptune
  create-neptune 1 [setxy random-xcor random-ycor]
  set-default-shape neptune "neptune"
  ask neptune [set size 5]
end

to  setup-darkhole ;;created the black hole
  create-turtles 1  [setxy random-xcor random-ycor]
  set-default-shape darkhole "darkhole"
   ask darkhole [set size 8]
end

;;==============================================================
@#$#@#$#@
GRAPHICS-WINDOW
300
10
632
343
-1
-1
9.82
1
10
1
1
1
0
1
1
1
-16
16
-16
16
1
1
1
ticks
30.0

BUTTON
19
72
142
159
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
164
73
286
156
NIL
GO
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
21
175
114
220
NIL
count mercury
17
1
11

MONITOR
178
176
269
221
NIL
count jupiter
17
1
11

MONITOR
22
230
96
275
NIL
count mars
17
1
11

MONITOR
177
230
255
275
NIL
count earth
17
1
11

MONITOR
21
291
102
336
NIL
count venus
17
1
11

MONITOR
176
292
262
337
NIL
count uranus
17
1
11

MONITOR
21
354
104
399
NIL
count saturn
17
1
11

MONITOR
176
354
270
399
NIL
count neptune
17
1
11

TEXTBOX
660
21
810
119
Note: The sun is farther away from the planets and the black hole\n\nMight require multiple clicks on \"setup\" to have all models generate
11
0.0
1

SWITCH
411
394
545
427
show-gravity?
show-gravity?
1
1
-1000

@#$#@#$#@
## WHAT IS IT?

This model explores space and the planets similar to our solar system but with a twist and experiments a what if senario like what would happen if planets collided against each other, how would that affect the solar system and the other planets in it.  

## HOW IT WORKS

Every two hundred ticks a set of two planets will randomly orbit space, while a black hole will be formed, any planets that hover into the black hole will meet its inevitable demise, however there is hope for the planets that do survive because the black hole has until 800 ticks till it disappears. The purpose of this is to see if there is a chance that multiple planets will survive the devastating black hole or face complete destruction. 

## HOW TO USE IT

Press, set up and go. Turn on and off the switch button to see the gravitational force the planets have.  


## THINGS TO NOTICE

If you pay close attention to the planets you'll notice that these planets aren't like ours, they're able to harness dark energy which shifts their color and become a real visual treat to those running the program more than once. WACKY WONDERFUL WORLDS COMING TO YOU...Wait...forget that last part

## THINGS TO TRY

There really isn’t much to do besides watch what happens. 

## EXTENDING THE MODEL

A comet was planned to be developed where the planets would gain a temporary speed boost but could not be implemented due to complications and time restrictions. 

## NETLOGO FEATURES

The usage of many breeds to distinguish each planet as their own shape. Usage of unique self drawn shapes to depict the planets of our not so similar solar system. 

## RELATED MODELS

Wolf sheep predation is a big inspiration to this concept using the patches at the factors in deciding if the planets will blow up and disappear from our world.

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

comet
true
8
Polygon -14835848 true false 164 57 89 222 179 42 89 222 164 87 134 222 149 102 104 207 134 147 119 207 149 132 149 102 119 237 134 147 104 222 164 72 134 207 89 192 134 117 164 72 179 42 104 207 164 72 104 237 134 192 119 222 149 147 119 222 149 147 104 192 119 147 89 207 134 117 89 192 164 72 179 57 134 147 119 207 179 42 89 192 179 42 134 207 149 132 74 207 134 177 119 192 149 147 179 42 104 192 104 192 149 102 89 207 149 117 119 222 149 117 119 222 164 87 119 222 89 207 179 42 104 222 149 102 134 207 149 102 119 207 149 147 119 207 149 132 119 192 134 132 119 162 149 117 134 192 149 132 119 192 134 147 134 222 134 177 134 207 134 207 149 117 119 192 134 192 134 207 134 192 134 207 134 192 134 207 134 192 134 222 149 117 104 222 134 132 104 207 149 132 89 207 134 132 104 207 149 117 104 207 149 102 104 177 149 87 74 222 149 87 104 192 149 117 89 222 149 117 89 207 149 117 104 207 134 132 89 207 134 117 89 192 119 132 89 192 134 117 89 192 149 87 74 222 179 72 104 222 164 72 134 222 179 57 134 192 119 222 134 192 134 222 134 177 119 222 134 207 119 222 134 192 119 222 134 207 134 222 134 192 134 222 149 147 119 207 164 72 179 42 119 162 104 207 104 192 74 237 89 207 149 42 74 222 119 87 74 207 149 72 104 207 149 102 104 207 164 102 119 207 179 102 104 237 179 117 119 237 149 192 149 177 209 102 134 222 194 102 134 222 194 87 134 207 194 87 134 207 194 87 119 222 179 87 119 237 179 102 164 207 209 132 134 237 194 132 134 222 209 117 134 207 134 147 104 222 89 72 74 207 89 87 89 177 104 42 89 192 119 87 104 192 104 72 74 222 74 72 89 207 119 87 104 102 104 192 149 87 119 192 119 132 119 42 104 192 134 72 104 222 164 117 134 207 179 57 134 177 164 72 119 207 164 87 119 207 134 117 104 207 119 162 104 192 104 177 104 192 119 162 89 207
Line -7500403 false 180 45 90 240
Circle -11221820 true true 71 191 67
Line -11221820 true 180 60 75 225
Line -11221820 true 165 75 120 240
Polygon -11221820 true true 120 165 135 180 120 195 165 75 150 165 180 90 105 210 165 105 120 195 150 105 120 165 120 135 105 210 150 120 120 180 135 120

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

darkhole
true
0
Circle -1 true false 30 30 240
Circle -16777216 true false 36 36 228

dot
false
0
Circle -7500403 true true 90 90 120

earth
true
0
Circle -13345367 true false 16 16 268
Circle -11221820 false false 15 15 268
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Circle -11221820 false false 15 15 270
Polygon -13840069 true false 105 45 60 90 45 120 45 150 60 165 75 195 90 210 105 210 135 210 150 225 150 255 165 270 195 255 225 240 225 225 225 195 195 195 195 195 150 210 135 210 120 195 105 180 120 165 135 165 150 180 165 180 180 165 165 165 165 150 165 135 195 120 195 90 165 60 165 45 150 45 135 30 180 30 195 60 195 30 150 15 120 30 105 45
Line -13840069 false 180 180 180 180
Line -13840069 false 180 180 195 195
Polygon -13840069 true false 210 60 240 105 255 120 240 135 240 165 255 150 255 135 270 120 270 135 270 105 240 60 210 60
Polygon -13840069 true false 240 180 255 165 270 165 270 195 255 210 255 225 240 210 240 180

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

jupiter
true
0
Circle -955883 true false 29 29 242
Polygon -7500403 true true 30 180 105 165 150 150 210 165 240 165 270 180 255 210 165 195 90 180 60 210 45 210 30 180
Polygon -7500403 true true 45 90 75 105 105 120 135 105 165 120 210 120 210 120 225 120 255 135 255 120 270 120 240 90 195 75 90 75 75 60 60 75 45 90
Polygon -6459832 true false 195 255 165 225 135 225 120 240 120 255 135 270 150 255 150 240 135 240 135 255 135 255 135 240 150 240 165 240 180 255 195 255
Polygon -7500403 true true 75 240 105 210 135 195 165 195 240 225 255 225 195 225 180 210 120 210 105 255 75 240
Polygon -6459832 true false 45 180 60 135 90 135 150 120 210 135 240 135 270 150 225 150 150 150 90 150 90 165 60 180
Polygon -7500403 true true 105 45 135 60 195 60 225 60 135 30 90 45 135 60

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

mars
true
0
Circle -2674135 true false 30 30 240
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 90 60 30
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 129 39 42
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 56 146 67
Circle -16777216 false false 120 210 30
Circle -16777216 false false 120 210 30
Circle -16777216 false false 120 210 30
Circle -16777216 false false 120 210 30
Circle -16777216 false false 120 210 30
Circle -16777216 false false 120 210 30
Circle -16777216 false false 120 210 30
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 204 159 42
Circle -16777216 false false 225 120 30
Circle -16777216 false false 225 120 30
Circle -16777216 false false 225 120 30
Circle -16777216 false false 225 120 30
Circle -16777216 false false 225 120 30
Circle -16777216 false false 225 120 30
Circle -16777216 false false 225 120 30
Circle -16777216 false false 225 120 30
Circle -16777216 false false 225 120 30
Circle -16777216 false false 225 120 30
Circle -16777216 false false 225 120 30
Polygon -955883 true false 45 90 105 105 195 105 225 90 240 75 255 90 255 105 270 120 195 135 135 150 75 135 90 135 60 135 30 120
Polygon -955883 true false 135 270 180 240 195 240 225 210 255 210 210 255 165 270 135 270
Polygon -955883 true false 135 180 150 150 165 150 180 150 195 165 180 165 165 165 150 180 135 195 120 195 135 180
Polygon -955883 true false 120 225 90 255 120 270 135 240 120 240 120 225
Polygon -955883 true false 150 210 195 180 210 195 210 210 180 210 150 225 150 210
Polygon -955883 true false 90 75 75 60 60 75 60 90 90 75
Polygon -955883 true false 120 60 135 75 120 75 120 60
Polygon -955883 true false 165 45 210 45 240 75 195 75 180 75

mercury
true
0
Circle -7500403 true true 29 29 242
Circle -1 true false 88 58 32
Circle -1 true false 120 105 60
Line -1 false 195 45 150 120
Line -1 false 150 150 135 270
Line -1 false 180 45 120 90
Line -1 false 120 90 90 165
Circle -1 true false 60 135 60
Circle -1 true false 210 135 0
Circle -1 true false 195 180 30
Line -1 false 210 195 210 240
Line -1 false 210 195 225 225
Line -1 false 210 195 240 210
Line -1 false 150 45 90 75
Line -1 false 90 75 45 120
Line -1 false 45 120 30 150
Circle -16777216 false false 90 210 30
Circle -16777216 false false 75 90 30
Circle -16777216 false false 225 135 30
Circle -16777216 false false 195 60 30
Circle -16777216 false false 165 180 0
Circle -16777216 false false 150 165 30
Line -16777216 false 90 180 90 180
Line -1 false 90 180 90 255
Circle -1 true false 210 90 30
Line -1 false 240 75 225 105
Line -1 false 225 105 210 135
Line -1 false 90 180 60 225
Circle -1 true false 150 210 30
Line -1 false 210 135 165 225
Line -1 false 165 225 165 270

neptune
true
0
Circle -13791810 true false 29 29 242
Polygon -13345367 true false 45 105 105 75 165 75 225 90 255 105 225 60 150 45 90 45 45 105
Polygon -13345367 true false 75 180 120 180 195 180 240 195 255 210 240 225 165 210 105 210 60 225
Polygon -13345367 true false 150 105 105 120 90 135 105 150 150 150 195 150 210 150 225 135 210 120 165 105 150 105
Polygon -13345367 true false 135 195 90 225 105 240 150 255 180 240 195 240 225 240 225 210 120 210
Polygon -1 true false 135 135 135 150 165 165 120 150 120 135 135 120
Polygon -1 true false 165 165 105 165 90 150 120 150 135 150
Line -1 false 225 135 255 150
Line -1 false 210 135 225 165
Line -1 false 225 165 180 165
Line -1 false 150 105 180 120

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

saturn
true
0
Circle -1184463 true false 60 60 180
Polygon -6459832 true false 60 135 105 150 150 150 210 150 240 135 225 120 75 120 60 135
Polygon -6459832 true false 90 210 105 210 150 210 210 210 225 195 225 180 75 180 75 195
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -16777216 false false 60 135 165 135 240 135 255 120 300 120 270 165 240 180 60 180 15 165 15 120 60 135
Polygon -6459832 true false 75 105 135 105 210 105 225 105 210 90 105 75 75 105
Polygon -7500403 true true 15 120 15 165 60 180 240 180 270 165 300 120 255 120 240 135 60 135 15 120

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

sun
true
0
Circle -1184463 true false 60 60 180
Polygon -955883 true false 45 75 45 75
Line -1184463 false 150 0 150 45
Line -1184463 false 195 60 225 30
Line -1184463 false 105 60 75 30
Line -1184463 false 90 225 60 255
Line -1184463 false 60 105 30 90
Line -1184463 false 240 105 270 90
Line -1184463 false 60 150 15 150
Line -1184463 false 240 150 285 150
Line -1184463 false 60 180 30 195
Line -1184463 false 240 180 270 195
Line -1184463 false 150 255 150 300
Line -1184463 false 210 225 240 255

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

uranus
true
0
Circle -11221820 true false 33 33 234
Polygon -1 true false 75 75 105 105 165 105 180 75 225 90 240 90 240 75 180 45 105 60 75 60 75 75
Polygon -1 true false 60 225 105 240 135 240 180 240 225 225 240 225 210 210 180 225 135 225 90 225 60 210 60 225

venus
true
0
Circle -16777216 true false 90 180 30
Circle -955883 true false 49 49 201
Polygon -1184463 true false 120 150 135 135 150 165 195 165 240 180 240 195 210 195 195 180 150 180 135 165 120 180 150 195 165 195 180 195 195 210 210 225 165 225 135 210 90 195 90 180 90 165 90 165 75 135 60 135 60 120 90 120 90 135 105 150 105 120 120 120 120 150
Polygon -1184463 false false 105 165 60 165 105 165 60 150 105 165 60 180 105 150 105 210 105 195 150 210 135 225 135 240 150 225 165 225 165 240 195 210 120 195
Line -1184463 false 105 150 120 90
Line -1184463 false 120 120 135 90
Line -1184463 false 75 135 60 105
Line -1184463 false 90 135 75 90
Circle -16777216 false false 135 60 30
Circle -16777216 true false 135 60 30
Circle -16777216 true false 195 105 30
Circle -16777216 true false 105 210 30
Line -1184463 false 120 60 90 90
Line -1184463 false 180 60 180 90
Line -1184463 false 120 60 120 105

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.1.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
