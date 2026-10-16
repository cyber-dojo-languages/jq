#!/bin/sh -eu

# Records the jq this image holds, in the shape every image shares. The
# installed jq is asked, so the version is one the image can run rather than
# one written down when someone last edited this file.
# jq --version prints "jq-1.8.2".
readonly LANGUAGE_VERSION=$(jq --version | cut -c4-)

if [ -z "${LANGUAGE_VERSION}" ]; then
  echo 'Could not read a version from jq --version' >&2
  exit 1
fi

cat > /versions.json <<EOF
{
  "language": {
    "name": "jq",
    "version": "${LANGUAGE_VERSION}"
  },
  "test_frameworks": []
}
EOF
