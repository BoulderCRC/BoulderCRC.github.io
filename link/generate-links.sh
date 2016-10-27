#!/bin/env bash

# First argument is the name of the link.
# Second argument is the destination URL.
function generate-redirect-page {
    sed "s|%dest%|$2|g" redirect.template.html >$1.html
}

generate-redirect-page madden4cu http://vote.madden4cu.com/
generate-redirect-page pledge-2016-10 http://www.colorado.edu/today/2016/10/12/academic-excellence-and-student-climate-shape-fall-2016-graduate-school-initiatives
generate-redirect-page survey-results-2014 http://www.colorado.edu/today/2016/10/12/academic-excellence-and-student-climate-shape-fall-2016-graduate-school-initiatives
generate-redirect-page living-wage-uggs-resolution-2016 http://www.colorado.edu/uggs/sites/default/files/attached-files/uggs_resolution_on_rights_and_compensation_0.pdf
