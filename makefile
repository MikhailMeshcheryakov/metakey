INSTALL=install
PREFIX=/usr

TARGET := metakey

CFLAGS += -Wall
CFLAGS += `pkg-config --cflags xtst x11`
LDFLAGS += `pkg-config --libs xtst x11`
LDFLAGS += -pthread

$(TARGET): xcape.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

install:
	$(INSTALL) -Dm 755 $(TARGET) $(DESTDIR)$(PREFIX)/bin/$(TARGET)
	$(INSTALL) -Dm 644 metakey.desktop $(DESTDIR)$(PREFIX)/share/autostart/metakey.desktop

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(TARGET)
	rm -f $(DESTDIR)$(PREFIX)/share/autostart/metakey.desktop

clean:
	if [ -e $(TARGET) ]; then rm $(TARGET); fi

.PHONY: clean
