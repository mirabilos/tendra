# $Id$

TIDY= tidy
XMLLINT= xmllint
XSLTPROC= xsltproc

STYLEDIR= ../../../style

TIDYFLAGS= --doctype transitional\
	   --output-xhtml yes\
	   -im -wrap 78 -utf8

XMLLINTFLAGS= --noout --postvalid --xinclude

XSLTPROCFLAGS=--stringparam html.stylesheet ${STYLEDIR}/docbook.css \
	       --xinclude

DBXSL_XHTML=`echo $(STYLEDIR) | rev | cut -f 2- -d / | rev `/xsl/tendra-docbook.xsl

# Typical BSD and pkgsrc locations.
PREFIX=	/usr/local/share /usr/pkg/share
.for prefix in ${PREFIX}
. if exists(${prefix}/xsl/docbook/manpages/docbook.xsl)
DBXSL_MAN= ${prefix}/xsl/docbook/manpages/docbook.xsl
. endif
.endfor

all: ${DOC}.html $(MAN)

${DOC}.html: ${DOC}.xml
	${XSLTPROC} ${XSLTPROCFLAGS} -o ${.TARGET} ${DBXSL_XHTML} ${DOC}.xml
	#${TIDY} ${TIDYFLAGS} ${.TARGET}

${MAN}: ${MAN}.xml
	${XSLTPROC} ${XSLTPROCFLAGS} -o ${.TARGET} ${DBXSL_MAN} ${MAN}.xml

clean:
	rm -f ${DOC}.html ${MAN}

lint: ${DOC}.xml
	${XMLLINT} ${XMLLINTFLAGS} ${DOC}.xml

