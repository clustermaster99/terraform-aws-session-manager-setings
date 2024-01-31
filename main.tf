resource "aws_ssm_document" "session_manager_preferences" {
  name            = "SSM-SessionManagerRunShell"
  document_type   = "Session"
  document_format = "JSON"

  content = <<DOC
{
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for SessionManager",
    "sessionType": "Standard_Stream",
    "UpdateMethod": "NewVersion",
    "inputs": {
        "s3BucketName": "",
        "s3KeyPrefix": "",
        "s3EncryptionEnabled": true,
        "cloudWatchLogGroupName": "${var.cloudwatch_log_group_name}",
        "cloudWatchEncryptionEnabled": true,
        "cloudWatchStreamingEnabled": true, 
        "idleSessionTimeout": "20",
        "maxSessionDuration": "",
        "kmsKeyId": "",
        "runAsEnabled": false,
        "runAsDefaultUser": "",
        "shellProfile": {
            "windows": "",
            "linux": ""
        }
    }
}
DOC
}