#!/bin/bash

command="${PWD}/fabric-samples/bin/peer"
eval $command

if [ $? -eq 0 ]; then
echo "installation checked"
else
${PWD}/install-fabric.sh --fabric-version 2.5.11 binary
${PWD}/install-fabric.sh --fabric-version 2.5.1 docker
sleep 10
fi

${PWD}/fabric-samples/test-network/network.sh down
sleep 10
${PWD}/fabric-samples/test-network/network.sh up -ca -s couchdb
sleep 10
${PWD}/fabric-samples/test-network/network.sh createChannel -c mychannel
${PWD}/fabric-samples/test-network/network.sh deployCC -c mychannel -ccn opendid -ccp ../../did-fabric-contract/source/did-fabric-contract -ccl go -ccs 1
sleep 10

cp ${PWD}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/keystore/* ${PWD}/cert/sk
cp ${PWD}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/signcerts/cert.pem ${PWD}/cert/cert.pem
