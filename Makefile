default: brew mint

.PHONY: brew mint lint

brew:
	brew install mint

mint:
	mint bootstrap

lint:
	mint run swiftformat . && mint run swiftlint

open: default
	open EmomTimer.xcodeproj
