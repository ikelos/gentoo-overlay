###############################################
# Linux settings
###############################################
LIBPCSC_HEADERS=`pkg-config --cflags libpcsclite`
LIBPCSC_LIB=`pkg-config --libs libpcsclite`
LIBUSB_HEADERS=`pkg-config --cflags libusb`
LIBUSB_LIB=`pkg-config --libs libusb`
LIBNFC_TYPE=so
LIBNFC_CFLAGS=-shared
LIBNFC_LINK=

###############################################
# General settings
###############################################
LIBNFC_LIBS=$(LIBPCSC_LIB) $(LIBUSB_LIB)
LIBNFC_PATH=..
VPATH=$(LIBNFC_PATH)

###############################################
# Compiler settings
###############################################
CC = gcc
LD = gcc
CFLAGS += $(LIBPCSC_HEADERS) $(LIBUSB_HEADERS)
# LDFLAGS = -fPIC -Wall -std=c99 -O4

OBJS = dev_pn531.o dev_acr122.o bitutils.o libnfc.o
HEADERS = dev_acr122.h bitutils.h defines.h libnfc.h
LIBNFC = libnfc.$(LIBNFC_TYPE)
EXES = anticol list simulate relay mftool

all: $(LIBNFC) $(EXES)

libnfc.$(LIBNFC_TYPE): $(OBJS)
	$(LD) $(LDFLAGS) -o $(LIBNFC) $(LIBNFC_CFLAGS) $(OBJS) $(LIBNFC_LIBS)

% : %.c $(LIBNFC)
	$(LD) $(LDFLAGS) -o $@ $< -L. -lnfc $(LIBNFC_LINK)

clean: 
	rm -f $(OBJS) $(LIBNFC) $(EXES)
