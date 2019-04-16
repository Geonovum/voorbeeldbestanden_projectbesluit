<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="#all">
    <xsl:output method="xhtml" encoding="UTF-8" indent="no" omit-xml-declaration="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

    <!-- Verwijder schemaverwijzing in om te zetten document -->

    <!-- Tijdelijke variabelen om de links goed te maken -->

    <xsl:variable name="title" select="string(.//RegelingOpschrift/al)"/>
    <xsl:variable name="links">
        <link title="Voorbeeldartikelen omgevingsplan Variant rijke annotatie" locatie="Centrumgebied_speelautomatenhal" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=1a6ef435c9a245f58fdb66525538e0d3"/>
        <link title="Voorbeeldartikelen omgevingsplan Variant rijke annotatie" locatie="Gemeentestad" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=f8b88c6ca69a449cac5082b91f2ba7d7"/>
        <link title="Voorbeeldartikelen omgevingsplan Variant rijke annotatie" locatie="Gemeentestad_bedrijf_categorie_2" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=18411644fdc3419aab9a532367ffc950"/>
        <link title="Voorbeeldartikelen omgevingsplan Variant rijke annotatie" locatie="Gemeentestad_bedrijf_categorie_2_HogeGebouwen" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=05825d1976b741cd8af2f4f2ae8de1d5"/>
        <link title="Voorbeeldartikelen omgevingsplan Variant rijke annotatie" locatie="Gemeentestad_bedrijf_categorie_2_LageGebouwen" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=5890084c2b96465981284ceaec93e6af"/>
        <link title="Voorbeeldartikelen omgevingsplan Variant rijke annotatie" locatie="Gemeentestad_beschermd_monument" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=d3c82b2c30a84c88988ce761e0b62c04"/>
        <link title="Voorbeeldartikelen omgevingsplan Variant rijke annotatie" locatie="Gemeentestad_bijzonder_houtgewas" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=aae4817cb9154b43847ef5d388a8c58e"/>
        <link title="Voorbeeldartikelen omgevingsplan Variant rijke annotatie" locatie="Gemeentestad_centrumgebied" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=b4443051448d4b91a57b3c0de71e727a"/>
        <link title="Voorbeeldartikelen omgevingsplan Variant rijke annotatie" locatie="Gemeentestad_woongebied_dorps" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=b058a7005dba42a6943eb72ca3e84c9c"/>
        <link title="Voorbeeldartikelen omgevingsplan Variant beperkte annotatie" locatie="Gemeentestad_bedrijf_categorie_2" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=2e4dbecd02e14d68b327c4051fcd4492"/>
        <link title="Voorbeeldartikelen omgevingsplan Variant beperkte annotatie" locatie="Gemeentestad_beschermd_monument" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=37fbe934581f443089de80168458f579"/>
        <link title="Voorbeeldartikelen omgevingsplan Variant beperkte annotatie" locatie="Gemeentestad_centrumgebied" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=cf58852a93c241a69de1c0852ba5450a"/>
        <link title="Voorbeeldartikelen omgevingsplan Variant beperkte annotatie" locatie="Gemeentestad_woongebied_dorps" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=a678dd922462400ca06ca7b7e0262d48"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="plangebied" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=56869900dc92406696a810d525ad163b"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="winkelcentrum" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=8a40feda29854ec0b2d298c54b1e6e36"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="woongebied" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=d6dfd84e34c24328839ad3c77c11a333"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="bouwen_na_vergunning_toegestaan" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=5b3641d1e3c946df98273b6f31b0d282"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="vergunningvrije_bouwactiviteit_1" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=2ca471d015b4444fae0e8a81dcd7b6b5"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="vergunningvrije_bouwactiviteit_2" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=a6aabb6655344e58808461dc72e0410f"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="bouwhoogte_12m" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=78272e29a08d4c1cb4319b4bba581670"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="bouwhoogte_15m" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=466b5ecaeac241739ec54f8a999cd14f"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="goothoogte_9m" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=c978d142b58a42b38724c954d80e920e"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="goothoogte_12m" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=1b91dae5bb9d4f258be649d10f792c29"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="cafe_toegestaan" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=6e802fea929042ee81a11f9ece2ceaba"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="detailhandel_toegestaan" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=16d8d50ab06c4289b89f503e057bc24f"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="restaurant_toegestaan" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=9ad7ad4622424070a85fa484fe687db8"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="supermarkt_toegestaan" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=47dc23b009864a6681fc74171b5f9a59"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="wonen_toegestaan" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=e30d58f87e8b4414be6f81efe3df76e9"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="aanbieden_short_stay" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=766a8d45cd2c4a3ca6cf0ff13411bec8"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="maximum_aantal_kalenderdagen_per_jaar_30" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=46985eb80aa34bc4b94738a2d35f5bfd"/>
        <link title="Voorbeeld gemeente Amterdam" locatie="maximum_aantal_kalenderdagen_per_jaar_60" url="https://gnm.maps.arcgis.com/apps/webappviewer/index.html?id=af406dcea02347c68c24de1625b34736"/>
    </xsl:variable>

    <!-- Koppenstructuur wordt vastgelegd in TOC -->

    <xsl:variable name="TOC">
        <xsl:variable name="test" select="name()"/>
        <xsl:for-each select=".//Kop">
            <xsl:element name="heading">
                <xsl:attribute name="id" select="generate-id(..)"/>
                <xsl:attribute name="level" select="count(ancestor::*[Kop])"/>
                <xsl:attribute name="number" select="count(.|../preceding-sibling::*[Kop])"/>
                <xsl:copy-of select="./element()"/>
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
                    <xsl:apply-templates select=".//RegelingOpschrift/al/node()"/>
                </title>
            </head>
            <body>
                <div class="page">
                    <div class="sidebar">
                        <div class="logo">
                            <img src="media/logo.svg" alt="logo" height="44"/>
                        </div>
                        <div class="menu">
                            <xsl:for-each-group select="$TOC/*" group-starting-with="heading[number(@level) eq 1]">
                                <ul class="mainmenu">
                                    <li>
                                        <xsl:choose>
                                            <xsl:when test="self::heading">
                                                <xsl:variable name="filename" select="concat('pages/page_',fn:format-number(position(),'00'),'.html')"/>
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
                        <div class="title"><p class="title"><xsl:value-of select=".//RegelingOpschrift/al/node()"/></p></div>
                        <div class="target"><iframe name="content" src="pages/page_01.html"/></div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- pages -->

    <xsl:template name="pages">
        <!-- maak de hoofdstukken in de omschrijving -->
        <xsl:for-each select=".//(Lichaam|Nawerk)/*[Kop]">
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
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="text()">
        <xsl:variable name="test" select="."/>
        <xsl:choose>
            <xsl:when test="fn:normalize-space() eq ''">
                <!-- doe niets -->
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="al">
        <p><xsl:if test="@class"><xsl:attribute name="class" select="fn:lower-case(@class)"/></xsl:if><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="Tussenkop">
        <p class="tussenkop"><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="Inhoud">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- metadata -->

    <xsl:template match="Metadata">
        <!-- doe niets -->
    </xsl:template>

    <xsl:template match="Metadata//Uitspraak" mode="metadata">
        <xsl:choose>
            <xsl:when test="@eigenschap='tpod:regelOverActiviteitweg'">
                <!-- doe niets -->
            </xsl:when>
            <xsl:when test="descendant::Object">
                <xsl:for-each select="descendant::Object[not(ancestor::Object)]">
                    <div class="metadata_uitspraak">
                        <p class="metadata_uitspraak"><xsl:value-of select="@type"/></p>
                        <xsl:apply-templates select="."/>
                    </div>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <div class="metadata_uitspraak">
                    <p class="metadata_uitspraak"><xsl:value-of select="@eigenschap"/></p>
                    <xsl:apply-templates/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Metadata//Eigenschap">
        <xsl:choose>
            <xsl:when test="descendant::Eigenschap">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="@naam='locatie'">
                <xsl:variable name="locatie" select="string(Waarde)"/>
                <div class="locatie">
                    <p class="locatie"><a class="locatie" href="{$links/link[@title=$title][@locatie=$locatie]/@url}" target="_blank"><img src="../media/icon.svg" alt="" width="40" height="40"/></a></p>
                </div>
                <p class="metadata_eigenschap"><xsl:value-of select="@naam"/></p>
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <p class="metadata_eigenschap"><xsl:value-of select="@naam"/></p>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Metadata//Object">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="Metadata//Reeks">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="Metadata//Waarde">
        <p class="metadata_waarde"><xsl:apply-templates/></p>
    </xsl:template>

    <!-- structuurelementen -->

    <xsl:template match="*[Kop]">
        <xsl:variable name="class" select="fn:lower-case(fn:string-join((name(),@class),' '))"/>
        <xsl:variable name="id" select="@id"/>
        <section class="{$class}" id="{generate-id(.)}">
            <xsl:apply-templates select="Metadata/Uitspraak[@onderwerp=$id]" mode="metadata"/>
            <xsl:apply-templates/>
        </section>
    </xsl:template>

    <xsl:template match="Kop">
        <!-- TOC bevat de koppenstructuur -->
        <xsl:variable name="id" select="generate-id(..)"/>
        <p class="{concat('heading_',$TOC/heading[@id=$id]/@level)}"><xsl:if test="./Label|./Nummer"><span class="nummer"><xsl:value-of select="fn:string-join((./Label,./Nummer),' ')"/></span></xsl:if><xsl:apply-templates select="./Opschrift/node()"/></p>
    </xsl:template>

    <!-- begrippenlijst -->

    <xsl:template match="Begrippenlijst">
        <div class="nummering_1">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="Begrip">
        <div class="item">
            <div class="nummer">
                <xsl:apply-templates select="LiNr"/>
            </div>
            <div class="inhoud">
                <xsl:apply-templates select="Term"/>
                <xsl:apply-templates select="Definitie/al"/>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="Term">
        <p class="begrip"><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="Definitie/al">
        <p class="begrip"><xsl:apply-templates/></p>
    </xsl:template>

    <!-- groep -->

    <xsl:template match="Groep">
        <xsl:variable name="class" select="(fn:lower-case(@class),'geen')[1]"/>
        <div class="{$class}">
            <xsl:apply-templates select="*">
                <xsl:with-param name="class" select="$class"/>
            </xsl:apply-templates>
        </div>
    </xsl:template>

    <xsl:template match="Groep/Tussenkop" priority="1">
        <xsl:param name="class"/>
        <p class="{fn:string-join(($class,'kop'),'_')}"><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="Groep/al" priority="1">
        <xsl:param name="class"/>
        <p class="{$class}"><xsl:apply-templates/></p>
    </xsl:template>

    <!-- opsomming -->

    <xsl:template match="Lijst">
        <xsl:variable name="class" select="concat('nummering_',count(.|ancestor::Lijst))"/>
        <xsl:choose>
            <xsl:when test="@type='expliciet'">
                <div class="{$class}">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="@class='Nummers'">
                <ol class="{$class}">
                    <xsl:apply-templates/>
                </ol>
            </xsl:when>
            <xsl:when test="@class='Tekens'">
                <ul class="{$class}">
                    <xsl:apply-templates/>
                </ul>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Lijstaanhef">
        <p><xsl:if test="@class"><xsl:attribute name="class" select="fn:lower-case(@class)"/></xsl:if><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="Li">
        <xsl:variable name="id" select="@id"/>
        <xsl:choose>
            <xsl:when test="parent::Lijst/@type='expliciet'">
                <div class="item">
                    <xsl:apply-templates select="ancestor::*/Metadata/Uitspraak[@onderwerp=$id]" mode="metadata"/>
                    <div class="nummer">
                        <xsl:apply-templates select="LiNr"/>
                    </div>
                    <div class="inhoud">
                        <xsl:apply-templates select="Inhoud"/>
                    </div>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <li>
                    <xsl:apply-templates select="ancestor::*/Metadata/Uitspraak[@onderwerp=$id]" mode="metadata"/>
                    <xsl:apply-templates select="Inhoud"/>
                </li>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="LiNr">
        <p><xsl:if test="@class"><xsl:attribute name="class" select="fn:lower-case(@class)"/></xsl:if><xsl:apply-templates/></p>
    </xsl:template>

    <!-- Lid -->

    <xsl:template match="Lid">
        <xsl:variable name="id" select="@id"/>
        <div class="item">
            <xsl:apply-templates select="ancestor::*/Metadata/Uitspraak[@onderwerp=$id]" mode="metadata"/>
            <div class="nummer">
                <xsl:apply-templates select="Lidnr"/>
            </div>
            <div class="inhoud">
                <xsl:apply-templates select="Inhoud"/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="Lidnr">
        <p><xsl:if test="@class"><xsl:attribute name="class" select="fn:lower-case(@class)"/></xsl:if><xsl:apply-templates/></p>
    </xsl:template>

    <!-- inline -->

    <xsl:template match="b">
        <span class="vet"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="i">
        <span class="cursief"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="u">
        <span class="onderstreept"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="sup">
        <span class="superscript"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="sub">
        <span class="subscript"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="ExtRef">
        <a href="{@doc}" target="_blank">
            <xsl:apply-templates/>
        </a>
    </xsl:template>

    <xsl:template match="IntRef">
        <xsl:variable name="idref" select="@idref"/>
        <xsl:variable name="check" select="generate-id(ancestor::Lichaam//*[@id=$idref])"/>
        <xsl:variable name="id" select="$TOC/*[@id=$check]"/>
        <xsl:choose>
            <xsl:when test="$id">
                <a href="{concat('page_',fn:format-number(count($TOC/*[@id=$check]/preceding-sibling::*[@level='1']),'00'),'.html#',$id/@id)}">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- tabel -->

    <xsl:template match="table">
        <table class="{./@type}">
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xsl:template match="table/title">
        <caption class="{ancestor::table[1]/@type}">
            <xsl:apply-templates/>
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
            <xsl:apply-templates/>
        </thead>
    </xsl:template>
    
    <xsl:template match="tbody">
        <tbody class="{ancestor::table[1]/@type}">
            <xsl:apply-templates/>
        </tbody>
    </xsl:template>
    
    <xsl:template match="row">
        <tr class="{ancestor::table[1]/@type}">
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="entry">
        <xsl:variable name="colspan" select="number(substring(./@nameend,4))-number(substring(./@namest,4))+1"/>
        <xsl:variable name="rowspan" select="number(./@morerows)+1"/>
        <xsl:choose>
            <xsl:when test="ancestor::thead">
                <th class="{ancestor::table[1]/@type}" colspan="{$colspan}" rowspan="{$rowspan}" style="{concat('text-align:',./@align)}">
                    <xsl:apply-templates/>
                </th>
            </xsl:when>
            <xsl:when test="ancestor::tbody">
                <td class="{ancestor::table[1]/@type}" colspan="{$colspan}" rowspan="{$rowspan}" style="{concat('text-align:',./@align)}">
                    <xsl:apply-templates/>
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
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="Figuur/Illustratie">
        <img class="figuur" src="{concat('../media/',./@naam)}" alt="{./@alt}"/>
    </xsl:template>

    <xsl:template match="Figuur/Bijschrift">
        <p class="bijschrift"><xsl:apply-templates/></p>
    </xsl:template>

    <!-- voetnoot -->

    <xsl:template match="Noot">
        <!-- doe niets -->
    </xsl:template>

</xsl:stylesheet>