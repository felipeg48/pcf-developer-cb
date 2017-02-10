+++
categories = ["general"]
date = "2016-03-08T15:10:46-06:00"
tags = ["document"]
title = "Services"

+++

Estimated Time: 25 minutes

# Requirements

[Lab Requirements](/pivotal-cloud-foundry-developer/requirements)

# What you will learn

* How to create a managed service instance
* How to create a user provided service instance
* How to bind an application to a service instance



# Exercises

## Review `articulate` dependencies

`articulate` exposes functionality to add attendees on the `Services` page.  However, `articulate` doesn't do this alone.  It makes REST calls to the `attendee-service` application. To learn more about services, let's provision the `attendee-service` application.

![Services](/pivotal-cloud-foundry-developer/resources/images/services.png)


## Push the `attendee-service` application

1) [Download](/pivotal-cloud-foundry-developer/resources/demo-apps/attendee-service-0.0.1-SNAPSHOT.jar) the `attendee-service` application.  Copy the file to folder: `~/pivotal-cloud-foundry-developer-workshop/attendee-service/` (`~` is shorthand for the home directory in Linux, Mac and Unix based operating systems).  You will need to create this directory in your <a href=https://en.wikipedia.org/wiki/Home_directory target="_blank">home</a> directory.

***NOTE:*** If your browser warns you about downloading this file please proceed to download it.

<a href=https://github.com/pivotal-enablement/attendee-service target="_blank">Source</a> is not required, but you may be curious how it works as you move through the labs.

2) Push the `attendee-service` application.

```
$ cd ~/pivotal-cloud-foundry-developer-workshop/attendee-service/
$ cf push attendee-service -p ./attendee-service-0.0.1-SNAPSHOT.jar -m 512M --random-route
```

Does `attendee-service` start up correctly?  Why not?

## Add a Managed Service

1) Review the <a href=http://docs.pivotal.io/pivotalcf/devguide/services/managing-services.html target="_blank">documentation</a> on managing service instances

2) Review what services are available in the marketplace.

```
$ cf marketplace
```

3) Provision a MySql service instance.

**Pivotal Cloud Foundry:**

```
$ cf create-service p-mysql 100mb-dev attendee-mysql
```

**Pivotal Web Services:**
```
$ cf create-service cleardb spark attendee-mysql
```


4) Now we need to bind the application with the service instance.

```
$ cf bind-service attendee-service attendee-mysql
```

_You can ignore the "TIP: Use 'cf restage attendee-service' to ensure your env variable changes take effect" message at this time._


5) Restart the application.

```
$ cf restart attendee-service
```

6) View the `attendee-service` in a browser.

You should see response similar to the following (pic is using the <a href=https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa?hl=en target="_blank">JSON Formatter for Chrome</a>):

![attendee-service](/pivotal-cloud-foundry-developer/resources/images/attendee_service.png "attendee-service")

### How does this work?

1) Read about how twelve-factor apps handle <a href=http://12factor.net/backing-services target="_blank">backing services</a> and <a href=http://12factor.net/config target="_blank">configuration</a>.

2) Read about <a href=https://docs.pivotal.io/pivotalcf/devguide/deploy-apps/environment-variable.html#VCAP-SERVICES target="_blank">VCAP_SERVICES</a>.

3) View the environment for `attendee-service`.

```
$ cf env attendee-service
```

4) Different languages/frameworks will have various ways to read environment variables.  `attendee-service` takes advantage of a <a href=https://github.com/cloudfoundry/java-buildpack target="_blank">Java Buildpack</a> feature called <a href=https://github.com/cloudfoundry/java-buildpack-auto-reconfiguration target="_blank">Auto-Reconfiguration</a> that will automatically re-write bean definitions to connect with services bound to an application.

### Questions

* After binding a service to an application why is the application restarted/restaged?
* In this case, why could we `restart` vs `restage`?


## Add a User Provided Service Instance

In the enterprise, not all services will be provisioned by Pivotal Cloud Foundry.

For example, consider your Oracle RAC cluster.  How can we connect our applications running on Pivotal Cloud Foundry to these external systems?

Additionally, how can we easily connect applications together running on the platform?

`articulate's` default configuration for the `attendee-service` `uri` is `http://localhost:8181/attendees`.  The subsequent steps will allow you to override the default configuration with your own.

1) Read about <a href=http://docs.pivotal.io/pivotalcf/devguide/services/user-provided.html target="_blank">user provided service instances</a>.

2) Create a user provided service instance.  This will create an interactive prompt.  Don't use the literal below for the value of `uri`, use your `attendee-service` `uri`.  Also make sure to specify `http` and include `/attendees` in the path.

***NOTE:*** This will not work with `https`.

```
$cf create-user-provided-service attendee-service -p uri

uri> http://attendee-service-surfy-glt.pcfi1.fe.gopivotal.com/attendees
```

3) Bind `articulate` to the `attendee-service` user provided service.

```
$ cf bind-service articulate attendee-service
```

_You can ignore the "TIP: Use 'cf restage articulate' to ensure your env variable changes take effect" message at this time._

4) Restart the application.

```
$ cf restart articulate
```

5) Refresh the `articulate` `Services` page.  You can now see the `attendee-service` listed under `Services`.

![articulate attendee](/pivotal-cloud-foundry-developer/resources/images/articulate_attendee.png "articulate attendee")

6) Review the environment.

```
$ cf env articulate
```

7) Add some attendees.

***NOTE:*** If you can't add attendees review the `articulate` logs and the user provided service instance configuration.

### Questions

* From an application perspective, are managed services instances different from user provided service instances?

# Beyond the class



* Use <a href=https://github.com/cloudfoundry-samples/spring-music target="_blank">Spring Music</a> and a User Provided Service Instance to connect to a database (MySQL or Oracle) in your environment.
