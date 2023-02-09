GO_CMD   := go
GO_BUILD := $(GO_CMD) build
GO_TEST  := $(GO_CMD) test -race -v -cover

GO_LINT  := golint -set_exit_status
GO_FMT   := gofmt
GO_VET   := $(GO_CMD) vet

CDI_PKG  := $(shell grep ^module go.mod | sed 's/^module *//g')

BINARIES :=

ifneq ($(V),1)
  Q := @
endif


#
# top-level targets
#

all: build

build: $(BINARIES)

clean: clean-binaries clean-schema

test: test-gopkgs test-schema

#
# validation targets
#

pre-pr-checks pr-checks: test fmt lint vet

fmt format:
	$(Q)$(GO_FMT) -s -d -w -e .

lint:
	$(Q)$(GO_LINT) -set_exit_status ./...
vet:
	$(Q)$(GO_VET) ./...

#
# cleanup targets
#

# clean up binaries
clean-binaries:
	$(Q) rm -f $(BINARIES)

# clean up schema validator
clean-schema:
	$(Q)rm -f schema/validate

#
# test targets
#

# tests for go packages
test-gopkgs:
	$(Q)$(GO_TEST) ./...

# tests for CDI Spec JSON schema
test-schema: schemas
	$(Q)echo "Building in schema..."; \
	$(MAKE) -C schema test


#
# dependencies
#

schemas: $(wildcard schema/*.json)
