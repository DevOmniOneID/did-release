echo "============================Create TAS Wallet==============================="
java -jar did-cli-tool-server-1.0.0.jar walletManager createWallet -m tas.wallet -p
echo "============================================================================"

echo "============================Create Issuer Wallet==============================="
java -jar did-cli-tool-server-1.0.0.jar walletManager createWallet -m issuer.wallet -p
echo "============================================================================"

echo "============================Create Verifier Wallet==============================="
java -jar did-cli-tool-server-1.0.0.jar walletManager createWallet -m verifier.wallet -p
echo "============================================================================"

echo "============================Create CAS Wallet==============================="
java -jar did-cli-tool-server-1.0.0.jar walletManager createWallet -m cas.wallet -p
echo "============================================================================"

echo "============================Create WalletServer Wallet==============================="
java -jar did-cli-tool-server-1.0.0.jar walletManager createWallet -m wallet.wallet -p
echo "============================================================================"


echo "============================Add TAS Wallet Key==============================="
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m tas.wallet -i assert -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m tas.wallet -i auth -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m tas.wallet -i keyagree -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m tas.wallet -i invoke -t 1 -p
echo "============================================================================"

echo "============================Add Issuer Wallet Key==============================="
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m issuer.wallet -i assert -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m issuer.wallet -i auth -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m issuer.wallet -i keyagree -t 1 -p
echo "============================================================================"

echo "============================Add Verifier Wallet Key==============================="
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m verifier.wallet -i assert -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m verifier.wallet -i auth -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m verifier.wallet -i keyagree -t 1 -p
echo "============================================================================"

echo "============================Add CAS Wallet Key==============================="
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m cas.wallet -i assert -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m cas.wallet -i auth -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m cas.wallet -i keyagree -t 1 -p
echo "============================================================================"

echo "============================Add WalletServer Wallet Key==============================="
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m wallet.wallet -i assert -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m wallet.wallet -i auth -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m wallet.wallet -i keyagree -t 1 -p
echo "============================================================================"