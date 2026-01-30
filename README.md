# Custosa Homebrew Tap

Prompt Injection Protection for OpenClaw/Moltbot

## Installation

```bash
brew tap uditanshutomar/custosaXopenclaw
brew install custosa
```

## Usage

```bash
# Run the installation wizard
custosa install

# Reconfigure Telegram integration
custosa install --reconfigure-telegram

# Check status
custosa status

# View logs
custosa logs
```

## Release Flow

1. Update version in `CustosaXopenclaw` repo (`pyproject.toml` and `custosa/__init__.py`)
2. Create a GitHub release tag (e.g., `1.1.0`)
3. Get the SHA256 of the release tarball:
   ```bash
   curl -sL "https://github.com/uditanshutomar/CustosaXopenclaw/archive/refs/tags/VERSION.tar.gz" | shasum -a 256
   ```
4. Update `Formula/custosa.rb` with new version and sha256
