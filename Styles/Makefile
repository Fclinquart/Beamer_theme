# ============================================================
#  Makefile  –  UCLouvain Beamer Presentation
#  François Clinquart  –  2026
# ============================================================

MAIN        := main
BUILDDIR    := build
LATEXMK     := latexmk
PDFVIEWER   := evince        # change to okular / zathura / xdg-open if needed

# Default output name = YYYY-MM-DD_main.pdf  (today's date, auto)
DATE        := $(shell date +%Y-%m-%d)
OUTPUT      := $(DATE)_$(MAIN)

# latexmk flags: force all temp files AND the pdf into build/
LATEXMK_FLAGS := -pdf -outdir=$(BUILDDIR) -interaction=nonstopmode

# ============================================================
.PHONY: all pdf save clean purge view help

# ============================================================
##  all              : compile → output named YYYY-MM-DD_main.pdf  (default)
all: pdf

# ============================================================
##  pdf              : same as all
pdf:
	@echo ">>> Compiling $(MAIN).tex  (aux + pdf → $(BUILDDIR)/)"
	@mkdir -p $(BUILDDIR)
	$(LATEXMK) $(LATEXMK_FLAGS) $(MAIN).tex
	@if [ -f $(BUILDDIR)/$(MAIN).pdf ]; then \
		cp $(BUILDDIR)/$(MAIN).pdf $(OUTPUT).pdf; \
		echo ">>> Done : $(OUTPUT).pdf"; \
	else \
		echo "!!! Compilation failed – check $(BUILDDIR)/$(MAIN).log"; \
		exit 1; \
	fi

# ============================================================
##  save NAME=foo    : compile → output named foo.pdf
##                     example:  make save NAME=Clinquart_PO_2026
save:
ifndef NAME
	$(error Usage: make save NAME=your_filename   e.g.  make save NAME=Clinquart_PO_2026)
endif
	@echo ">>> Compiling $(MAIN).tex → $(NAME).pdf ..."
	@mkdir -p $(BUILDDIR)
	$(LATEXMK) $(LATEXMK_FLAGS) $(MAIN).tex
	@if [ -f $(BUILDDIR)/$(MAIN).pdf ]; then \
		cp $(BUILDDIR)/$(MAIN).pdf $(NAME).pdf; \
		echo ">>> Done : $(NAME).pdf"; \
	else \
		echo "!!! Compilation failed – check $(BUILDDIR)/$(MAIN).log"; \
		exit 1; \
	fi

# ============================================================
##  view             : compile then open the PDF in $(PDFVIEWER)
view: pdf
	@$(PDFVIEWER) $(OUTPUT).pdf &

# ============================================================
##  clean            : remove build/ and aux files  (keeps PDF)
clean:
	@echo ">>> Cleaning build directory ..."
	@$(LATEXMK) -c -outdir=$(BUILDDIR) $(MAIN).tex
	@rm -rf $(BUILDDIR)
	@echo ">>> Clean done."

# ============================================================
##  purge            : remove everything including all PDFs
purge:
	@echo ">>> Purging all generated files ..."
	@$(LATEXMK) -C -outdir=$(BUILDDIR) $(MAIN).tex
	@rm -rf $(BUILDDIR)
	@rm -f $(OUTPUT).pdf
	@echo ">>> Purge done."

# ============================================================
##  help             : show this help message
help:
	@echo ""
	@echo "  ╔══════════════════════════════════════════════════════════════╗"
	@echo "  ║        UCLouvain Beamer – Makefile & LaTeX Reference         ║"
	@echo "  ╚══════════════════════════════════════════════════════════════╝"
	@echo ""
	@echo "  ── MAKE TARGETS ────────────────────────────────────────────────"
	@grep -E '^##' Makefile | sed 's/^## */  make /'
	@echo ""
	@echo "  ── SETTINGS ────────────────────────────────────────────────────"
	@echo "    PDF viewer  : $(PDFVIEWER)"
	@echo "    Build dir   : $(BUILDDIR)/   ← ALL temp files stored here"
	@echo "    Default PDF : $(OUTPUT).pdf  ← copied to root after build"
	@echo ""
	@echo "  ── CUSTOM LaTeX COMMANDS (beamer-style.cls) ────────────────────"
	@echo ""
	@echo "  AUTHORS & TITLE PAGE"
	@echo "    \addauthor{Name}{1,a}          add author with affiliation superscript"
	@echo "    \addaffil{1}{Institution name} add affiliation (one line each)"
	@echo "    \setcontact{a}{email@ucl.be}   mark corresponding author email"
	@echo ""
	@echo "  SLIDES"
	@echo "    \thanksframe[text]             thank-you slide (white, sober)"
	@echo "    \twocols[ratio]{left}{right}   two-column layout  (default ratio 0.48)"
	@echo "    \uclbox{text}                  highlighted UCLblue box"
	@echo ""
	@echo "  BLOCKS"
	@echo "    \begin{block}{Title}           standard blue block"
	@echo "    \begin{alertblock}{Title}      red alert block"
	@echo "    \begin{exampleblock}{Title}    cyan example block"
	@echo "    \begin{greenblock}{Title}      dark green block  (vert sapin)"
	@echo ""
	@echo "  APPENDICES"
	@echo "    \appendixbib               Appendix I: References  (always first)"
	@echo "                               → separator slide + bibliography frames"
	@echo "    \appendixsec{Title}        Appendix II, III, ...   (add as many as needed)"
	@echo "                               → separator slide + section in TOC"
	@echo "                               → add normal \begin{frame} after"
	@echo ""
	@echo "    TOC tip: use \tableofcontents[hideallsubsections] on outline slide"
	@echo "             appendix sections appear automatically in the TOC"
	@echo ""
	@echo "  LOGO PATHS  (change in beamer-style.cls)"
	@echo "    \UCLlogopath                   path to UCLouvain logo (bottom-left)"
	@echo "    \EPLlogopath                   path to EPL logo       (bottom-right)"
	@echo "    \logoheight                    logo height  (default 1.0cm)"
	@echo ""
	@echo "  FIGURE CAPTIONS"
	@echo "    Automatic format:  Fig. X.  caption text  (bold italic prefix + italic)"
	@echo ""
