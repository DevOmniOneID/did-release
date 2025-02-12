#!/bin/bash

command="${PWD}/fabric-samples/bin/peer"
eval $command

if [ $? -eq 0 ]; then
	echo "installation checked"
else
	tar -xvf did-fabric-contract-1.0.0.tar.gz
	tar -xvf fabric-samples-1.4.4.tar.gz
	${PWD}/install-fabric.sh --fabric-version 2.5.11 binary
	${PWD}/install-fabric.sh --fabric-version 2.5.1 docker
	sleep 5
	${PWD}/fabric-samples/test-network/network.sh down
	sleep 5
fi

${PWD}/fabric-samples/test-network/network.sh up
sleep 5
${PWD}/fabric-samples/test-network/network.sh up -ca -s couchdb
sleep 5

command="sh ${PWD}/status.sh"
eval $command

if [ $? -eq 0 ]; then
echo "start success"
else
	${PWD}/fabric-samples/test-network/network.sh createChannel -c mychannel
	sleep 5
	${PWD}/fabric-samples/test-network/network.sh deployCC -c mychannel -ccn opendid -ccp ${PWD}/did-fabric-contract/source/did-fabric-contract -ccl go -ccs 1
fi

cp ${PWD}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/keystore/* ${PWD}/cert/sk
cp ${PWD}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/signcerts/* ${PWD}/cert/cert.pem
