# Description:
#   Tim Noel-inspired ice cream!
#
# Commands:
#   hubot ice cream me <username> - Return a pic of <username> with ice cream!

icecreams = {
  "aknight": "http://rich.io/image/030F1z043j1r/ice-cream-aknight.jpg",
  "agoldman": "http://rich.io/1r253v0C2w34/avi-goldman.jpg",
  "amiller": "http://rich.io/image/1X191Y3J0j3z/ice-cream-amiller.jpg",
  "awinder": "http://rich.io/image/3k1s0R2x1q3x/ice-cream-awinder.jpg",
  "bobevans": "http://rich.io/image/0N2a0Y2C3F36/ice-cream-bobevans.jpg",
  "cmcfadden": "http://rich.io/image/0x1j1t3I210W/ice-cream-cmcfadden.jpg",
  "jmartin": "http://rich.io/image/2R050Q1d311H/ice-cream-jmartin.jpg",
  "jordan": "http://rich.io/image/1z320Z2T0b1p/ice-cream-jordan.jpg",
  "jsorensen": "http://rich.io/image/3x0y0i2q3U2B/ice-cream-jsorensen.jpg",
  "richleland": "http://rich.io/image/1j2l0K1z0u3F/ice-cream-richleland.jpg",
  "tnoel": "http://rich.io/image/2T0t3i3Q2020/ice-cream-tnoel.jpg",
  "mmathieu": "http://i.imgur.com/XqBQsUa.jpg"
}

icecream_users = Object.keys(icecreams)

module.exports = (robot) ->
  robot.respond /ice cream me$/i, (msg) ->
    foo = msg.random icecream_users
    msg.send icecreams[foo]

  robot.respond /ice cream me (.*)/i, (msg) ->
    match = msg.match[1]
    if icecreams.hasOwnProperty match
      msg.send icecreams[match]
    else
      msg.send "I DON'T KNOW MUCH ABOUT " + match.toUpperCase()
