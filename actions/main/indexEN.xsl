<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="lang" select="'en'"/>
    <xsl:param name="action" select="'main'"/>
    <xsl:param name="show" select="'overview'"/>
    <xsl:param name="package" select="'none'"/>
    <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <title>Package Index</title>            
            <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
            <meta name="viewport" content="width=device-width,initial-scale=1" />
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
            <link rel="stylesheet" type="text/css" href="styles/main.css" />
            <link rel="stylesheet" type="text/css" href="highlight/styles/default.css" />
            <script src="highlight/highlight.pack.js"><xsl:comment/></script>
            <script>hljs.initHighlightingOnLoad();</script>
        </head>
        <body>
            <ul id="flags">
                <!-- do not use lang in navigation links here, the language will be take from the root site cookie --> 
                <li class="nav">
                    <a class="material-icons" href="https://wolf.ncbr.muni.cz/whitezone/root/index.php?action=main">home</a> / 
                    <a href="https://wolf.ncbr.muni.cz/whitezone/root/index.php?action=support">Support</a>
                </li>
                <li>
                    <a id="EN" href="index.php?lang=en&amp;action={$action}&amp;show={$show}"><img src="images/en.png" alt="english flag" />English</a> 
                </li>
            </ul>
            <div id="header">
                <h1>Packages</h1>
            </div>
            <ul id="nav">
                <li><a id="overview" href="index.php?lang={$lang}&amp;action={$action}&amp;show=overview">Overview</a></li>
                <li><a id="metadpkgs" href="index.php?lang={$lang}&amp;action={$action}&amp;show=metadpkgs">MetaPackages</a></li>
                <li><a id="alldpkgs" href="index.php?lang={$lang}&amp;action={$action}&amp;show=alldpkgs">All Packages</a></li>
                <li><a id="instructions" href="index.php?lang={$lang}&amp;action={$action}&amp;show=instructions">Instructions</a></li>
            </ul>
            <div id="main">
                <xsl:copy-of select="/div"/> 
            </div>
            <div id="footer">
                <p> 2016 Petr Kulhánek; Attendance is monitored by <a href="http://www.piwik.org">Piwik</a>.
                    <!-- Piwik -->
                    <script type="text/javascript">
                    var pkBaseURL = (("https:" == document.location.protocol) ? "https://lcc.ncbr.muni.cz/whitezone/piwik/" : "http://lcc.ncbr.muni.cz/whitezone/piwik/");
                    document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
                    </script><script type="text/javascript">
                    try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 1);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                    } catch( err ) {}
                    </script>
                    <!-- End Piwik Tag -->
                </p>
                <p>Found an error or improvement is needed? Please contact us at <a href="mailto: LCC Support &lt;support@lcc.ncbr.muni.cz&gt;">LCC Support &lt;support@lcc.ncbr.muni.cz&gt;</a>.</p>
            </div>	   
        </body>
    </html>
    </xsl:template>
</xsl:stylesheet> 