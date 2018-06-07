### Setting up the environment (DO NOT MODIFY THESE LINES) ###
ifndef FRAMAC_SHARE                                          #
FRAMAC_SHARE := $(shell frama-c-config -print-share-path)    #
endif                                                        #
ifndef FRAMAC_LIBDIR                                         #
FRAMAC_LIBDIR := $(shell frama-c-config -print-libpath)      #
endif                                                        #
PLUGIN_DIR ?=.                                               #
##############################################################

# PLUGIN_NAME must not contain hyphens or spaces
PLUGIN_NAME = Hello

# List of .cmo files (usually one per .ml)
PLUGIN_CMO = hello_options hello_print hello_run

# Test directories must be below $PLUGIN_DIR/tests
PLUGIN_TESTS_DIRS := hello

# After everything is set, include Frama-C's Makefile for plug-ins
include $(FRAMAC_SHARE)/Makefile.dynamic

### Note: if your plug-in has a [Makefile.in], uncomment the lines below.
#
#ifeq ("$(FRAMAC_INTERNAL)","yes")
#CONFIG_STATUS_DIR=$(FRAMAC_SRC)
#else
#CONFIG_STATUS_DIR=.
#endif
#$(Hello_DIR)/Makefile: $(Hello_DIR)/Makefile.in \
#                       $(CONFIG_STATUS_DIR)/config.status
#	cd $(CONFIG_STATUS_DIR) && ./config.status --file $@
