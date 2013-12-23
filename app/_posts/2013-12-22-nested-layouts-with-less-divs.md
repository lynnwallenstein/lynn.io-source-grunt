---
layout: post
title: "Nested Layouts with Less Divs"
date: 2013-12-22  20:20:20
categories: blogging css webdev
excerpt: Using calc you can create really nice clean nested layouts without extra markup.
---

First to start out, this method relies heavily on the use of the CSS [Calc][caniusecalc] as a unit value. This is fairly well supported on most modern browsers, but if you need to support old versions of IE (pre 9), this probably won't work for you.

Ok now that we got that out of the way...

A currently very popular design style is what I call nested layouts. By this I mean the page is broken up into sections where the content is in the center, but some attribute such as a border or background color stretches the total width of the page.

## The Example

A great example of this is one of my favorite sites [GitHub][github] :)

<a href="/img/post-assets/2013-12-22/github.png" title="GitHub Dot Com, The Web Site" class="colorbox">
  <img src="/img/post-assets/2013-12-22/github.png">
</a>

While the GitHub web site doesn't actually use this method, it is a good example of the structure I am talking about:

<a href="/img/post-assets/2013-12-22/github-annotation.png" title="Page sections on GitHub with comment nest" class="colorbox">
  <img src="/img/post-assets/2013-12-22/github-annotation.png">
</a>

So in our example we have three content sections:

* Header
* Content
* Footer

Each of these have design attributes (background color/images) that stretch the whole width of the page, but the content is nested in the center of the page. To achieve this effect GitHub wraps each content section in an `div` that it is full width and contains the design attributes (background color/image.)

For our example lets focus on just the content section with the black iconed image background. We have a wrapping div with the styles for the `background-image`:

<a href="/img/post-assets/2013-12-22/github-content-wrapper.png" title="Content Wrapper" class="colorbox">
  <img src="/img/post-assets/2013-12-22/github-content-wrapper.png">
</a>

and then another `div` containing the content nested in the center using a fixed width with an auto margin, basicaly centering the content.

<a href="/img/post-assets/2013-12-22/github-content.png" title="Content" class="colorbox">
  <img src="/img/post-assets/2013-12-22/github-content.png">
</a>

## Why is this Bad?

Its not "bad", it just adds a lot of extra unneccessary markup/divs which:

* Increases complexity of page making it harder to work with/change/maintain
* Makes it harder to use responsive CSS for responsive design
* More code coming down the wire/larger page/performance

There is a better way! (IF you don't have to worry about older browsers)

## Calc All the Things!

[Calc][mozdevcalc] is one of my favorite new things about CSS. If you haven't played around with it I highly recommend you do, it is immensely powerful and has enabled me to do so many amazing things w/o relying on absolute positioning and/or adding tons of extra markup.

The key is that calc allows the browser use mixed units for units of measurements, like percentages and pixels.  For some good examples of calc is use, there is a great [CSSTricks][csstricks] article that goes over some common design patters and how calc can help.

So how can calc help us from [Divitis][divitis]? Easy!

So lets start by simplifying our markup a little bit:

``` html
<header id="page-header" role="banner">
  <h1>Here Is Our Header!</h1>
</header><!-- /header#page-header -->

<div id="main" role="main">
  <p>Our Main "content" area.</p>
</div><!-- /div#main -->

<footer id="page-footer">
  A footer... cause, why not.
</footer><!-- /footer#page-footer -->

```

This is pretty clean and simple and we don't really want to add any more markup just for the sake of our design. Using calc we can dynamically add padding to the left and right so that the content is centered, but the design styles will apply to the whole block.

Lets take our `#main` and style it with a black background with the content in a 1280px width nested in the center.

## The Math

So the math here is we have the full page width (100%) and we need to take out a fixed pixel chunk for our content (1280px) and then the padding on either side is half of whatever is left ... 50% of that for the right, 50% for the left:

Each margin: `(100% - 1280px) / 2`

We could do that with calc like this:

``` css
#main {
  background-color: black;
  padding-right: calc((100% - 1280px) / 2);
  padding-left: calc((100% - 1280px) / 2);
}
```

Now remember, calc is pretty new, so probably to be safe you might want to add the browser vendor prefixes (or use something like a preprocessor such as [Sass][sass] with mixins to take care of it :

``` css
#main {
  background-color: black;
  padding-left: -moz-calc((100% - 1280px) / 2);
  padding-left: -webkit-calc((100% - 1280px) / 2);
  padding-left: calc((100% - 1280px) / 2);
  padding-right: -moz-calc((100% - 1280px) / 2);
  padding-right: -webkit-calc((100% - 1280px) / 2);
  padding-right: calc((100% - 1280px) / 2);
}
```

## See It in Action

Using [Codepen][codepen], I created a similar (yet even cleaner! Sass <3) version you can see in action:

<p data-height="420" data-theme-id="0" data-slug-hash="HKdCz" data-user="lynnwallenstein" data-default-tab="result" class='codepen'>See the Pen <a href='http://codepen.io/lynnwallenstein/pen/HKdCz'>HKdCz</a> by Lynn Wallenstein (<a href='http://codepen.io/lynnwallenstein'>@lynnwallenstein</a>) on <a href='http://codepen.io'>CodePen</a></p>
<script async src="//codepen.io/assets/embed/ei.js"></script>

[caniusecalc]: http://caniuse.com/calc
[github]: http://www.github.com
[mozdevcalc]: https://developer.mozilla.org/en-US/docs/Web/CSS/calc
[csstricks]: http://css-tricks.com/a-couple-of-use-cases-for-calc/
[divitis]: http://en.wiktionary.org/wiki/divitis
[codepen]: http://codepen.io/
[sass]: http://sass-lang.com/
