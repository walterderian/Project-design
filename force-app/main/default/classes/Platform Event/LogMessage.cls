public with sharing class LogMessage {

    public String requestId{
        get{
            if( requestId == null ) {
                return Request.getCurrent().getRequestId();
            }

            return requestId;
        }

        private set;
    }


    /* This declaration check for quiddity var, if it's null 
       the var is initialized. Otherwise is returned */

    public String quiddity{
        get {
            if( quiddity == null) {
                quiddity = Request.getCurrent().getQuiddity().name();
            }

            return quiddity;
        }

        private set;

    }

    public String message { get; set; }
    public LogSeverity severity {get; set; }

    public SObject toEvent() {

        return new Log__e(
            Log_Message__c = this.message,
            Quiddity__c = this.quiddity,
            Request_Id__c = this.requestId,
            Severity__c = this.severity?.name()
        );
    }

    public LogMessage(String message) {
        this.message = message;
    }

    public LogMessage(Exception ex) {
        this.message = 'Exception: [' + ex.getTypeName()+ '] : ' +
                        ex.getmessage() + '\n StackTrace: ' +
                        ex.getStackTraceString();
    }

}
