LITECOIND=/opt/bin/litecoind
LITECOINGUI=/opt/bin/litecoin-qt
LITECOINCLI=/opt/bin/litecoin-cli
B1_FLAGS=
B2_FLAGS=
B1=-datadir=1 $(B1_FLAGS)
B2=-datadir=2 $(B2_FLAGS)
BLOCKS=1
ADDRESS=
AMOUNT=
ACCOUNT=

start:
	$(LITECOIND) $(B1) -daemon
	$(LITECOIND) $(B2) -daemon

start-gui:
	$(LITECOINGUI) $(B1) &
	$(LITECOINGUI) $(B2) &

generate:
	$(LITECOINCLI) $(B1) generate $(BLOCKS)

getinfo:
	$(LITECOINCLI) $(B1) getinfo
	$(LITECOINCLI) $(B2) getinfo

sendfrom1:
	$(LITECOINCLI) $(B1) sendtoaddress $(ADDRESS) $(AMOUNT)

sendfrom2:
	$(LITECOINCLI) $(B2) sendtoaddress $(ADDRESS) $(AMOUNT)

address1:
	$(LITECOINCLI) $(B1) getnewaddress $(ACCOUNT)

address2:
	$(LITECOINCLI) $(B2) getnewaddress $(ACCOUNT)

stop:
	$(LITECOINCLI) $(B1) stop
	$(LITECOINCLI) $(B2) stop

clean:
	rm -rf 1/regtest/*
	rm -rf 2/regtest/*
