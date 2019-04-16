<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="#all">
    <xsl:output method="xhtml" encoding="UTF-8" indent="no" omit-xml-declaration="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

    <!-- Koppenstructuur wordt vastgelegd in TOC -->

    <xsl:variable name="TOC">
        <xsl:for-each select=".//Divisie/Kop">
            <xsl:element name="heading">
                <xsl:attribute name="id" select="generate-id(.)"/>
                <xsl:attribute name="level" select="count(ancestor::Divisie)"/>
                <xsl:attribute name="number" select="count(.|../preceding-sibling::Divisie/Kop)"/>
                <xsl:copy-of select="./node()"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:variable>

    <!-- document -->

    <xsl:template match="/">
        <!-- maak de index -->
        <xsl:call-template name="index"/>
        <!-- maak de pagina's -->
        <xsl:call-template name="pages"/>
    </xsl:template>

    <!-- index -->

    <xsl:template name="index">
        <html>
            <head>
                <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
                <meta name="viewport" id="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui"/>
                <link rel="stylesheet" type="text/css" href="index.css"/>
                <title>
                    <xsl:apply-templates select=".//Tekst/Kop/Opschrift/node()"/>
                </title>
            </head>
            <body>
                <div class="page">
                    <div class="sidebar">
                        <div class="logo">
                            <img src="media/logo.svg" alt="logo" height="44"/>
                        </div>
                        <div class="menu">
                            <xsl:for-each-group select="$TOC/*" group-starting-with="heading[number(@level) eq 1]|appendix[1]">
                                <ul class="mainmenu">
                                    <li>
                                        <xsl:choose>
                                            <xsl:when test="self::heading">
                                                <xsl:variable name="filename" select="concat('pages/page_',fn:format-number(./@number,'00'),'.html')"/>
                                                <p><a href="{$filename}" target="content"><xsl:apply-templates select="./Opschrift/node()"/></a></p>
                                                <xsl:if test="current-group()/self::heading[number(@level) eq 2]">
                                                    <ul class="submenu">
                                                        <xsl:for-each select="current-group()/self::heading[number(@level) eq 2]">
                                                            <li><p><a href="{concat($filename,'#',@id)}" target="content"><xsl:apply-templates select="./Opschrift/node()"/></a></p></li>
                                                        </xsl:for-each>
                                                    </ul>
                                                </xsl:if>
                                            </xsl:when>
                                        </xsl:choose>
                                    </li>
                                </ul>
                            </xsl:for-each-group>
                        </div>
                    </div>
                    <div class="content">
                        <div class="title"><p class="title"><xsl:value-of select=".//Tekst/Kop/Opschrift/node()"/></p></div>
                        <div class="target"><iframe name="content" src="pages/page_01.html"/></div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- pages -->

    <xsl:template name="pages">
        <!-- maak de hoofdstukken in de omschrijving -->
        <xsl:for-each select=".//Tekst/Divisie">
            <xsl:variable name="filename" select="concat('pages/page_',fn:format-number(position(),'00'),'.html')"/>
            <xsl:result-document href="{$filename}" method="xhtml">
                <html>
                    <head>
                        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
                        <link rel="stylesheet" type="text/css" href="custom.css"/>
                        <title>
                            <xsl:apply-templates select="./Kop[1]/Opschrift/node()"/>
                        </title>
                    </head>
                    <body>
                        <xsl:apply-templates select="."/>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <!-- algemeen -->

    <xsl:template match="*">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="./node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="al">
        <p><xsl:if test="@class"><xsl:attribute name="class" select="fn:lower-case(@class)"/></xsl:if><xsl:apply-templates select="./node()"/></p>
    </xsl:template>

    <xsl:template match="Tussenkop">
        <p class="tussenkop"><xsl:apply-templates select="./node()"/></p>
    </xsl:template>

    <xsl:template match="Inhoud">
        <xsl:apply-templates select="*"/>
    </xsl:template>

    <!-- divisie -->

    <xsl:template match="Divisie">
        <xsl:variable name="class">
            <xsl:choose>
                <xsl:when test="@class">
                    <xsl:value-of select="fn:lower-case(@class)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="string('geen')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <section class="{$class}">
            <xsl:apply-templates select="*"/>
        </section>
    </xsl:template>

    <xsl:template match="Divisie/Kop">
        <!-- TOC bevat de koppenstructuur -->
        <xsl:variable name="id" select="generate-id(.)"/>
        <p class="{concat('heading_',$TOC/heading[@id=$id]/@level)}" id="{$id}"><xsl:apply-templates select="./Opschrift/node()"/></p>
    </xsl:template>

    <!-- groep -->

    <xsl:template match="Groep">
        <xsl:variable name="class">
            <xsl:choose>
                <xsl:when test="@class">
                    <xsl:value-of select="fn:lower-case(@class)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="string('geen')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <div class="{$class}">
            <xsl:apply-templates select="*">
                <xsl:with-param name="class" select="$class"/>
            </xsl:apply-templates>
        </div>
    </xsl:template>

    <xsl:template match="Groep/Tussenkop" priority="1">
        <xsl:param name="class"/>
        <p class="{fn:string-join(($class,'kop'),'_')}">
            <xsl:apply-templates select="./node()"/></p>
    </xsl:template>

    <xsl:template match="Groep/al" priority="1">
        <xsl:param name="class"/>
        <p class="{$class}">
            <xsl:apply-templates select="./node()"/></p>
    </xsl:template>

    <!-- opsomming -->

    <xsl:template match="Lijst">
        <xsl:choose>
            <xsl:when test="@class='Nummers'">
                <ol class="{concat('nummering_',count(.|ancestor::Lijst))}">
                    <xsl:apply-templates select="*"/>
                </ol>
            </xsl:when>
            <xsl:when test="@class='Tekens'">
                <ul class="{concat('nummering_',count(.|ancestor::Lijst))}">
                    <xsl:apply-templates select="*"/>
                </ul>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Li">
        <li>
            <xsl:apply-templates select="*"/>
        </li>
    </xsl:template>

    <!-- inline -->

    <xsl:template match="b">
        <span class="vet"><xsl:apply-templates select="./node()"/></span>
    </xsl:template>

    <xsl:template match="i">
        <span class="cursief"><xsl:apply-templates select="./node()"/></span>
    </xsl:template>

    <xsl:template match="u">
        <span class="onderstreept"><xsl:apply-templates select="./node()"/></span>
    </xsl:template>

    <xsl:template match="sup">
        <span class="superscript"><xsl:apply-templates select="./node()"/></span>
    </xsl:template>

    <xsl:template match="sub">
        <span class="subscript"><xsl:apply-templates select="./node()"/></span>
    </xsl:template>

    <xsl:template match="ExtRef">
        <a href="{@doc}" target="_blank">
            <xsl:apply-templates/>
        </a>
    </xsl:template>

    <!-- tabel -->

    <xsl:template match="table">
        <table class="{./@type}">
            <xsl:apply-templates select="*"/>
        </table>
    </xsl:template>

    <xsl:template match="table/title">
        <caption class="{ancestor::table[1]/@type}">
            <xsl:apply-templates select="./node()"/>
        </caption>
    </xsl:template>

    <xsl:template match="tgroup">
        <xsl:variable name="tablewidth" select="sum(./colspec/@colwidth)"/>
        <colgroup>
            <xsl:for-each select="./colspec">
                <col id="{./@colname}" style="{concat('width: ',./@colwidth div $tablewidth * 100,'%')}"/>
            </xsl:for-each>
        </colgroup>
        <xsl:apply-templates select="./thead"/>
        <xsl:apply-templates select="./tbody"/>
    </xsl:template>

    <xsl:template match="thead">
        <thead class="{ancestor::table[1]/@type}">
            <xsl:apply-templates select="*"/>
        </thead>
    </xsl:template>
    
    <xsl:template match="tbody">
        <tbody class="{ancestor::table[1]/@type}">
            <xsl:apply-templates select="*"/>
        </tbody>
    </xsl:template>
    
    <xsl:template match="row">
        <tr class="{ancestor::table[1]/@type}">
            <xsl:apply-templates select="*"/>
        </tr>
    </xsl:template>
    
    <xsl:template match="entry">
        <xsl:variable name="colspan" select="number(substring(./@nameend,4))-number(substring(./@namest,4))+1"/>
        <xsl:variable name="rowspan" select="number(./@morerows)+1"/>
        <xsl:choose>
            <xsl:when test="ancestor::thead">
                <th class="{ancestor::table[1]/@type}" colspan="{$colspan}" rowspan="{$rowspan}" style="{concat('text-align:',./@align)}">
                    <xsl:apply-templates select="*"/>
                </th>
            </xsl:when>
            <xsl:when test="ancestor::tbody">
                <td class="{ancestor::table[1]/@type}" colspan="{$colspan}" rowspan="{$rowspan}" style="{concat('text-align:',./@align)}">
                    <xsl:apply-templates select="*"/>
                </td>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- figuur -->

    <xsl:template match="Figuur">
        <xsl:variable name="width">
            <!-- voor het geval er meer illustraties in een kader mogen, wordt de breedte berekend met sum -->
            <xsl:variable name="sum" select="fn:sum(Illustratie/number(@breedte))"/>
            <xsl:choose>
                <xsl:when test="$sum lt 75">
                    <xsl:value-of select="$sum"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="100"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="float">
            <xsl:choose>
                <xsl:when test="(./@tekstomloop='ja')">
                    <xsl:choose>
                        <xsl:when test="./@uitlijning=('links','rechts')">
                            <xsl:value-of select="string(./@uitlijning)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="string('geen')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="string('geen')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <div class="{fn:string-join(('figuur',$float),' ')}" style="{concat('width: ',$width,'%')}">
            <xsl:apply-templates select="*"/>
        </div>
    </xsl:template>

    <xsl:template match="Figuur/Illustratie">
        <img class="figuur" src="{concat('../media/',./@naam)}" alt="{./@alt}"/>
    </xsl:template>

    <xsl:template match="Figuur/Bijschrift">
        <p class="bijschrift"><xsl:apply-templates select="./node()"/></p>
    </xsl:template>

    <!-- voetnoot -->

    <xsl:template match="Noot">
        <!-- doe niets -->
    </xsl:template>

</xsl:stylesheet>