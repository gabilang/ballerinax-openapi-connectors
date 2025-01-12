// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

# This is a generated connector for [SAPS4HANA Intelligent Trade Claims Management API v1.0.0](https://help.sap.com/viewer/902b9d277dfe48fea582d28849d54935/CURRENT/en-US) OpenAPI specification. 
# SAP Intelligent Trade Claims Management uses the organizational data services to represent distribution channel services, sales areas, sales divisions, and sales organizations for customer management.
@display {label: "SAPS4HANA ITCM Organizational Data", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create and configure an OAuth2 client credentials by following [this guide](https://help.sap.com/viewer/b865ed651e414196b39f8922db2122c7/LATEST/en-US/7aefa21a65f94b25b7e639c3931b6f83.html).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Create a new Distribution Channel
    #
    # + payload - Request payload to create distribution channel 
    # + return - Success Created. 
    remote isolated function createDistributionChannel(ExternalDistributionChannelDTO payload) returns ResponseCreated|error {
        string resourcePath = string `/distributionChannels`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ResponseCreated response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get particular Distribution Channel
    #
    # + externalId - externalId 
    # + return - OK. 
    remote isolated function getDistributionChannelByExternalId(string externalId) returns DistributionChannelResponse|error {
        string resourcePath = string `/distributionChannels/${getEncodedUri(externalId)}`;
        DistributionChannelResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete particular Distribution Channel
    #
    # + externalId - externalId 
    # + return - OK 
    remote isolated function deleteDistributionChannel(string externalId) returns DistributionChannelDeleteResponse|error {
        string resourcePath = string `/distributionChannels/${getEncodedUri(externalId)}`;
        DistributionChannelDeleteResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create a new Sales Area
    #
    # + payload - Request payload to create a sales area 
    # + return - Success Created. 
    remote isolated function createSalesArea(ExternalSalesAreaDTO payload) returns ResponseCreated|error {
        string resourcePath = string `/salesAreas`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ResponseCreated response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get particular Sales Area
    #
    # + externalId - externalId 
    # + return - OK. 
    remote isolated function getSalesAreaByExternalId(string externalId) returns SalesAreaResponse|error {
        string resourcePath = string `/salesAreas/${getEncodedUri(externalId)}`;
        SalesAreaResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete particular Sales Area
    #
    # + externalId - externalId 
    # + return - OK. 
    remote isolated function deleteSalesArea(string externalId) returns SalesAreaDeleteResponse|error {
        string resourcePath = string `/salesAreas/${getEncodedUri(externalId)}`;
        SalesAreaDeleteResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create a new Sales Division
    #
    # + payload - salesDivisionDTO 
    # + return - Success Created. 
    remote isolated function createSalesDivision(ExternalSalesDivisionDTO payload) returns ResponseCreated|error {
        string resourcePath = string `/salesDivisions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ResponseCreated response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get particular Sales Division
    #
    # + externalId - externalId 
    # + return - OK. 
    remote isolated function getSalesDivisionByExternalId(string externalId) returns SalesDivisionResponse|error {
        string resourcePath = string `/salesDivisions/${getEncodedUri(externalId)}`;
        SalesDivisionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # delete particular Sales Division
    #
    # + externalId - externalId 
    # + return - OK. 
    remote isolated function deleteSalesDivision(string externalId) returns SalesDivisionDeleteResponse|error {
        string resourcePath = string `/salesDivisions/${getEncodedUri(externalId)}`;
        SalesDivisionDeleteResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create a new Sales Organization
    #
    # + payload - Request payload to create sales organization 
    # + return - Success Created. 
    remote isolated function createSalesOrganization(ExternalSalesOrganizationDTO payload) returns ResponseCreated|error {
        string resourcePath = string `/salesOrganizations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ResponseCreated response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get particular Sales Organization
    #
    # + externalId - externalId 
    # + return - OK. 
    remote isolated function getSalesOrganizationByExternalId(string externalId) returns SalesOrganizationResponse|error {
        string resourcePath = string `/salesOrganizations/${getEncodedUri(externalId)}`;
        SalesOrganizationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete particular Sales Organization
    #
    # + externalId - externalId 
    # + return - OK 
    remote isolated function deleteSalesOrganization(string externalId) returns SalesOrgDeleteResponse|error {
        string resourcePath = string `/salesOrganizations/${getEncodedUri(externalId)}`;
        SalesOrgDeleteResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
