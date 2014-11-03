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

  regex = /// (
    ?: jira\s*([A-Za-z]{1,10}-[0-9]+)\b
     | \b((?:AD|BZ|CCHBCK|CFG|COPS|DOC|ESC|FAD|LGBCK|MA|MC|MDB|MO|MOCRBCK|MOMLBCK|MR|MSC|MT|OPS|PAB|PKBMAB|PKG|PL|PM|PT|SCM|SPCP|SUP|SUPM|SUPSITE|TM|TPS|TR)-[0-9]{1,5})\b
  ) ///i

  robot.hear regex, (msg) ->

    match = msg.match[1]

    if msg.match[2]
      match = msg.match[2]

    msg.send "#{baseurl}/#{match}"

