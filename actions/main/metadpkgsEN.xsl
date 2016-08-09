<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="lang" select="'en'"/>
    <xsl:template match="/">
    <div id="topic">
        <h1><xsl:value-of select="root/repository/title"/></h1>
        <p>MetaPackages are special purpose packages that do not contain actual software. They simply depend on other packages to be installed, which allows entire sets of software to be installed by selecting only the appropriate metapackage.</p> 
        <table class="list">
            <tr>
                <th>Package</th>
                <th>Version</th>
                <th>Annotation</th>
            </tr>
            <xsl:for-each select="root/packages/package">
                <xsl:sort select="name"/>
                <xsl:if test="tag = 'show-as-meta'">
                <tr>
                    <td>
                        <a>
                            <xsl:attribute name="href">index.php?lang=<xsl:value-of select="$lang"/>&amp;show=package&amp;package=<xsl:value-of select="name" /></xsl:attribute>
                            <xsl:value-of select="name"/>
                        </a>
                    </td>
                    <td><xsl:value-of select="vers"/></td>
                    <td><xsl:value-of select="sdesc"/></td>
                </tr>
                </xsl:if>
            </xsl:for-each>
        </table>
    </div>
    </xsl:template>
</xsl:stylesheet> 
