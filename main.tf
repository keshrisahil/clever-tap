resource "aws_db_instance" "wordpress_db" {
  allocated_storage     = 20
  engine                = var.rds_engine
  engine_version        = var.rds_engine_version
  instance_class        = var.rds_instance_class
  username              = var.rds_username
  password              = var.rds_password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  availability_zone  = var.availability_zones[0]  # Select first AZ

  multi_az = true  # Enable multi-AZ for high availability
}

resource "aws_security_group" "rds_sg" {
  name = "rds-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    cidr_blocks = [module.vpc.public_subnet_id]  # Allow access from public subnet
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}