component { 
    
    this.name = "FP" & hash(getCurrentTemplatePath()); 
    this.applicationTimeout = createTimeSpan(0,1,0,0); 
    this.sessionTimeout = createTimeSpan(0,30,0,0); 
    this.sessionManagement = true; 
    this.setClientCookies = true;

    public boolean function onApplicationStart() { 
        return true; 
    } 

    public void function onApplicationEnd(struct applicationScope={}) { 
        return; 
    } 

    public void function onSessionStart() { 
        cookie.cftoken = {value="#session.cftoken#"};
        cookie.cfid = {value="#session.cfid#"};
        return; 
    } 

    public void function onSessionEnd(required struct sessionScope, struct applicationScope={}) { 
        return; 
    } 

    public boolean function onRequestStart(required string targetPage) { 
        return true; 
    } 

    public void function onRequest(required string targetPage) { 
        include arguments.targetPage; 
        return; 
    } 

    public void function onCFCRequest(string cfcname, string method, struct args) { 
        return; 
    } 

    public void function onRequestEnd() { 
        return; 
    } 

    // public void function onAbort(required string targetPage) { 
    //     return; 
    // } 

    // public void function onError(required any exception, required string eventName) { 
    //     return; 
    // } 

    public boolean function onMissingTemplate(required string targetPage) { 
        return true; 
    } 
}
