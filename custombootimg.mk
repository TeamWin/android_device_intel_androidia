DEVICE_FOLDER := device/intel/androidia/


$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo ----- Creating ramdisk ------
	rm -f $(TARGET_RECOVERY_ROOT_OUT)/sbin/healthd
	cp $(DEVICE_FOLDER)/recovery/healthd $(TARGET_RECOVERY_ROOT_OUT)/sbin/healthd
	rm -f $(TARGET_RECOVERY_ROOT_OUT)/init
	cp $(DEVICE_FOLDER)/recovery/init $(TARGET_RECOVERY_ROOT_OUT)/init
	rm -f $(TARGET_RECOVERY_ROOT_OUT)/sepolicy
	cp $(DEVICE_FOLDER)/recovery/sepolicy $(TARGET_RECOVERY_ROOT_OUT)/sepolicy
	chmod 750 $(TARGET_RECOVERY_ROOT_OUT)/init.rc
	(cd $(TARGET_RECOVERY_ROOT_OUT) && find * | sort | cpio -o -H newc) | gzip > $(recovery_ramdisk)
	@echo ----- Making recovery image ------
	$(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	@echo ----- Made recovery image -------- $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)


$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
