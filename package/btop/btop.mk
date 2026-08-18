################################################################################
#
# btop
#
################################################################################

BTOP_VERSION = 1.2.13
BTOP_SITE = $(call github,aristocratos,btop,v$(BTOP_VERSION))
BTOP_LICENSE = Apache-2.0
BTOP_LICENSE_FILES = LICENSE

define BTOP_BUILD_CMDS
	$(TARGET_MAKE_ENV) env -u DEBUG $(MAKE) -C $(@D) \
		CXX="$(TARGET_CXX)" PLATFORM=linux ARCH=armv7 STRIP=true
endef

define BTOP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/btop $(TARGET_DIR)/usr/bin/btop
	$(INSTALL) -d $(TARGET_DIR)/usr/share/btop/themes
	cp -a $(@D)/themes/. $(TARGET_DIR)/usr/share/btop/themes/
endef

$(eval $(generic-package))
