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
  "http://www.quickmeme.com/img/68/68148e48f722465fedaf37348b49ac33f87344507eba8786b4f6b72dec8062de.jpg"
]

module.exports = (robot) ->
  robot.respond /(bro, do you even test|brotest)/i, (msg) ->
    msg.send msg.random bros
