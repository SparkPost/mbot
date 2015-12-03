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

  regex = /decode\s*me\s*=\?utf-8\?B\?([a-zA-Z0-9\+\/]+)\?=/m

  robot.hear regex, (msg) ->

    if msg.match[1]
      match = msg.match[1]
      try
        msg.send new Buffer(match, 'base64').toString('utf8')
      catch ex
        msg.send 'Unable to decode'
