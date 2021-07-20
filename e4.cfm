<!doctype html>

<cfscript>

    d2 = "{ts '2021-08-19 00:00:00'}";
    

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
                <li><a href="e3.cfm">E3</a></li>
                <li class="active"><a href="e4.cfm">E4</a></li>
            </ul>
        </nav>
    
        <header>
        <h1>Example 4</h1>
        </header>
        <h2>Date and Time Functions</h2>

        <cfscript>

            writeDump([{date=d2},{datetest1=isDate(d2)}]);

            writeOutput("<br/>");
        
        </cfscript>

    </body>
