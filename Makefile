# Переменные
PROTO_DIR = lib/generated/
DART_DIR = lib/generated/protobuf
PROTOC = protoc
DART_PLUGIN = ~/.pub-cache/bin/protoc-gen-dart

proto:
	@mkdir -p $(DART_DIR)
	$(PROTOC) \
		--dart_out=grpc:$(DART_DIR) \
		-I$(PROTO_DIR) \
		$(PROTO_DIR)/*.proto
	@echo "✅ Dart-код сгенерирован в $(DART_DIR)"

.PHONY: proto