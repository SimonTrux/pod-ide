# Pod - IDE

Work in progress to carry aroung full IDE nvim based config in a container.

## Requirements

- Linux
- podman
- make
- internet connexion.

## Usage

```bash
# to build podman image with LSP configued neo vim
make build

# to run it on current repertoire
make run

# use alias later on anywhere on
ide text_file
```

### Remaining to do

- Attempt as a slimmer image with multi stage build.
- Make container persistent and attach for smaller cpu footprint.
- Endpoint as nvim or in bash ?

# Test signed commit
