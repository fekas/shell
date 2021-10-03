#!/bin/bash

if [ $# -lt 1 ]
then
	echo "No Args Input"
	exit ;
fi

case $1 in
"start")
	echo "=============启动Hadoop集群============="

	echo "-----------启动hdfs-------------"
	ssh hadoop102 "/opt/module/hadoop-3.1.3/sbin/start-dfs.sh"
	echo "-----------启动yarn-------------"
	ssh hadoop103 "/opt/module/hadoop-3.1.3/sbin/start-yarn.sh"
	echo "-----------启动historyserver-----------"
	ssh hadoop102 "/opt/module/hadoop-3.1.3/bin/mapred --daemon start historyserver"
;;
"stop")
	echo "=============关闭Hadoop集群============="

        echo "-----------关闭historyserver-------------"
        ssh hadoop102 "/opt/module/hadoop-3.1.3/bin/mapred --daemon stop historyserver"
        echo "-----------关闭yarn-------------"
        ssh hadoop103 "/opt/module/hadoop-3.1.3/sbin/stop-yarn.sh"
        echo "-----------关闭hdfs-----------"
        ssh hadoop102 "/opt/module/hadoop-3.1.3/sbin/stop-dfs.sh"
;;
*)
	echo "Input Args Error"
;;
esac
