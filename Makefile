# Переменные
PROTO_DIR = lib/generated/
DART_DIR = lib/generated/protobuf
PROTOC = protoc
DART_PLUGIN = ~/.pub-cache/bin/protoc-gen-dart
PROTO_FILES := $(wildcard $(PROTO_DIR)/*.proto)

proto-gen:
	@mkdir -p $(DART_DIR)
	$(PROTOC) \
		--dart_out=grpc:$(DART_DIR) \
		-I$(PROTO_DIR) \
		$(PROTO_DIR)/*.proto
	@echo "✅ Dart-код сгенерирован в $(DART_DIR)"


# Установка eazyP (требуется Go)
install-easyp:
	go install github.com/easyp-tech/easyp/cmd/easyp@latest

# Линтинг .proto файлов через eazyP
proto-lint:
	@echo "🔍 Linting .proto files with eazyP..."
	@easyp lint $(PROTO_DIR)/trainer.proto

#proto-lint:
#	@echo "🔍 Linting .proto files with eazyP..."
#	@cd $(PROTO_DIR) lint -config=. --path=.

# Установка зависимостей (protoc, Dart-плагин)
setup:
	@echo "🛠 Setting up protoc and Dart plugin..."
	@dart pub global activate protoc_plugin
	@which protoc || (echo "❌ Error: protoc not installed. Install it first!" && exit 1)

# Основная цель: проверить и сгенерировать код
proto: proto-lint proto-gen

.PHONY: install-easyp proto-lint proto-gen setup proto proto