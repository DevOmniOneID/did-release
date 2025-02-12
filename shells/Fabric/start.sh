#!/bin/bash

command="${PWD}/fabric-samples/bin/peer"
eval $command

if [ $? -eq 0 ]; then
echo "installation checked"
else
${PWD}/install-fabric.sh
sleep 5
fi

${PWD}/fabric-samples/test-network/network.sh down
${PWD}/fabric-samples/test-network/network.sh up -ca -s couchdb
${PWD}/fabric-samples/test-network/network.sh createChannel -c mychannel
${PWD}/fabric-samples/test-network/network.sh deployCC -c mychannel -ccn opendid -ccp ../../did-fabric-contract/source/did-fabric-contract -ccl go -ccs 1
sleep 5

cp ${PWD}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/keystore/* ${PWD}/cert/sk
cp ${PWD}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/signcerts/cert.pem ${PWD}/cert/cert.pem
