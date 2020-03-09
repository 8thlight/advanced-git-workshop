# Advanced Git Workshop

The current slides for this workshop can be found in Google Drive.

## Old Version of Slides

The slides can be found in `slides.md`. To build them I have used
[Marp Next](https://github.com/marp-team/marp), please check their documentation to get you set up. I personally have simply installed their [VS Code extension](https://github.com/marp-team/marp-vscode), and that gets you going, but the [CLI](https://github.com/marp-team/marp-cli) works just as well.

### Slides Theme

The theme the project uses is [haskell](https://github.com/matsubara0507/marp-themes) by [@matsubara0507](https://github.com/matsubara0507).

### Compiling the Slides

To compile the slides into a nice PDF simply run:

```bash
npx @marp-team/marp-cli slide-deck.md --pdf --theme theme.css
```

## Exercises

Below you will find the different exercises which will be run through during the workshop.

### Helpful Tools

#### Showing a Nice Diff Between Branches

```bash
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative master..feature-branch
```

* Source: [How do I see the commit differences between branches in git?](https://stackoverflow.com/questions/13965391/how-do-i-see-the-commit-differences-between-branches-in-git)

#### Reset Branch to Remote

```bash
git reset --hard origin/feature-branch
```

### Git Rebase Exercise

https://github.com/8thlight/agw-rebase

#### Run Through

1. Simple rebase + interactive rebase for squashing
2. Interactive rebasing for doing both at the same time
3. Let's go back – there's one change which hasn't caused a conflict, but is wrong. Fix it.
4. Add a comment somewhere in the code, in the rebased commit, not a new one.
5. Rewrite commit message after having finished rebasing
6. Now let's reset the branch and redo this with `git merge`

#### Some Questions

- Why did rebase not mark that one change as conflict? What's the lesson learnt here?
- How could this whole situation have been avoided in the first place?
- Once you've finished rebasing, would you force push the branch or create a new one? Why?
- What's the main difference you've observed between merge and rebase? Which one makes you feel safer? Why? When would you use one or the other?

### Git Merge Exercise

https://github.com/8thlight/agw-merge

#### Some Questions

- When merging `master` into `feature-branch`, which README does it keep? Why? Is it the same when we apply `rebase`?
- Run the log after having used `merge` and after having used `rebase`. What differences can you see?
  _Hint: use `git log --one-line --decorate --color --graph`_
- What is the difference between running `git merge master` in `feature-branch` and running `git merge feature-branch` in `master`? If you're not sure, run both and check the logs.
- After doing the merge, if you run `git log`  you'll see the merge commit has a special line saying: `merge: commit1 commit2`, do you know why?
- If we `git show` the merge commit, what content is there?
  _Hint: try running `git show HEAD^...HEAD` or `git diff commit1...commit2`_

## Bonus Git Bisect Exercise

Follow the instructions in https://github.com/8thlight/agw-bisect
