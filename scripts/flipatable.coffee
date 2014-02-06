# Description:
#   Flips a table.
#
# Commands:
#   hubot flip a table

module.exports = (robot) ->
  robot.respond /flip a table$/i, (msg) ->
    msg.send "(╯°□°）╯︵ ┻━┻"
