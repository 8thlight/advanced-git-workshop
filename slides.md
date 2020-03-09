---
marp: true
title: Git Strategies
theme: haskell
class: lead
paginate: true
---

# **Git** strategies
###### A history of conflicts, and how to approach them

---

## **Agenda**

- Git rebase
- Git merge
- Team git workflows
- Common anti-patterns
- Useful tools

---

## Git **rebase**

###### *Rewritting history since 2005*

---

### **What** is rebase?

> _Reapply commits on top of another base tip_

---

### So... **why** rebase?

- Modifying broken commits, ergo eliminating bugged commits

- Rearranging content between commits, ergo more meaningful commits

- Keeping a clean history, ergo... clean history :)

---

### **How** do I rebase?

```
           --A---B---C topic
         /
    D---E---F---G master


$ git checkout topic
$ git rebase master topic


                   --A'--B'--C' topic
                 /
    D---E---F---G master
```

---

### The powerhouse: **interactive** rebase

- The power to rewrite history literally: it allows you to alter commits rather than only moving them.

- It’s based on `git commit --amend`

- Interactive mode further allows you to also squash the commits, for a cleaner history.

---

### Rebasing **caveats**

- Rewrites history – careful with rebasing on public branches

- Merge conflicts are more frequent

- Commits can be lost in interactive mode

---

## Git **merge**

###### *Eventually, all rivers lead to the sea*

---

### **What** is merge?

> _Join two or more development histories together_

---

### What's the **difference** with rebase?

- Merge commits are unique against other commits in the fact that they have two parent commits.

- History is completely preserved, instead of rewritting it.

---

### **Why** would I want to merge?

- Incorporate the commits from the named branch into the current branch without loosing history

---

### **Merging** in a nutshell

```
          A---B---C topic
        /
    D---E---F---G master

$ git checkout master
$ git merge topic

          A---B---C topic
        /          \
    D---E---F---G---H master
```

---

### Further **details**

*Git merge will combine multiple sequences of commits into one unified history. [...] git merge takes two commit pointers, usually the branch tips, and will find a common base commit between them. Once Git finds a common base commit it will create a new "merge commit" that combines the changes of each queued merge commit sequence.*

- If a piece of data that is changed in both histories git will be unable to automatically combine them.

- Fast-forward vs 3-way merge

---

## Defining a **workflow**

###### *Life only gives us options, choice is always ours.*

---

### **Trunk**-based development
- Whole team develops to shared branch called trunk (!!)
- Short lived feature branches
- Release branches

#### When?
- Just starting up/need quick iterations
- Mostly senior developers

#### When not?
- Open source projects
- Mostly junior developers

---

![trunk-based-development](https://www.gocd.org/assets/images/blog/cd-considerations/trunk-based-development-6995662e.png)

---

### **Gitflow**
- Two main branches: `develop` and `main`.
- Features are developed by branching `develop` and are reviewed before merging.
- Releases are merges from `develop` to `master`.

#### When?
The opposite scenarios to Trunk-based development. In other words, any scenario where **branch micromanagement** could be an asset rather than a burden.

---

![gitflow](https://wac-cdn.atlassian.com/dam/jcr:61ccc620-5249-4338-be66-94d563f2843c/05%20(2).svg?cdnVersion=621)

---

### And where do merge/rebase fit in?

Both of these commands are designed to integrate changes from one branch into another branch—they just do it in very different ways.

The golden rule of `git rebase` is to never use it on public branches.

Nonetheless, the team decides.

---

## The **extra** mile

###### *The noblest pleasure is the joy of understanding.*

---

### Some **anti-patterns** to be aware of

- Pushing every commit
- Can you jump to any commit?
- Long living branches
- Complicated commit log
- Using GUIs

**Commit early, commit often, perfect later, publish once.**

_credits: [@lemiorhan](https://speakerdeck.com/lemiorhan/10-git-anti-patterns-you-should-be-aware-of)_

---

### Further **tools** to hone our craft

- [git bisect](https://thoughtbot.com/blog/git-bisect)
- [git log](https://www.atlassian.com/git/tutorials/git-log)
- [git cherry-pick](https://www.atlassian.com/git/tutorials/cherry-pick)
- [git reflog](https://www.atlassian.com/git/tutorials/rewriting-history/git-reflog)
- [git hooks](https://githooks.com/)

---
<!-- Scoped style -->
<style scoped>
p {
  text-align: left;
}
a {
  font-size: 18px;
}
</style>
### **Thank you** all!

![bg left](https://images6.alphacoders.com/985/985806.png)

#### [Workshop Repository](https://github.com/Manzanit0/advanced-git-workshop)

![](https://img.icons8.com/metro/26/000000/twitter.png) [hojasdemanzano](https://twitter.com/hojasdemanzano)
![](https://img.icons8.com/small/32/000000/github.png) [Manzanit0](https://github.com/manzanit0)
