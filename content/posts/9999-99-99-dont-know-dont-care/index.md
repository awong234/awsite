---
title: Three dimensions of AI usage
author: Alec Wong
draft: true
categories: [life]
tags: [ai]
---

I've come to believe there are three motivations for using AI:

1. I don't know how do it
2. I don't care to know how to do it
3. I don't have time to do it

I think most people might rationalize their usage as falling into category 3,
and I think most people are not wrong. A business, given with the option of a
worker completing a task in 30 minutes versus 7 minutes will undoubtedly do what
they need to do to accomplish the 7-minute task. I'm in this category.

But I also care about what I know how to do, which makes it extremely
uncomfortable to use AI for my work.

I've dabbled in front-end development. It started with learning the R Shiny
web-app framework. I've tried to learn the D3 data visualization framework to
make my visualizations more interactive and impactful (but I failed to really
grok it each time). Before becoming a data scientist I made an effort to learn
python packaging and more front-end work by making a Flask-based productivity
tracker for myself authored in markdown. Obviously I maintain this website.

I would say I had enough experience to tackle my current task at work, which is
to make a web application for non-technical clients to devise their own natural
language prompts to extract data from PDFs. It is a simple application:

1. Upload some test PDFs.
1. Offer some fields for the user to write prompts.
1. Execute prompt-based extraction on the PDFs.
1. Compare against some groundtruth that the client produces.

I created a specification that was within my abilities to reason about -- pure
HTML wherever possible, jinja templating, no JavaScript (based on my D3
experiences I am just not great at understanding JS), FastAPI python back-end. I
wrote the specification up-front and iterated with Copilot's Plan mode.

The result was some 11K lines of code that _just worked_. Minor back-and-forth
on UX but it _worked_, flawlessly. This is a day's worth of work (most of it
spent waiting) that would have taken me maybe a month to put together myself
(including time refreshing my memory on front-end work).

Here's an example of something trivial enough that I could say I know how to do
it, and I care to know how to do it (based on my previous attempts at learning
web development). But what business would afford the time to do it the old way?
Increasingly "I don't have time to do it" becomes a self-fulfilling prophecy. We
clearly had time to a lot of things "the old way" before; now we don't for fears
of being outcompeted.

