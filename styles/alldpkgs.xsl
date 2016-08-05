<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <h1><xsl:value-of select="root/repository/title"/></h1>
    <table class="list">      
        <tr>
            <th class="dpkg">Package</th>
            <th>Version</th>
            <th>Description</th>
        </tr>
        <xsl:for-each select="root/packages/package">
            <xsl:sort select="name"/>
            <tr>
                <td>
                    <a>
                        <xsl:attribute name="href">indexEN.html?show=package&amp;package=<xsl:value-of select="name" /></xsl:attribute>
                        <xsl:value-of select="name"/>
                    </a>
                </td>
                <td><xsl:value-of select="vers"/></td>
                <td><xsl:value-of select="sdesc"/></td>
            </tr>
        </xsl:for-each>
    </table>
    </xsl:template>
</xsl:stylesheet> 
