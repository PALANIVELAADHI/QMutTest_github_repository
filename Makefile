.PHONY: all test experiments figures tables paper clean
PY ?= python
export PYTHONPATH := src

all: test experiments figures tables paper

test:
	$(PY) -m pytest -q tests

experiments:           # ~2 min on one CPU core, fixed seed
	$(PY) experiments/run_all.py

figures:
	$(PY) experiments/make_figures.py
	mkdir -p paper/figures && cp figures/*.png paper/figures/

tables:
	$(PY) experiments/make_tables.py

paper:                 # needs pdflatex, bibtex, pandoc
	cd paper && ./build.sh

clean:
	rm -f paper/*.aux paper/*.log paper/*.bbl paper/*.blg paper/*.out paper/main_docx.tex
