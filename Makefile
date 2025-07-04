# OctoDNS Makefile for zone management
# Each zone target depends on its corresponding zone file

# Default target
.PHONY: all
all: sync

.PHONY: sync
sync: zones/*.yaml zones
	octodns-sync --config-file config.yaml --doit
    
# Zone targets
.PHONY: shortrib.io
shortrib.io: zones/shortrib.io.yaml
	octodns-sync --config-file config.yaml --doit shortrib.io.

.PHONY: shortrib.dev
shortrib.dev: zones/shortrib.dev.yaml
	octodns-sync --config-file config.yaml --doit shortrib.dev.

.PHONY: shortrib.app
shortrib.app: zones/shortrib.app.yaml
	octodns-sync --config-file config.yaml --doit shortrib.app.

.PHONY: shortrib.run
shortrib.run: zones/shortrib.run.yaml
	octodns-sync --config-file config.yaml --doit shortrib.run.

.PHONY: shortrib.life
shortrib.life: zones/shortrib.life.yaml
	octodns-sync --config-file config.yaml --doit shortrib.life.

.PHONY: shortrib.net
shortrib.net: zones/shortrib.net.yaml
	octodns-sync --config-file config.yaml --doit shortrib.net.

.PHONY: lab.shortrib.net
lab.shortrib.net: zones/lab.shortrib.net.yaml
	octodns-sync --config-file config.yaml --doit lab.shortrib.net.

# Dry run targets (preview changes without applying)
.PHONY: dry-run
dry-run: zones/*.yaml zones
	octodns-sync --config-file config.yaml 
    
.PHONY: dry-run-shortrib.io
dry-run\:shortrib.io: zones/shortrib.io.yaml
	octodns-sync --config-file config.yaml shortrib.io.

.PHONY: dry-run-shortrib.dev
dry-run\:shortrib.dev: zones/shortrib.dev.yaml
	octodns-sync --config-file config.yaml shortrib.dev.

.PHONY: dry-run-shortrib.app
dry-run\:shortrib.app: zones/shortrib.app.yaml
	octodns-sync --config-file config.yaml shortrib.app.

.PHONY: dry-run-shortrib.run
dry-run\:shortrib.run: zones/shortrib.run.yaml
	octodns-sync --config-file config.yaml shortrib.run.

.PHONY: dry-run-shortrib.life
dry-run\:shortrib.life: zones/shortrib.life.yaml
	octodns-sync --config-file config.yaml shortrib.life.

.PHONY: dry-run-shortrib.net
dry-run\:shortrib.net: zones/shortrib.net.yaml
	octodns-sync --config-file config.yaml shortrib.net.

.PHONY: dry-run-lab.shortrib.net
dry-run\:lab.shortrib.net: zones/lab.shortrib.net.yaml
	octodns-sync --config-file config.yaml lab.shortrib.net.

# Dry run targets (preview changes without applying)
.PHONY: force
force: zones/*.yaml zones
	octodns-sync --config-file config.yaml --doit --force
    
.PHONY: force-shortrib.io
force\:shortrib.io: zones/shortrib.io.yaml
	octodns-sync --config-file config.yaml shortrib.io. --doit --force

.PHONY: force-shortrib.dev
force\:shortrib.dev: zones/shortrib.dev.yaml
	octodns-sync --config-file config.yaml shortrib.dev. --doit --force

.PHONY: force-shortrib.app
force\:shortrib.app: zones/shortrib.app.yaml
	octodns-sync --config-file config.yaml shortrib.app. --doit --force

.PHONY: force-shortrib.run
force\:shortrib.run: zones/shortrib.run.yaml
	octodns-sync --config-file config.yaml shortrib.run. --doit --force

.PHONY: force-shortrib.life
force\:shortrib.life: zones/shortrib.life.yaml
	octodns-sync --config-file config.yaml shortrib.life. --doit --force

.PHONY: force-shortrib.net
force\:shortrib.net: zones/shortrib.net.yaml
	octodns-sync --config-file config.yaml shortrib.net. --doit --force

.PHONY: force-lab.shortrib.net
force\:lab.shortrib.net: zones/lab.shortrib.net.yaml
	octodns-sync --config-file config.yaml lab.shortrib.net. --doit --force

# Utility targets
.PHONY: validate
validate:
	octodns-validate --config-file config.yaml

.PHONY: dump
dump:
	octodns-dump --config-file dump-config.yaml --output-dir zones.backup.$$(date +%Y%m%d-%H%M%S) '*' yaml

.PHONY: clean
clean:
	rm -rf zones.backup.*

.PHONY: help
help:
	@echo "OctoDNS Makefile targets:"
	@echo "  all                - Sync all zones"
	@echo "  <zone>             - Sync specific zone (e.g., make shortrib.io)"
	@echo "  dry-run            - Preview changes for all zones without applying"
	@echo "  dry-run-<zone>     - Preview changes for specific zone"
	@echo "  validate           - Validate configuration file"
	@echo "  dump               - Backup all zones to timestamped directory"
	@echo "  clean              - Remove backup directories"
	@echo "  help               - Show this help message"
