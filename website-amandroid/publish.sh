if [ ! -e api ]; then
  echo "Could not find Amandroid API (no api directory)"; exit
fi
rm -fR target
mkdir target
cd target
git clone git@github.com:sireum/gh-pages-amandroid.git
rm -fR gh-pages-amandroid/*
cp -R ../api gh-pages-amandroid/
cd ../src/main/website
touch source/index.rst
make html
cp -R build/html/* ../../../target/gh-pages-amandroid/
cd ../../..
cd src/main/docs
touch source/index.rst
make html
mkdir ../../../target/gh-pages-amandroid/docs/
cp -R build/html/* ../../../target/gh-pages-amandroid/docs/
cd ../../../target/gh-pages-amandroid
echo "amandroid.sireum.org" > CNAME
git add --all
git commit -m 'Updated.'
git push
