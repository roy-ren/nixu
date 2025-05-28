# Like GNU `make`, but `just` rustier.
# https://just.systems/
# run `just` from this directory to see available commands

# Default command when 'just' is run without arguments
default:
  @just --list

# Update nix flake
[group('Main')]
update:
  nix flake update

# Activate the configuration
[group('Main')]
run:
  nix run

#lagoon darwin-rebuild switch --flake ./#lagoon --show-trace
[group('Main')]
lagoon:
  darwin-rebuild switch --flake ./#lagoon --show-trace

# nixos-rebuild switch --flake ./#nixpad --show-trace
[group('Main')]
nixpad:
  sudo nixos-rebuild switch --flake ./#nixpad --show-trace

# Lint nix files
[group('dev')]
lint:
  nix fmt

# Check nix flake
[group('dev')]
check:
  nix flake check --show-trace

# Manually enter dev shell
[group('dev')]
dev:
  nix develop

[group('dev')]
set-proxy:
    sudo mkdir -p /run/systemd/system/nix-daemon.service.d/
    echo -e "[Service]\nEnvironment=\"https_proxy=socks5h://localhost:1085\"" \
      | sudo tee /run/systemd/system/nix-daemon.service.d/override.conf
    sudo systemctl daemon-reload
    sudo systemctl restart nix-daemon
