FILTERLISTS=$(shell scripts/filterlists list FilterLists/data/FilterList.json)

all : data

data : data/iab/vendorlist.json data/aboutads-info/members.json ${FILTERLISTS}

data/iab/vendorlist.json :
	mkdir -p data/iab
	wget -O $@ https://vendorlist.consensu.org/vendorlist.json

data/aboutads-info/members.json :
	mkdir -p data/aboutads-info
	wget -O $@ http://optout.aboutads.info/naibc/resource/members/public

data/filterlists/% :
	scripts/filterlists fetch $@

clean : 
	true

pristine : clean
	rm -rf data

.PHONY : all clean pristine

