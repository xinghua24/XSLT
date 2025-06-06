<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
>
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <html>
            <body>
                <h2>My CD Collection</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Title</th>
                        <th>Artist</th>
                        <th>Price</th>
                    </tr>
                    <xsl:for-each select="catalog/cd">
                        <xsl:if test="price>10">
                            <tr>
                                <td><xsl:value-of select="title"/></td>
                                <td><xsl:value-of select="artist"/></td>
                                <td><xsl:value-of select="price"/></td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>