run:
	@qrun -f verification/program_counter_test/filelist.f -64 -vcddump dump.vcd

clean:
	@rm -rf qrun.log *.wlf *.vcd *.log transcript *.out
