
var xml = {}; // data
var xsl = {}; // transformation

// ----------------------------------------------------------------------------

function loadXML(filename) {
    
    if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari
        xml=new XMLHttpRequest();
    } else { // code for IE6, IE5
        xml=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xml.open("GET", filename, true);
    xml.onreadystatechange = function() {
        if ( (xml.readyState == 4) && (xml.status == 200) && (xsl.readyState == 4) && (xsl.status == 200) ) {
            transform_document();
        }
    };     
    xml.send();
}

// ----------------------------------------------------------------------------

function loadXSL(filename) {
    
    if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari
        xsl=new XMLHttpRequest();
    } else { // code for IE6, IE5
        xsl=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xsl.open("GET", filename, true);
    xsl.onreadystatechange = function() {
        if ( (xml.readyState == 4) && (xml.status == 200) && (xsl.readyState == 4) && (xsl.status == 200) ) {
            transform_document();
        }
    };     
    xsl.send();
}

// ----------------------------------------------------------------------------

function transform_document() {
    // code for IE
    if (window.ActiveXObject) {
        ex = xml.responseXML.transformNode(xsl.responseXML);
        document.getElementById("topic").innerHTML = ex;
    } // code for Chrome, Firefox, Opera, etc.
    else if (document.implementation && document.implementation.createDocument) {
        xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xsl.responseXML);
        xsltProcessor.setParameter(null, "package", dpkgname);
        resultDocument = xsltProcessor.transformToFragment(xml.responseXML, document);
        document.getElementById("topic").appendChild(resultDocument);
    }
}

// ----------------------------------------------------------------------------

function load_iscript(name)
{
    if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari
        client=new XMLHttpRequest();
    } else { // code for IE6, IE5
        client=new ActiveXObject("Microsoft.XMLHTTP");
    }
    client.open('GET', name, true);
    client.overrideMimeType('text/plain; charset=x-user-defined');
    client.onreadystatechange = function() {
        if (client.readyState == 4 && client.status == 200) {
            var res = hljs.highlight("bash",client.responseText);
            document.getElementById("iscript").innerHTML = res.value;
        }
    };    
    client.send(); 
}

// ----------------------------------------------------------------------------

function displayResult()
{
    // parse URI    
    var uri = new URI(window.location.href);
    var cmds = uri.search(true);
    
    // source data
    loadXML("packages.xml");
    dpkgname = "";
    
    // data transformation
    switch(cmds["show"]){
        case 'instructions':
            document.getElementById("instructions").className = "selected";
            loadXSL("styles/instructions.xsl");
            break;
        case 'metadpkgs':
            document.getElementById("metadpkgs").className = "selected";
            loadXSL("styles/metadpkgs.xsl");
            break; 
        case 'alldpkgs':
            document.getElementById("alldpkgs").className = "selected";
            loadXSL("styles/alldpkgs.xsl");
            break;  
        case 'package':
            dpkgname = cmds["package"];
            loadXSL("styles/package.xsl");
            break;             
        case 'overview':
        default:
            document.getElementById("overview").className = "selected";            
            loadXSL("styles/overview.xsl");
            break;
    }
}

// ----------------------------------------------------------------------------