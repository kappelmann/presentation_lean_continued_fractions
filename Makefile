FILE := presentation_lean_continued_fractions
OUT  := build

.PHONY: pdf
pdf:
	latexmk -xelatex -latexoption="-shell-escape" -interaction=nonstopmode -outdir=$(OUT) -halt-on-error $(FILE)

.PHONY: watch
watch:
	latexmk -xelatex -latexoption="-shell-escape" -interaction=nonstopmode -outdir=$(OUT) -pvc -halt-on-error $(FILE)

.PHONY: clean
clean:
	rm -rf $(filter-out $(OUT)/$(FILE).pdf, $(wildcard $(OUT)/*))

.PHONY: purge
purge:
	rm -rf $(OUT)

# gnome-specific command
.PHONY: start
start:
	gnome-terminal -- make watch
