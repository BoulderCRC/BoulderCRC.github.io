#!/bin/env sh

# First argument is page name; second argument is the header class.
function generate_html {
    cat frontmatter.fragment.html >$1.html
    echo '      <body class="'$1'">' >>$1.html
    cat header.fragment.html |sed s/%headerclass%/$2/g >>$1.html
    cat $1.fragment.html >>$1.html
    cat backmatter.fragment.html >>$1.html
    sed -i 's/\r//' $1.html
}

generate_html index alt
generate_html provost-letter-2016-09 ''
