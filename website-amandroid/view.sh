cd src/main/website
touch source/index.rst; make html
cd ../docs
touch source/index.rst; make html
cd ../website
open build/html/index.html
cd ../../..
