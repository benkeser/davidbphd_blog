Introduction {#introduction}
------------

The goal of this post is to present a system for maintaining project
folders that are organized, well documented, readable, and reproducible.
We go over motivation for the structure, some fundamental principles of
organization that we believe everyone should adhere to, a few software
tools that make things easier, and wrap it all up with an example
project that shows how all of this might work in practice.

The tutorial focuses on data analysis/coding projects that are primarily

-   in the `R` programming language,
-   culminate in an `R` Markdown report,
-   are non-exploratory in nature (i.e., you have a pretty good idea
    ahead of time what analyses you will apply).

However, the principles outline here generally will also apply to other
programming languages, types of projects, and exploratory data analysis
as well!

The source code for this post is available on
[GitHub](https://github.com/benkeser/davidbphd_blog/20201229).

Why organize {#why-organize}
------------

I am generally very excited to get my hands on a new data set. As a
tenure-track professor, I spend a fair portion of my time these days
writing technical manuscripts, developing software packages, and grant
writing. While these activities are all good fun, for me, nothing
compares to the excitement of opening a new data set and doing *actual
science*. In all of this excitement, it is tempting to move quickly.
Often, these data sets are literally years in the making and I am eager
to start poking and prodding, cleaning, analyzing, and getting results!

The point of this post is to convince you that it is beneficial to
**slow down** and be deliberate about your approach to analyzing data.
It is important to take time at the outset of the project to put an
organizational structure in place and to outline some rules for
generating scripts to analyze the data. I see the following benefits of
adhering to these guidelines.

#### Ensure reproducibility of the analysis {#ensure-reproducibility-of-the-analysis}

As data scientists, we should strive for our work to be reproducible.
While there are many definitions of reproducibility (see reading
[here](https://benkeser.github.io/info550/readings/#reproducible-research))
what *I* mean by the term is:

> Given the same raw data set that you analyzed, someone should be able
> to, with minimal to no effort, produce exactly the same set of
> figures, tables, and results.

This is really a bare minimum standard for reproducibility, as it says
absolutely nothing about the validity of the experimental design, the
appropriateness of the analytic methods, etc… However, this is the one
aspect of a data analysis that is always in our control as an analyst.
It’s the least we can do for our collaborators to make sure we don’t
screw it up!

#### Increase chances of “correctness” {#increase-chances-of-correctness}

Being deliberate about organization and coding guidelines **does not
ensure appropriateness of the analysis**. A perfectly coded,
reproducible analysis could still lead to completely inappropriate
conclusions if the methods are garbage – garbage in, garbage out, as
they say. However, being deliberate **does increase the likelihood of
correctness**. That is, by slowing down and writing well-documented
code, we do increase the chances that our code is doing what we think
its doing. In other words, we decrease the chances of silly mistakes –
errant data cleaning, incorrect model specifications, etc…

#### Ensure accessibility of the project {#ensure-accessibility-of-the-project}

A typical applied statistician will, at any point in time, be juggling
anywhere between two and twenty (have mercy…) different projects.

> To function effectively as a data scientist, we must be prepared to
> quickly dive back into a project at a moment’s notice.

We want to avoid wasting our precious time reading thousands of lines of
old code or looking through dozens of output files to find what we need.
We have better things to do with our time, like decide [which Wes
Anderson color scheme](https://github.com/karthik/wesanderson) we should
use for our graphs. Moreover, life happens. We may need to drop off a
project and have another analyst step in. You will not endear yourself
to your colleagues if all you leave them is a poorly commented,
2000-line-long `R` script.

#### Increase your scientific impact {#increase-your-scientific-impact}

Publishing analysis code and, when possible, data alongside your work is
the best way to increase your scientific impact and contribute to the
open science movement. &gt; Transparent research is more trustworthy.
Trustworthy research has more impact.

Major principles {#major-principles}
----------------

#### Develop your own system {#develop-your-own-system}

The first major principle on project organization is that there is no
“correct” way to organize projects. But there are definitely incorrect
ways! I will highlight here a few principles that will keep you on the
right track and show a simple example project of how I would approach
project organization. The biggest thing to remember is to develop a
system and, once it’s working well, stick to it! Remember the goal is to
organize projects in such a way that it is absolutely painless to drop
back into the project after weeks or months away. This will not be
possible if every project is structured differently!

#### For better science, plan ahead {#for-better-science-plan-ahead}

Raise your hand if you’ve been in this situation. A collaborator asks
for a set of “pre-specified” analyses (e.g., fit a set of regressions),
but results don’t quite make sense to the collaborator. So they ask for
a few more (e.g., include these interactions). All of a sudden the
results “make more sense”. Oddly enough, you notice a correlation
between magnitude of p-values and “making sense”. You, the principled
statistician that you are, point out that really we should only trust
the pre-specified analyses and that all other analyses should be labeled
exploratory. But by now your collaborator is seeing NEJM and JAMA logos
floating around their head and are envisioning their future TED talks.
The non-pre-specified models make in the manuscript. A throwaway
sentence in the discussion is added about “needing to validate results
in future studies”. You cry yourself at night, having failed in your
solemn duty as a statistician to protect the integrity of science.

A bit exaggerated, sure. But I have certainly had enough experiences as
a lowly data analyst to understand that this is too close to reality for
comfort. &gt; As statisticians, the best thing we can do to ensure the
validity of science is to fully automate the entire analysis *before
ever looking at the data*.

We should insist on having a pre-specified statistical analysis plan and
commit to coding up the methods and reporting in that plan to the
greatest extent possible before we ever receive the real data.

How can we write code to analyze data that we don’t have yet? We can
work with our database managers and clinical investigators to understand
the format that the data will arrive in. We build an understanding of
what variables will be available and how they will be formatted. We put
together a *mock data set* that is as close as possible in format to the
real data we will eventually analyze. In fact, we can often use the real
data to this end. If analyses rely on baseline data, we can often use
the real baseline data set, augmented with a simulated
exposure/treatment and a simulated outcome variable. By removing the
real exposure and/or outcome from the data, we maintain our objectivity
while building the code base for the analysis.

We should strive to be at a point where, once the real data arrives, we
are ready to plug-in the real data, push a single button, and generate
results. &gt; Having push-button code ready the moment the real data
arrives is not only better for science, but will greatly endear you to
your collaborators.

#### Raw data are sacred {#raw-data-are-sacred}

The raw data you receive from your collaborators should be treated as
sacred. To put it in programmatic terms, these data should be **read
only**. To me, this is really a liability issue – I often do not have
full control over how the raw data are generated, but I have full
responsibility for what happens to the raw data once they’re in my
possession. Maintaining a master copy of the raw data I was given in
perpetuity allows for better isolation of data processing errors. Did
the error occur upstream of me, i.e., in the generation of the raw data,
or downstream of me, i.e., in my code for cleaning the data?

#### Everything scripted {#everything-scripted}

On the subject of raw data, the data you receive from collaborators will
almost certainly be a mess. It is very tempting to use simple point and
click graphical user interfaces (GUIS, e.g., excel or RStudio data
editor) to manipulate data. Do not defile the raw data with your dark
magic (bonus points if you get the Harry Potter reference).

From the time we receive the raw data, anything we do to manipulate that
data must be saved in a script somewhere. &gt; Think of your project
like cooking a big meal composed of many different dishes. The goal is
that someone, if given the same ingredients (raw data), recipes (code),
and kitchen supplies (computing architecture) as you, could cook the
exact same meal.

If we start cooking without our recipe – add an extra dash of salt here,
make a by-hand change to the data in Excel – these changes go
undocumented and stymie our efforts towards reproducibility. Follow the
recipe! Code everything.

#### (Almost) everything modular {#almost-everything-modular}

It is tempting to have a single script execute an entire analysis. For
very small projects or for people who are very quick at searching
through files (looking at all the `vim` power users of the world) maybe
this is OK. For the rest of us, we should strive to *modularize* our
analysis.

Returning to the cooking metaphor above, we want to break our recipes up
into small chunks. For example, say we are making a pie. A modular
approach would be to separate the recipe for the pie’s crust from the
recipe for the pie’s filling (and to separate these recipes from all
other recipes for the meal). Why is this modularity helpful? Well, if we
bake our pie and find it tastes bad, we can ask, *what exactly* tastes
bad? The crust? The filling? We can immediately pull out the recipe card
for that component and scrutinize it. &gt; Writing modular code allows
us to scrutinize each piece of the analysis and to fine tune *just that
particular piece* in isolation.

In the example project below, we will see in detail how this modularity
can be achieved.

*Why almost?* There are of course exceptions to this that arise due to
practical considerations. For example, we have a small data set from
which we need to make, say ten different figures. In general, I would
encourage a separate script to make each of these 10 figures. This would
make it easier to debug one particular figure, to tweak the color
scheme, fonts, labels, etc… However, if instead your analysis is based
on an enormous data set, a serious consideration in the development of
the analysis is the time it takes to load the data. For such an
analysis, we may opt for a less modular workflow to generate the needed
figures – for example, using a single script to load the data and
produce all ten figures.

#### Makefiles are your friend {#makefiles-are-your-friend}

As we move towards a more modular structure for code, we will quickly
find that there is a need for understanding how all of the pieces fit
together. Returning to the cooking example, we need a meta-recipe that
tells us how everything fits together: \* Dinner consists of a pie, a
hamburger, and French fries (America!). \* The pie is built from a crust
and filling. \* The crust is built from these ingredients according to
this pie crust recipe. \* The filling is built from these ingredients
according to this \* The hamburger is built from …

This is the role of a `Makefile` and [GNU
Make](https://www.gnu.org/software/make/). This is a plain text file
that specifies dependencies between your code and the objects it
produces. To learn more about `make`, please see the [slides from my
course](https://benkeser.github.io/info550/lectures/06_make/make.html).

#### The `here` `R` package is also your friend {#the-here-r-package-is-also-your-friend}

One of the more painful elements of reproducible coding is ensuring that
all file paths that are included in your code are *relative* to the
project folder. In other words, we do not want our code to have
*absolute* file paths like `/Users/davidbenkeser/myfolder` in my code,
since (i) you might not have a Mac, so you might need different folder
structure (e.g., `C:/`), (ii) even if you do, you probably don’t have a
user named `davidbenkeser` set up on your computer, (iii) even if you do
(wait, why do you?), you probably don’t have `myfolder` in that users
home directory.

What we need instead is to make sure all our paths are *relative* to the
specific project folder. That way someone can download your project
(e.g., from GitHub) and execute code in your project directory without
needing to modify every single path that appears in your code.

The best way I know of in `R` for how to achieve this is the `here`
package.

![alt](https://raw.githubusercontent.com/allisonhorst/stats-illustrations/master/rstats-artwork/here.png)

#### Separate analysis from reporting {#separate-analysis-from-reporting}

Example project {#example-project}
---------------
