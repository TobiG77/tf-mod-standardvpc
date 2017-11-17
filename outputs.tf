output "vpc_id" {
  value = "${aws_vpc.legacy.id}"
}

output "private_subnets" {
  value = ["${aws_subnet.private_a.id}", "${aws_subnet.private_b.id}", "${aws_subnet.private_c.id}"]
}

output "public_subnets" {
  value = ["${aws_subnet.public_a.id}", "${aws_subnet.public_b.id}", "${aws_subnet.public_c.id}"]
}

output "rds_subnets" {
  value = ["${aws_subnet.rds_a.id}", "${aws_subnet.rds_b.id}", "${aws_subnet.rds_c.id}"]
}

output "availability_zones" {
  value = ["${var.region}a", "${var.region}b", "${var.region}c"]
}

output "vpc_cidr" {
  value = "${var.vpc_legacy_cidr}"
}