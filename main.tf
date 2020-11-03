provider "aws" {
  region = "us-west-2"
}

resource "aws_sns_topic" "email_notification" {
  name = "user-updates-topic"
}


resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.email_notification.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.user_updates_queue.arn
}
