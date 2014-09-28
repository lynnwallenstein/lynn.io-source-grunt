# Relative Date Filter
#
#= require moment
#
# Rewrites timestamps as dynamic relative ones.
#
#     less than a minute ago
#     about a month ago
#     2 years ago
#
# ### Markup
#
# A `time` element with the class name `js-relative-date` must be used
# as a wrapper. The datetime string should be in ISO 8601 as per the
# HTML5 spec. The contents of the element will be replaced. But its
# still good to provide a decent fallback.
#
# ``` html
# <time class="js-relative-date" datetime="<%= created_at.iso8601 %>">
#   <%= created_at.to_date %>
# </time>
# ```
#

relativeTimeFormat =
  future: "%s from now",
  past: "%s ago",
  s: "seconds",
  m: "a minute",
  mm: "%d minutes",
  h: "an hour",
  hh: "%d hours",
  d: "a day",
  dd: "%d days",
  M: "a month",
  MM: "%d months",
  y: "a year",
  yy: "%d years"

relativeTimeOldFormat =
  future: "%s",
  past: "%s",
  s: "seconds",
  m: "a minute",
  mm: "%d minutes",
  h: "an hour",
  hh: "%d hours",
  d: "a day",
  dd: "%d days",
  M: "a month",
  MM: "%d months",
  y: "a year",
  yy: "%d years"

getMoment = (datetime) ->
  moment datetime, "YYYY-MM-DDTHH:mm:ssZ"

setTimeText = ($el, text) ->
  text = "just now" if text is "a few seconds ago"
  $el.show().text text

refreshRelativeDates = (container = document) ->
  nowMoment = moment()

  moment.locale "en",
    relativeTime: relativeTimeFormat
  for el in $(container).find "time.js-relative-date"
    $el = $(el)
    time = getMoment($el.attr('datetime'))
    text = time.fromNow()
    setTimeText $el, text

  moment.locale "en",
    relativeTime: relativeTimeOldFormat
  for el in $(container).find "time.js-relative-old"
    $el = $(el)
    time = getMoment($el.attr("datetime"))
    text = time.fromNow()
    setTimeText $el, text


# Refresh relative dates every min
$ ->
  refreshRelativeDates()
  console.log("Oh hai")
  setInterval refreshRelativeDates, 60000
