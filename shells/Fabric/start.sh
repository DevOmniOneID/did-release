command="./fabric-samples/bin/peer"
eval $command

if [ $? -eq 0 ]; then
echo "installation checked"
else
./install-fabric.sh d s b
sleep 5
fi

./fabric-samples/test-network/network.sh up -ca -s couchdb
./fabric-samples/test-network/network.sh createChannel -c mychannel
./fabric-samples/test-network/network.sh deployCC -c mychannel -ccn opendid -ccp ../../did-fabric-contract/source/did-fabric-contract -ccl go -ccs 1
