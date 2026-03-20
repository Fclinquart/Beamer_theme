# ============================================================
#  .latexmkrc  –  UCLouvain Beamer Presentation
#  François Clinquart  –  2026
#
#  NOTE: -outdir=build is passed directly by the Makefile.
#        Do NOT set $out_dir here to avoid conflicts when
#        latexmk is called manually without the Makefile.
# ============================================================

# --- Engine : pdflatex ---
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -shell-escape -synctex=1 %O %S';

# --- Bibliography : Biber ---
$bibtex_use = 2;

# --- Compilation passes ---
$max_repeat = 5;

# --- Extensions cleaned by latexmk -c / -C ---
$clean_ext      = 'aux bbl bcf blg fdb_latexmk fls log nav out run.xml snm synctex.gz toc vrb idx ilg ind';
$clean_full_ext = 'pdf';

# --- Do not treat Overfull hbox warnings as fatal errors ---
$warnings_as_errors = 0;
