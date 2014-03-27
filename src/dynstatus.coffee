# Description:
#   Get hubot to check the http://www.dynstatus.com/ page for you
#
# Dependencies:
#   "nodepie": "0.5.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot dyn top <N> - get the top N from the main feed
#   hubot dyn dns <N> - get the N posts from the dns feed
#   hubot dyn email <N> - get the N posts from the email feed
#
# Author:
#   skimbrel - hackernews
#   ivey
#   jjasghar

NodePie = require("nodepie")

dynFeedUrl = "http://www.dynstatus.com/dyndns/feed"
dyndnsFeedUrl ="http://www.dynstatus.com/dynect-dns/feed"
dynemailFeedUrl ="http://www.dynstatus.com/dynect-email/feed"

module.exports = (robot) ->
  robot.respond /dyn top (\d+)?/i, (msg) ->
    msg.http(dynFeedUrl).get() (err, res, body) ->
      if res.statusCode is not 200
        msg.send "Something's gone awry"
      else
        feed = new NodePie(body)
        try
          feed.init()
          count = msg.match[1] || 5
          items = feed.getItems(0, count)
          console.log(feed.getDate())
          msg.send item.getTitle() + ": " + item.getPermalink() + " @ " + item.getDate() for item in items
        catch e
          console.log(e)
          msg.send "Something's gone awry"

  robot.respond /dyn dns (\d+)?/i, (msg) ->
    msg.http(dyndnsFeedUrl).get() (err, res, body) ->
      if res.statusCode is not 200
        msg.send "Something's gone awry"
      else
        feed = new NodePie(body)
        try
          feed.init()
          count = msg.match[1] || 5
          items = feed.getItems(0, count)
          msg.send item.getTitle() + ": " + item.getPermalink()  + " @ " + item.getDate() for item in items
        catch e
          console.log(e)
          msg.send "Something's gone awry"

  robot.respond /dyn email (\d+)?/i, (msg) ->
    msg.http(dynemailFeedUrl).get() (err, res, body) ->
      if res.statusCode is not 200
        msg.send "Something's gone awry"
      else
        feed = new NodePie(body)
        try
          feed.init()
          count = msg.match[1] || 5
          items = feed.getItems(0, count)
          msg.send item.getTitle() + ": " + item.getPermalink()  + " @ " + item.getDate() for item in items
        catch e
          console.log(e)
          msg.send "Something's gone awry"

