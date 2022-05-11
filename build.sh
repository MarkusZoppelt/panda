#! /usr/bin/env zsh

# SET YOUR OUTPUT DIRECTORY HERE
# Note: GitHub allows to render your docs/ directory to GitHub Pages
outdir=docs

# Clean and/or create the output dir
[ -d "$outdir" ] && rm -rf $outdir && mkdir $outdir || mkdir $outdir

# copy necessary directories
cp -r css images $outdir/.

# We will generate sites for every .md file so cp index.md to safety
cp index.md index.lock

# Generate posts from markdown (posts/)
for post in $(ls posts/*.md | sort -r); do
    pandoc -V lang=en $post \
        -t html5 \
        -o $outdir/${$(basename $post)%.*}.html \
        -s -c css/main.css \
        -H header.html \
        -A footer.html

    uri=${$(basename $post)%.*}    
    date=${uri:0:10}
    name=$(echo $uri | cut -c12-)
    prettyname=$(echo $name | tr '-' ' ')
    
    echo "Generating post: ($date) $prettyname"

    echo "<div class='content'>" >> index.md
    echo "<i>$date</i><br />" >> index.md
    echo "<a href='$uri.html'>$prettyname</a>" >> index.md
    echo "</div>" >> index.md
done

# Generate sites
for site in *.md; do
  pandoc -V lang=en $site \
          -t html5 \
          -o $outdir/${$(basename $site)%.*}.html \
          -s -c css/main.css \
          -H header.html \
          -A footer.html
  echo "Generated $site"
done

#Restore index.md
mv index.lock index.md

echo "Done!"