# Panda

Extremely simple static blogging engine

Requirements:

* zsh
* pandoc

## Why the name?

* Panda uses [pandoc](https://github.com/pandoc) for generating .html pages from markdown.
* Pandas are black and white and so is the default theme in [css/main.css](css/main.css).
* Pandas are chill.

## Setup:

First, set your `outdir` and header in build.sh. Then, you can write posts in plain markdown. Make sure you put them in `posts/`.

All files with the `.md` file extension in the root directory will be rendered as well, e.g. about.md will be available at /about.html.

`images` and `css` get copied to `outdir` as well (change in build.sh if necessary)

## Generate your site:
    
    ./build.sh

## View your site:

Change to your `outdir` and run a webserver:

    cd docs
    python -m http.server

