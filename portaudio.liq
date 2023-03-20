#!/Users/flo/.opam/default/bin/liquidsoap

# Assumes installation of Liquidsoap on macOS via OPAM:
#   $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#   $ brew update
#   $ brew install opam
#   $ opam init
#   $ opam depext  taglib mad lame cry ffmpeg opus liquidsoap portaudio	# TODO: May no longer be required.
#   $ opam install taglib mad lame cry ffmpeg opus liquidsoap portaudio
#   $ eval $(opam env)
#   $ which liquidsoap
# Then run this script:
#   $ ./portaudio.liq

# src = input.https("https://icecast.radiofrance.fr/fip-hifi.aac")

H = playlist("./H.m3u")
A = playlist("./A.m3u")
J = playlist("./J.m3u")
V = delay(180., playlist("./V.m3u"))
# src = fade.in(duration=0.125, type="sin", src)
# src = fade.out(src)

radio = add([V, fallback([H, A, J])])

# thread.run(every=0.25, {ignore(src.seek(1.))})
# thread.run(every=10., {src.skip()})

output.portaudio(
  mksafe(radio)
)


