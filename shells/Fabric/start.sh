./fabric-samples/test-network/network.sh up -ca -s couchdb
./fabric-samples/test-network/network.sh createChannel -c mychannel
./fabric-samples/test-network/network.sh deployCC -c mychannel -ccn opendid -ccp ../../did-fabric-contract/source/did-fabric-contract -ccl go -ccs 1
