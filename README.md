# Panda

Extremely simple static blogging engine (requires pandoc)

## Why the name?

* Panda uses [pandoc](https://github.com/pandoc) for generating .html pages from markdown.
* Pandas are black and white and so is the default theme in [css/main.css](css/main.css).
* Pandas are chill.

## Setup:

First, set your `outdir` and header in build.sh. Then, you can write posts in plain markdown. Make sure you put them in `posts/`.

`images` and `css` get copied to `outdir` as well.

## Generate your site:
    
    ./build.sh

## View your site:

Change to your `outdir` and run a webserver:

    cd docs
    python -m http.server


