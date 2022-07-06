terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.4"
        }
    }
   backend "s3" {  }
}

// Definition of provider and the region
provider "aws" {
  region = local.config.region
}

// Definition of elastic beanstalk environment
resource "aws_elastic_beanstalk_environment" "beanstalkAppName" {
  name                = local.config.beanstalkAppName
  application         = local.config.beanstalkApp
  solution_stack_name = local.config.solutionStackName
  tier                = local.config.tier

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = local.config.minSize
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = local.config.maxSize
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = local.config.iamInstanceProfile
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeIOPS"
    value     = local.config.rootVolumeIOPS
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeSize"
    value     = local.config.rootVolumeSize
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeType"
    value     = local.config.rootVolumeType
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = local.config.KeyNameSSH
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "MonitoringInterval"
    value     = local.config.monitoringInterval
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = local.config.rollingUpdateEnabled
    resource  = ""
  }
  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = local.config.instanceTypes
    resource  = ""
  }
setting {
    namespace = "aws:ec2:instances"
    name      = "EnableSpot"
    value     = local.config.enableSpot
    resource  = ""
  }
  setting {
    namespace = "aws:ec2:instances"
    name      = "SpotMaxPrice"
    value     = local.config.spotMaxPrice
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "StreamLogs"
    value     = local.config.streamLogs
    resource  = ""
  } 
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "DeleteOnTerminate"
    value     = local.config.deleteLogsOnTerminate
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "RetentionInDays"
    value     = local.config.retentionLogsInDays
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "DeploymentPolicy"
    value     = local.config.deploymentPolicy
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSizeType"
    value     = local.config.batchSizeType
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSize"
    value     = local.config.batchSize
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = local.config.environmentType
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = local.config.serviceRole
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = local.config.systemType
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "ConfigDocument"
    value     = local.config.configDocument
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:hostmanager"
    name      = "LogPublicationControl"
    value     = local.config.logPublicationControl
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:managedactions"
    name      = "ManagedActionsEnabled"
    value     = local.config.managedActionsEnabled
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:managedactions"
    name      = "PreferredStartTime"
    value     = local.config.preferredStartTime
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
    name      = "UpdateLevel"
    value     = local.config.updateLevel
    resource  = ""
  }
  dynamic "setting" {
    for_each = local.config.environmentVariables
    content {
      namespace      = "aws:elasticbeanstalk:application:environment"
      name           = "${setting.value.name}"
      value          = setting.value.value
      resource       = ""
    }
  }
  tags = {
    Team          = "${local.config.team}"
    Product       = "${local.config.product}"
    Department    = "${local.config.department}"
    Environment   = "${local.config.environment}"
  }
}