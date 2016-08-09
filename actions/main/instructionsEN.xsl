<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="lang" select="'en'"/>
    <xsl:template match="/">
    <div id="topic">
        <h1><xsl:value-of select="root/repository/title"/></h1>
        <h2>How to activate access to the package repository</h2>
        <ol>
            <li>
                <p class="noindent">Download the activation script either by the wget command in a terminal or using a web link provided:</p>
                <pre><code class="bash">$ wget <a><xsl:attribute name="href"><xsl:value-of select="root/repository/url"/>/<xsl:value-of select="root/repository/iscript"/></xsl:attribute><xsl:value-of select="root/repository/url"/>/<xsl:value-of select="root/repository/iscript"/></a> -O initialize-repos</code></pre>
            </li>
            <li>
                <p class="noindent">Execute the activation script as root in terminal:</p>
                <pre><code class="bash">$ sudo bash ./initialize-repos</code></pre>
                <p class="noindent">The script must finished with '&gt;&gt;&gt; Repository initialization finished sucessfully!. If not then examine carefully the whole output printed to the terminal!'</p>
            </li>
        </ol>
        <p class="noindent">Note: '$' character represents a terminal prompt of an ordinary user thus this character is not ment to be typed to the terminal!'</p>
        <h2>How to install a package from the package repository</h2>
        <ol>
            <li>
                <p class="noindent">Select a package from either <a href="index.php?lang={$lang}&amp;show=alldpkgs">all packages</a> or special purpose <a href="index.php?lang={$lang}&amp;show=metadpkgs">MetaPackages</a>. Please read carefully the Description section of the package for special comments or instructions.</p>
            </li>
            <li>
                <p class="noindent">Install selected package:</p>
                <pre><code class="bash">$ sudo apt-get install package-name</code></pre>
            </li>
        </ol>
        <h2>Contents of the activation code</h2>
        <pre><code id="iscript" class="bash"><xsl:comment/></code></pre>
    </div>
    </xsl:template>
</xsl:stylesheet> 
