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
git add --all
git commit -m 'Updated.'
git push
