#!/bin/env bash

# First argument is the name of the link.
# Second argument is the destination URL.
function generate-redirect-page {
    sed "s|%dest%|$2|g" redirect.template.html >$1.html
}

generate-redirect-page madden4cu http://vote.madden4cu.com/
