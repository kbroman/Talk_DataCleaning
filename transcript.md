## Draft transcript

1. Data analysts spend a lot of time cleaning data, but few of us have
   had any formal training. Why is that? Some say the process is
   difficult to generalize.

2. Hadley Wickham said "Tidy data are all alike, but every messy
   dataset is messy in its own way." He was talking about data
   structure rather than cleaning...that if data are in a consistent
   format, it simplifies all of the work downstream.

   But is every messy dataset uniquely messy?

   It's true that my collaborators show impressive creativity in their
   data handling processes. But we do all see many of the same kinds
   of problems, repeatedly.

3. In his discussion of David Donoho's paper about data science, Roger
   Peng asked "If I clean up Medicare data, does any of the knowledge
   I gain apply to the processing of RNA-seq data?"

   My response is: **absolutely**!

   The context certainly matters, but cleaning one dataset provides
   useful experience when confronted with the next one, even it's from
   a completely different discipline.

4. One of the best things to happen in the pandemic was Data Mishaps
   Night. 16 people gave 5 min talks about mistakes they'd made with
   data. Many concerned data cleaning, and I think we all felt a great
   closeness through our shared experience and struggles with data.

5. I think we're not teaching data cleaning because it's tedious, the
   results are often embarrassing, it needs context, and it often doesn't
   feel like progress.

   I mean, how many students are going to be excited to sign up for a
   course in data cleaning?

   But data cleaning also requires great creativity, our most advanced
   programming skills. And it's the source of most problems.

6. And so I'd like to propose a set of principles for data cleaning.
   I've split them up into 5 parts: some fundamental ideas, plus
   the four main pieces: verify, explore, ask, and document.

7. So let's start with some fundamental principles, and the first is
   don't clean data when you're tired or hungry.
   Ghazal Gulati said this at the Data Mishaps Night, and it's so true.
   Data cleaning takes time and intense concentration, so grab a
   snickers and a coffee before you begin.

8. Second, don't trust anyone, even yourself. Maybe you respect
   compiled the data; maybe it was you three months ago. Still, you
   should double-check.

   Jenny Bryan once tweeted "my motto is trust no one except maybe
   kwbroman", which may be the nicest thing anyone has said about me.
   But still, don't trust him either.

9. The central principle for me is: think about what might have gone
   wrong and how it might be revealed.

   The illustration here is of the most dramatic data cleaning success
   I've had: a genetics study with almost 20% sample mix-ups. The DNA
   samples were arrayed in 8x12 plates; a dot here indicates the
   correct sample was placed in the correct spot. An arrow points from
   where a sample should have been to where it actually ended up.
   There are some distant sample swaps, plus a big series of
   off-by-one and off-by-two errors.

   I came to this understanding of the sample mix-ups by first
   thinking about what might have been and how it might be revealed.

10. Fourth, use care when merging data sets. Many problems are due to
    mistakes in merging files. For example, here the order of the
    columns have been swapped. (Note that it's best to focus on the
    labels rather than position, because changes in column orders are
    common.)

11. Fifth, dates and categories suck. Much of your efforts will be
    focused on fixing typos and inconsistencies in dates and
    categorical variables.

    I know what you're thinking: how is that a principle? We're all
    really in tune here, and I was thinking the same thing: what is a
    principle? Are these principles or just random stuff related to
    data cleaning?

12. My working definition of principle is that it's a fundamental
    truth that guides our thinking. That seems reasonable.

13. And so "Dates and categories suck". Yeah, that's true, and it can
    guide our thinking, so I think it's okay to view it as a
    principle.

    Dates and categories suck, and just be glad if you're not working
    with time zones.

14. Let's move to the next category of principles: "Verify". You first
    want to verify that the distinct things are distinct. For example,
    if you have a column of sample identifiers, are there any
    duplicates? In this example, I found a pair of samples with the
    sample ID but different other data.

15. Next, check that things that are supposed to match actually do
    match. For example, if the same data appear in duplicate in
    multiple files, are they actually the same in all of the files?
    Here, one sample had 22 for "number of generations" in one file
    but 21 in a different file.

16. Next, check any calculations. For example, this shows a comparison
    between HOMA_IR in a datafile, and the calculated ratio of glucose
    to insulin. This is useful both to verify that the calculated
    values are correct and that your understanding of the calculation
    is correct.

    On the left, in the scatterplot of the re-calculated values versus
    the provided values, I've separated out missing values. There are
    some missing values that look like they don't need to be missing.

    When you're looking for differences, it's often best to calculate
    the differences and plot them. That's what's shown on the right.
    The differences look like just rounding errors, but note that
    there's a group of values that look to have been rounded more
    coarsely. (This often looks like a copy-paste action.) Also,
    there's a group of values that are all missing, which are maybe
    are the values where the derived value was missing but shouldn't
    have been.
    
17. Finally, for this section, when you find a problem be sure to look
    for other instances of that problem. This is just like debugging
    software: if you find a bug, look to see if you've made the same
    mistake elsewhere.
