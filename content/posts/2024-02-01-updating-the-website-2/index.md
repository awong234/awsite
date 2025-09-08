---
title: Updating this website (again)
author: Alec Wong
date: '2024-02-01'
cover: 'https://novagallery.org/img/novagallery-home.jpg'
categories: [life]
tags: [websites, hugo, photography]
---

I've done it! Finally got my website all sorted.

TLDR:

- RTFM. The config section of the docs had the answer the whole time; needed to set config to point to my subdirectory instead of the root.
- Clear your cache, and the web server's cache. Band-aid is to open your browser's network section of the dev tools and disable cache, which apparently also has the effect of requesting fresh content from the web server as well.

## Photo gallery

I found a php photo gallery at [novaGallery](https://novagallery.org/). It's a
very pleasant-looking design that uses PHP to serve images from a folder on the
server. It handles caching and thumbnails, and can present full-screen
lightboxes for the individual images. It's reasonably quick once the cache is
built.

I had no idea what to do with this at first. I could check my hosting service
(Bluehost) and verify that it was running PHP 8 (which I downgraded to 7.4 for
compatibility with novaGallery), and running Apache/2.4.58.

The documentation gives the following instructions:

* Unzip files
* Upload files on Webspace
* Copy nova-config/site.example.php to nova-config/site.php
* Change settings in nova-config/site.php
* Create folders in galleries (used as albums)
* Upload your images to the albums
* Enjoy your new beautiful photo gallery

This was a little too vague for me, a complete web hosting novice. Upload files
on Webspace? Where, exactly? Change settings ... to what? Managing my website
with Hugo made for some more questions. I figured I'd have to put the thing in
the `static/` directory, so I just plopped it in there, under a folder
`photography/`.

Nothing.

OK... maybe I'll change the config -- actually it looks like the default `url`
field was a generic option, let me change that to my website.

The page loaded! But the text was still stock, not what I'd entered into the
config. In prior updates, the server seems to present its own cache of webpages
even when I've cleared mine -- so I got into devtools and disabled cache. The
content was now updated. But the links to the thumbnails were broken, so the
images didn't load; neither did the albums if I tried to follow their links.

I kept at it and engaged Bluehost customer support. I went through the github
issues for novaGallery and found these two comments from the developer:

- [Some stuff about apache settings](https://github.com/novafacile/novagallery/issues/15#issuecomment-1229381824)
- [Installing the code in a subdirectory](https://github.com/novafacile/novagallery/issues/4#issuecomment-1023274300)

The second one was the kicker, I had to change the config from `/` to config
value `/photography/`. Well, I should have noticed it earlier because it is in
the main page of the setup docs ... that one is on me.

## Server stuff

The server cache was kinda annoying. I was told by the service rep that renaming
the `.htaccess` file would clear the cache, so I'll try that next. Bluehost
offers a lot of features (none of which I'm really using) so navigating around
the various settings was a pain. I'm wondering if I should go with something
like DigitalOcean where I can control more of the stack, but how far do I really
want to go just to make a website? This seems like a good spot for now, I just
want to get to uploading stuff.

I do have to figure out how to manage the photos outside of Hugo. If I put a lot
of photos for Hugo to handle, it takes a long time to copy them over to the
`public/` directory. I think I will have a separate process sync the photos to
the website. Additionally, I have to remember to avoid deleting the cache when
I `rsync` the photos over.
