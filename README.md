TodoList
========

An small TODO list application


## Installation

```
$ git clone git@github.com:vicmaster/TodoList.git
$ bundle install
$ rake db:setup
```
## TDD: Set Guard

```
$ rake db:test:prepare
$ bundle exec guard start
```

## Run Application

```
$ rails server
```

## Demo Online
```
  http://mitodo.herokuapp.com/
```

## Aditional Usage

### If you want to use a Gem Pry an IRB alternative and runtime developer console


Put in Controllers wherever you want like this:

```
binding.pry
```

Put in Views wherever you want like this:

```
- binding.pry
```

After that just go to your server console and see what it's going on,
and start to play.

When you finish just write:

> Exit


## Expected Conventions

* http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
