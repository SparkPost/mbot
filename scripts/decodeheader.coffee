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
#   George

mimelib = require('mimelib')

module.exports = (robot) ->

  b_regex = /decode\s*me\s*=\?utf-8\?B\?([a-zA-Z0-9\+\/]+={0,2})\?=/
  q_regex = /decode\s*me\s*=\?utf-8\?Q\?([ -~]+)\?=/

  robot.hear b_regex, (msg) ->
    if msg.match[1]
      match = msg.match[1]
      try
        msg.send '```' + new Buffer(match, 'base64').toString('utf8') + '```'
      catch ex
        msg.send 'Unable to decode'

  robot.hear q_regex, (msg) ->
    if msg.match[1]
      match = msg.match[1]
      try
        msg.send '```' + mimelib.decodeQuotedPrintable(match) + '```'
      catch ex
        msg.send 'Unable to decode'
