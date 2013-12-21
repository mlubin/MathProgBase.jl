MathProgBase.jl Documentation README
================================

MathProgBase.jl's documentation is written in reStructuredText, a good reference for which
is the [Documenting Python](http://docs.python.org/devguide/documenting.html)
chapter of the Python Developer's Guide.


Building the documentation
--------------------------

The documentation is built using [Sphinx](http://sphinx.pocoo.org/) and LaTeX.
On ubuntu, you'll need the following packages installed:

    python-sphinx
    texlive
    texlive-latex-extra

You will also need to install the [JuliaDoc](https://github.com/JuliaLang/JuliaDoc) Python package; this can be done via

    pip install git+git://github.com/JuliaLang/JuliaDoc.git#egg=JuliaDoc

Then run

    $ make helpdb.jl
    $ make html
    $ make latexpdf


File layout
-----------

    conf.py             Sphinx configuration
    helpdb.jl           REPL help database
    sphinx/             Sphinx extensions and plugins
    sphinx/jlhelp.py    Sphinx plugin to build helpdb.jl
    _themes/            Sphinx html themes
