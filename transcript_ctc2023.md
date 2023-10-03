## Draft transcript

1. As an applied statistician, I spend a lot of time cleaning data,
   and I think many of you do as well.
   But have any of us had formal training in data cleaning?
   Some say that's because it is difficult to generalize.

2. Hadley Wickham wrote, "Tidy data are all alike, but every messy
   dataset is messy in its own way." Now, he was talking about data
   structure rather than cleaning...

   But _is_ every messy dataset _uniquely_ messy?

   My collaborators do show impressive creativity in their
   data handling. But we also see many of the same problems,
   repeatedly.

3. Roger Peng asked "If I clean up Medicare data, does any of the
   knowledge I gain apply to the processing of RNA-seq data?"

   My response is: **absolutely**!

   The context certainly matters, but cleaning one dataset provides
   really useful experience for the next one, even it's from
   a completely different field.

4. One of the best things to happen in the pandemic was Data Mishaps
   Night. 16 people gave 5 min talks about mistakes they'd made with
   data. Many concerned data cleaning, and I felt a great closeness
   to the community through our shared experience and struggles with
   data.

   We may actually share more in common in our data cleaning efforts than in the rest of our work.

5. I think data cleaning is not taught because it's tedious, the
   results are often embarrassing, it needs the context, and it often
   doesn't feel like progress.

   I mean, how many students will be excited to sign up for a
   course in _data cleaning_?

   But data cleaning also requires great creativity and our most
   advanced programming skills. And it can have a huge effect on
   the results.

6. I think there _are_ principles that underlie our data
   cleaning work, and I'd like to propose a set.
   I've split them up into 5 parts: some fundamental ideas, plus
   the four main concepts: verify, explore, ask, and document.

7. The first fundamental principle is:
   don't clean data when you're tired or hungry.
   Ghazal Gulati said this at the Data Mishaps Night, and it's right on.
   Data cleaning takes time and intense concentration, so grab a
   snickers and a cup of coffee before you begin.

8. Second, don't trust anyone, even yourself. Maybe a person you respect
   compiled the data; maybe it was you three months ago. Still, you
   should double-check.

   Jenny Bryan once tweeted "my motto is trust no one except maybe
   kwbroman", which may be the nicest thing anyone has said about me.
   But still, don't trust him either.

9. The central principle for me is: think about what might have gone
   wrong and how it might be revealed.

   The illustration here is of the most dramatic data cleaning success
   I've had: a genetics study with almost 20% sample mix-ups. The DNA
   samples were arranged in 8x12 grids; a dot here indicates the
   correct sample was placed in the correct spot. An arrow points from
   where a sample should have been to where it actually ended up.
   There are some distant sample swaps, plus a big series of
   off-by-one and off-by-two errors.

   I came to identify these sample mix-ups by following this basic
   principle: think about what might have gone wrong and how it might
   be revealed.

10. Fourth, use care when merging data sets. Many problems are due to
    mistakes in merging files. Here, the order of the
    columns have changed. (And note that it's best to focus on
    labels rather than position.)

11. Fifth, dates and categories suck. Much of your efforts will be
    focused on fixing typos and inconsistencies in dates and
    categorical variables.

    I imagine you're thinking: how is that a principle?
    I was thinking the same thing: what exactly is a
    principle?

12. My working definition of a principle is that it's a fundamental
    truth that guides our thinking.

13. And so "Dates and categories suck". Yeah, that counts as a
    principle.

    Dates and categories suck, and just be glad if you're not working
    with time zones.

14. Moving to the next category: "Verify" that all of things
    that are supposed to be true about the data are
    indeed true. First, check that things that are supposed to be
    distinct really are distinct. For example, if you have a column of
    sample identifiers, are there any duplicates? In this example, I
    found a pair of samples with the same ID; one was a typo.

15. Next, check that things that are supposed to match actually do
    match. For example, if the same data appear in
    multiple files, are they actually the same in all of the files?
    Here, one sample had 22 for "number of generations" in one file
    but 21 in a different file.

16. Next, check any calculations. For example, HOMA_IR is the ratio
    of serum glucose to insulin. And so we can re-calculate it and
    compare it to what's provided. This is useful both to check for
    errors and to check our understanding of the calculation.

    The results look the same, but note that I've separated out missing
    values, and there are some values that are missing but maybe shouldn't
    be.

    When you're looking for differences, it's good to plot the
    differences directly.
    They look like just rounding errors, but note that
    there's a group of values that have been rounded more
    coarsely. (This often looks like a copy-paste action.) Also,
    there's a group of values that are all missing, which are maybe
    the ones where the derived value was missing but shouldn't
    have been.

17. Finally (for this section) when you find a problem be sure to look
    for other instances of that problem. This is just like debugging
    software: if you find a bug, look to see if you've made the same
    mistake elsewhere.

18. Having verified the things that were supposed to be true about the
    data, you now move to a more broad exploration of the data for
    potential problems.

    A key principle is to make lots of plots.

    Plot things against time or index, which can show batch effects.

    Make scatterplots, which can help to identify outliers. For
    example one mouse gained a lot of weight and another mouse lost a
    lot of weight; turns out they were right next to each other in the
    file and the data got transposed.

    Outliers are the main thing to look for: here a group of values
    were recorded in grams rather than milligrams. There are some odd
    batch effects here too.

19. It can be particularly useful to look at the pattern of missing
    data. The R package {visdat} includes a heatmap of where the
    missing values are, and the package {naniar} can make scatterplots
    that highlight rather than omit the missing values.

20. With massive datasets, you should be making more plots rather than
    fewer.

    There's a tendency to say "I can't look at 500 histograms, so I'll
    look at none." But you actually _can_ look at 500 histograms. You
    can put 25 or 50 on a page (ideally, sorted on some feature) and
    flip through a long PDF, or you can superimpose 500 density
    estimates.

    It can be helpful to highlight a portion, like those that are most
    variable.

    I also like to make a scatterplot of a couple of summary
    statistics, like the SD versus the mean, or here the
    inter-quartile range versus the median. This indicates a cluster
    of samples that are unusual.

    It's also worthwhile to rethink our standard plots. This is the
    equivalent of 500 box plots, but going farther down in the tails
    of the distributions. The 500 samples have been sorted to have
    decreasing median, and the lines connect quantiles: median,
    25th and 75th percentiles, 10th and 90th, 5th and 95th, 1st and
    99th. This shows that while the bulk of distributions on are
    symmetric about 0, the first 120 or so samples have elevated
    median and long lower tail.

21. And a fundamental principle here is to follow up all artifacts
    that you see.

    This is a heat map of a correlation matrix, with questionable
    color choices and an odd plaid pattern. If you see this sort
    of abomination, you should figure out what's going on.

22. I'm running out of time, so I'll breeze through the final two
    groups of principles.

    Don't be afraid to ask questions. And ask for the primary data.
    And ask for metadata (like, what the heck are these data?)
    And above all, ask about the missing data: why are they missing,
    how should they be treated, and do they indicate problems or
    introduce bias?

23. Finally, document what you've done: create checklists and
    pipelines that capture what you've learned. And your work needs to
    be more than just reproducible, you need to capture not just
    _what_ you did but _why_ you did it.
    And data cleaning is not just step in the analysis
    but a continual process that you'll need to
    return to as you dig deeper into the data.

24. So these are my suggestions for 20 data cleaning principles.
    Some fundamental ideas, like "trust no one", and then verify,
    explore, ask, and document.

25. Allison Reichel tweeted "I will let the data speak for itself when
    it cleans itself." Reading that always brings me a jolt of joy.

    Data cleaning will always be a big part of our work.

26. Thanks for having me! Here's where you can find these slides,
    and me.
