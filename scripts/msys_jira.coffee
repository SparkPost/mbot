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

baseurl = "https://jira.int.messagesystems.com/browse"

module.exports = (robot) ->

  links = () -> robot.brain.data.jira_links ?= {}

  link_timeout = 10 * 60 * 1000

  regex = /// (
    ?: jira\s*([A-Za-z]{1,10}-[0-9]+)\b
     | (?:[^/A-Z]|^)((?:AD|BZ|CCHBCK|CFG|COPS|DOC|DT|ESC|ESCSP|FAD|LGBCK|MA|MC|MDB|MO|MOCRBCK
               |MOMLBCK|MR|MSC|MT|OPS|PAB|PGM|PKBMAB|PKG|PL|PM|PSI|PT|SCM|SPCP|SRE|SUP|SUPM
               |SUPSITE|TM|TPS|TR)-[0-9]{1,5})\b
  ) ///i

  robot.hear regex, (msg) ->

    match = msg.match[1]

    if msg.match[2]
      match = msg.match[2]

    match = match.toUpperCase()

    respond = true
    last_response = links()[match]
    time_now = new Date().getTime()

    if last_response and time_now - last_response < link_timeout
      respond = false
    else
      links()[match] = time_now

    if respond
      msg.send "#{baseurl}/#{match}"
