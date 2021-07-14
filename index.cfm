<!doctype html>


<cfscript>
    complexData = [ {a: 4}, {a: 18}, {a: 51} ];
    newArray = arrayMap( complexData, function(item){
    return item.a;
    });
    
</cfscript>



<html>
    <head>
        <title>Test pg</title>
    </head>
    <body>
        <h1>Example 1</h1>

        <cfscript>writeDump(newArray);</cfscript>

    </body>