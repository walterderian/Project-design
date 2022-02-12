public with sharing class Log {

    private static Log currentInstance;
    private List<LogMessage> buffer;

    public Log() {
        buffer = new List<LogMessage>();
    }

    public static Log get(){

        if(currentInstance == null) {
            currentInstance = new Log();
        }

        return currentInstance;
    }

    public void add( String messageToAdd ) {

        buffer.add( new LogMessage( messageToAdd) );
    }

    public void add( Exception exceptionToLog) {

        buffer.add( new LogMessage( exceptionToLog) );
    }

    public void publish() {
        List<SObject> rawLogs = new List<SObject>();

        for( LogMessage msg: this.buffer ) {
            rawLogs.add(msg.toEvent());
        }
        Eventbus.publish(rawLogs);
        this.buffer.clear();
    }

    public void publish( String messageToAdd ) {
        this.buffer.add( new LogMessage(messageToAdd));
        this.publish();
    }


}
