<!doctype html>

<cfscript>

    strings = "111111,3333,9,888,2222222222,44,555,6666,777777";

    lstrings = strings.ListMap(function(s){return s.len();});

    stringsorted = strings.listMap(function(v,i,l) {
            var newValue = "#numberFormat(v.len(),'00')#:#v#";
            return newValue;})
        .listSort("text","asc");


    finalanswer = stringsorted.listMap(function(e){return mid(e,4,e.len());});

</cfscript>

<html>
    <head>
        <title>Test pg</title>
        <link href="site.css" rel="stylesheet">
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="e1.cfm">E1</a></li>
                <li><a href="e2.cfm">E2</a></li>
                <li class="active"><a href="e3.cfm">E3</a></li>
            </ul>
        </nav>
    
        <header>
        <h1>Example 3</h1>
        </header>
        <article>
        <h2>Power Programming</h2>
        <h3>Print a list of strings sorted in order by length from those with fewest chars to the most chars</h3>

        <cfscript>

            writeDump([{strings=strings},{lstrings=lstrings},{stringsorted:stringsorted}]);

            writeDump([{finalanswer=finalanswer}]);

            writeOutput("<br/>");
        
        </cfscript>

        </article>
    </body>
