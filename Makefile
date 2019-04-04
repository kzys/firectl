# Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may
# not use this file except in compliance with the License. A copy of the
# License is located at
#
#	http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is distributed
# on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language governing
# permissions and limitations under the License.
SRCFILES := *.go

all: firectl

release: firectl firectl.sha256
	test $(shell git status --short | wc -l) -eq 0

firectl.sha256:
	sha256sum firectl > firectl.sha256

firectl: $(SRCFILES)
	go build

test:
	go test -v ./...

lint:
	golint $(SRCFILES)

clean:
	go clean

.PHONY: all clean
