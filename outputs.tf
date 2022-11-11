output "xmr_miners" {
  value = aws_instance.xmr-miner.*.arn 
}