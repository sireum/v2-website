rm -fR target
mkdir target
cd target
git clone git@github.com:sireum/gh-pages-sireum.git
rm -fR gh-pages-sireum/*
cd ../src/main/rst
make clean
touch source/index.rst
make html
cp -R build/html/* ../../../target/gh-pages-sireum/
cd ../../../target/gh-pages-sireum
echo "sireum.org" > CNAME
mkdir download
echo $'<html><head><meta http-equiv="Refresh" content="0; url=http://sireum.org/software.html"/></head><body><p>Please follow <a href="http://sireum.org/software.html">this link</a>.</p></body></html>' > download/index.html
git add --all
git commit -m 'Updated.'
git push
