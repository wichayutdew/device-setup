echo "Add Homebrew to Fish"
fish_add_path /opt/homebrew/bin/

# Install Rust if not present
if not command -v rustup &> /dev/null
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
end
