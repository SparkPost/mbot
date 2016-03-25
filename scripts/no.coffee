# Description:
#   NO
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   no - respond using an image of something along the lines of no
#
# Author:
#   nobot

noes = [
  "http://rich.io/V1Jo/untitle.JPG",
  "http://rich.io/V15K/falcon-hair.jpg",
  "http://rich.io/V1i4/483ef0911f5e27073a015b45aee7a288b9c8d3bfa104f8bfe6625572f97cfa52.jpg",
  "http://rich.io/V1j5/how-about-no-bear-meme.jpg",
  "http://f.cl.ly/items/0w110n0G131t2o2l3G15/img-thing.jpg",
  "http://rich.io/V1yS/your-argument-is-invalid-meme-dumpaday-5.jpg",
  "http://rich.io/V0ye/image.png",
  "http://rich.io/V26K/675646-354knf.jpg",
  "http://rich.io/V1ZM/67610cd7d50aef26c374303c76365479644a5674f7ede7cfdb2ac2011c6a49d9.jpg",
  "http://rich.io/image/331Z1n0b0D1q",
  "http://rich.io/V1Ey/nope-exe_o_675265.jpg",
  "https://media1.giphy.com/media/149t2dI5M5nzvq/200.gif"
]

module.exports = (robot) ->
  robot.respond /(nope|invalid|no)/i, (msg) ->
    msg.send msg.random noes
