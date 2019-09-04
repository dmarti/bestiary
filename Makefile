FILTERLISTS=$(shell scripts/filterlists list FilterLists/data/FilterList.json)

all : data

data : data/iab/vendorlist.json data/aboutads-info/members.json ${FILTERLISTS} FilterLists/data/FilterList.json

FilterLists/data/FilterList.json :
	git submodule init
	git submodule update

data/iab/vendorlist.json :
	mkdir -p data/iab
	wget -O $@ https://vendorlist.consensu.org/vendorlist.json

data/aboutads-info/members.json :
	mkdir -p data/aboutads-info
	wget -O $@ http://optout.aboutads.info/naibc/resource/members/public

data/filterlists/% : FilterLists/data/FilterList.json
	scripts/filterlists fetch $@

clean : 
	true

pristine : clean
	rm -rf data

.PHONY : all clean pristine

