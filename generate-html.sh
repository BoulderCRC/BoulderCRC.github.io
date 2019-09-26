#!/usr/bin/env bash

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
        cat ${COMMONTEMPLATES}/backmatter.fragment.html \
            |sed s/%basedir%/$BASEDIR/g \
            >>$PAGENAME.html

        # End body tag.
        echo '</body>' >>$PAGENAME.html

        # End html tag.
        echo '</html>' >>$PAGENAME.html

        # Removes windows returns... a little tacky... sue me.
        sed -i 's/\r//' $PAGENAME.html
    )
}

generate_html '' 'index' 'alt'
generate_html '' 'join' ''
generate_html '' 'apply' ''
generate_html '' 'who' ''
generate_html '' 'provost-letter-2016-09' ''
generate_html '' 'wages-petition-2017-10' ''
generate_html '' 'fee-waiver-petition' ''
generate_html '' 'food-assistance' ''
generate_html '' 'parental-leave-comparison' ''
generate_html '' 'zine-2018' ''
generate_html '' 'wagetheft' ''
cp 'wages-petition-2017-10.html' 'wages-petition.html'
generate_html 'manual' 'index' ''
generate_html 'manual' 'rent' ''
generate_html 'manual' 'issues' ''
generate_html 'manual' 'what-is-a-regent' ''
generate_html 'manual' 'labor' ''
generate_html 'manual' 'links' ''
generate_html 'manual' 'living' ''
generate_html 'manual' 'union' ''
generate_html 'class-struggle' 'index' ''

( cd link; ./generate-links.sh; )
