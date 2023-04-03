H = playlist("./H.m3u")
A = playlist("./A.m3u")
J = playlist("./J.m3u")
V = delay(180., playlist("./V.m3u"))

# Randomly play between these three playlists
pSource = random([H, A, J])

# Play the VO every three mintues over the other audio
cRadio = add([V, pSource])

# playlist organization
earlymorning = playlist(mode = "normal", "./PL_GD01.m3u")
morning = playlist (mode = "normal", "./PL_GD02.m3u")
noon = playlist (mode = "normal", "./PL_GD03.m3u")
afternoon = playlist (mode = "normal", "./PL_GD04.m3u")
evening = playlist (mode = "normal", "./PL_GD05.m3u")


dRadio = normalize(switch([
({1h-2h}, earlymorning), 
({6h-7h}, morning),
({11h-12h}, noon), 
({16h-17h}, afternoon), 
({21h-22h}, evening)
]))

dRadio = crossfade(fade_out = 5., fade_in = 5., duration = 6., dRadio) 

radio = switch([({1h-2h}, dRadio), ({3h-4h}, cRadio), ({6h-7h}, dRadio), ({8h-9h}, cRadio), ({11h-12h}, dRadio), ({13h-14h}, cRadio), ({16h-17h}, dRadio), ({18h-19h}, cRadio), ({21h-22h}, dRadio), ({23h-0h}, cRadio) ])

output.portaudio(mksafe(radio))