terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.4"
        }
    }
   backend "s3" {  }
}

provider "aws" {
  region = local.config.region
}

resource "aws_elastic_beanstalk_environment" "beanstalkAppName" {
  name                = local.config.beanstalkAppName
  application         = local.config.beanstalkApp
  solution_stack_name = local.config.solutionStackName
  tier                = local.config.tier
  cname_prefix        = local.config.beanstalkAppName

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
    namespace = "aws:autoscaling:trigger"
    name      = "MeasureName"
    value     = local.config.measureName
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Unit"
    value     = local.config.measureUnit
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "LowerThreshold"
    value     = local.config.lowerThreshold
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "UpperThreshold"
    value     = local.config.upperThreshold
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Period"
    value     = local.config.period
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MaxBatchSize"
    value     = local.config.maxBatchSize
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MinInstancesInService"
    value     = local.config.minInstancesInService
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = local.config.rollingUpdateEnabled
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateType"
    value     = local.config.rollingUpdateType
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
    namespace = "aws:ec2:instances"
    name      = "SpotFleetOnDemandBase"
    value     = local.config.spotFleetOnDemandBase
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:application"
    name      = "Application Healthcheck URL"
    value     = local.config.healthcheckURL
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
    name      = "ServiceRole"
    value     = local.config.serviceRole
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = local.config.loadBalancerType
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "Port"
    value     = local.config.applicationPort
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "HealthCheckPath"
    value     = local.config.healthCheckPath
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "MatcherHTTPCode"
    value     = local.config.matcherHTTPCode
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
  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "DefaultProcess"
    value     = local.config.defaultProcess443
    resource  = ""
  }  
  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "Protocol"
    value     = local.config.protocol443
    resource  = ""
  }  
  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "SSLCertificateArns"
    value     = local.config.certificateArns443
    resource  = ""
  }
  setting {
    namespace = "aws:elbv2:loadbalancer"
    name      = "AccessLogsS3Enabled"
    value     = local.config.accessLogsS3Enabled
    resource  = ""
  }
  setting {
    namespace = "aws:elbv2:loadbalancer"
    name      = "AccessLogsS3Bucket"
    value     = local.config.accessLogsS3Bucket
    resource  = ""
  }
  setting {
    namespace = "aws:elbv2:loadbalancer"
    name      = "AccessLogsS3Prefix"
    value     = local.config.accessLogsS3Prefix
    resource  = ""
  }
  setting {
    namespace = "aws:elbv2:loadbalancer"
    name      = "IdleTimeout"
    value     = local.config.idleTimeout
    resource  = ""
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = local.config.EC2Subnets
    resource  = ""
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = local.config.ELBSubnets
    resource  = ""
  }
  setting {
    namespace = "aws:ec2:vpc" 
    name      = "AssociatePublicIpAddress"
    value     = local.config.AssociatePublicIpAddress
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
  dynamic "setting" {
    for_each = local.config.asgScheduleAction
    content {
      namespace      = "aws:autoscaling:scheduledaction"
      name           = "${setting.value.name}"
      value          = setting.value.value
      resource       = "${setting.value.resource}"
    }
  }
  tags = {
    Team          = "${local.config.team}"
    Product       = "${local.config.product}"
    Department    = "${local.config.department}"
    Environment   = "${local.config.environment}"
  }
}

data "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_elastic_beanstalk_environment.beanstalkAppName.load_balancers[0]
  port = 80
}
data "aws_lb_listener" "http_listener443" {
  load_balancer_arn = aws_elastic_beanstalk_environment.beanstalkAppName.load_balancers[0]
  port = 443
}

resource "aws_lb_listener_rule" "redirect_http_to_https" {
  listener_arn = data.aws_lb_listener.http_listener.arn
  priority = 1
  action {
    type = "redirect"
    redirect {
      port = "443"
      protocol = "HTTPS"
      host = "#{host}"
      path = "/#{path}"
      query = "#{query}"
      status_code = "HTTP_301"
    }
  }
  condition {
    path_pattern {
      values = ["/*"]
    }
  }
  tags = {
    Team          = "${local.config.team}"
    Product       = "${local.config.product}"
    Department    = "${local.config.department}"
    Environment   = "${local.config.environment}"
  }
}
