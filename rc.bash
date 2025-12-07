#!/usr/bin/env bash
set -eu
GNU_MIRROR_BASE="https://ftp.jaist.ac.jp/pub/GNU"

lsgnu() {
	# Fetch HTML, extract directory links, remove tags,
	#   filter out non-package links
	#   and remove trailing slashes
	curl -sL "${GNU_MIRROR_BASE}" | \
		grep -o 'href="[^"]*/"' | \
		sed 's/href="//;s/"$//' | \
		grep -v '^\.\./' | \
		grep -v '^\?' | \
		grep -v '^/' | \
		sed 's/\/$//'
}

# download latest gnu package
gnupkg() {
	local pkg_name="$1"

	if [ -z "$pkg_name" ]; then
		return 20
	fi

	local target_url="${GNU_MIRROR_BASE}/${pkg_name}/"
	# 1. Fetch HTML content
	# 2. Extract href links for .tar.gz files
	# 3. Clean up the tags to get filenames
	# 4. Sort by version (natural sort)
	# 5. Pick the last one (latest)
	local latest_file=$(curl -sL "$target_url" | \
	grep -o 'href="[^"]*\.tar\.gz"' | \
	sed 's/href="//;s/"$//' | \
	sort -V | \
	tail -n 1)

	if [ -z "$latest_file" ]; then
		return 30
	fi

	curl -O "${target_url}${latest_file}"
	if [ ! $? -eq 0 ]; then
		return 40
	fi
}

