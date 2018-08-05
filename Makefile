all : li-ers.txt

vendorlist.json :
	wget https://vendorlist.consensu.org/vendorlist.json

li-ers.txt : vendorlist.json li-ers
	./li-ers < $< > $@

clean : 
	rm -f li-ers.txt

pristine : clean
	rm -f vendorlist.json

.PHONY : all clean pristine

