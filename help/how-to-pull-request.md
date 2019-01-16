
## Specific commits to PR to the red/GTK branch (for instance)

As in my `.git/config` file, there is 2 remotes `red` (upsteam url repo) and `origin` (rcqls url repo). To Pull Request some commits form `rcqls/red:GTK` to  
[git cherry-pick](https://mirrors.edge.kernel.org/pub/software/scm/git/docs/git-cherry-pick.html)

```{branch}
git checkout -b GTK-patch-<patch-name> red/GTK # GTK from the original upstream repo
git cherry-pick <commit-from>..<commit-to> # commits to insert <commit-from> is not inserted when <commit-to> is
```
Be careful! `red` is the remote url of new branch `GTK-patch-<patch-name>`. I am not the owner then! I can't **push** (`git push` or `directly using Github Desktop`)

Two options:

1. become the owner first (local save)
```{bash}
## change remote of GTK-patch-<patch-name> from red (upstream) to origin (inside .git/config)
git branch GTK-patch-<patch-name> -u  origin/GTK-patch-<patch-name> 
# or git branch GTK-patch-<patch-name> -u  origin
## 
git push # or Github Desktop
```
2. push to origin
```{bash}
git push origin GTK-patch-<patch-name>

Since this patch is not really informative locally, you could remove it locally (not remotely since used in the PR)
```{bash}
git branch -d fix-color-issue 
```

