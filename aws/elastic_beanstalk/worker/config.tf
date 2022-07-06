locals {
  env = {
    _defaults = {
      region                = "{aws_region}"
      beanstalkApp          = "worker"
      beanstalkAppDesc      = "My Worker"
      solutionStackName     = "64bit Amazon Linux 2 v3.4.16 running Docker"
      tier                  = "Worker"
      minSize               = 1
      maxSize               = 1
      KeyNameSSH            = "{aws_key_name}"
      monitoringInterval    = "1 minute"
      rollingUpdateEnabled  = false
      instanceTypes         = "t3.small"
      enableSpot            = true
      spotMaxPrice          = "0.02"
      iamInstanceProfile    = "{aws_iam_role_name_instance}"
      environmentType       = "SingleInstance"
      serviceRole           = "{aws_iam_role_name_service}"
      rootVolumeIOPS        = "3000"
      rootVolumeSize        = "10"
      rootVolumeType        = "gp3"
      streamLogs            = true
      deleteLogsOnTerminate = true
      retentionLogsInDays   = 1
      deploymentPolicy      = "AllAtOnce"
      batchSizeType         = "Percentage"
      batchSize             = 100
      systemType            = "enhanced"
      configDocument        = "${file("../cloudWatch_Metrics.json")}"
      logPublicationControl = false
      managedActionsEnabled = true
      preferredStartTime    = "WED:11:00"
      updateLevel           = "minor"
      team                  = "data"
      product               = "Worker"
      department            = "tech"
      environmentVariables = [
        {
          name  = "KEY"
          value = "value"
        }

      ]
    }
    staging = {
      beanstalkAppEnv       = "staging"
      beanstalkAppName      = "worker-staging"
      retentionLogsInDays   = 1
      deleteLogsOnTerminate = true
      logPublicationControl = true
      environment           = "staging"
    }
    production = {
      beanstalkAppEnv       = "production"
      beanstalkAppName      = "worker-production"
      retentionLogsInDays   = 7
      deleteLogsOnTerminate = false
      logPublicationControl = true
      environment           = "production"
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
