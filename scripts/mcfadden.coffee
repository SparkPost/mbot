# Description:
#   McFadden Time
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   mcfadden time - Display a random McFadden
#
# Author:
#   people of earth

mcfaddens = [
  "http://f.cl.ly/items/0Y2n061M1G420g2k2w3G/7lvi4.jpg",
  "http://cl.ly/image/3i150P3x0f2G/7lvq1.jpg",
  "http://rich.io/image/2x3B1J0l2v1h/james-mcfadden_1718888c.jpg",
  "http://rich.io/image/1H3Y011e1U2K/images.jpg",
  "http://rich.io/image/3A3p263X262N/james-mcfadden-image-3-505607415-3272494.jpg",
  "http://rich.io/image/1c3F090L1X2H/brianmcfadden_just.jpg",
  "http://rich.io/image/3B3V3d3x2l3B/78079.jpg",
  "http://cl.ly/image/1D123D3m0417/7lvua.jpg",
  "http://rich.io/image/0D3C2u3c123H/eric-mcfadden-the-mint.jpg",
  "http://rich.io/image/1A112V2T3P0q/ls.jpg",
  "http://rich.io/image/2N0s3B1A0s2Q/brian-mcfadden-come-party-thats-how-life-goes.png"
]

module.exports = (robot) ->
  robot.hear /\bmcfadden time\b/i, (msg) ->
    msg.send msg.random mcfaddens
