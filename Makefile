DESIGN_DIR = $(PWD)/design
VERIFICATION_DIR = $(PWD)/verification

printenv:
	@echo "DESIGN_DIR=$(DESIGN_DIR)"
	@echo "VERIFICATION_DIR=$(VERIFICATION_DIR)"

.ONESHELL:
run:
	@export DESIGN_DIR=$(DESIGN_DIR)
	@export VERIFICATION_DIR=$(VERIFICATION_DIR)
	@qrun -f verification/program_counter_test/filelist.f -64 -vcddump dump.vcd

clean:
	@rm -rf qrun.log *.wlf *.vcd *.log transcript *.out
