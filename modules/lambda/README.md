# Lambda Function Module

This Terraform module provisions an AWS Lambda function using a local ZIP file. It assumes that the required IAM role is created separately and passed in as an input.

---

## 📦 Features

- Creates an AWS Lambda function
- Accepts a local `.zip` file as code input
- Supports environment variables, VPC configuration, custom timeout and memory
- Integrates cleanly with separate IAM and API Gateway modules

---

## 🛠️ Required Inputs

| Variable              | Description                                 |
|-----------------------|---------------------------------------------|
| `function_name`       | Name of the Lambda function                 |
| `filename`            | Path to the ZIP file with your Lambda code  |
| `source_code_hash`    | Base64-encoded SHA256 hash of the ZIP file  |
| `handler`             | Lambda function handler (e.g. `index.handler`) |
| `iam_role_arn`        | ARN of the IAM role to use for execution    |

---

## ⚙️ Optional Inputs

| Variable              | Description                                 | Default        |
|-----------------------|---------------------------------------------|----------------|
| `runtime`             | Lambda runtime (e.g. `nodejs18.x`, `python3.11`) | `nodejs18.x`   |
| `timeout`             | Function timeout in seconds                 | `10`           |
| `memory_size`         | Memory size in MB                           | `128`          |
| `environment_variables` | Key-value map of environment variables   | `{}`           |
| `vpc_config`          | VPC subnet and security group IDs (optional) | `null`         |
| `tags`                | Resource tags                               | `{}`           |

---

## 🔁 Outputs

| Output          | Description                      |
|------------------|----------------------------------|
| `function_name`  | Lambda function name             |
| `invoke_arn`     | ARN used for invoking the Lambda |
| `arn`            | Full ARN of the Lambda function  |

---

## 🧪 Example Usage

```hcl
data "aws_iam_policy_document" "lambda_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

module "lambda_role" {
  source = "../modules/iam/roles/role"

  role_name               = "my-lambda-role"
  assume_role_policy_json = data.aws_iam_policy_document.lambda_assume.json
  policy_arns             = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
  create_instance_profile = false
}

module "lambda_function" {
  source           = "../modules/lambda_function"
  function_name    = "my-api-handler"
  filename         = "${path.module}/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda.zip")
  handler          = "index.handler"
  iam_role_arn     = module.lambda_role.arn

  environment_variables = {
    STAGE = "prod"
  }

  tags = {
    Project = "MyAPI"
  }
}
