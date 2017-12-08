# Description:
#   Look up acronym expansions
#
# Commands:
#   hubot acronym me <query> - Prints a link to Acronym Finder for the supplied acronym.

MAX_RESULTS = 5

htmlp = require('htmlparser')
soups = require('soupselect')

module.exports = (robot) ->
  robot.respond /(ac(?:ro(?:nym)?)?)\s*(me|link)? (\w+)/i, (msg) ->
    uri = "https://www.acronymfinder.com/#{msg.match[3]}.html"
    msg.send uri
    if msg.match[2] == 'link'
      return
    msg.http(uri)
      .get() (err, res, body) ->
        hand = new htmlp.DefaultHandler (err, domset)->
          if err?
            # silent errors
          else if res.statusCode == 301
            if res.headers.location && res.headers.location != uri?
              msg.send "301: http://www.acronymfinder.com#{res.headers.location}"
          else if Array.isArray(domset)
            defs = getDefs(domset)
            msg.send defs
        , { verbose: false, ignoreWhitespace: true }

        parser = new htmlp.Parser(hand)
        parser.parseComplete(body)

getDefs = (domset) ->
  titles = soups.select(domset, 'td.result-list__body__meaning')
  nres = titles.length
  rv = "#{titles.length} meanings"
  if nres > MAX_RESULTS
    rv = "#{rv}, first #{MAX_RESULTS}:\n"
  else
    rv = "#{rv}:\n"
  i = 0
  for title in titles
    if i++ >= MAX_RESULTS
      break
    c = title.children[0]
    if c.children?
      # printing the url gets too noisy with auto-expands
      #rv = "#{rv}#{c.children[0].data} #{c.attribs.href}\n"
      rv = "#{rv}#{i}. #{c.children[0].data}\n"
    else
      rv = "#{rv}#{i}. #{c.data}\n"
  rv

