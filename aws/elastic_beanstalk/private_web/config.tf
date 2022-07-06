locals {
  env = {
    _defaults = {
      region                   = "{aws_region}"
      beanstalkApp             = "private_web"
      beanstalkAppDesc         = "My Private Web"
      solutionStackName        = "64bit Amazon Linux 2 v3.4.16 running Docker"
      tier                     = "WebServer"
      minSize                  = 1
      maxSize                  = 1
      EC2Subnets               = "{aws_private_subnet_1_id},{aws_private_subnet_2_id}"
      ELBSubnets               = "{aws_public_subnet_1_id},{aws_public_subnet_2_id}"
      AssociatePublicIpAddress = false
      KeyNameSSH               = "{aws_key_name}"
      maxBatchSize             = 1
      minInstancesInService    = 0
      rollingUpdateEnabled     = true
      rollingUpdateType        = "Health"
      healthcheckURL           = "/status"
      instanceTypes            = "t3.small"
      enableSpot               = true
      spotMaxPrice             = "0.02"
      spotFleetOnDemandBase    = 0
      iamInstanceProfile       = "{aws_iam_role_name_instance}"
      serviceRole              = "{aws_iam_role_name_service}"
      rootVolumeIOPS           = "3000"
      rootVolumeSize           = "10"
      rootVolumeType           = "gp3"
      monitoringInterval       = "1 minute"
      streamLogs               = true
      deleteLogsOnTerminate    = true
      retentionLogsInDays      = 1
      deploymentPolicy         = "immutable"
      rollingUpdateType        = "Health"
      batchSizeType            = "Percentage"
      batchSize                = 50
      loadBalancerType         = "application"
      applicationPort          = 80
      healthCheckPath          = "/status"
      matcherHTTPCode          = "200"
      systemType               = "enhanced"
      configDocument           = "${file("../cloudWatch_Metrics.json")}"
      defaultProcess443        = "default"
      protocol443              = "HTTPS"
      certificateArns443       = "arn:aws:acm:{aws_region}:{aws_account}:certificate/{aws_certificate_id}"
      accessLogsS3Enabled      = false
      accessLogsS3Bucket       = "{aws_s3_bucket}"
      accessLogsS3Prefix       = "default"
      idleTimeout              = 180
      logPublicationControl    = false
      measureName              = "NetworkOut"
      measureUnit              = "Bytes"
      lowerThreshold           = 2000000
      upperThreshold           = 6000000
      period                   = 1
      managedActionsEnabled    = true
      preferredStartTime       = "WED:11:00"
      updateLevel              = "minor"
      team                     = "dev"
      product                  = "private_web"
      department               = "tech"
      asgScheduleAction = [
        {
          name     = "Recurrence"
          value    = "0 5 * * *"
          resource = "start"
        },
        {
          name     = "MaxSize"
          value    = "1"
          resource = "start"
        },
        {
          name     = "MinSize"
          value    = "1"
          resource = "start"
        },
        {
          name     = "Recurrence"
          value    = "0 22 * * *"
          resource = "stop"
        },
        {
          name     = "MaxSize"
          value    = "0"
          resource = "stop"
        },
        {
          name     = "MinSize"
          value    = "0"
          resource = "stop"
        },
        {
          name     = "StartTime"
          value    = "2021-09-04T12:30:00Z"
          resource = "restart"
        },
        {
          name     = "DesiredCapacity"
          value    = "1"
          resource = "restart"
        },
        {
          name     = "MaxSize"
          value    = "1"
          resource = "restart"
        },
        {
          name     = "MinSize"
          value    = "1"
          resource = "restart"
        }
      ]
      environmentVariables = [
        {
          name  = "KEY"
          value = "value"
        }
      ]
    }
    staging = {
      beanstalkAppEnv     = "staging"
      beanstalkAppName    = "private_web-staging"
      retentionLogsInDays = 3
      accessLogsS3Enabled = true
      accessLogsS3Prefix  = "private_web-staging"
      environment         = "staging"
    }
    production = {
      beanstalkAppEnv       = "production"
      beanstalkAppName      = "gehry--production"
      instanceTypes         = "t3.medium"
      deploymentPolicy      = "RollingWithAdditionalBatch"
      deleteLogsOnTerminate = false
      retentionLogsInDays   = 7
      minSize               = 1
      maxSize               = 2
      maxBatchSize          = 1
      minInstancesInService = 1
      enableSpot            = false
      spotFleetOnDemandBase = 1
      logPublicationControl = true
      accessLogsS3Enabled   = true
      accessLogsS3Prefix    = "private_web-production"
      measureName           = "NetworkOut"
      measureUnit           = "Bytes"
      lowerThreshold        = 25000000
      upperThreshold        = 100000000
      environment           = "production"
      asgScheduleAction     = []
      environmentVariables = [
        {
          name  = "KEY"
          value = "production_value"
        }
      ]
    }
  }
  config = merge(
    lookup(local.env, "_defaults"),
    lookup(local.env, terraform.workspace)
  )
}
