## Overview

Ballerina connector for Apptigent PowerTools Developer is connecting the [Apptigent Powertools Developer API](https://portal.apptigent.com/node/612) via Ballerina language easily. Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. PowerTools is the ultimate developer toolkit. This module provides the capability for file operations.

This module supports [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612).

## Prerequisites

* Create [Apptigent](https://portal.apptigent.com/user/register) Account
* Obtain tokens
    1. Log into Apptigent Developer Portal by visiting https://portal.apptigent.com
    2. Create an app and obtain the `Client ID` which will be used as the `API Key` by following the guidelines described [here]((https://portal.apptigent.com/start)).
* Configure the connector with obtained tokens
 
## Quickstart

To use the Apptigent PowerTools Developer connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import Apptigent PowerTools Developer Files module
Import the ballerinax/powertoolsdeveloper.files module into the Ballerina project.
```ballerina
import ballerinax/powertoolsdeveloper.files as pf;
```
### Step 2: Initialize the client.
Initialize the client as follows. You can provide the Client ID obtained from the [Apptigent Developer Portal](https://portal.apptigent.com) in the configuration.
```ballerina
pf:ApiKeysConfig config = {
    apiKeys: {
        X-IBM-Client-Id: "<CLIENT_ID>"
    }
}
pf:Client baseClient = check new Client(config);
```
### Step 3: Generate a QR code image.
Generate a QR code image by providing the `InputQRCode` record with text value(s) (vertical bar delimited by type) and payload type.

```ballerina
public function main() {
    pf:InputQRCode inputQRCode = {
        input: "someone@example.com|Test message|This is a test.",
        payload: "Mail"
    };
    string|error response = baseClient->generateQRCode(inputQRCode);
    if (response is string) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 