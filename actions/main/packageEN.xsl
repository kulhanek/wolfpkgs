<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="lang" select="'en'"/>
    <xsl:param name="package"/>
    <xsl:template match="/">
    <xsl:for-each select="root/packages/package">
        <xsl:if test="name = $package">
        <div id="topic">
            <h1><xsl:value-of select="name"/> (<xsl:value-of select="/root/repository/title"/>)</h1>
            <table class="info">   
                <tr>
                    <td class="label">Version:</td><td><xsl:value-of select="vers"/></td>
                </tr>
                <tr>
                    <td class="label">Annotation:</td><td><xsl:value-of select="sdesc"/></td>
                </tr>
                <xsl:if test="not(depends = '')">
                    <tr>
                        <td class="label">Depends:</td>
                        <td>
                            <xsl:for-each select="depends/package">
                                <xsl:choose>
                                    <xsl:when test="contains(current(),'ncbr')">
                                        <a>
                                            <xsl:attribute name="href">index.php?lang=<xsl:value-of select="$lang" />&amp;show=package&amp;package=<xsl:value-of select="current()" /></xsl:attribute>
                                            <xsl:value-of select="current()"/>
                                        </a>
                                    </xsl:when>
                                    <xsl:when test="contains(current(),'openafs')">
                                        <a href="https://launchpad.net/~openafs/+archive/ubuntu/stable">
                                            <xsl:value-of select="current()"/>
                                        </a>
                                    </xsl:when>
                                    <xsl:when test="contains(current(),'perun')">
                                        <a href="https://wiki.metacentrum.cz/wiki/Facility_managers's_manual">
                                            <xsl:value-of select="current()"/>
                                        </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="contains(current(),':')">
                                                <a>
                                                    <xsl:attribute name="href">http://packages.ubuntu.com/<xsl:value-of select="/root/repository/distribution/code"/>/<xsl:value-of select="substring-before(current(),':')" /></xsl:attribute>
                                                    <xsl:value-of select="current()"/>
                                                </a>
                                            </xsl:when>
                                            <xsl:when test="contains(current(),' ')">
                                                <a>
                                                    <xsl:attribute name="href">http://packages.ubuntu.com/<xsl:value-of select="/root/repository/distribution/code"/>/<xsl:value-of select="substring-before(current(),' ')" /></xsl:attribute>
                                                    <xsl:value-of select="current()"/>
                                                </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <a>
                                                    <xsl:attribute name="href">http://packages.ubuntu.com/<xsl:value-of select="/root/repository/distribution/code"/>/<xsl:value-of select="current()" /></xsl:attribute>
                                                    <xsl:value-of select="current()"/>
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
                </xsl:if>
            </table>
            <xsl:if test="not(ldesc = '')">
                <h2>Description</h2>
                <pre><xsl:value-of select="ldesc"/></pre>
            </xsl:if>
            </div>
        </xsl:if>
    </xsl:for-each>

    </xsl:template>
</xsl:stylesheet> 
