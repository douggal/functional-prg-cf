component {

public function init(){
    //TODO create constructor
}

 public numeric function simpleSum(required l, required origin, required end) {
    var i = 0;
    var s = 0;
    for (i=arguments.origin; i <= arguments.end; i++)
    {
        s += arguments.l.listGetAt(i);
    };
    return s;
}

    public numeric function recurSum(required origin, required end) {
        var o = arguments.origin;
        var e = arguments.end;
        if (o eq e)
            return e;
        return o + recurSum(o+1, e);
}


}