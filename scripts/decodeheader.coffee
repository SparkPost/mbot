# Description:
#   Decode RFC2047 header
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
#   George

rfc2047 = require('rfc2047')

module.exports = (robot) ->

  regex = /decode\s*me\s*(.*)/

  robot.hear regex, (msg) ->
    if msg.match[1]
      msg.send '```' + rfc2047.decode(msg.match[1]) + '```'
