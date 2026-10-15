#!/usr/bin/env bash
set -ex

go -C ../../ build -o bin/ -v \
  ./go/cmd/vtadmin \
  ./go/cmd/vtctld \
  ./go/cmd/vtgate \
  ./go/cmd/vtorc \
  ./go/cmd/vttablet \
  ./go/cmd/vtctldclient \
  ./go/cmd/mysqlctl \
  ./go/cmd/mysqlctld

rm -rfv ./vtdataroot

./101_initial_cluster.sh
#./201_customer_tablets.sh
#./202_move_tables.sh
#./203_switch_reads.sh
#./204_switch_writes.sh
#./205_clean_commerce.sh
#./301_customer_sharded.sh
#./302_new_shards.sh
#./303_reshard.sh
#./304_switch_reads.sh
#./305_switch_writes.sh
#./306_down_shard_0.sh
#./307_delete_shard_0.sh
./401_backup_small.sh
#./401_backup.sh
./402_list_backup_small.sh
#./402_list_backup.sh
#403_restore_from_backup.sh
#501_teardown.sh

