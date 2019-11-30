#!/bin/bash
# takes the release_id of a discogs release from a markdown table
# which has been converted from csv
# in this format:
# |Artist|Title|Label|Catalogue|Released|release_id| 
# and turns it into full link within the table

awk -v FS=\| -v OFS=\| '
NR>2 {$(NF-1) = "[link](http://www.discogs.com/release/" $(NF-1) "){:target=\"_blank\"}"}
1
' discogs.md > discogs_links.md

# with sed
# sed '3,$s@\([0-9]*\)| *$@[link](https://www.discogs.com/release/\1){:target=\"_blank\"}|@' discogs.md > discogs_links.md