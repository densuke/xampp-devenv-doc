# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= uv run sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile



html-auto: 
	uv run make html
	@echo "Starting auto-rebuild"
	uv run sphinx-autobuild -b html source build/html

info:
	@echo "======================================================="
	@echo "組版は、ターミナルを開いて次のようにコマンドを打って下さい"
	@echo "$$ make html-auto"
	@echo "実行後ポートのビューからブラウザで接続すると確認できます。"
	@echo "保存後自動的に組版が行われます"
	@echo "======================================================="


# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	uv run $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
