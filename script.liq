H = playlist("./H.m3u")
A = playlist("./A.m3u")
J = playlist("./J.m3u")
V = delay(180., playlist("./V.m3u"))

# Randomly play between these three playlists
pSource = random([H, A, J])

# Play the VO every three mintues over the other audio
radio = add([V, pSource])

radio = switch([({3h-4h}, radio), ({8h-9h}, radio), ({13h-14h}, radio), ({18h-19h}, radio), ({23h-0h}, radio) ])

output.portaudio(mksafe(radio))

