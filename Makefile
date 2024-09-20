.PHONY: init

DISK_DIR=disk
DB_DATA_DIR=$(DISK_DIR)/db_data
CONF_DIR=$(DISK_DIR)/conf
LOGS_DIR=$(DISK_DIR)/logs
PERMISSIONS=777

init:
	mkdir -p $(DB_DATA_DIR)
	mkdir -p $(CONF_DIR)
	mkdir -p $(LOGS_DIR)
	chmod -R $(PERMISSIONS) $(DB_DATA_DIR)
	chmod -R $(PERMISSIONS) $(CONF_DIR)
	chmod -R $(PERMISSIONS) $(LOGS_DIR)