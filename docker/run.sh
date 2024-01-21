OUTPUT=output
HPCRUN=reusetracker-bin/bin/hpcrun
AMD="-e WP_AMD_REUSETRACKER -e IBS_OP@100000 -e AMD_L1_DATA_ACCESS@100000000"
LOG=short_rd_inc_log
rm -rf output *.hpcrun $LOG
PRG=reuse-invalidation-benchs/reuse-invalidation 
if [ ! -f $PRG ]; then
	gcc reuse-invalidation-benchs/reuse-invalidation.c -o $PRG -fopenmp
fi
HPCRUN_WP_REUSE_PROFILE_TYPE="TEMPORAL" HPCRUN_PROFILE_L3=false HPCRUN_WP_REUSE_BIN_SCHEME=4000,2 HPCRUN_WP_CACHELINE_INVALIDATION=true HPCRUN_WP_DONT_FIX_IP=true HPCRUN_WP_DONT_DISASSEMBLE_TRIGGER_ADDRESS=true /usr/bin/time -f "Elapsed Time , %e, system, %S, user, %U, memory, %M" $HPCRUN $AMD -o $OUTPUT $PRG -outer 10 -a0 20 -a1 1000 -b0 20 -b1 2000 -c0 20 -c1 4000 -d0 20 -d1 8000 -e0 20 -e1 16000 -inv 1 2>&1 | tee $LOG
HPCRUN_WP_REUSE_PROFILE_TYPE="SPATIAL" HPCRUN_PROFILE_L3=false HPCRUN_WP_REUSE_BIN_SCHEME=4000,2 HPCRUN_WP_CACHELINE_INVALIDATION=true HPCRUN_WP_DONT_FIX_IP=true HPCRUN_WP_DONT_DISASSEMBLE_TRIGGER_ADDRESS=true /usr/bin/time -f "Elapsed Time , %e, system, %S, user, %U, memory, %M" $HPCRUN $AMD -o $OUTPUT $PRG -outer 10 -a0 20 -a1 1000 -b0 20 -b1 2000 -c0 20 -c1 4000 -d0 20 -d1 8000 -e0 20 -e1 16000 -inv 1 2>&1 | tee $LOG
