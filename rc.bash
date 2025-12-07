#!/usr/bin/env bash
GNU_MIRROR_BASE="https://ftp.jaist.ac.jp/pub/GNU"

# list gnu packages
lsgnu() {
	curl -sL "${GNU_MIRROR_BASE}" | \
		grep -o 'href="[^"]*/"' | \
		sed 's/href="//;s/"$//' | \
		grep -v '^\.\./' | \
		grep -v '^\?' | \
		grep -v '^/' | \
		sed 's/\/$//'
}

# lsit gnu package versions
lsvgnu() {
	local pkg_name="$1"
	if [ -z "$pkg_name" ]; then
		return 20
	fi

        local target_url="${GNU_MIRROR_BASE}/${pkg_name}/"
	local files=$(curl -sL "$target_url" | \
		grep -o 'href="[^"]*\.tar\.gz"' | \
		sed 's/href="//;s/"$//')
	echo ${files}

}

# download latest gnu package and unzip it
getgnu() {
	local pkg_name="$1"
	if [ -z "$pkg_name" ]; then
		return 20
	fi

	local target_url="${GNU_MIRROR_BASE}/${pkg_name}/"
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
	tar -xzf "${latest_file}"
}

# configure short hand
confi() {
	if [ -z "${PREFIX}" ]; then
		return 20
	fi
	local dir_name=$(basename "${PWD}")
	./configure --prefix="${PREFIX}/${dir_name}" "$@"
}
