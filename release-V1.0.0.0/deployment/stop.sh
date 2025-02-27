PID_FILE="orchestrator.pid"
if [[ ! -f "$PID_FILE" ]]; then
    echo "Error: PID file not found. Server may not be running."
    exit 1
fi

PID=$(cat "$PID_FILE")

echo "Stopping server (PID: $PID)..."


if kill "$PID" 2>/dev/null; then
    echo "Server stopped successfully."
else
    echo "Server did not stop. Killing process..."
    kill -9 "$PID"
    kill -9 $(ps --ppid $PID -o pid=) 2>/dev/null
fi

rm -f "$PID_FILE"
