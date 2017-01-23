
Prerequisites:
* [DTDGenerator](http://saxon.sourceforge.net/dtdgen.html)
* [Apache FOP](https://xmlgraphics.apache.org/fop/download.html)

Generating the DTD schema:

`java -cp dtdgen.jar DTDGenerator cookbook.xml > cookbook.dtd`

Generating the PDF with XSLT transformations using Apache FOP:

`./fop -xml cookbook.xml -xsl cookbook.xsl -pdf cookbook.pdf`
