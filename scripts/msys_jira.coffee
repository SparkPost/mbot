# Description:
#   Show JIRA Issue link when an ID is mentioned.
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

baseurl = "http://jira.int.messagesystems.com/browse"

module.exports = (robot) ->
  robot.hear /jira\s*([A-Za-z]{1,10}-[0-9]+)\b/i, (msg) ->
    msg.send "#{baseurl}/#{msg.match[1]}"

