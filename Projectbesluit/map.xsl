<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:gml="http://www.opengis.net/gml/3.2">
    <xsl:output method="xml" version="1.0" indent="yes" encoding="utf-8"/>

    <xsl:variable name="map">
        <element old="aanduidingen" new="Aanduidingen"/>
        <element old="aanhaling" new="Aanhaling"/>
        <element old="aanhef" new="Aanhef"/>
        <element old="abbr" new="abbr"/>
        <element old="afdeling" new="Afdeling"/>
        <element old="al" new="al"/>
        <element old="al-groep" new="Groep"/>
        <element old="artikel" new="Artikel"/>
        <element old="b" new="b"/>
        <element old="begrip" new="Begrip"/>
        <element old="begrippenlijst" new="Begrippenlijst"/>
        <element old="bijlage" new="Bijlage"/>
        <element old="bijlage-sluiting" new="Sluiting"/>
        <element old="bijschrift" new="Bijschrift"/>
        <element old="blad" new="Blad"/>
        <element old="bladaanduiding" new="Bladaanduiding"/>
        <element old="bladgemeenschappelijkeregeling" new="BladGR"/>
        <element old="bladgeneriek" new="Bladgeneriek"/>
        <element old="blockBase" new="BlockBase"/>
        <element old="boek" new="Boek"/>
        <element old="br" new="Br"/>
        <element old="bron" new="Bron"/>
        <element old="caption" new="caption"/>
        <element old="citaat" new="Citaat"/>
        <element old="col" new="col"/>
        <element old="colgroup" new="colgroup"/>
        <element old="colspec" new="colspec"/>
        <element old="containerBase" new="Onbekend"/>
        <!--element old="datum" new="Datum"/-->
        <element old="deel" new="Deel"/>
        <element old="definitie" new="Definitie"/>
        <!--element old="dItem" new="Ditem"/-->
        <element old="divisie" new="Divisie"/>
        <!-- toegevoegd is Eigenschap -->
        <element old="eol" new="EOL"/>
        <element old="eop" new="EOP"/>
        <element old="extref" new="ExtRef"/>
        <element old="gemeenteblad" new="Gemeenteblad"/>
        <element old="geometrie" new="Geometrie"/>
        <!-- toegevoegd is Groep -->
        <element old="hcontainer" new="Hcontainer"/>
        <element old="hoofdstuk" new="Hoofdstuk"/>
        <element old="i" new="i"/>
        <element old="illustratie" new="Illustratie"/>
        <element old="img" new="Illustratie"/>
        <element old="inhoud" new="Inhoud"/>
        <element old="inline" new="Inline"/>
        <element old="inlineBase" new="Onbekend"/>
        <element old="intref" new="IntRef"/>
        <element old="kop" new="Kop"/>
        <element old="label" new="Label"/>
        <element old="li" new="Li"/>
        <element old="li.nr" new="LiNr"/>
        <!-- let op type-attribuut op Lijst -->
        <element old="lid" new="Lid"/>
        <element old="lidnr" new="Lidnr"/>
        <element old="lijst" new="Lijst"/>
        <element old="lijst.aanhef" new="Lijstaanhef"/>
        <element old="lijst.sluiting" new="Lijstsluiting"/>
        <!--element old="lItem" new="Litem"/-->
        <element old="locatieaanduiding_geometrie" new="locatieaanduiding_geometrie"/>
        <element old="locatieaanduiding_locatiegroep" new="locatieaanduiding_locatiegroep"/>
        <element old="locatieaanduiding_locatieverwijzing" new="locatieaanduiding_locatieverwijzing"/>
        <!-- deze kan vermoedelijk weg -->
        <element old="locatieAanduidingen" new="LocatieAanduidingen"/>
        <element old="locatiegroep" new="Locatiegroep"/>
        <element old="locatieverwijzing" new="Onbekend"/>
        <element old="marker" new="Marker"/>
        <element old="markerBase" new="MarkerBase"/>
        <!-- ContainerBase en InlineBase zijn verwijderd, MarkerBase niet? -->
        <element old="metadata" new="Metadata"/>
        <!-- metadata wordt afzonderlijk getransformeerd -->
        <element old="mutatie-bericht" new="mutatie-bericht"/>
        <element old="nawerk" new="Nawerk"/>
        <element old="nawerk-container" new="NawerkContainer"/>
        <element old="noot" new="Noot"/>
        <element old="Noot.nr" new="NootNummer"/>
        <element old="noot.nr" new="NootNummer"/>
        <element old="nootref" new="Nootref"/>
        <!-- graag NootRef van maken, conform ExtRef en IntRef -->
        <element old="nota-toelichting" new="Toelichting"/>
        <element old="nota-toelichting-sluiting" new="Sluiting"/>
        <element old="nr" new="Nummer"/>
        <!-- toegevoegd is Object -->
        <element old="officiele-inhoudsopgave" new="Inhoudsopgave"/>
        <!-- toegevoegd is OfficieelBericht -->
        <element old="officiele-publicatie" new="OfficielePublicatie"/>
        <element old="omissie" new="Omissie"/>
        <element old="ondertekening" new="Ondertekening"/>
        <element old="opschrift" new="RegelingOpschrift"/>
        <element old="paragraaf" new="Paragraaf"/>
        <element old="plaatje" new="Figuur"/>
        <!-- bij plaatje attributen nalopen -->
        <element old="popupBase" new="PopupBase"/>
        <!-- ContainerBase en InlineBase zijn verwijderd, PopupBase niet? -->
        <element old="provincieblad" new="Provincieblad"/>
        <element old="publicatiecontainers" new="publicatiecontainers"/>
        <element old="redactioneel" new="Redactioneel"/>
        <!-- toegevoegd is Reeks -->
        <element old="regeling" new="Regeling"/>
        <element old="regeling-sluiting" new="Sluiting"/>
        <element old="regeling-tekst" new="Lichaam"/>
        <!--element old="sItem" new="Sitem"/-->
        <element old="staatsblad" new="Staatsblad"/>
        <element old="staatscourant" new="Staatscourant"/>
        <element old="strong" new="strong"/>
        <element old="sub" new="sub"/>
        <element old="subtitel" new="Subtitel"/>
        <element old="sup" new="sup"/>
        <element old="table" new="table"/>
        <element old="table_html5" new="table_html5"/>
        <element old="tbody" new="tbody"/>
        <element old="td" new="entry"/>
        <!-- toegevoegd is Tekst -->
        <element old="tekstelement_artikel" new="tekstelement_artikel"/>
        <element old="tekstelement_lichaam" new="tekstelement_lichaam"/>
        <element old="tekstelement_structuurelement" new="tekstelement_structuurelement"/>
        <element old="term" new="Term"/>
        <element old="tfoot" new="tfoot"/>
        <element old="tgroup" new="tgroup"/>
        <element old="th" new="entry"/>
        <element old="thead" new="thead"/>
        <element old="titel" new="Opschrift"/>
        <!-- binnen plaatje wordt het Titel -->
        <element old="titeldeel" new="Titel"/>
        <element old="titelregel" new="Titelregel"/>
        <element old="title" new="title"/>
        <element old="toestand" new="Toestand"/>
        <element old="tr" new="row"/>
        <element old="tractatenblad" new="Tractatenblad"/>
        <element old="tripleBase" new="Onbekend"/>
        <element old="tussenkop" new="Tussenkop"/>
        <element old="u" new="u"/>
        <element old="uitspraak" new="Uitspraak"/>
        <element old="waarde" new="Waarde"/>
        <!-- waarde heeft een compleet andere invulling gekregen -->
        <element old="was" new="was"/>
        <element old="was-wordt-mutatie" new="was-wordt-mutatie"/>
        <element old="was-wordt-mutatie-groep" new="was-wordt-mutatie-groep"/>
        <element old="was-wordt-mutaties" new="was-wordt-mutaties"/>
        <element old="waterschapsblad" new="Waterschapsblad"/>
        <element old="werkingsgebied" new="Uitspraak"/>
        <element old="wijzig-artikel" new="WijzigArtikel"/>
        <element old="wordt" new="wordt"/>
    </xsl:variable>

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="element()" priority="0">
        <xsl:variable name="name" select="name()" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="$map/element[@old=$name]">
                <xsl:element name="{$map/element[@old=$name]/@new}">
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{$name}">
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="element()[metadata|werkingsgebied]" priority="1">
        <xsl:variable name="name" select="name()" as="xs:string"/>
        <xsl:element name="{$map/element[@old=$name]/@new}">
            <xsl:apply-templates select="@*"/>
            <xsl:if test="metadata|werkingsgebied">
                <xsl:element name="Metadata">
                    <xsl:apply-templates select="metadata|werkingsgebied" mode="metadata"/>
                </xsl:element>
            </xsl:if>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="metadata|werkingsgebied" mode="metadata">
        <xsl:for-each select="uitspraak">
            <xsl:element name="Uitspraak">
                <xsl:apply-templates select="@*" mode="metadata"/>
                <xsl:element name="Waarde">
                    <xsl:attribute name="type" select="string('xs:string')"/>
                    <xsl:value-of select="string(.)"/>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
        <xsl:for-each select="self::werkingsgebied">
            <xsl:element name="Uitspraak">
                <xsl:if test="parent::*/@id">
                    <xsl:attribute name="onderwerp" select="parent::*/@id"/>
                </xsl:if>
                <xsl:attribute name="eigenschap" select="string('imop:werkingsgebied')"/>
                <xsl:element name="Waarde">
                    <xsl:attribute name="type" select="string('stop:objectRef')"/>
                    <xsl:value-of select="locatiegroep/@idref"/>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="@*" mode="metadata">
        <xsl:choose>
            <xsl:when test="name()='about'">
                <xsl:attribute name="onderwerp" select="."/>
            </xsl:when>
            <xsl:when test="name()='property'">
                <xsl:attribute name="eigenschap" select="replace(.,'stop:','imop:')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment><xsl:value-of select="concat('GW ',name(),': ',.)"></xsl:value-of></xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="metadata|werkingsgebied" priority="1">
        <!-- doe niets -->
    </xsl:template>

    <xsl:template match="lijst" priority="1">
        <xsl:variable name="name" select="name()" as="xs:string"/>
        <xsl:element name="{$map/element[@old=$name]/@new}">
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="type" select="string('expliciet')"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!--xsl:template match="@name" priority="0">
        <xsl:variable name="name" select="." as="xs:string"/>
        <xsl:choose>
            <xsl:when test="$map/element[@old=$name]">
                <xsl:attribute name="name" select="$map/element[@old=$name]/@new"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="name" select="string('onbekend')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template-->

</xsl:stylesheet>