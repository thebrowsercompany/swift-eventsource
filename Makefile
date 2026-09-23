build:
	swift build

clean:
	swift clean

test:
	swift test

TEMP_TEST_OUTPUT=/tmp/sse-contract-test-service.log

build-contract-tests:
	cd ContractTestService && swift build

start-contract-test-service:
	./ContractTestService/.build/debug/contract-test-service

start-contract-test-service-bg:
	echo "Test service output will be captured in $(TEMP_TEST_OUTPUT)"
	make start-contract-test-service >$(TEMP_TEST_OUTPUT) 2>&1 &

run-contract-tests:
	curl -fsSL https://raw.githubusercontent.com/launchdarkly/sse-contract-tests/f76cb45d7cc7737d32d061f6e5995eef6fe8b964/downloader/run.sh \
		| VERSION=v2.32.0 PARAMS="-url http://localhost:8000 -debug -stop-service-at-end -skip 'basic parsing/large message in one chunk' -skip 'basic parsing/large message in two chunks'" sh

contract-tests: build-contract-tests start-contract-test-service-bg run-contract-tests

.PHONY: build clean test build-contract-tests start-contract-test-service run-contract-tests contract-tests
