<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4-portrait"
              page-height="29.7cm" page-width="21.0cm" margin="2cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="A4-portrait">
        <fo:flow flow-name="xsl-region-body">
          <fo:block font-family="Calibri" linefeed-treatment="preserve">
            Hello, <xsl:value-of select="cookbook/recipe/title"/>!

            <xsl:apply-templates select="cookbook/recipe"/>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

  <xsl:template match="cookbook/recipe">
    <xsl:apply-templates select="title" />
    <xsl:apply-templates select="region" />
    <xsl:apply-templates select="ingredients" />
    <xsl:apply-templates select="preparation" />
    <xsl:apply-templates select="comment" />
    <xsl:apply-templates select="nutrition" />
    ----
  </xsl:template>

  <xsl:template match="title">
    Име на рецептата: <xsl:value-of select="." />
  </xsl:template>

  <xsl:template match="region">
    Регион: <xsl:value-of select="." />
  </xsl:template>

  <xsl:template match="ingredients">
    Съставки: <xsl:apply-templates select="ingredient" />
  </xsl:template>

  <xsl:template match="ingredient">
    • <xsl:value-of select="@amount" />
    <xsl:text> </xsl:text>
    <xsl:value-of select="@unit" />
    <xsl:text> </xsl:text>
    <xsl:value-of select="@name" />
  </xsl:template>

  <xsl:template match="preparation">
    Приготвяне: <xsl:apply-templates select="step" />
  </xsl:template>

  <xsl:template match="step">
    <xsl:value-of select="." /><xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="comment">
    Коментар: <xsl:value-of select="." />
  </xsl:template>

  <xsl:template match="nutrition">
    Медицински параметри:
    • калории: <xsl:value-of select="@calories" />
    • въглехидрати: <xsl:value-of select="@carbohydrates" />
    • протеини: <xsl:value-of select="@protein" />
    • мазнини: <xsl:value-of select="@fat" />
  </xsl:template>

</xsl:stylesheet>
