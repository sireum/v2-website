cd src/main/website
touch source/index.rst; make html
cd ../docs
touch source/index.rst; make html
open build/html/index.html
cd ../../..
