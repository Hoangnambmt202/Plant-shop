<?php
namespace Aws\EMRContainers;

use Aws\AwsClient;

/**
 * This client is used to interact with the **Amazon EMR Containers** service.
 * @method \Aws\Result cancelJobRun(array $args = [])
 * @method \GuzzleHttp\Promise\Promise cancelJobRunAsync(array $args = [])
 * @method \Aws\Result createJobTemplate(array $args = [])
 * @method \GuzzleHttp\Promise\Promise createJobTemplateAsync(array $args = [])
 * @method \Aws\Result createManagedEndpoint(array $args = [])
 * @method \GuzzleHttp\Promise\Promise createManagedEndpointAsync(array $args = [])
 * @method \Aws\Result createSecurityConfiguration(array $args = [])
 * @method \GuzzleHttp\Promise\Promise createSecurityConfigurationAsync(array $args = [])
 * @method \Aws\Result createVirtualCluster(array $args = [])
 * @method \GuzzleHttp\Promise\Promise createVirtualClusterAsync(array $args = [])
 * @method \Aws\Result deleteJobTemplate(array $args = [])
 * @method \GuzzleHttp\Promise\Promise deleteJobTemplateAsync(array $args = [])
 * @method \Aws\Result deleteManagedEndpoint(array $args = [])
 * @method \GuzzleHttp\Promise\Promise deleteManagedEndpointAsync(array $args = [])
 * @method \Aws\Result deleteVirtualCluster(array $args = [])
 * @method \GuzzleHttp\Promise\Promise deleteVirtualClusterAsync(array $args = [])
 * @method \Aws\Result describeJobRun(array $args = [])
 * @method \GuzzleHttp\Promise\Promise describeJobRunAsync(array $args = [])
 * @method \Aws\Result describeJobTemplate(array $args = [])
 * @method \GuzzleHttp\Promise\Promise describeJobTemplateAsync(array $args = [])
 * @method \Aws\Result describeManagedEndpoint(array $args = [])
 * @method \GuzzleHttp\Promise\Promise describeManagedEndpointAsync(array $args = [])
 * @method \Aws\Result describeSecurityConfiguration(array $args = [])
 * @method \GuzzleHttp\Promise\Promise describeSecurityConfigurationAsync(array $args = [])
 * @method \Aws\Result describeVirtualCluster(array $args = [])
 * @method \GuzzleHttp\Promise\Promise describeVirtualClusterAsync(array $args = [])
 * @method \Aws\Result getManagedEndpointSessionCredentials(array $args = [])
 * @method \GuzzleHttp\Promise\Promise getManagedEndpointSessionCredentialsAsync(array $args = [])
 * @method \Aws\Result listJobRuns(array $args = [])
 * @method \GuzzleHttp\Promise\Promise listJobRunsAsync(array $args = [])
 * @method \Aws\Result listJobTemplates(array $args = [])
 * @method \GuzzleHttp\Promise\Promise listJobTemplatesAsync(array $args = [])
 * @method \Aws\Result listManagedEndpoints(array $args = [])
 * @method \GuzzleHttp\Promise\Promise listManagedEndpointsAsync(array $args = [])
 * @method \Aws\Result listSecurityConfigurations(array $args = [])
 * @method \GuzzleHttp\Promise\Promise listSecurityConfigurationsAsync(array $args = [])
 * @method \Aws\Result listTagsForResource(array $args = [])
 * @method \GuzzleHttp\Promise\Promise listTagsForResourceAsync(array $args = [])
 * @method \Aws\Result listVirtualClusters(array $args = [])
 * @method \GuzzleHttp\Promise\Promise listVirtualClustersAsync(array $args = [])
 * @method \Aws\Result startJobRun(array $args = [])
 * @method \GuzzleHttp\Promise\Promise startJobRunAsync(array $args = [])
 * @method \Aws\Result tagResource(array $args = [])
 * @method \GuzzleHttp\Promise\Promise tagResourceAsync(array $args = [])
 * @method \Aws\Result untagResource(array $args = [])
 * @method \GuzzleHttp\Promise\Promise untagResourceAsync(array $args = [])
 */
class EMRContainersClient extends AwsClient {}
