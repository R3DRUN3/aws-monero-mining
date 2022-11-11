resource "aws_instance" "xmr-miner" {
  # Creates n identical aws ec2 instances for xmr mining
  count = var.instance_count    
  
  ami = lookup(var.ec2_ami,var.region) 
  instance_type = var.instance_type
  tags = {

    Name = "xmr-miner-${count.index}"
  }
  security_groups = [
    var.sec_group_name,
  ]
  vpc_security_group_ids = [
    aws_security_group.miners.id,
  ]
  user_data = "${file("./xmrig/run-xmrig.sh")}"
}

resource "aws_security_group" "miners" {
  description = var.sec_group_description
  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description = ""
      from_port = 0
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = "-1"
      security_groups = []
      self = false
      to_port = 0
    },
  ]
  ingress = [
    for _port in var.port_list:
    {
      cidr_blocks = [
      for _ip in var.ip_list:
      _ip
      ]
      description = ""
      from_port = _port
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = "tcp"
      security_groups = []
      self = false
      to_port = _port
    }
  ]
  name = var.sec_group_name
} 