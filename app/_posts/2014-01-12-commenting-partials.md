---
layout: post
title: "Auto Commenting of Partials"
date: 2014-01-12 04:16:07
tags:
- rubyonrails
- webdev
excerpt: Auto HTML commenting of partials in a ruby on rails app.
---

When working in a rails app, sometimes it is really easy to loose yourself in a complex path of nested partials. Not knowing where code is coming from or where the proper place is to edit the source can be extremly frustrating and after my consistent bitching, my friend [Chris Maddox][comaddox] whipped up this really helpful code snippet that puts HTML comments outline the source of the view code:

<script src="https://gist.github.com/lynnwallenstein/f624bebff99c4035e75e.js"></script>

Just copy this code into an intializer then, when in development mode, view your rendered HTML:

<a href="/img/post-assets/2014-01-12/devtools.png" title="Devtools" class="colorbox">
  <img src="/img/post-assets/2014-01-12/devtools.png">
</a>

BOOM. Now you can easily track what is coming form where. :wink:

[comaddox]: http://twitter.com/comaddox
