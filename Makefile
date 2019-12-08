dir_out := out

all: $(dir_out) hashGenerator stage2 stage3

$(dir_out):
	@mkdir -p $(dir_out)

.PHONY: hashGenerator
hashGenerator:
	@cc hashGenerator.c -o hashGenerator

.PHONY: stage2
stage2: $(dir_out) hashGenerator
	@$(MAKE) -C payload_stage2
	@./hashGenerator $(dir_out)/payload_stage2.bin

.PHONY: stage3
stage3: $(dir_out) hashGenerator
	@$(MAKE) -C payload_stage3
	@./hashGenerator $(dir_out)/payload_stage3.bin

clean:
	@$(MAKE) -C payload_stage2 clean
	@$(MAKE) -C payload_stage3 clean
	@rm -rf $(dir_out) hashGenerator hashGenerator.exe
