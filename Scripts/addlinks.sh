#!/bin/bash
# takes the release_id of a discogs release from a markdown file
# which has been converted from csv
# in this format:
# |Artist|Title|Label|Catalogue|Released|release_id| 
# and turns it into full link within the table

awk -v FS=\| -v OFS=\| '
NR>2 {$(NF-1) = "[🔗](http://www.discogs.com/release/" $(NF-1) "){:target=\"_blank\"}"}
1
' discogs.md > discogs_links.md
