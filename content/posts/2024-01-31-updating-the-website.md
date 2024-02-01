---
title: Updating this website
author: Alec Wong
date: '2024-01-31'
cover: 'https://gohugo.io/images/hugo-logo-wide.svg'
categories: [life]
tags: [websites, hugo, photography]
---

Finally got around to updating this dang website.

I'm using straight Hugo, built on a WSL Ubuntu, and `rsync`'d over to my website
(why is rsync on Windows so hard?). I might use quarto going forward to render
any notebooks I have. For R and python I'm using micromamba to manage
installation and environments.

Formerly I'd relied on the R package `blogdown` to create the website; however,
I felt that it abstracted just a bit _too_ much of the process away, I wanted to
be more involved in maintaining hugo settings and understanding the system a
little better. Don't get me wrong, I think for those who don't want to know
about hugo or jekyll or whatever, blogdown is a great way to get up-and-running
very quickly. I just had a terrible system for managing things that got in the
way and lowered motivation to update the website, so I wanted to simplify.

Previously, I had an R Project as the entry point for the website. I would write
my content with R Markdown documents, and those would be converted to .md, and
then hugo would convert them to HTML, all done using `blogdown::build_site()`.

Now, it's not like I'd written a lot, but it was still a bit more of a hassle
and just enough to keep me from working in the website. I also had a weird
system to get around the `rsync` issue on Windows where I had a github
repository for my hugo website, and then I had another one for my `public/`
directory that I would pull down on my web server. Really messy setup led to
lack of a desire to work on it.

---

I came back to the website this year and tried to boostrap the `renv`
environment and it just failed, erroring out on something simple like MASS or
something.

{{< code language="txt" title="renv bootstrap error" expand="Show" collapse="Hide" isCollapsed="true">}}
- Installing MASS ...                           FAILED
Error: Error installing package 'MASS':
================================

* installing *source* package 'MASS' ...
** package 'MASS' successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C compiler: 'gcc.exe (GCC) 12.2.0'
gcc  -I"C:/PROGRA~1/R/R-43~1.2/include" -DNDEBUG     -I"C:/rtools43/x86_64-w64-mi
ngw32.static.posix/include"     -O2 -Wall  -mfpmath=sse -msse2 -mstackrealign  -c
 MASS.c -o MASS.o
MASS.c:37:23: error: unknown type name 'Sint'; did you mean 'int'?
   37 | VR_sammon(double *dd, Sint *nn, Sint *kd, double *Y, Sint *niter,
      |                       ^~~~
      |                       int
MASS.c:37:33: error: unknown type name 'Sint'; did you mean 'int'?
   37 | VR_sammon(double *dd, Sint *nn, Sint *kd, double *Y, Sint *niter,
      |                                 ^~~~
      |                                 int
MASS.c:37:54: error: unknown type name 'Sint'; did you mean 'int'?
   37 | VR_sammon(double *dd, Sint *nn, Sint *kd, double *Y, Sint *niter,
      |                                                      ^~~~
      |                                                      int
MASS.c:38:27: error: unknown type name 'Sint'; did you mean 'int'?
   38 |           double *stress, Sint *trace, double *aa, double *tol)
      |                           ^~~~
      |                           int
MASS.c:168:8: error: unknown type name 'Sint'
  168 | static Sint *ord;               /* ranks of dissimilarities */
      |        ^~~~
MASS.c:169:8: error: unknown type name 'Sint'
  169 | static Sint *ord2;              /* inverse ordering (which one is rank i?
) */
      |        ^~~~
MASS.c:170:8: error: unknown type name 'Sint'
  170 | static Sint n;                  /* number of  dissimilarities */
      |        ^~~~
MASS.c:171:8: error: unknown type name 'Sint'
  171 | static Sint nr;                 /* number of data points */
      |        ^~~~
MASS.c:172:8: error: unknown type name 'Sint'
  172 | static Sint nc;                 /* # cols of  fitted configuration */
      |        ^~~~
MASS.c:181:31: error: unknown type name 'Sint'; did you mean 'int'?
  181 | VR_mds_fn(double *, double *, Sint *, double *, Sint *,
      |                               ^~~~
      |                               int
MASS.c:181:49: error: unknown type name 'Sint'; did you mean 'int'?
  181 | VR_mds_fn(double *, double *, Sint *, double *, Sint *,
      |                                                 ^~~~
      |                                                 int
MASS.c:182:21: error: unknown type name 'Sint'; did you mean 'int'?
  182 |           double *, Sint *, Sint *, double *, Sint *, double *);
      |                     ^~~~
      |                     int
MASS.c:182:29: error: unknown type name 'Sint'; did you mean 'int'?
  182 |           double *, Sint *, Sint *, double *, Sint *, double *);
      |                             ^~~~
      |                             int
MASS.c:182:47: error: unknown type name 'Sint'; did you mean 'int'?
  182 |           double *, Sint *, Sint *, double *, Sint *, double *);
      |                                               ^~~~
      |                                               int
MASS.c:188:18: error: unknown type name 'Sint'; did you mean 'int'?
  188 | VR_mds_init_data(Sint *pn, Sint *pc, Sint *pr, Sint *orde,
      |                  ^~~~
      |                  int
MASS.c:188:28: error: unknown type name 'Sint'; did you mean 'int'?
  188 | VR_mds_init_data(Sint *pn, Sint *pc, Sint *pr, Sint *orde,
      |                            ^~~~
      |                            int
MASS.c:188:38: error: unknown type name 'Sint'; did you mean 'int'?
  188 | VR_mds_init_data(Sint *pn, Sint *pc, Sint *pr, Sint *orde,
      |                                      ^~~~
      |                                      int
MASS.c:188:48: error: unknown type name 'Sint'; did you mean 'int'?
  188 | VR_mds_init_data(Sint *pn, Sint *pc, Sint *pr, Sint *orde,
      |                                                ^~~~
      |                                                int
MASS.c:189:18: error: unknown type name 'Sint'; did you mean 'int'?
  189 |                  Sint *ordee, double *xx, double *p)
      |                  ^~~~
      |                  int
MASS.c: In function 'fminfn':
MASS.c:240:5: error: unknown type name 'Sint'; did you mean 'int'?
  240 |     Sint  do_derivatives = 0;
      |     ^~~~
      |     int
MASS.c:243:5: warning: implicit declaration of function 'VR_mds_fn'; did you mean
 'VR_mds_unload'? [-Wimplicit-function-declaration]
  243 |     VR_mds_fn(y, yf, &n, &ssq, ord2, x, &nr, &nc, 0, &do_derivatives,
      |     ^~~~~~~~~
      |     VR_mds_unload
MASS.c: In function 'fmingr':
MASS.c:252:5: error: unknown type name 'Sint'; did you mean 'int'?
  252 |     Sint  do_derivatives = 1;
      |     ^~~~
      |     int
MASS.c: At top level:
MASS.c:263:26: error: unknown type name 'Sint'; did you mean 'int'?
  263 | VR_mds_dovm(double *val, Sint *maxit, Sint *trace, double *xx, double *to
l)
      |                          ^~~~
      |                          int
MASS.c:263:39: error: unknown type name 'Sint'; did you mean 'int'?
  263 | VR_mds_dovm(double *val, Sint *maxit, Sint *trace, double *xx, double *to
l)
      |                                       ^~~~
      |                                       int
MASS.c:280:34: error: unknown type name 'Sint'; did you mean 'int'?
  280 | VR_mds_fn(double *y, double *yf, Sint *pn, double *pssq, Sint *pd,
      |                                  ^~~~
      |                                  int
MASS.c:280:58: error: unknown type name 'Sint'; did you mean 'int'?
  280 | VR_mds_fn(double *y, double *yf, Sint *pn, double *pssq, Sint *pd,
      |                                                          ^~~~
      |                                                          int
MASS.c:281:22: error: unknown type name 'Sint'; did you mean 'int'?
  281 |           double *x, Sint *pr, Sint *pncol, double *der,
      |                      ^~~~
      |                      int
MASS.c:281:32: error: unknown type name 'Sint'; did you mean 'int'?
  281 |           double *x, Sint *pr, Sint *pncol, double *der,
      |                                ^~~~
      |                                int
MASS.c:282:11: error: unknown type name 'Sint'; did you mean 'int'?
  282 |           Sint *do_derivatives, double *p)
      |           ^~~~
      |           int
MASS.c:356:12: error: unknown type name 'Sint'; did you mean 'int'?
  356 | VR_ucv_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |            ^~~~
      |            int
MASS.c:356:21: error: unknown type name 'Sint'; did you mean 'int'?
  356 | VR_ucv_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                     ^~~~
      |                     int
MASS.c:356:31: error: unknown type name 'Sfloat'; did you mean 'float'?
  356 | VR_ucv_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                               ^~~~~~
      |                               float
MASS.c:356:42: error: unknown type name 'Sint'; did you mean 'int'?
  356 | VR_ucv_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                          ^~~~
      |                                          int
MASS.c:356:51: error: unknown type name 'Sfloat'; did you mean 'float'?
  356 | VR_ucv_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                                   ^~~~~~
      |                                                   float
MASS.c:356:62: error: unknown type name 'Sfloat'; did you mean 'float'?
  356 | VR_ucv_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                                              ^~~~~~
      |                                                              float
MASS.c:373:12: error: unknown type name 'Sint'; did you mean 'int'?
  373 | VR_bcv_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |            ^~~~
      |            int
MASS.c:373:21: error: unknown type name 'Sint'; did you mean 'int'?
  373 | VR_bcv_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                     ^~~~
      |                     int
MASS.c:373:31: error: unknown type name 'Sfloat'; did you mean 'float'?
  373 | VR_bcv_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                               ^~~~~~
      |                               float
MASS.c:373:42: error: unknown type name 'Sint'; did you mean 'int'?
  373 | VR_bcv_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                          ^~~~
      |                                          int
MASS.c:373:51: error: unknown type name 'Sfloat'; did you mean 'float'?
  373 | VR_bcv_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                                   ^~~~~~
      |                                                   float
MASS.c:373:62: error: unknown type name 'Sfloat'; did you mean 'float'?
  373 | VR_bcv_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                                              ^~~~~~
      |                                                              float
MASS.c:391:13: error: unknown type name 'Sint'; did you mean 'int'?
  391 | VR_phi4_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |             ^~~~
      |             int
MASS.c:391:22: error: unknown type name 'Sint'; did you mean 'int'?
  391 | VR_phi4_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                      ^~~~
      |                      int
MASS.c:391:32: error: unknown type name 'Sfloat'; did you mean 'float'?
  391 | VR_phi4_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                ^~~~~~
      |                                float
MASS.c:391:43: error: unknown type name 'Sint'; did you mean 'int'?
  391 | VR_phi4_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                           ^~~~
      |                                           int
MASS.c:391:52: error: unknown type name 'Sfloat'; did you mean 'float'?
  391 | VR_phi4_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                                    ^~~~~~
      |                                                    float
MASS.c:391:63: error: unknown type name 'Sfloat'; did you mean 'float'?
  391 | VR_phi4_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                                               ^~~~~~
      |                                                               float
MASS.c:409:13: error: unknown type name 'Sint'; did you mean 'int'?
  409 | VR_phi6_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |             ^~~~
      |             int
MASS.c:409:22: error: unknown type name 'Sint'; did you mean 'int'?
  409 | VR_phi6_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                      ^~~~
      |                      int
MASS.c:409:32: error: unknown type name 'Sfloat'; did you mean 'float'?
  409 | VR_phi6_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                ^~~~~~
      |                                float
MASS.c:409:43: error: unknown type name 'Sint'; did you mean 'int'?
  409 | VR_phi6_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                           ^~~~
      |                                           int
MASS.c:409:52: error: unknown type name 'Sfloat'; did you mean 'float'?
  409 | VR_phi6_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                                    ^~~~~~
      |                                                    float
MASS.c:409:63: error: unknown type name 'Sfloat'; did you mean 'float'?
  409 | VR_phi6_bin(Sint *n, Sint *nb, Sfloat *d, Sint *x, Sfloat *h, Sfloat *u)
      |                                                               ^~~~~~
      |                                                               float
MASS.c:428:12: error: unknown type name 'Sint'; did you mean 'int'?
  428 | VR_den_bin(Sint *n, Sint *nb, Sfloat *d, Sfloat *x, Sint *cnt)
      |            ^~~~
      |            int
MASS.c:428:21: error: unknown type name 'Sint'; did you mean 'int'?
  428 | VR_den_bin(Sint *n, Sint *nb, Sfloat *d, Sfloat *x, Sint *cnt)
      |                     ^~~~
      |                     int
MASS.c:428:31: error: unknown type name 'Sfloat'; did you mean 'float'?
  428 | VR_den_bin(Sint *n, Sint *nb, Sfloat *d, Sfloat *x, Sint *cnt)
      |                               ^~~~~~
      |                               float
MASS.c:428:42: error: unknown type name 'Sfloat'; did you mean 'float'?
  428 | VR_den_bin(Sint *n, Sint *nb, Sfloat *d, Sfloat *x, Sint *cnt)
      |                                          ^~~~~~
      |                                          float
MASS.c:428:53: error: unknown type name 'Sint'; did you mean 'int'?
  428 | VR_den_bin(Sint *n, Sint *nb, Sfloat *d, Sfloat *x, Sint *cnt)
      |                                                     ^~~~
      |                                                     int
MASS.c:466:31: error: 'VR_bcv_bin' undeclared here (not in a function)
  466 |     {"VR_bcv_bin", (DL_FUNC) &VR_bcv_bin, 6},
      |                               ^~~~~~~~~~
MASS.c:467:31: error: 'VR_den_bin' undeclared here (not in a function)
  467 |     {"VR_den_bin", (DL_FUNC) &VR_den_bin, 5},
      |                               ^~~~~~~~~~
MASS.c:468:32: error: 'VR_mds_dovm' undeclared here (not in a function); did you
mean 'VR_mds_unload'?
  468 |     {"VR_mds_dovm", (DL_FUNC) &VR_mds_dovm, 5},
      |                                ^~~~~~~~~~~
      |                                VR_mds_unload
MASS.c:469:30: error: 'VR_mds_fn' undeclared here (not in a function); did you me
an 'VR_mds_unload'?
  469 |     {"VR_mds_fn", (DL_FUNC) &VR_mds_fn, 11},
      |                              ^~~~~~~~~
      |                              VR_mds_unload
MASS.c:470:37: error: 'VR_mds_init_data' undeclared here (not in a function)
  470 |     {"VR_mds_init_data", (DL_FUNC) &VR_mds_init_data, 7},
      |                                     ^~~~~~~~~~~~~~~~
MASS.c:472:32: error: 'VR_phi4_bin' undeclared here (not in a function)
  472 |     {"VR_phi4_bin", (DL_FUNC) &VR_phi4_bin, 6},
      |                                ^~~~~~~~~~~
MASS.c:473:32: error: 'VR_phi6_bin' undeclared here (not in a function)
  473 |     {"VR_phi6_bin", (DL_FUNC) &VR_phi6_bin, 6},
      |                                ^~~~~~~~~~~
MASS.c:474:30: error: 'VR_sammon' undeclared here (not in a function)
  474 |     {"VR_sammon", (DL_FUNC) &VR_sammon, 9},
      |                              ^~~~~~~~~
MASS.c:475:31: error: 'VR_ucv_bin' undeclared here (not in a function)
  475 |     {"VR_ucv_bin", (DL_FUNC) &VR_ucv_bin, 6},
      |                               ^~~~~~~~~~
MASS.c:249:1: warning: 'fmingr' defined but not used [-Wunused-function]
  249 | fmingr(int nn, double *x, double *der, void *dummy)
      | ^~~~~~
MASS.c:237:1: warning: 'fminfn' defined but not used [-Wunused-function]
  237 | fminfn(int nn, double *x, void *dummy)
      | ^~~~~~
MASS.c:173:12: warning: 'dimx' defined but not used [-Wunused-variable]
  173 | static int dimx;                /* Size of configuration array */
      |            ^~~~
make: *** [C:/PROGRA~1/R/R-43~1.2/etc/x64/Makeconf:265: MASS.o] Error 1
ERROR: compilation failed for package 'MASS'
* removing 'C:/Users/AlecW/OneDrive/Documents/alecsalces/renv/staging/1/MASS'
install of package 'MASS' failed [error code 1]
Traceback (most recent calls last):
13: renv::restore()
12: renv_restore_run_actions(project, diff, current, lockfile, rebuild)
11: renv_install_impl(records)
10: renv_install_staged(records)
 9: renv_install_default(records)
 8: handler(package, renv_install_package(record))
 7: renv_install_package(record)
 6: withCallingHandlers(renv_install_package_impl(record), error = function(e) wr
itef("FAILED"))
 5: renv_install_package_impl(record)
 4: r_cmd_install(package, path)
 3: r_exec_error(package, output, "install", status)
 2: abort(all)
 1: stop(fallback)
{{< /code >}}

IDK man I don't write C code.

Granted, the lockfile was built using R 4.0.2 in December 2020, so there is
probably something to do with the fact I'm on R 4.3.2. Perhaps the compilers I'm
using from Rtools 43 are too new? I don't know. *Whatever*. I could never get
`renv` to restore my environments when it matters most, here or at work.

I couldn't be bothered to fix the environment as I use exactly 2 packages so far
(`ggplot2`, `dplyr`) in the one Rmd file I have. I might try groundhog or
something, I think a blog needs a script-level reproducibility solution because
packages used in the R Markdown files (or maybe quarto documents) can't all be
fixed to a single date or version over the years. It almost makes more sense to
me that each one has its own private library. Or maybe one per publication year.

*Anyway*.

I had also wanted to build my own photography gallery, but that was a wretched
abomination of HTML and javascript, where I generated a list of all the image
folders recursively _on my end_, and then slapped that in the JS script, and had
the client loop through the paths, load the `.jpg` files inside each folder, and
then display all of them. It kind of worked, actually shocked that it worked at
all. It was kinda slow because it would serve every single image at full
resolution at the same time. But it's not a really sustainable option, and I
think I need to get set up with a real content management system. Maybe learn
some PHP.

I used to take photos, edit them, and post them to tumblr or 500px or twitter.
But I wanted more ownership of the process, so I thought hey maybe I should host
them on my own website! I ended up without the motivation to see that through
for a long time. Then COVID hit and I stopped going out and taking pictures.
Between COVID and website woes, I really have lost touch with my photography
routine.

Hopefully in 2024 I can finally get back to publishing pictures!
