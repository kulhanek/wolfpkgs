<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <script>
        hljs.initHighlighting();
        load_iscript('<xsl:value-of select="root/repository/iscript"/>');
    </script>
    <h1>How to activate access to the <xsl:value-of select="root/repository/title"/> repository</h1>
    <ol>
        <li>Download the activation script either by the wget command in a terminal or as a web link ('$' notes a terminal prompt, this character is not ment to be typed to the terminal):
        <pre><code class="bash">
$ wget <a><xsl:attribute name="href"><xsl:value-of select="root/repository/url"/>/<xsl:value-of select="root/repository/iscript"/></xsl:attribute><xsl:value-of select="root/repository/url"/>/<xsl:value-of select="root/repository/iscript"/></a> -O initialize-repos
        </code></pre>
        </li>
        <li>Execute the activation script as root in terminal: ('$' notes a terminal prompt, this character is not ment to be typed to the terminal)
        <pre><code class="bash">
$ sudo bash ./initialize-repos
        </code></pre>
        The script must finished with '&gt;&gt;&gt; Repository initialization finished sucessfully!. If not then examine carefully the whole output printed to the terminal!'
        </li>
    </ol>
    <h1>Contents of the activation code</h1>
    <pre><code id="iscript" class="bash"></code></pre>
    </xsl:template>
</xsl:stylesheet> 
