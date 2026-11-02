# QMutTest — noise-aware mutation testing of quantum circuits

Replication package for the paper **"Noise-Aware Mutation Testing of Quantum Circuits: Statistical Oracles,
Equivalent Mutants and the Detectability of Subtle Faults"** (`paper/`).

* Six subject programs (GHZ-4, Adder-2, Draper-3, Grover-3, BV-3, Teleport), 782 mutants, six operators
  (GI, GD, GR, CS, AP, SR), exact equivalent-mutant detection.
* Two statistical oracles: **A** (ideal distribution) and **B** (noise-aware two-sample test against a
  calibration run of the trusted program).
* Ideal (statevector) and noisy (Qiskit Aer density matrix, depolarising) execution; shots are drawn by
  multinomial sampling from the exact distributions.

## Quick start
```bash
pip install -r requirements.txt
make test          # 5 unit tests: subjects compute the right function, noise model, mutants
make experiments   # ~2 min on one core; writes results/raw.pkl and results/mutants.csv
make figures       # figures/*.png|pdf and results/summary.json
make tables        # paper/tables/*.tex (generated from the results, no hand-typed numbers)
make paper         # paper/main.pdf and paper/main.docx (needs pdflatex, bibtex, pandoc)
```
Seed `20260211`; versions used: Python 3.12.3, Qiskit 2.6.1, Qiskit Aer 0.18.2, NumPy 2.4.4, SciPy 1.17.1.

## Layout
```
src/qmutest/       circuits.py (subjects) · mutation.py (operators) · simulate.py (ideal/noisy) · oracle.py (A, B)
experiments/       run_all.py · make_figures.py · make_tables.py
results/           mutants.csv · summary.json · raw.pkl · run.log
figures/           all figures (PNG + PDF)
paper/             main.tex · references.bib · main.pdf · main.docx · build.sh · build_docx.py · tables/ · figures/
tests/             pytest unit tests
```

## Notes
* Placeholders `[Author Name]`, `[user]` in the paper, LICENSE and CITATION.cff must be replaced before submission.
* See `REFERENCES.md` for the verification status of every cited paper and for the guest editors' related work.
