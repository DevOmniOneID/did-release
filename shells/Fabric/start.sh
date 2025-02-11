command="./fabric-samples/bin/peer"
eval $command

if [ $? -eq 0 ]; then
echo "installation checked"
else
./install-fabric.sh
sleep 5
./fabric-samples/test-network/network.sh down
sleep 5
fi

./fabric-samples/test-network/network.sh up -ca -s couchdb
./fabric-samples/test-network/network.sh createChannel -c mychannel
./fabric-samples/test-network/network.sh deployCC -c mychannel -ccn opendid -ccp ../../did-fabric-contract/source/did-fabric-contract -ccl go -ccs 1
sleep 5

cp ./fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/keystore/* ./cert/sk
cp ./fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/signcerts/cert.pem ./cert/cert.pem
