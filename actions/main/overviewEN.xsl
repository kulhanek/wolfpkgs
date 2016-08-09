<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="lang" select="'en'"/>
    <xsl:template match="/">
    <div id="topic">
        <h1>Introduction</h1>
        <p>This site provides you with information about all the packages available in the <xsl:value-of select="root/repository/title"/> package repository. Information how to activate access to this repository is available in <a href="index.php?lang={$lang}&amp;show=instructions">Instructions</a>. You can either browse <a href="index.php?lang={$lang}&amp;show=alldpkgs">all packages</a> or special purpose <a href="index.php?lang={$lang}&amp;show=metadpkgs">MetaPackages</a>, which are suitable to setup your machine for a desired function by installing all necessary software.</p>
        <h1><xsl:value-of select="root/repository/title"/></h1>
        <table class="info">
            <tr>
                <td class="label">Package Repository:</td><td><a><xsl:attribute name="href"><xsl:value-of select="root/repository/url"/></xsl:attribute><xsl:value-of select="root/repository/url"/></a></td>
            </tr>
            <tr>
                <td class="label">Repository Maintainer:</td><td><a><xsl:attribute name="href">mailto:<xsl:value-of select="root/repository/maintainer"/></xsl:attribute><xsl:value-of select="root/repository/maintainer"/></a></td>
            </tr>
            <tr>
                <td class="label">Supported Distribution:</td><td><xsl:value-of select="root/repository/distribution/name"/></td>
            </tr>
        </table>
        <p><xsl:value-of select="root/repository/desc"/></p>
    </div>
    </xsl:template>
</xsl:stylesheet> 
