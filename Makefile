# Bootstrap

.PHONY: bootstrap
bootstrap: pod install

# Tools

.PHONY: brew-install
brew-install:
	brew install git-flow swiftlint