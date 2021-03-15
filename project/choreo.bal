import ballerinax/github.webhook as webhook;
import ballerina/websub;
import ballerina/log;

configurable string CHOREO_APP_INVOCATION_URL = ?;
configurable string ACCESS_TOKEN_515EB459_832C_11EB_B869_86B98E9143BB = ?;
configurable string CLIENT_SECRET_515EB459_832C_11EB_B869_86B98E9143BB = ?;

listener webhook:Listener githubWebhookListener = new (8090);

@websub:SubscriberServiceConfig {
    target: [webhook:HUB, "https://github.com/kanushka-fb/test-repo/events/*.json"],
    secret: CLIENT_SECRET_515EB459_832C_11EB_B869_86B98E9143BB,
    callback: CHOREO_APP_INVOCATION_URL,
    httpConfig: {
        auth: {
            token: ACCESS_TOKEN_515EB459_832C_11EB_B869_86B98E9143BB
        }
    }
}

service / on githubWebhookListener {
    remote function onIssuesOpened(webhook:IssuesEvent event) returns webhook:Acknowledgement? {
       log:print("**************************************************"); 
    }
}
