---
layout: post
title: "Auto Commenting of Partials"
date: 2014-01-12 04:16:07
tags:
- rubyonrails
- webdev
excerpt: Auto HTML commenting of partials in a ruby on rails app.
---

When working in a rails app, sometimes it is really easy to loose yourself in a complex path of nested partials. Not knowing where code is coming from or where the proper place is to edit the source can be extremly frustrating and after my consistent bitching, my friend [Chris Maddox][comaddox] whipped up this [really helpful gem][partial_logging] that adds inline comments in your HTML showing you when partials start and end.

Install the gem as normal: 

`gem install partial_logging` 

and then view the source of your HTML in dev tools or however you view source (hint: the correct answer is devtools :trollface:)

<a href="/img/post-assets/2014-01-12/devtools.png" title="Devtools" class="colorbox">
  <img src="/img/post-assets/2014-01-12/devtools.png">
</a>

BOOM. Now you can easily track what is coming form where. :wink:

Source can be found on [GitHub][partial_logging_source]

[comaddox]: http://twitter.com/comaddox
[partial_logging]: http://rubygems.org/gems/partial_logging
[partial_logging_source]: https://github.com/tyre/partial_logging
