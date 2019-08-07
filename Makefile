
.PHONY: all
all: R/err-composite.R \
     R/err-member.R \
     R/err-single.R \
     documentation

## Create 'err' files

R/err-composite.R : make_err.awk \
                    R/chk-composite.R
	awk -f $< R/chk-composite.R > $@

R/err-member.R : make_err.awk \
                 R/chk-member.R
	awk -f $< R/chk-member.R > $@

R/err-single.R : make_err.awk \
                 R/chk-single.R
	awk -f $< R/chk-single.R > $@


## Documentation

.PHONY: documentation
documentation:
	Rscript -e "devtools::document()"

.PHONY: clean
clean:
	rm -f R/err-composite.R
	rm -f R/err-member.R
	rm -f R/err-single.R 
