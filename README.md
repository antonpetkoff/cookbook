
Prerequisites:
* [http://saxon.sourceforge.net/dtdgen.html](DTDGenerator)
* [https://xmlgraphics.apache.org/fop/download.html](Apache FOP)

Generating the DTD schema: `java -cp dtdgen.jar DTDGenerator cookbook.xml > cookbook.dtd`

Generating the PDF with XSLT transformations: `./apache-fop -xml cookbook.xml -xsl cookbook.xsl -pdf cookbook.pdf`
