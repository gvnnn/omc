#!/bin/bash

# Start with a clean environment
rm ~/.omc/omc.json

go build -o omc main.go

project="$(./omc use cmd/use/testdata/useContext/must-gather-singleNS.sample | awk '/^Project/ {print $NF}')"

if [ -n "${project}" ] && [ "${project}" != 'openshift-etcd' ]; then
	exit 1
fi

exit 0
