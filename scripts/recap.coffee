# Description:
#   Allows users to add recap data on a per-room basis to help people catch up on ongoing issues
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   mbot recap reset - resets the recap for this channel
#   mbot recap add <text> - adds <text> to the recap.
#   mbot recap me - prints the recap for this channel.  
#   mbot recap me #<channel> - prints the recap for a given channel.
#
# Author:
#   Yaakov

module.exports = (robot) ->
  robot.respond /recap reset/i, (response) ->
    # clean out the recap for this channel
    robot.brain.set("recap_##{response.envelope.room}", null)
    response.send("erased recap data for ##{response.envelope.room}")

  robot.respond /recap add(.*)$/i, (response) ->
    recap = response.match[1].trim()
    prev_recap = robot.brain.get("recap_##{response.envelope.room}") or ""

    # set up a nice, detailed timestamp 
    date_object = new Date
    timestamp = "#{date_object.getMonth() + 1}-#{date_object.getDate()} #{date_object.getHours()}:#{date_object.getMinutes()}"

    # stitch it all together 
    recap = "#{response.message.user.name} [#{timestamp}] #{recap}"

    # tack on the existing recap to maintain history
    recap = "#{prev_recap}\n#{recap}" 
    robot.brain.set("recap_##{response.envelope.room}", recap)
    response.send("set recap for ##{response.envelope.room}")

  robot.respond /recap me(.*)$/i, (response) ->
    # default the recap channel to be the current channel
    if response.match[1] and response.match[1].trim()
      recap_target = response.match[1].trim()
    else
      recap_target = "##{response.envelope.room}"

    recap = robot.brain.get("recap_#{recap_target}")
    if recap is null
      response.send("I don't have a recap for #{recap_target}")
    else
      response.send(recap)
