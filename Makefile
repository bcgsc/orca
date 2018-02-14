all: versions.diff.html

.DELETE_ON_ERROR:
.SECONDARY:

SHELL=bash -e -o pipefail

versions.previous.tsv:
	git show origin/master:versions.tsv >$@

versions.current.tsv:
	( printf "Formula\tVersion\n"; \
	docker run --rm bcgsc/orca:latest -- 'brew list --versions; pip freeze' \
		| tr -s ' =' '\t\t') >$@

versions.diff.html: versions.previous.tsv versions.current.tsv
	Rscript scripts/release_note_ORCA.R
