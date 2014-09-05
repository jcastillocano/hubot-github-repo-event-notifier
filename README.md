# Hubot: hubot-github-repo-event-notifier

Notifies hubot about any available GitHub repo event

## Installation

Add **hubot-github-repo-event-notifier** to your `package.json` file:

```json
"dependencies": {
  "hubot": ">= 2.5.1",
  "hubot-scripts": ">= 2.4.2",
  "hubot-github-repo-event-notifier": ">= 0.0.0",
  "hubot-hipchat": "~2.5.1-5",
}
```

Add **hubot-github-repo-event-notifier** to your `external-scripts.json`:

```json
["hubot-github-repo-event-notifier"]
```

## Configuration:

1. Prepare a dictionary with those fields:
 * user: who did githut action
 * action: [created|deleted|pushed]
 * repository: github repository
 * branch: github branch
 * head_commit: url with last commit (head)
 * message: message related to last commit
2. Post data to: <HUBOT_URL>:<PORT>/hubot/gh-repo-events[?room=<room>]
    (Don't forget to urlencode the room name, especially for IRC. Hint: # = %23)

Enjoy this message in your hubot!

**URLS: POST /hubot/gh-repo-events?room=<room>**
