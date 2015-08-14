# Description:
#   Decode MSFBL header
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Notes:
#   None
#
# Author:
#   mbainter


module.exports = (robot) ->


  regex = /MSFBL: ([a-zA-Z0-9=\+\/]+)\|([a-zA-Z0-9=\+\/\s]+)/m

  robot.hear regex, (msg) ->

    if msg.match[2]
      match = msg.match[2]
      match = match.replace /\s+/mg, ''
      out = new Buffer(match, 'base64').toString('ascii')
      msg.send '```' + out + '```'
