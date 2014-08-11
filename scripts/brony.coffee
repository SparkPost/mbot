# Description:
#   Random brony pic
#
# Commands:
#   hubot brony me - Return a random brony pic!

bronies = [
  "http://rich.io/image/1R2Q0t12360j/giphy.gif",
  "http://rich.io/image/0O3l1q441H2u/the_power_of_christ_compels_you__o_o_by_mabelpines2001-d67po6h.gif",
  "http://rich.io/image/2s233C3i2C2F/bill-clinton-brony-obama.jpg",
  "http://rich.io/image/0B2T3a3z0d0v/are%2Byou%2Bbrony%2Benough%2Bto%2Bpaint%2Byour%2Broom%2Bpink%2B_c8218c4826daacfe1e0b5c697b3d981d.png",
  "http://rich.io/image/1U0L2o3x3e2p/seth_green_is_a_brony_by_lipanel-d3f4xez.jpg",
  "http://rich.io/image/3O2I2d0e0G2P/someone-made-a-documentary-about-bronies-male-my-little-pony-fans.jpg",
  "http://rich.io/image/0i1I3y0y1B3F/spiderman_is_a_brony_by_inferno111-d5r99to.jpg",
  "http://rich.io/image/2a0h373X2t3I/BronyMegaPosterFull.jpg",
  "http://rich.io/image/3Q3X0t2W081R/hipster_brony_zemratsu_by_aemi-d546gr5.png",
  "http://rich.io/image/0G3R2k0a3f0n/keep_calm_and_brony_on_by_usmarkinator-d509fnk.png",
  "http://rich.io/image/1l3m013O0X20/f23cb5cd093b94b6d5637a0b5466df78326e1414bea2e4ae2d6c606c530fe5cb.jpg"
]

module.exports = (robot) ->
  robot.respond /brony me$/i, (msg) ->
    msg.send msg.random bronies
