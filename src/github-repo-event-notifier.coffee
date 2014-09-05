# Description:
#   Notifies about any available GitHub repo event via post by puppetmaster sync script
# Configuration:
#
#   1. Prepare a dictionary with those fields:
#     - user: who did githut action
#     - action: [created|deleted|pushed]
#     - repository: github repository
#     - branch: github branch
#     - head_commit: url with last commit (head)
#     - message: message related to last commit
#   2. Post data to: <HUBOT_URL>:<PORT>/hubot/gh-repo-events[?room=<room>]
#      (Don't forget to urlencode the room name, especially for IRC. Hint: # = %23)
#   3. Enjoy this message in your hubot!
#
# Commands:
#   None
#
# URLS:
#   POST /hubot/gh-repo-events?room=<room>
#
# Authors:
#   Juan Carlos Castillo Cano
url = require('url')
querystring = require('querystring')

module.exports = (robot) ->
  robot.router.post "/hubot/gh-repo-events", (req, res) ->
    query = querystring.parse(url.parse(req.url).query)
    data = req.body
    room = query.room

    try
      announceRepoEvent data, (what) ->
        robot.messageRoom room, what
    catch error
      robot.messageRoom room, "Whoa, I got an error: #{error}"
      console.log "github repo event notifier error: #{error}. Request: #{req.body}"

    res.end ""

announceRepoEvent = (data, cb) ->
  msg = "GITHUB: #{data['user']} #{data['action']} in #{data['repository']}-#{data['branch']}"
  if data['head_commit']
    msg = msg + " with message '#{data['message']}' (URL: #{data['head_commit']})"
  cb msg
