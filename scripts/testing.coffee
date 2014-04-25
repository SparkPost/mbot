# Description:
#   Bro Testing
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   brotest - Bro, Do you even test?
#
# Author:
#   mbainter

bros = [
  "http://www.quickmeme.com/img/68/68148e48f722465fedaf37348b49ac33f87344507eba8786b4f6b72dec8062de.jpg",
  "http://www.quickmeme.com/img/f2/f24f5dfd4615c15cc2dbe3d7675a90e1f94b1126d5d21cd05d51b31068df1193.jpg",
  "http://cdn.memegenerator.net/instances/500x/44673034.jpg",
  "http://i.imgur.com/t3jA92e.jpg",
  "http://i.imgur.com/CFDizl5.jpg"
]

module.exports = (robot) ->
  robot.respond /|brotest)/i, (msg) ->
    msg.send msg.random bros

  robot.hear /bro, do you even test/i, (msg) ->
    msg.send msg.random bros

