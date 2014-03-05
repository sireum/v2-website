Notes
#####

The website projects use the following tools/frameworks:

* `Sphinx <http://sphinx-doc.org>`__

* `Pygments <http://pygments.org>`__

* `Bootstrap <http://getbootstrap.com>`__

* `Bootswatch <http://bootswatch.com>`__

* `Sphinx Bootstrap Theme <https://github.com/ryan-roemer/sphinx-bootstrap-theme>`__

* (Optional) `MathJax <http://mathjax.org>`__ 



Setup: Sphinx, etc.
###################

1. Install pip, sphinx, and pygments; in OS X using Macports: 

   .. code-block:: bash
   
      sudo port install py33-pip py33-sphinx py33-pygments

            
2. Install pygments Github style:

   .. code-block:: bash
   
      sudo pip install pygments-style-github

3. Install sphinx_bootstrap_theme:

   .. code-block:: bash

      sudo pip install sphinx_bootstrap_theme      

      
Setup: MathJax
##############

1. Retrieve MathJax from GitHub:

   .. code-block:: bash
   
      git clone git://github.com/mathjax/MathJax.git <path>

2. Under the project ``build/html/_static`` (create one if the directory 
   has not been created before), symlink your local MathJax copy 
   as ``mathjax``:
  
   .. code-block:: bash
   
      ln -s <path> mathjax

   This method was chosen instead of putting MathJax under
   ``src/main/rst/.static`` which gets copied by Sphinx to the 
   above destination (thus, avoiding time to copy as well as duplication).
