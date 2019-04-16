<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:imop="http://www.overheid.nl/imop/def#" xmlns:gml="http://www.opengis.net/gml/3.2">
    <xsl:output method="xml" version="1.0" indent="yes" encoding="utf-8"/>

    <xsl:template match="*">
        <xsl:element name="{name()}">
            <xsl:if test="local-name() eq 'Divisie'">
                <xsl:attribute name="id" select="generate-id()"/>
            </xsl:if>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>

    <!-- attributen verwerken -->

    <xsl:template match="@*">
        <xsl:copy/>
    </xsl:template>

</xsl:stylesheet>