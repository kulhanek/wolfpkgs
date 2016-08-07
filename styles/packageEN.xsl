<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="lang" select="'en'"/>
    <xsl:param name="package"/>
    <xsl:template match="/">
    <xsl:for-each select="root/packages/package">
        <xsl:if test="name = $package">
        <div id="topic">
            <h1><xsl:value-of select="/root/repository/title"/> / <xsl:value-of select="name"/></h1>
            <table>   
                <tr>
                    <td class="label">Version:</td><td><xsl:value-of select="vers"/></td>
                </tr>
                <tr>
                    <td class="label">Annotation:</td><td><xsl:value-of select="sdesc"/></td>
                </tr>
                <tr>
                    <td class="label">Depends:</td>
                    <td>
                        <xsl:for-each select="depends/depend">
                            <xsl:choose>
                                <xsl:when test="contains(package,'ncbr')">
                                    <a>
                                        <xsl:attribute name="href">index.php?lang=<xsl:value-of select="$lang" />&amp;show=package&amp;package=<xsl:value-of select="package" /></xsl:attribute>
                                        <xsl:value-of select="package"/>
                                    </a>
                                </xsl:when>
                                <xsl:when test="contains(package,'openafs')">
                                    <a href="https://launchpad.net/~openafs/+archive/ubuntu/stable">
                                        <xsl:value-of select="package"/>
                                    </a>
                                </xsl:when>
                                <xsl:when test="contains(package,'perun')">
                                    <a href="https://wiki.metacentrum.cz/wiki/Facility_managers's_manual">
                                        <xsl:value-of select="package"/>
                                    </a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="contains(package,':')">
                                            <a>
                                                <xsl:attribute name="href">http://packages.ubuntu.com/<xsl:value-of select="/root/repository/distribution/code"/>/<xsl:value-of select="substring-before(package,':')" /></xsl:attribute>
                                                <xsl:value-of select="package"/>
                                            </a>
                                        </xsl:when>
                                        <xsl:when test="contains(package,' ')">
                                            <a>
                                                <xsl:attribute name="href">http://packages.ubuntu.com/<xsl:value-of select="/root/repository/distribution/code"/>/<xsl:value-of select="substring-before(package,' ')" /></xsl:attribute>
                                                <xsl:value-of select="package"/>
                                            </a>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <a>
                                                <xsl:attribute name="href">http://packages.ubuntu.com/<xsl:value-of select="/root/repository/distribution/code"/>/<xsl:value-of select="package" /></xsl:attribute>
                                                <xsl:value-of select="package"/>
                                            </a>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="position() != last()">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:for-each>
                    </td>
                </tr>
            </table>
            <h2>Description</h2>
            <p><xsl:value-of select="ldesc"/></p>
            </div>
        </xsl:if>
    </xsl:for-each>

    </xsl:template>
</xsl:stylesheet> 
