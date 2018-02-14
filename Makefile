all: versions.diff.html

.DELETE_ON_ERROR:
.SECONDARY:

SHELL=bash -e -o pipefail

versions.previous.tsv:
	git show origin/master:versions.tsv >$@

versions.current.tsv:
	( printf "Formula\tVersion\n"; \
	docker run --rm bcgsc/orca:latest sh -c 'brew list --versions; pip2 freeze' \
		| tr -s ' =' '\t\t' | sort -f) >$@

versions.diff.html: versions.previous.tsv versions.current.tsv
	Rscript scripts/diff-versions.R
