<?php

// input -----------------------------------------------------------------------
if( isset($_GET['lang']) ){
    $lang = $_GET["lang"];
} else {
    $lang = 'EN';
}

if( isset($_GET['action']) ){
    $action = $_GET["action"];
} else {
    $action = 'main';
}

if( isset($_GET['show']) ){
    $show = $_GET["show"];
} else {
    $show = 'overview';
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

if( ! file_exists( sprintf('actions/%s/%s%s.xsl',$action,$show,$lang) ) ){
    $action = 'main';
    $show = 'overview';
}

switch($show){
    case 'package':
        $dpkg = 'none';
        if( isset($_GET["package"]) ){
            $dpkg = $_GET["package"];
        }
        $xslt->setParameter('','package',$dpkg);
    default:
        $xslt->importStyleSheet(DomDocument::load(sprintf('actions/%s/%s%s.xsl',$action,$show,$lang)));
        $res = $xslt->transformToDoc($data);           
        break;
    case 'instructions':
        $xslt->importStyleSheet(DomDocument::load(sprintf('actions/%s/%s%s.xsl',$action,$show,$lang)));
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
$xslt->importStyleSheet(DomDocument::load(sprintf('actions/%s/index%s.xsl',$action,$lang)));
$xslt->setParameter('','lang',strtolower($lang));
$xslt->setParameter('','action',$action);
$xslt->setParameter('','show',$show);
$fin = $xslt->transformToDoc($res);

// select menu items
$nodes = $fin->getElementsByTagName('a');
foreach ($nodes as $node) {
    if( $node->getAttribute('id') == $lang ){
        $node->setAttribute('class','selected');
    }
    if( $node->getAttribute('id') == $show ){
        $node->setAttribute('class','selected');
    }
}

print $fin->saveXML(); 

?>