#!/usr/bin/env bash
set -ex

go -C ../../ build -o ./bin ./go/cmd/vtbackup
../../bin/vtbackup \
    --logtostderr=true \
    --initial_backup=false \
    --allow_first_backup=true \
    --backup_storage_compress=false \
    --backup_storage_implementation=file \
    --builtinbackup-include-binlogs=true \
    --file_backup_storage_root=vtdataroot/backups \
    --topo_implementation=etcd2 \
    --topo_global_server_address=localhost:2379 \
    --topo_global_root=/vitess/global \
    --init_keyspace=commerce \
    --init_shard=0 \
    --pprof-http
