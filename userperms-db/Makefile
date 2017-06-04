FRAGMENTS = $(wildcard fragments/*.fragment.sql)

schema.sql: Makefile $(FRAGMENTS)
	echo "-- NOTICE: this file was machine generated; see Makefile!" > $@
	echo "-- "`date` >> $@
	echo "" >> $@
	for f in $(FRAGMENTS); do \
	  provides=`grep -- '-- *#provides' $$f | sed 's/.* //'`; \
	  for requires in `grep -- '-- *#requires' $$f | sed 's/.* //'`; do \
	    printf "$$requires\t$$provides\n"; \
	  done; \
	done | tsort | sed 's/$$/.fragment.sql/' | sed 's|^|fragments/|' | xargs cat >> $@



