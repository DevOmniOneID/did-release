PID_FILE="orchestrator.pid"

if [[ ! -f "$PID_FILE" ]]; then
    echo "Error: PID file not found. Server may not be running."
    exit 1
fi

PID=$(cat "$PID_FILE")

echo "Stopping server (PID: $PID)..."
kill "$PID"

sleep 2

if ps -p "$PID" > /dev/null; then
    echo "⚠Server did not stop. Killing process..."
    kill -9 "$PID"
else
    echo "Server stopped successfully."
fi

rm -f "$PID_FILE"