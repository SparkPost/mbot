# Description:
#   Corgime
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot corgi me - Receive a corgi
#   hubot corgi bomb N - get N corgis
#
# Author:
#   alexgodin

module.exports = (robot) ->

  robot.respond /corgi me/i, (msg) ->
    msg.http("http://corgibomb.heroku.com/random")
      .get() (err, res, body) ->
        msg.send body

  robot.respond /corgi bomb( (\d+))?/i, (msg) ->
    msg.send "http://mlkshk.com/r/X977.gif"

