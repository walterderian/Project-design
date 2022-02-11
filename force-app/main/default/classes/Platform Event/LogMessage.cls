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
                quiddity = Request.getCurrent().getQuiddity();
            }

            return quiddity;
        }

        private set;

    }

}
