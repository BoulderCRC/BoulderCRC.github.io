#!/bin/env sh

# First argument is page name; second argument is the header class.
function generate_html {

	# create html tag
	echo '<!DOCTPE HTML><html>' >>$1.html

	# concat frontmatter frag to web page
	# this contains head part of document
    cat frontmatter.fragment.html >$1.html

	# create body tag
	echo '<body class="'$1'">' >>$1.html

	# create and concat main page frags
	echo '<div id="page-wrapper">' >>$1.html
	# concat header
	# this is the main header for the page, the class gets replaced with the second argument
    cat header.fragment.html |sed s/%headerclass%/$2/g >>$1.html
	# concat main page
	# this contains the primary content for the page
    cat $1.fragment.html >>$1.html
	echo '</div>' >>$1.html

	#concat backmatter frag to web page
	# this contains contact us, footer, and scripts
    cat backmatter.fragment.html >>$1.html

	# end body tag
	echo '</body>' >>$1.html

	# end html tag
	echo '</html>' >>$1.html

	# removes windows returns
    sed -i 's/\r//' $1.html
}

# create "first_agrument.html" file with second argument header class
generate_html index alt
generate_html provost-letter-2016-09 ''
# generate_html reinformation ''

( cd link; ./generate-links.sh; )
