all : index.html

hooks : .git/hooks/pre-push

vendorlist.json :
	wget https://vendorlist.consensu.org/vendorlist.json

.git/hooks/% : Makefile
	echo "#!/bin/sh" > $@
	echo "make `basename $@`" >> $@
	chmod 755 $@

pre-push : deploy

pristine : clean
	rm -f vendorlist.json

.PHONY : all clean hooks pre-push

