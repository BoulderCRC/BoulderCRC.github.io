#!/bin/env sh

# See variables defined below for arguments.
# ASSUMES:
#   - present working directory is at the root of the file tree,
#     and that all common templates are in the root directory.
function generate_html {
    OUTDIR=$1       # Directory of page we're generating.
    PAGENAME=$2     # Name of page we're generating.
    HEADERCLASS=$3  # Class of page header.
    COMMONTEMPLATES=$(pwd)

    (
        BASEDIR=.
        # If first argument is nonempty, change to the directory given by first arg.
        # BASEDIR is the path of the base of our website, relative to output directory.
        [[ -n "$OUTDIR" ]] \
            && cd $OUTDIR \
            && BASEDIR=$(echo ${OUTDIR} | sed -re 's/[^\/]+/\.\./g')

        # Create output file starting with doctype and html tag.
        echo '<!DOCTYPE HTML><html>' >$PAGENAME.html

        # Append frontmatter fragment to file.
        # This contains head part of document.
        cat ${COMMONTEMPLATES}/frontmatter.fragment.html \
            |sed s/%basedir%/${BASEDIR}/g \
            >>$PAGENAME.html

        # Create body tag.
        echo '<body class="'$PAGENAME'">' >>$PAGENAME.html

        # Create and append main page fragments.
        echo '<div id="page-wrapper">' >>$PAGENAME.html

        # Append header.
        # This is the main header for the page, using the argument-provided header class.
        cat ${COMMONTEMPLATES}/header.fragment.html \
            |sed s/%headerclass%/$HEADERCLASS/g \
            >>$PAGENAME.html

        # Append main page content.
        cat $PAGENAME.fragment.html >>$PAGENAME.html
        echo '</div>' >>$PAGENAME.html

        # Append backmatter fragment to web page.
        # This contains contact us, footer, and scripts.
        cat ${COMMONTEMPLATES}/backmatter.fragment.html >>$PAGENAME.html

        # End body tag.
        echo '</body>' >>$PAGENAME.html

        # End html tag.
        echo '</html>' >>$PAGENAME.html

        # Removes windows returns... a little tacky... sue me.
        sed -i 's/\r//' $PAGENAME.html
    )
}

# create "firstagrument.html" file with second argument as header class
generate_html '' index alt
generate_html '' provost-letter-2016-09 ''
generate_html 'manual' index ''
generate_html 'manual' rent ''
