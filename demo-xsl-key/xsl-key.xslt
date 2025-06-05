<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:variable name="lookupfile" select="document('demo-xsl-key/lookup.xml')"/>

    <xsl:key name="country-by-countryCd" use="countryCd" match="countryEntry" ></xsl:key>

    <xsl:template match="/">
        <xsl:for-each select="$lookupfile/key('country-by-countryCd', 'US')" >
            <xsl:variable name="countryName" select="countryName" />
            <xsl:element name="result">
                <xsl:value-of select="$countryName" />
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>