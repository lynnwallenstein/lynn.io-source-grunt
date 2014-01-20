---
layout: post
title: "Keeping Your SCSS Vars and Adobe Palletes in Sync with Tinge"
date: 2014-01-19  23:35:08
tags:
- color
- adobe
- bruce
- gem
excerpt: Tinge creates Adobe Swatch Exchange (.ase) files from your sass variables.
---

I am a fan of designing in code. I like the ability to really "kick the tires" of a design and feel how it will work from an interaction level.

Sometimes this isn't possible.

Sometimes it isn't me doing the design.

Sometimes I just feel Photoshoppy.

One of the many drawbacks between moving back and forth from Adobe to code is losing my color variables that I maintain in sass. I want to keep these colors in sass due do the power of of the sass color functions, but getting them outside of sass is a total PITA.

Now I could use a color picker or even just guestimate colors in Photoshop/Illustrator and replace them with color variables when the design finally gets codified, but that feels like a garbage solution to a technology problem.

Here enters [Tinge][tinge].

Tinge is a awesome gem created by my amazing friend [Bruce Williams][bruce] who after being sick and tired or my whining and complaining spent like 10 seconds (cause he is a genius) and created me this fabulous little tool that basically input my `_color.scss` SASS partials that I use in my projects and create for me an [Adobe Swatch Exchange][ase] file that I could import into photoshop/illustrator with all my colors.

The key thing here is that Tinge computes my sass color variables using sass color functions like lighten, darken, desaturate, etc, so I get the full color palette. Tinge also can export to JSON or YAML format instead of ASE.

## How Does It Work

It's pretty simple.  Let's take my example color file for this site:

``` css
// --------------------------
//  Colors
// --------------------------

$black: #333332 !default;
$white: #fff !default;

// Grays
$gray: #a29f99 !default;
$gray-light : lighten($gray, 20%) !default;
$gray-lighter: lighten($gray, 50%) !default;
$gray-lightest: lighten($gray, 90%) !default;
$gray-dark: darken($gray, 20%) !default;
$gray-darker: darken($gray, 50%) !default;
$gray-darkest: darken($gray, 80%) !default;

// Transparent
$transparent-white: hsla(100,100%,100%,0) !default;
$transparent-black: hsla(0,0%,0%,0) !default;

$shadow-lightest: hsla(0, 0%, 0%, 0.1) !default;
$shadow-lighter: hsla(0, 0%, 0%, 0.25) !default;
$shadow-light: hsla(0, 0%, 0%, 0.5) !default;
$shadow: hsla(0, 0%, 0%, 0.75) !default;

$glow-lightest: hsla(100,100%,100%,0.1) !default;
$glow-lighter: hsla(100,100%,100%,0.25) !default;
$glow-light: hsla(100,100%,100%,0.5) !default;
$glow: hsla(100,100%,100%,0.75) !default;


// Better Default Colors - https ://github.com/mrmrs/colors
// --------------------------

$aqua: #7FDBFF !default;
$blue: #0074D9 !default;
$navy: #001F3F !default;
$teal: #39CCCC !default;
$green: #2ECC40 !default;
$olive: #3D9970 !default;
$lime: #01FF70 !default;

// Warm
$yellow: #FFDC00 !default;
$orange: #FF851B !default;
$red: #FF4136 !default;
$fuchsia: #F012BE !default;
$purple: #B10DC9 !default;
$maroon: #85144B !default;

// Gray Scale
//$white: #fff !default;
//$silver: #ddd !default;
//$gray: #aaa !default;
//$black: #111 !default;

// Flat UI Colors - http://flatuicolors.com/
// --------------------------

// Greenish/Teal
$green-sea: #16a085; // Lighter
$turquoise: #1abc9c; // Darker

// Green
$emerald: #2ecc71; // Lighter
$nephritis: #27ae60; // Darker

// Blue - Bright
$peter-river: #3498db; // Lighter
$belize-hole: #2980b9; // Darker

// Blue - Dark
$wet-asphalt: #34495e; // Lighter
$midnight-blue: #2c3e50; // Darker

// Purple
$amethyst: #9b59b6; // Lighter
$wisteria: #8e44ad; // Darker

// Red
$alizariin: #e74c3c; // Lighter
$pomegranate: #c0392b; // Darker

// Orange
$sunflower: #f1c40f; // Lighter
$orange: #f39c12; // Darker

// Grays
$clouds: #ecf0f1;
$silver: #bdc3c7;
$concrete: #95a5a6;
$asbestos: #7f8c8d;
$gray-slate: #3e454f;

// Base16 - Ocean - http://chriskempson.github.io/base16/#ocean
// --------------------------

$base16-00: #2B303B;
$base16-01: #343D46;
$base16-02: #4F5B66;
$base16-03: #65737E;
$base16-04: #A7ADBA;
$base16-05: #C0C5CE;
$base16-06: #DFE1E8;
$base16-07: #EFF1F5;
$base16-08: #BF616A;
$base16-09: #D08770;
$base16-0A: #EBCB8B;
$base16-0B: #A3BE8C;
$base16-0C: #96B5B4;
$base16-0D: #8FA1B3;
$base16-0E: #B48EAD;
$base16-0F: #AB7967;
```

I run it through tinge:

`tinge -f ase _colors.scss -o colors.ase`

and I then get my outputted .ase file that I can open in Adobe with all my colors:

<a href="/img/post-assets/2014-01-19/ase.png" title="Color Palette" class="colorbox">
  <img src="/img/post-assets/2014-01-19/ase.png">
</a>

:boom: All my comps will be using the same colors as my code and I don't have to manually sync things... just regenerate, load and go.

Hovering over the colors will also give you the variable name so even makes it quicker to cross reference when coding :heart:

[bruce]: http://bruce.io/
[tinge]: https://github.com/bruce/tinge
[ase]: http://www.colourlovers.com/web/blog/2007/11/08/color-palettes-in-adobe-swatch-exchange-ase
