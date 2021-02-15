Why don’t we offer a course in data cleaning?
Roger Peng quote: “each dataset is unique; approach to cleaning medicare data totally different than approach to cleaning RNAseq”
- I totally don’t believe that

“Frustratingly difficult to generalize”
“If I clean up administrative claims data from Medicare...does any of the knowledge I gain...apply to the processing of RNA-seq data?”

Really:
- it’s tedious
- the results are often embarrassing
- it requires understanding of the context
- it doesn’t feel like progress
- what student is going to sign up for such a course?

But also
- it requires all of our creativity
- it’s the source of most problems
- it requires are most detailed coding prowess
- you don’t appreciate it until later

DataMishaps Night
- more than half of mishaps were a data cleaning or data merge problem
- we all really can identify with each other’s data cleaning problems

1. “Don’t do data QC when tired, hungry, or thirsty” (or angry)
[Allocate sufficient time and energy] - Ghazal Gulati, @ghazalgulati
2. Think about what might have gone wrong, and how it might be revealed
3. Care in merging: Focus on labels not position
   - (so often, rows and/or columns get swapped)
4. Ask for the primary data (mistakes may have been made in the compiling)
   - Rounding patterns
Ask for metadata (easier to identify with variables that you understand)
5. If things are supposed to be the same, check that they are
   - Double-check calculations
6. Look at missing data patterns
- Subjects present in one file but missing from another
7. Yeah but why are they missing?
7. Plot stuff: vs time, and scatterplots
   - Batch differences
8. Dates suck
9. Categories suck
10. Create checklists and pipelines
    - make use of your experience
11. Data cleaning should be more than reproducible; document not just what but why
12. Don’t be shy about asking questions
13. If you find a problem, look for other instances of the problem
14. Are the things that should be distinct actually distinct?
15. Are the things that should be consistent actually consistent?
16. There will always be typos
17. Don’t trust anyone (even yourself)
18. Look for outliers (real variation or error?)

“I have a dream: one day ads for positions in data science groups  will include terms like “diagnostics specialist” as well as expertise in statistical modeling, forecasting, machine learning.” Di Cook (@visnut)

<https://twitter.com/visnut/status/1351363812314607618>


---

From abstract:

1. think about what might have gone wrong and how it might be revealed
2. study the pattern of missing data and ask why they are missing
3. use care when merging datasets and focus on labels not position
4. if things are supposed to match, check that they do
5. if things are supposed to be distinct, check that they are
6. look for outliers and other oddities by making lots of plots, particularly scatterplots
7. look for batch effects by making lots of plots, particularly plots against time and scatterplots colored by batch
8. ask for the primary data and also metadata
9. don’t be shy about asking questions
10. document not just what you did but also why you did it
11. don’t trust anyone (even yourself)
12. allocate sufficient time and energy to the effort



---

Data cleaning code cannot be clean. It's a sort of sin eater.
<https://twitter.com/StatFact/status/492753200190341120>

---

I will let the data speak for itself when it cleans itself.
<https://twitter.com/AllisonReichel/status/1350107719236247558>

---

Split principles into four groups:
- verify
- explore
- confer (or collaborate)
- document

would be nice to have balance, like 4 groups of 4 things, or 4 groups
of 3 things where each has some over-arching principle

a principle on top of everything: "trust no one" (or is that part of "verify"?)
