GITHUB_REPO="DevOmniOneID/did-orchestrator-server"
TAG="V1.0.0"

OCHESTRATOR_JAR_FILE="did-orchestrator-server-1.0.0.jar"
CONFIG_PATH="configs/application.yml"
LOG_DIR="logs"
LOG_FILE="$LOG_DIR/orchestrator.log"
PID_FILE="orchestrator.pid"

JAR_NAMES=("did-api-server-1.0.0.jar" "did-demo-server-1.0.0.jar" "did-issuer-server-1.0.0.jar" "did-ta-server-1.0.0.jar" "did-ca-server-1.0.0.jar" "did-verifier-server-1.0.0.jar" "did-wallet-server-1.0.0.jar")
JAR_PATHS=("jars/API" "jars/Demo" "jars/Issuer" "jars/TAS" "jars/CAS" "jars/Verifier" "jars/WalletService")

fail_flag=0

download_jar() {
    local jar_name="$1"
    local download_path="$2"
    local jar_file="$download_path/$jar_name"

    if [[ -f "$jar_file" ]]; then
        echo "$jar_file already exists. Skipping download."
        return
    fi

    echo "🔍 Fetching release information for $jar_name..."

    ASSET_URL=$(curl -s "https://api.github.com/repos/$GITHUB_REPO/releases/tags/$TAG" | grep "browser_download_url" | grep "$jar_name" | cut -d '"' -f 4)

    if [[ -z "$ASSET_URL" ]]; then
        echo "Error: Failed to find $jar_name in GitHub release."
        fail_flag=1
        return
    fi

    mkdir -p "$download_path"

    echo "Downloading $jar_name to $download_path..."
    curl -L --output "$jar_file" "$ASSET_URL"

    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to download $jar_name."
        fail_flag=1
        return
    fi

    echo "Download complete: $jar_file"
}

for i in "${!JAR_NAMES[@]}"; do
    download_jar "${JAR_NAMES[$i]}" "${JAR_PATHS[$i]}"
done

wait

if [[ $fail_flag -eq 1 ]]; then
    echo "Some JAR files failed to download. Exiting..."
    exit 1
fi

echo "All JAR files are ready."

echo "Running orchestrator..."

if [ ! -d "$LOG_DIR" ]; then
  mkdir -p "$LOG_DIR"
fi

chmod +x "$OCHESTRATOR_JAR_FILE"

nohup java -jar "$OCHESTRATOR_JAR_FILE" --spring.config.location="$CONFIG_PATH" > "$LOG_FILE" 2>&1 &

echo $! > "$PID_FILE"

sleep 1

tail -f "$LOG_FILE"


echo "Server started successfully!"
