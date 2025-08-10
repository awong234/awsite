---
title: "RSS is working"
author: Alec Wong
cover: 'rss-icon-1.png'
date: '2025-02-19'
categories: [life]
tags: [websites, technology]
---

At the advice of [Corey Doctorow](https://pluralistic.net/2024/10/16/keep-it-really-simple-stupid/)
I've gotten an RSS reader for myself and subscribed to a bunch of blogs. It's
refreshingly simple and good-feeling heritage tech, when tech was for the
people.

I fixed this website's parameters to make the RSS work properly (or, at least,
as far as I can tell). I'm using a preconfigured theme; digging into the code
that forms the `index.xml` file I saw that the placeholder (is it called a
shortcode? a method? I'm not sure) was `{{ .Permalink }}`, but it was resolving
to `/`; not helpful on the wider web. The solution was to change the baseURL to
my domain name explicitly, and create permalink templates in the configuration.

Next I am debating whether I want the whole thing published, or just the
summary. I think I'll modify the layout so that the rss feed publishes the whole
story.
