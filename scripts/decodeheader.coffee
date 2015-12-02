# Description:
#   Decode UTF8 header
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


  regex = /decode me =\?utf-8\?B\?([a-zA-Z0-9=\+\/]+)==\?=/m

  robot.hear regex, (msg) ->

    if msg.match[1]
      match = msg.match[2]
      match = match.replace /\s+/mg, ''
      out = 'invalid'
      try
        out = new Buffer(match, 'base64').toString('utf8')
      catch ex
        "do nothing"
        
      msg.send '```' + out + '```'
