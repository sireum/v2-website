touch source/index.rst; make html
scp -r build/html/* santos_jenkins@cislinux.cis.ksu.edu:/research/santos/web/sireum.org/
