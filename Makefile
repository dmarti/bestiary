all : li-ers.txt

data/iab/vendorlist.json :
	mkdir -p data/iab
	wget -O $@ https://vendorlist.consensu.org/vendorlist.json

li-ers.txt : data/iab/vendorlist.json scripts/li-ers
	./li-ers < $< > $@

clean : 
	rm -f li-ers.txt

pristine : clean
	rm -rf data

.PHONY : all clean pristine

