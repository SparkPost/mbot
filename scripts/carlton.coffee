# Description:
#   Carlton Celebration
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   dance - Display a dancing Carlton
#
# Author:
#   pingles

carltons = [
  "http://media.tumblr.com/tumblr_lrzrlymUZA1qbliwr.gif",
  "http://web.archive.org/web/20121119111926/http://3deadmonkeys.com/gallery3/var/albums/random_stuff/Carlton-Dance-GIF.gif",
  "http://gifsoup.com/webroot/animatedgifs/987761_o.gif",
  "http://s2.favim.com/orig/28/carlton-banks-dance-Favim.com-239179.gif",
  "http://gifsoup.com/webroot/animatedgifs/131815_o.gif",
  "http://rich.io/V2N3/hand-jive2.gif",
  "http://eventstreams.com/es/rmb/ryan.gif",
  "http://eventstreams.com/es/rmb/dancing_julie.gif",
  "https://media.giphy.com/media/PPZetzwRl6Fyw/giphy.gif"
]

module.exports = (robot) ->
  robot.respond /\b(dance|happy)\b/i, (msg) ->
    msg.send msg.random carltons
