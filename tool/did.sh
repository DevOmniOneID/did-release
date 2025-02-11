echo "============================Create TAS DID Document==============================="
java -jar did-cli-tool-server-1.0.0.jar did createDid -m tas.wallet -f tas.did -id did:omn:tas -ci did:omn:tas -mi assert -ai auth -ki keyagree -ii invoke -p
echo "============================================================================"

echo "============================Create Issuer DID Document==============================="
java -jar did-cli-tool-server-1.0.0.jar did createDid -m issuer.wallet -f issuer.did -id did:omn:issuer -ci did:omn:tas -mi assert -ai auth -ki keyagree -p
echo "============================================================================"

echo "============================Create Verifier DID Document==============================="
java -jar did-cli-tool-server-1.0.0.jar did createDid -m verifier.wallet -f verifier.did -id did:omn:verifier -ci did:omn:tas -mi assert -ai auth -ki keyagree -p
echo "============================================================================"

echo "============================Create CAS DID Document==============================="
java -jar did-cli-tool-server-1.0.0.jar did createDid -m cas.wallet -f cas.did -id did:omn:cas -ci did:omn:tas -mi assert -ai auth -ki keyagree -p
echo "============================================================================"

echo "============================Create WalletServer DID Document==============================="
java -jar did-cli-tool-server-1.0.0.jar did createDid -m wallet.wallet -f wallet.did -id did:omn:wallet -ci did:omn:tas -mi assert -ai auth -ki keyagree -p
echo "============================================================================"