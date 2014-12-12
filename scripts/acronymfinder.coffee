# Description:
#   Look up acronym expansions
#
# Commands:
#   hubot acronym me <query> - Prints a link to Acronym Finder for the supplied acronym.

htmlp = require('htmlparser')
soups = require('soupselect')

module.exports = (robot) ->
  robot.respond /(ac(?:ro(?:nym)?)?)\s*(me|link)? (\w+)/i, (msg) ->
    uri = "http://www.acronymfinder.com/#{msg.match[3]}.html"
    msg.send uri
    if msg.match[2] == 'link'
      return
    msg.http(uri)
      .get() (err, res, body) ->
        hand = new htmlp.DefaultHandler (err, domset)->
          if err?
            # silent errors
          else if Array.isArray(domset)
            defs = getDefs(domset)
            msg.send defs
        , { verbose: false, ignoreWhitespace: true }

        parser = new htmlp.Parser(hand)
        parser.parseComplete(body)

getDefs = (domset) ->
  titles = soups.select(domset, 'td.result-list__body__meaning')
  rv = "#{titles.length} meanings:\n"
  for title in titles
    c = title.children[0]
    if c.children?
      rv = "#{rv}#{c.children[0].data} #{c.attribs.href}\n"
    else
      rv = "#{rv}#{c.data}\n"
  rv

