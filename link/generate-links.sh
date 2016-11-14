#!/bin/env bash

# First argument is the name of the link.
# Second argument is the destination URL.
function generate-redirect-page {
    sed "s|%dest%|$2|g" redirect.template.html >$1.html
}

generate-redirect-page dean-response-2016-11 https://docs.google.com/document/d/1iXU1MYzex05O33wPltEC2SH8ChZjUhy4l5OUhAwVpAM/edit

generate-redirect-page madden4cu http://vote.madden4cu.com/
cp madden4cu.html ../madden.html
cp madden4cu.html ../vote.html

generate-redirect-page pledge-2016-10 http://www.colorado.edu/today/2016/10/12/academic-excellence-and-student-climate-shape-fall-2016-graduate-school-initiatives
generate-redirect-page survey-results-2014 http://web.archive.org/web/20160911224955/http://www.colorado.edu/studentsuccess/campus-climate/graduate-student-social-climate-survey
generate-redirect-page living-wage-uggs-resolution-2016 http://www.colorado.edu/uggs/sites/default/files/attached-files/uggs_resolution_on_rights_and_compensation_0.pdf
generate-redirect-page regent-meeting-2016 http://www.dailycamera.com/cu-news/ci_30024771/cu-boulder-graduate-students-demand-higher-wages-offset

generate-redirect-page subscribe http://eepurl.com/clWamD
mv subscribe.html ..
