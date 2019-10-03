#!/usr/bin/env bash

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
cp survey-results-2014.html ../survey.html

generate-redirect-page subscribe http://eepurl.com/clWamD
mv subscribe.html ..
generate-redirect-page join-thanks "https://docs.google.com/forms/d/e/1FAIpQLSdy9nP6yav8Xk1gMP9MYvsbdLaqPPxUHmiB9jV0eybWaa4LcA/viewform?usp=sf_link"
mv join-thanks.html ..

generate-redirect-page 2014-survey docs/2014graddemoanalysis.pdf
mv 2014-survey.html ..
generate-redirect-page 2014-survey-complete docs/2014-sc-survey-oiec-analysis.zip
mv 2014-survey-complete.html ..

generate-redirect-page wages-petition-sign https://docs.google.com/forms/d/e/1FAIpQLSeMaf6Qpw_zLVddneM2EyZyDCheRS0Nrs8iP0c7Ts9geQcw9w/viewform
mv wages-petition-sign.html ..

generate-redirect-page fee-waiver-sign https://docs.google.com/forms/d/e/1FAIpQLSexmso9BvlT-o0tIGjJcyeSH67oAvkl2rmPt7k1WD_rAubDTA/viewform?usp=sf_link
mv fee-waiver-sign.html ..

generate-redirect-page BFA-SSS docs/BFA-SSS-resolution.pdf
sed -i 's/Click here to continue/Click here if download does not start automatically/' BFA-SSS.html

generate-redirect-page TCJA docs/TCJA.pdf
sed -i 's/Click here to continue/Click here if download does not start automatically/' TCJA.html
mv TCJA.html ..

generate-redirect-page survival-manual docs/graduate-survival-manual.pdf
sed -i 's/Click here to continue/Click here if download does not start automatically/' survival-manual.html
mv survival-manual.html ..

generate-redirect-page am-i-a-worker docs/am-i-a-worker.pdf
sed -i 's/Click here to continue/Click here if download does not start automatically/' am-i-a-worker.html
mv am-i-a-worker.html ..

generate-redirect-page new-supporter 'https://docs.google.com/forms/d/e/1FAIpQLSeZO2-OyJ8P7WNRpPYYmY_qsJkmJQgOo4izGXif_kMtmAfBaw/viewform?usp=sf_link'
mv new-supporter.html ..

generate-redirect-page rally 'https://www.facebook.com/events/592919221181146/'
mv rally.html ..

generate-redirect-page food-assistance-application 'https://docs.google.com/forms/d/e/1FAIpQLSdkF54APJ-0ay97E-kTdi2LDcfoebEa9fmRbdWUid8bPqgWSQ/viewform?usp=sf_link'
mv food-assistance-application.html ..

generate-redirect-page class-struggle-1 '/docs/class-struggle-2019-05-01.pdf'
mv class-struggle-1.html ../class-struggle/1.html
