<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <h1><xsl:value-of select="root/repository/title"/></h1>
    <p>MetaPackages are special purpose packages that do not contain actual software. They simply depend on other packages to be installed, which allows entire sets of software to be installed by selecting only the appropriate metapackage.</p> 
    <table>
        <tr>
            <th class="dpkg">Package</th>
            <th>Version</th>
            <th>Description</th>
        </tr>
        <xsl:for-each select="root/packages/package">
            <xsl:sort select="name"/>
            <xsl:if test="tag = 'meta'">
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
            </xsl:if>
        </xsl:for-each>
    </table>
    </xsl:template>
</xsl:stylesheet> 
