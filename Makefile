all : li-ers.txt

data : data/iab/vendorlist.json data/aboutads-info/members.json

data/iab/vendorlist.json :
	mkdir -p data/iab
	wget -O $@ https://vendorlist.consensu.org/vendorlist.json

data/aboutads-info/members.json :
	mkdir -p data/aboutads-info
	wget -O $@ http://optout.aboutads.info/naibc/resource/members/public

li-ers.txt : data/iab/vendorlist.json scripts/li-ers
	./li-ers < $< > $@

clean : 
	rm -f li-ers.txt

pristine : clean
	rm -rf data

.PHONY : all clean pristine

