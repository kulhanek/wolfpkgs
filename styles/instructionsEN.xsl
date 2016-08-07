<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="lang" select="'en'"/>
    <xsl:template match="/">
    <div id="topic">
        <h1>How to activate access to the <xsl:value-of select="root/repository/title"/> repository</h1>
        <ol>
            <li>
                <p class="noindent">Download the activation script either by the wget command in a terminal or as a web link:</p>
                <pre><code class="bash">$ wget <a><xsl:attribute name="href"><xsl:value-of select="root/repository/url"/>/<xsl:value-of select="root/repository/iscript"/></xsl:attribute><xsl:value-of select="root/repository/url"/>/<xsl:value-of select="root/repository/iscript"/></a> -O initialize-repos</code></pre>
            </li>
            <li>
                <p class="noindent">Execute the activation script as root in terminal:</p>
                <pre><code class="bash">$ sudo bash ./initialize-repos</code></pre>
                <p class="noindent">The script must finished with '&gt;&gt;&gt; Repository initialization finished sucessfully!. If not then examine carefully the whole output printed to the terminal!'</p>
            </li>
        </ol>
        <p class="noindent">Note: '$' and '#' note a terminal prompt, these charactera are not ment to be typed to the terminal!'</p>
        <h1>Contents of the activation code</h1>
        <pre><code id="iscript" class="bash"><xsl:comment/></code></pre>
    </div>
    </xsl:template>
</xsl:stylesheet> 
