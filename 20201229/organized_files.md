## Project organization for reproducible data science

This post focuses on one of the most boring, but simultaneously most
important elements of being an effective data scientist: project
organization. I describe a system for maintaining project folders that
are organized, well documented, readable, and reproducible.

First, I will try to convince you that project organization is crucial
for doing good (data) science. Second, I outline a few fundamental
principles of good project organization that I believe everyone should
adhere to. Finally, I also include a toy project that shows how these
principles might be used in practice. By the end, I think you will have
an appreciation for exactly how strangely into organization I am.

![Monica from friends claiming to have won awards for her organizational
skills](https://github.com/benkeser/davidbphd_blog/blob/main/20201229/img/monica.gif?raw=true)

A disclaimer: the advice here is aimed towards projects that are
primarily

  - in the `R` programming language,
  - culminate in an `R` Markdown report,
  - are non-exploratory in nature (i.e., you have a pretty good idea
    ahead of time what analyses you will apply).

However, the principles outlined here will also apply to other
programming languages, types of projects, and exploratory data analysis
as well\!

The source code for this post is available on
[GitHub](https://github.com/benkeser/davidbphd_blog/tree/main/20201229).

## Why organize

As a tenure-track professor, I spend a fair portion of my time working
on technical manuscripts, developing software packages, and writing
grants. While these activities are all piles of fun, nothing compares to
the excitement of opening a new data set and doing *actual science*. In
all of this excitement, it is tempting to move quickly. Often, these
data sets are literally years in the making and I am eager to start
poking, prodding, and getting results\!

I want to convince you to **slow down and be deliberate** about your
approach to analyzing data. Taking time at the outset of a project to
establish organizational structure will pay off big time down the road.
Among other things, here are some benefits.

#### Ensure reproducibility of the analysis

As data scientists, we should strive for our work to be reproducible.
While there are many definitions of reproducibility (see [reading
here](https://benkeser.github.io/info550/readings/#reproducible-research)),
what *I* mean by the term is:

> Given the same raw data set as you, someone should be able to, with
> minimal effort, reproduce exactly your figures, tables, and results.

This is a *bare minimum* standard for reproducibility – it says nothing
about the validity of the experimental design, appropriateness of the
analysis, etc… However, this is the one aspect of a data analysis that
is always in the analyst’s control. It’s the least we can do to make
sure we don’t screw it up\!

#### Increase chances of “correctness”

Being deliberate about organization and coding guidelines **does not
ensure appropriateness of the analysis**. A perfectly coded,
reproducible analysis could still lead to completely inappropriate
conclusions if the methods are garbage – garbage in, garbage out, as
they say. However, being deliberate **does increase the likelihood of
correctness**.

> By slowing down and writing well-documented code, we increase the
> chance that our code is doing what we think its doing.

#### Ensure accessibility of the project

A typical applied statistician may be juggling anywhere between two and
twenty (have mercy…) different projects.

> To function effectively as a data scientist, we must be prepared to
> quickly dive back into a project at a moment’s notice after weeks or
> months away.

We want to avoid wasting our precious time reading thousands of lines of
old code or looking through dozens of output files to find what we need.
We have better things to do with our time, like decide [which Wes
Anderson color scheme](https://github.com/karthik/wesanderson) we should
use for our graphs (the correct answer is The Life Aquatic). Moreover,
life happens. We may need to drop off a project and have another analyst
step in. You will not endear yourself to your colleagues if all you
leave them is a poorly commented, 2000-line-long `R` script.

#### Increase your scientific impact

Publishing analysis code and, when possible, data alongside your work is
the best way to increase your scientific impact and contribute to the
open science movement.

> Transparent research is more trustworthy. Trustworthy research has
> more impact.

## Major principles

#### Develop your own system

The most important principle of project organization is that there is no
“correct” way to organize projects, but there are definitely incorrect
ways. I highlight a few principles that will keep you on the right track
and show a simple toy project of how I would approach project
organization. The biggest thing to remember is to develop a system and,
once it’s working well, more or less stick to it\! Remember the goal is
to organize projects in such a way that it is painless to drop back into
after months away. This will not be possible if every project is
structured differently\!

#### For good science, plan ahead

> As statisticians, the best thing we can do to ensure the validity of
> science is to fully pre-specify the entire analysis *before ever
> looking at the data*.

Have you ever been in this situation or is it just me?

A collaborator asks for a set of “pre-specified” analyses, but results
don’t quite make sense. So they ask for a few more. And a few more.
Oddly enough, you notice a correlation between magnitude of p-values and
“making sense”. You, a principled statistician, point out that we should
only trust pre-specified analyses and all other analyses should be
considered exploratory. But by now your collaborator has the JAMA logo
in their eyes and are planning a future TED talks. To placate you, they
put a sentence in the discussion about a need to validate in future
studies. You cry yourself to sleep at night, having failed in your
solemn duty as an arbiter or the scientific method.

To avoid this situation, commit to producing (and [probably
publishing](https://doi.org/10.1186/s12874-019-0879-5)) prespecified
analysis plans.

![Drake meme: prespecified statistical analysis? nope. p-hacking your
way to
JAMA](https://github.com/benkeser/davidbphd_blog/blob/main/20201229/img/drake.JPG?raw=true)

#### For better science, code ahead

In addition to having a pre-specified statistical analysis plan, we
should commit to coding up the analysis stipulated by that plan to the
greatest extent possible before we receive the real data.

How can we write code to analyze data that we don’t have yet? We work
with database managers and clinical investigators to understand the
format that the data will arrive in. We build an understanding of what
variables will be available and how they will be formatted.

> Put together a *mock data set* that is as close as possible in format
> to the real data that will eventually be analyzed.

In fact, we can often use the real data to this end. For example, we
often have access to baseline data while longitudinal data collection is
ongoing. We can use these data to develop a code bank. To maintain
objectivity, we can augment the baseline data with a simulated
exposure/treatment and a simulated outcome variable. By removing the
real exposure and/or outcome from the data, we maintain our objectivity
while building a functional code base for the analysis.

#### For best science, push a button

We should strive to be at a point where, once the real data arrives, we
are ready to plug-in the real data, push a single button, and generate
results.

> Having push-button code ready the moment the real data arrives is not
> only better for science, but will greatly endear you to your
> collaborators.

You, right now probably, halfway through a far-too-long blog post on
organizing code.

![Homer Simpson looking bored and saying “Yeah, yeah push the button,
got it.”](https://media.giphy.com/media/xT5LMQE61gpiaELZCg/giphy.gif)

#### Raw data are sacred

The raw data you receive from your collaborators should be treated as
sacred. To put it in programmatic terms, these data should be read only.
This is really a liability issue – I often do not have full control over
how the raw data are generated, but I have full responsibility for what
happens to the raw data once they’re in my possession.

> Maintaining a master copy of the raw data in perpetuity allows for
> better isolation of data processing errors.

Did the error occur upstream of me, i.e., in the generation of the raw
data, or downstream of me, i.e., in my code for cleaning the data?

#### Everything scripted

On the subject of raw data, the data you receive from collaborators will
almost certainly be a mess. It is very tempting to use simple point and
click program like Excel or RStudio to manipulate data.

Do not defile the raw data with your dark magic\!

![Helena Ravenclaw’s ghost encouraging you to not defile your raw data
with the dark magic of
Excel](https://github.com/benkeser/davidbphd_blog/blob/main/20201229/img/helena.jpg?raw=true)

From the time we receive the raw data, anything we do to manipulate that
data must be saved in a script somewhere.

> Think of your project like cooking a big meal composed of many
> different dishes. The goal is that someone, if given the same
> ingredients (raw data), recipes (code), and kitchen supplies
> (computing architecture) as you, could cook the exact same meal.

If we start cooking without our recipe – add an extra dash of salt here,
make a by-hand change to the data in Excel – these changes go
undocumented and stymie our efforts towards reproducibility. Follow the
recipe\! Code everything.

#### (Almost) everything modular

It is tempting to have a single script execute an entire analysis. For
small projects (and perhaps highly skilled `vim` users) maybe this is
OK. For the rest of us, we should strive to *modularize* almost all
\[efn\_note\]*Why almost?* There are of course exceptions to this that
arise due to practical considerations. For example, we have a small data
set from which we need to make, say ten different figures. In general, I
would encourage a separate script to make each of these 10 figures. This
would make it easier to debug one particular figure, to tweak the color
scheme, fonts, labels, etc… However, if instead your analysis is based
on an enormous data set, a serious consideration in the development of
the analysis is the time it takes to load the data. For such an
analysis, we may opt for a less modular workflow to generate the needed
figures – for example, using a single script to load the data and
produce all ten figures.\[/efn\_note\] aspects of our analysis.

Returning to the cooking metaphor above, we want to break our recipes up
into small chunks. For example, say we are making a pie. A modular
approach would be to separate the recipe for the pie’s crust from the
recipe for the pie’s filling (and to separate these recipes from all
other recipes for the meal).

Why is this modularity helpful? Well, if we bake our pie and find it
tastes bad, we can ask, “*What exactly* tastes bad? The crust? The
filling?” We can immediately pull out the recipe card for that component
and scrutinize it.

> Writing modular code allows us to scrutinize each piece of the
> analysis and to fine tune *that particular piece* in isolation.

In the toy project below, we will see in detail how this modularity can
be achieved.

#### Makefiles are your friend

As we move towards a more modular structure for code, we will quickly
find that there is a need for understanding how the pieces fit together.

![Kronk from Emperor’s New Groove saying, “It’s all coming
together”](https://media.giphy.com/media/KEYEpIngcmXlHetDqz/giphy.gif)

Returning to the cooking example, we need a meta-recipe that tells us
how everything fits together:

  - Dinner consists of a pie, a hamburger, and French fries (America\!).
      - The pie is built from a crust and filling.
          - The crust is built from these ingredients according to this
            recipe.
          - The filling is built from *these ingredients* according to
            *this* recipe.
      - The hamburger is built from …

This is the role of a [GNU Make](https://www.gnu.org/software/make/) and
an associated `Makefile`. GNU Make is a widely distributed program
originally designed for compiling software. Using this program, we write
a plain text `Makefile` that specifies dependencies between your code
and the objects it produces. This approach provides documentation for
how your project fits together and also a convenient way of building the
output of your analysis. To learn more about `make`, please see the
[slides from my
course](https://benkeser.github.io/info550/lectures/06_make/make.html).\[efn\_note\]
Alternatives to GNU Make exist including [CMake](https://cmake.org/),
[Rake](https://github.com/ruby/rake) (for Ruby projects),
[SCons](https://www.scons.org/) (for python projects), among
others.\[/efn\_note\]

#### The `here` `R` package is also your friend

One of the more (heretofore) painful elements of reproducible coding is
ensuring that all file paths that are included in your code are
*relative* to the project folder. In other words, we do not want our
code to have *absolute* file paths like `/Users/davidbenkeser/myfolder`
in my code, since

1.  You might not have a Mac, so you might need different folder
    structure (e.g., `C:/`).
2.  Even if you do, you probably don’t have a user named `davidbenkeser`
    set up on your computer.
3.  Even if you do (wait, why do you?), you probably don’t have
    `myfolder` in that user’s home directory.

What we need instead is to make sure all our paths are *relative* to the
specific project folder. That way someone can download your project
(e.g., from GitHub) and execute code in your project directory without
needing to modify every single path that appears in your code.

The best way I know of in `R` for how to achieve this is the [`here`
package](https://here.r-lib.org/). Read about it. Learn it. Love it.

![Cartoon illustration of the here package. Down one path lies evil
absolute paths. Down the other, harmonious relative
paths](https://raw.githubusercontent.com/allisonhorst/stats-illustrations/master/rstats-artwork/here.png)

#### Separate analysis from reporting

R Markdown is a great program for integrating code and output, but it’s
also easy to abuse. It is so easy to use that it is tempting to write
lots of bad code interwoven into a report. For large projects such
report documents can easily run into the thousands of lines. Such
documents *are* reproducible, but they *are not* accessible. For this
reason, I encourage using `R` scripts to generate results that are then
placed into the `Rmd` document.

> The `Rmd` document should contain the bare minimum amount of code
> necessary to produce the desired report. If a code chunk is longer
> than 5-7 lines, it should be in a separate script, **not** the `Rmd`
> file.

I have several reasons for preferring this approach:

  - You are *modularizing* the report-writing element of the project.
    The written report is now much more readable by removing code
    chunks.
  - It is faster to make many small tweaks (e.g., modifying elements of
    a figure) to one particular `R` script than it is to make many small
    tweaks in an `Rmd` document, since the latter requires re-compiling
    the whole document with each tweak.
  - The `Makefile` approach is a more deliberate system for caching
    results than that adopted by R Markdown.

## Toy project

You can download the [toy project from my
GitHub](https://raw.githubusercontent.com/benkeser/davidbphd_blog/main/20201229/toy_project.zip).
The final product of this project is an html report created based on an
R Markdown document. The report gives summary statistics of the data and
shows two simple figures. The data and reported results are
intentionally simplistic. The idea is to illustrate how one might
structure an analysis in a way that satisfies the goals outlined above.

The contents of the project directory are shown below.

    toy_project
    ├── .here
    ├── Makefile
    ├── clean_data
    ├── code
    │   ├── good_round.R
    │   ├── make_clean_data.R
    │   ├── make_fig1.R
    │   ├── make_fig2.R
    │   ├── make_report.R
    │   ├── make_summary_stats.R
    │   └── report.Rmd
    ├── figs
    ├── output
    └── raw_data
        ├── biomarkers.txt
        └── clinical.txt
    
    5 directories, 11 files

  - `Makefile` describes all the dependencies of output created in my
    analysis.
  - `code` is a directory containing all of my scripts needed for the
    analysis.
  - `raw_data` is a directory containing two small data sets that need
    to be merged for the analysis.
  - `.here` is an empty file that is used by the [`here`
    package](https://here.r-lib.org/) to set the root project directory.
  - `clean_data`, `figs`, `output` are empty directories that will
    contain output of my analysis.

#### Examining the `Makefile`

We can start our orientation to the project by looking at the
`Makefile`. Again, if you are not familiar with `make`, please [review
my slides
here](https://benkeser.github.io/info550/lectures/06_make/make.html). By
convention the first rule in a `Makefile` is one that builds the final
product. From the command line if we simply type `make` and hit Return
the final product will compile.

We’ll orient ourselves to this project by starting at the end – we want
to understand all of the components of the final report, before diving
into the specifics of how those components are made. Here is the `make`
rule for building the
    report.

    ## report                    : compiles the final report in output/report.html
    report: code/report.Rmd \
      output/summ_stats.RData \
      figs/fig1.png figs/fig2.png
        cd code && Rscript make_report.R

We see that the `report` depends on the source file `code/report.Rmd` as
well as some files in the `output` folder that have not yet been
created. Looking further down the `Makefile`, we see that these files
have their own `make` rules. The rule to `make` the `report` itself,
stipulates changing into the `code` directory\[efn\_note\]This step is
needed because R Markdown apparently likes to render documents in an R
session with working directory set to the the directory where the `.Rmd`
file lives.\[/efn\_note\] and executing the `make_report.R` script,
shown below.

    rmarkdown::render(
      "report.Rmd", output_file = here::here("output", "report.html")
    )

Nothing too complicated happening here – just rendering the document
using a call to the
[`render`](https://rmarkdown.rstudio.com/docs/reference/render.html)
function from the [`rmarkdown`](https://rmarkdown.rstudio.com/) package.
We see the utility of the `here` package, where we are using a call to
the `here` function to specify the save directory relative to the
project’s root directory, i.e., the directory that contains the `.here`
file.

Before diving into the guts of the project, let’s pause to comment on
the `Makefile`.

  - The dependencies for `report` (files appearing after `:`) are broken
    onto multiple lines using the escape character `\`.
  - The character `#` is used for comments in `Makefiles`.
  - The character `##` for a special purpose.
      - For each rule, I include a short description of what that rule
        does or the file it creates.
      - I include a `make help` rule that prints out lines that start
        with `##`.
      - Type `make help` at the command line and see the result\!

#### Examining the report

The contents of the report are shown below.

    ---
    title: "Biomarker Analysis"
    output: html_document
    ---
    
    ```{r, setup, include = FALSE}
    library(here)
    load(here("output", "summ_stats.RData"))
    ```
    
    # Results
    
    There were `r summ_stats$n` observations included. There were 
    `r summ_stats$n_female` females and the average age of participants 
    was `r summ_stats$mean_age`. Summary plots are shown below. 
    
    ```{r, figure-1, echo = FALSE}
    knitr::include_graphics(here("figs", "fig1.png"))
    ```
    
    ```{r, figure-2, echo = FALSE}
    knitr::include_graphics(here("figs", "fig2.png"))
    ```

The report is intentionally simplistic: it shows some in-line results
and two figures. The figures are placed in the document using the
[`include_graphics`](https://www.rdocumentation.org/packages/knitr/versions/1.30/topics/include_graphics)
function from the [`knitr`](https://yihui.org/knitr/) package.

> The contents of the report are easy to digest because we have
> separated our analysis from the report itself.

#### Creating clean data

The “data” for this example consist of two files and are meant to mimic
what a simple cleaning operation could look like and how it can be
folded into a reproducible workflow. For the definitive work on how to
process and clean data, see Hadley Wickham’s [paper on tidy
data](https://www.jstatsoft.org/article/view/v059i10).

In the `data` folder, we have `biomarkers.txt`:

    id biom1 biom2
    1 -0.319 0.274
    2 0.486 0.048
    3 -0.293 -0.662
    4 -0.576 -2.205
    5 -0.497 -0.955
    6 2.879 0.62
    7 0.494 1.28
    8 0.246 -0.055
    9 -2.149 -1.925
    10 1.244 -1.772

We also have `clinical.txt`.

    id age sexf
    1 49 1
    2 29 1
    3 68 1
    4 50 0
    5 21 0
    6 57 1
    7 28 0
    8 66 0
    9 41 1
    10 69 0

The goal of “cleaning” these data is to merge them into a single file
and save it. That is what is accomplished by `code/make_clean_data.R`.

    # merges clinical and biomarkers data set
    # saves clean_data/clean_data.txt
    
    data_clin <- read.table(
      here::here("raw_data", "clinical.txt"), header = TRUE
    )
    data_biom <- read.table(
      here::here("raw_data", "biomarkers.txt"), header = TRUE
    )
    data_merge <- merge(data_clin, data_biom)
    
    write.table(
      data_merge, here::here("clean_data", "clean_data.txt")
    )

The second rule in `Makefile` specifies a rule for creating the clean
data set.

    ## clean_data/clean_data.txt : two raw data sets merged
    clean_data/clean_data.txt: code/make_clean_data.R \
      raw_data/biomarkers.txt raw_data/clinical.txt
        Rscript code/make_clean_data.R

As expected, based on `code/make_clean_data.R` shown above, the cleaned
data set will be stored in a file `clean_data/clean_data.txt`. The
creation of this file depends on this `R` script, as well as both raw
data files.

#### Obtaining summary statistics

In order to keep the `report.Rmd` clean, summary statistics needed for
the report are computed and a `list` containing those statistics is
saved in `output` by `code/make_summary_stats.R` script.

    # get summary statistics needed for the report
    # saves file output/summ_stats.RData
    
    # source in a rounding function
    source(here::here("code", "good_round.R"))
    
    data_merge <- read.table(
      here::here("clean_data", "clean_data.txt"), 
      header = TRUE
    )
    
    n <- nrow(data_merge)
    n_female <- sum(data_merge$sexf)
    mean_age <- good_round(mean(data_merge$age))
    
    summ_stats <- list(
      n = n, 
      n_female = n_female,
      mean_age = mean_age
    )
    
    save(
      summ_stats, file = here::here("output", "summ_stats.RData")
    )

The `output/summ_stats.RData` object is `load`’ed into `R` by
`report.Rmd` to obtain the in-line-referenced summary statistics. Note
that the `R` script sources in the contents of `code/good_round.R`. I
will leave it to the reader to explore the contents of that file. This
step is included in this tutorial to mimic how one might bring in more
general outside functions.\[efn\_note\] Power users should consider the
benefits of including a project-specific `R` package to formalize the
documentation of such functions. You can see in `code/good_round.R` I am
including [`roxygen2`](https://roxygen2.r-lib.org/)-style documentation,
anticipating that this function may eventually be moved into a
package.\[/efn\_note\]

A rule is given for making the `summ_stats`
    object.

    ## output/summ_stats.txt     : summary statistics reported in text of report
    output/summ_stats.RData: code/make_summary_stats.R \
      code/good_round.R \
      clean_data/clean_data.txt
        Rscript code/make_summary_stats.R

#### Making figures

Similarly, we clean data in hand, we can `make` the figures needed by
the report. The first figure is a simple scatter plot created by
`code/make_fig1.R`

    # make a two-panel scatter plot of biomarker by age and sex
    
    data_merge <- read.table(here::here("clean_data", "clean_data.txt"), 
                             header = TRUE)
    
    png(here::here("figs", "fig1.png"))
    layout(t(1:2))
    plot(y = data_merge$biom1, x = data_merge$age,
         xlab = "Age", ylab = "Biomarker 1",
         col = data_merge$sexf + 1, pch = 19)
    legend(title = "Sex", col = c(1, 2), 
           legend = c("Male", "Female"),
           pch = 19,
           x = "topleft")
    plot(y = data_merge$biom2, x = data_merge$age,
         xlab = "Age", ylab = "Biomarker 2",
         col = data_merge$sexf + 1, pch = 19)
    dev.off()

The `make` rule should look familiar by
    now.

    ## figs/fig1.png             : scatter plot of biomarker 1 vs. biomarker
    figs/fig1.png: code/make_fig1.R clean_data/clean_data.txt
        Rscript code/make_fig1.R

I leave it to the reader to check out how `figs/fig2.png` is constructed
(hint: pretty much the same as `fig1`). I also leave it to you to check
the `Makefile` for specifying a
([`PHONY`](https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html))
rule for making all `figs` with a single command.

## Wrapping up

I hope this has done something to convince you that being organized is
worth climbing learning curve for some of these approaches.

I would be glad to hear from you with your own tips and tricks for
organization. Leave a comment below or give me a shout on Twitter
[@biosbenk](https://twitter.com/biosbenk).

Wishing all of you the best of luck in all your future reproducible
endeavors.
