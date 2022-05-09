#! /usr/bin/env zsh

# SET YOUR OUTPUT DIRECTORY HERE
# Note: GitHub allows to render your docs/ directory to GitHub Pages
outdir=docs

# Clean and/or create the output dir
[ -d "$outdir" ] && rm -rf $outdir && mkdir $outdir || mkdir $outdir

# copy necessary directories
cp -r images $outdir/.
cp -r css $outdir/.

# Generate posts from markdown (posts/)
for post in posts/*.md
    pandoc -V lang=en $post \
        -t html5 \
        -o $outdir/${$(basename $post)%.*}.html \
        -s -c css/main.css

rm -f _index.md

header="""
---
title: Your blog
language: en-EN
---
"""

echo $header > _index.md

for post in $(ls posts/*.md | sort -r); do
    # get URI, use this as href
    uri=${$(basename $post)%.*}
    
    # get date
    date=${uri:0:10}

    # get name
    name=$(echo $uri | cut -c12-)
    prettyname=$(echo $name | tr '-' ' ')
    
    echo "Generating post:"
    echo $date
    echo $prettyname
    echo "================================================="

    # build 
    echo "<div class='content'>" >> _index.md
    echo "<i>$date</i><br />" >> _index.md
    echo "<a href='$uri.html'>$prettyname</a>" >> _index.md
    echo "</div>" >> _index.md
done

echo "Generating index..."
pandoc -V lang=en _index.md \
        -t html5 \
        -o $outdir/index.html \
        -s -c css/main.css

rm _index.md

echo "Done!"