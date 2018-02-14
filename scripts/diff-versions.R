# Written by Shaun Jackman @sjackman
# and Tatyana Mozgacheva <tmozgacheva@bcgsc.ca>
# Description: This script generates a table of added
# and removed software, and their versions in the new release of ORCA
# in HTML and TSV format (versions.diff.html and versions.diff.tsv).
# Usage:
# 1. Run the Docker container using `docker run -it bcgsc/orca`
# 2. Inside the Docker containers of old and new ORCAs, type `brew list --versions` and `pip freeze`
# 3. Replace ` ` and `==` with `\t`

library(DT)
library(dplyr)
library(readr)

# Read the previous and current versions from TSV and text files.
old_orca <- read_tsv("versions.previous.tsv", col_types = "cc")
new_orca <- read_tsv("versions.current.tsv", col_types = "cc")

# Remove the Brew revision number.
old_orca <- old_orca %>% mutate(Version = sub("_.*", "", Version)) %>%
	arrange(Formula) %>% distinct()
new_orca <- new_orca %>% mutate(Version = sub("_.*", "", Version)) %>%
	arrange(Formula) %>% distinct()
write_tsv(new_orca, "versions.tsv")

# Determine which formula have changed.
versions_diff <- full_join(old_orca, new_orca, by = "Formula") %>%
	rename(Previous = Version.x, Current = Version.y) %>%
	mutate(Status =
		ifelse(is.na(Previous), "Added",
		ifelse(is.na(Current), "Removed",
		ifelse(Previous != Current, "Updated",
		NA))))

# Export to TSV file
write_tsv(versions_diff, "versions.diff.tsv")

# Export to HTML file
datatable(versions_diff) %>%
	formatStyle(columns = "Status",
		background = styleEqual(c("Added", "Removed"), c("green", "red"))) %>%
	saveWidget("versions.diff.html")
