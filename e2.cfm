<!doctype html>

<cfscript>


   sumFunctions = createObject("component", "utils");
  
    // create a list of integers
    limit = 1e3;
    half = limit\2;  // do integer division
    myList = "";
    for (i = 1; i <= limit; i++) {
        myList = myList.listAppend(i);  // note: throws away and creates new myList each time.
    }


    // IDEA 1
    // try to sum the list of integers by splitting across two threads
    session.sum = 0;
    thread action="run" name="myThread" {
        // do single thread stuff 
        for (i=1; i <= half; i++)
        {
            session.sum += myList.listGetAt(i);
        }

    }
    thread action="run" name="myOtherThread" {
        // do single thread stuff 
        for (i=half+1; i <= limit; i++)
        {
            session.sum += myList.listGetAt(i);
        }

    } 
    // await threads to finish so we can continue;    
    thread action="join" name="myThread,myOtherThread";
    // session value sum should have sum of the integers



    // IDEA 2
    //isolate threads and sum outputs after threads complete.  what is the sum???
    session.tmp1 = 0;
    session.tmp2 = 0;
    thread action="run" name="t1" {
        session.tmp1 = sumFunctions.simpleSum(myList, 1, half);
    }
    thread action="run" name="t2" {
        session.tmp2 = sumFunctions.simpleSum(myList, half+1, limit);
    }
    //await completion of both threads before continuing...
    thread action="join" name="t1,t2";

    idea2 = session.tmp1 + session.tmp2;



    // IDEA 3 Do things the FP way
    // apply a reduce function to the list elements returning sum (left to right)
    // CF probably cannot but Scala, Clojure have optimizations that can take advantage of extra cores
    idea3 = myList.listReduce(function(previousValue,value){return previousValue+value;},0);

    
</cfscript>

<html>
    <head>
        <title>Immutable</title>
        <link href="site.css" rel="stylesheet">
    </head>
<body>
    <nav>
        <ul>
            <li><a href="e1.cfm">E1</a></li>
            <li class="active"><a href="e2.cfm">E2</a></li>
            <li><a href="e3.cfm">E3</a></li>
        </ul>
    </nav>

    <header>
    <h1>Example 2</h1>
    </header>

    <article>
        <header>
            <h2>Immutable values - why?  Make concurrency easier.</h2>
            <p>Find the sum of integers from 1 to 1 000</p>
        </header>

    <cfscript>

        writeOutput("<p>Sum of numbers 1 to #encodeForHTML(limit)# using TWO THREADS.</p>");
        writeOutput("<p>The first example fails, but the 2nd returns correct answer.</p>");
        writeOutput("BAD:  Sum of numbers TWO THREADS: #numberformat(session.sum,',')#");
        writeOutput("<br/>");
        writeOutput("GOOD: Sum of numbers using isolated threads: #numberformat(idea2,',')#");
        writeOutput("<br/>");
        writeOutput("BEST: Sum of numbers using FP: #numberformat(idea3,',')#");
        writeOutput("<br/>");
    
    </cfscript>
    
    </article>
</body>
