<!doctype html>

<cfscript>

    a = [1,2,3,4,5,6];

    // IP:
    b = [];
    for (i=1; i<=a.len(); i++)
    {
        b.append(a[i]+3);
    }

    // FP: map - applying a function and a value to each item in array, returns a new array, 'a' not touched.
    aprime = a.map(function(x){return x + 3;});


    // coldfusion supports a "static" method syntax too - does same thing:
    complexData = [ {a: 4}, {a: 18}, {a: 51} ];
    newArray = arrayMap( complexData, function(item){
    return item.a;
    });

</cfscript>

<html>
    <head>
        <title>Test pg</title>
        <link href="site.css" rel="stylesheet">
    </head>
    <body>
        <nav>
            <ul>
                <li class="active"><a href="e1.cfm">E1</a></li>
                <li><a href="e2.cfm">E2</a></li>
                <li><a href="e3.cfm">E3</a></li>
            </ul>
        </nav>
    
        <h1>Example 1</h1>
        <h2>Powerful syntax</h2>
        <h3>Some simple examples</h3>
        <h4>Less code means less mistakes and once understood is easier to read</h4>

        <cfscript>
        
            writeDump([{"ArrrayA":a},{"ArrayB":b},{"aprime":aprime}]);
            
            writeOutput("<br/>");
        
        </cfscript>

    </body>
