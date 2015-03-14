ifneq ($(filter androidia,$(TARGET_DEVICE)),)
    include $(all-subdir-makefiles)
endif
