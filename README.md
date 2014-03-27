# Hubot: hubot-dynstatus

[![Build Status](https://travis-ci.org/jjasghar/hubot-dynstatus.png?branch=master)](https://travis-ci.org/jjasghar/hubot-dynstatus)

## A DynDNS checker for Hubots.

You can check all three (top, email, dns) http://www.dynstatus.com feeds from this script. You can check as many posts as you would like also.

See [`src/dynstatus.coffee`](src/dynstatus.coffee) for full documentation.

## Installation

Add **hubot-dynstatus** to your `package.json` file:

```json
"dependencies": {
  "hubot": ">= 2.5.1",
  "hubot-scripts": ">= 2.4.2",
  "hubot-dynstatus": ">= 0.0.0"
}
```

Add **hubot-dynstatus** to your `external-scripts.json`:

```json
["hubot-dynstatus"]
```

Run `npm install hubot-dynstatus`

## Sample Interaction

```
user1>> hubot dyn email 1
hubot>> [RESOLVED] DynECT E-mail Sending Delays: http://www.dynstatus.com/dynect-email/6449/6449 @ Wed Mar 26 2014 16:01:43 GMT-0500 (CDT)
user1>> hubot dyn top 1
hubot>> [DynTLD, Standard & Remote Access Scheduled Maintenance: http://www.dynstatus.com/dyndns/6432/dyntld-standard-remote-access-scheduled-maintenance @ Tue Mar 25 2014 12:45:36 GMT-0500 (CDT)
user1>> hubot dyn dns 1
hubot>> [Resolved] DynECT DNS API and Portal Service Degradation: http://www.dynstatus.com/dynect-dns/6460/dynect-dns-api-and-portal-service-degradation @ Thu Mar 27 2014 15:08:03 GMT-0500 (CDT)
```
