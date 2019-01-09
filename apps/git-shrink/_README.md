# USAGE & EXAMPLES

## Run with Java

```sh
java -jar bfg.jar
```

### Create Bash Shortcut

~/.bash_aliases
```sh
alias gitshrink=$USE_PATH/bfg-shrink.jar
alias bfg=$USE_PATH/bfg-shrink.jar
```

### Examples

> Delete all files named 'id_rsa' or 'id_dsa' :
```sh
bfg --delete-files id_{dsa,rsa}  my-repo.git
```

> Remove all blobs bigger than 50 megabytes :
```sh
bfg --strip-blobs-bigger-than 50M  my-repo.git
```

> Replace all passwords listed in a file (prefix lines 'regex:' or 'glob:' if required) with ***REMOVED*** wherever they occur in your repository :
```sh
bfg --replace-text passwords.txt  my-repo.git
```

> Remove all folders or files named '.git' - a reserved filename in Git. These often become a problem when migrating to Git from other source-control systems like Mercurial :
```sh
bfg --delete-folders .git --delete-files .git  --no-blob-protection  my-repo.git
```

