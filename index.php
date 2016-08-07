<?php

// input -----------------------------------------------------------------------
if( isset($_GET['show']) ){
    $show = $_GET["show"];
} else {
    $show = 'overview';
}

if( isset($_GET['lang']) ){
    $lang = $_GET["lang"];
} else {
    $lang = 'EN';
}

// language setup --------------------------------------------------------------
$lang = strtoupper($lang);
if( $lang != 'EN' ) $lang = 'EN';   // currently only EN is supported

$xslt = new xsltProcessor;

// process show command --------------------------------------------------------
$data = DomDocument::load('packages.xml');
$xpath = new DOMXpath($data);
$repo_url = $xpath->query("/root/repository/url")->item(0)->nodeValue;
$repo_iscript = $xpath->query("/root/repository/iscript")->item(0)->nodeValue;

switch($show){
    case 'overview':
    default:
        $xslt->importStyleSheet(DomDocument::load(sprintf('styles/overview%s.xsl',$lang)));
        $res = $xslt->transformToDoc($data);           
        break;
        break;
    case 'metadpkgs':
        $xslt->importStyleSheet(DomDocument::load(sprintf('styles/metadpkgs%s.xsl',$lang)));
        $res = $xslt->transformToDoc($data); 
        break; 
    case 'alldpkgs':
        $xslt->importStyleSheet(DomDocument::load(sprintf('styles/alldpkgs%s.xsl',$lang)));
        $res = $xslt->transformToDoc($data); 
        break;  
    case 'package':
        $dpkg = 'none';
        if( isset($_GET["package"]) ){
            $dpkg = $_GET["package"];
        }
        $xslt->setParameter('','package',$dpkg);
        $xslt->importStyleSheet(DomDocument::load(sprintf('styles/package%s.xsl',$lang)));
        $res = $xslt->transformToDoc($data); 
        break;
    case 'instructions':
        $xslt->importStyleSheet(DomDocument::load(sprintf('styles/instructions%s.xsl',$lang)));
        $res = $xslt->transformToDoc($data);
        $nodes = $res->getElementsByTagName('code');
        foreach ($nodes as $node) {
            if( $node->getAttribute('id') == 'iscript' ){
                $iscript = file_get_contents($repo_url . '/' . $repo_iscript);
                $iscript_node = $res->createTextNode($iscript);
                $node->appendChild($iscript_node);
            }
        }
        break;
    }

// create final html page
$xslt->importStyleSheet(DomDocument::load(sprintf('styles/index%s.xsl',$lang)));
$xslt->setParameter('','action',$show);
$xslt->setParameter('',$show,'selected');
$fin = $xslt->transformToDoc($res);
//$fin->formatOutput = true;
print $fin->saveXML(); 

?>