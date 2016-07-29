# Description:
#   Show Desk Issue link when an ID is mentioned.
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
#   dunc

baseurl = 'https://support.sparkpost.com/web/agent/case'

module.exports = (robot) ->

  links = () -> robot.brain.data.desk_links ?= {}

  link_timeout = 15 * 60 * 1000

  robot.hear /\bdesk[\s:#=-]*([0-9]{1,6})(\b|\D*)/i, (msg) ->

    match = msg.match[1]

    respond = true
    last_response = links()[match]
    time_now = new Date().getTime()

    if last_response and time_now - last_response < link_timeout
      respond = false
    else
      links()[match] = time_now

    if respond
      msg.send "#{baseurl}/#{match}"
