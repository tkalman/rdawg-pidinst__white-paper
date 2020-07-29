SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = PIDINST
SOURCEDIR     = .
BUILDDIR      = _build
BUILDERS      = html dirhtml singlehtml epub latex latexpdf linkcheck	\
                xml json pickle

# Subdirectories of the source directory that are supposed to be there
# but that may be empty and may thus be missing after a git checkout.
STATIC_SOURCEDIRS = $(SOURCEDIR)/_static $(SOURCEDIR)/_templates


help:
	$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

$(BUILDERS): $(STATIC_SOURCEDIRS)
	$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

distclean:
	rm -rf $(BUILDDIR)

$(STATIC_SOURCEDIRS):
	mkdir $@

.PHONY: help distclean $(BUILDERS)
