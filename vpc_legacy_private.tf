resource "aws_nat_gateway" "legacy" {
  subnet_id     = "${aws_subnet.public_b.id}"
  allocation_id = "${aws_eip.nat.id}"
  depends_on    = ["aws_eip.nat"]
  depends_on    = ["aws_internet_gateway.legacy"]

  tags {
    Name = "legacy"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_eip" "nat" {
  vpc        = true
  depends_on = ["aws_internet_gateway.legacy"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.legacy.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.legacy.id}"
  }

  tags {
    Name = "legacy-private"
  }
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = "${aws_subnet.private_a.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = "${aws_subnet.private_b.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private_c" {
  subnet_id      = "${aws_subnet.private_c.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_subnet" "private_a" {
  vpc_id                  = "${aws_vpc.legacy.id}"
  availability_zone       = "${var.region}a"
  cidr_block              = "${var.subnet_private_a}"
  map_public_ip_on_launch = false

  tags {
    Name = "private a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id                  = "${aws_vpc.legacy.id}"
  availability_zone       = "${var.region}b"
  cidr_block              = "${var.subnet_private_b}"
  map_public_ip_on_launch = false

  tags {
    Name = "private b"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id                  = "${aws_vpc.legacy.id}"
  availability_zone       = "${var.region}c"
  cidr_block              = "${var.subnet_private_c}"
  map_public_ip_on_launch = false

  tags {
    Name = "private c"
  }
}

resource "aws_subnet" "rds_a" {
  vpc_id                  = "${aws_vpc.legacy.id}"
  availability_zone       = "${var.region}a"
  cidr_block              = "${var.subnet_rds_a}"
  map_public_ip_on_launch = false

  tags {
    Name = "rds a"
  }
}

resource "aws_subnet" "rds_b" {
  vpc_id                  = "${aws_vpc.legacy.id}"
  availability_zone       = "${var.region}b"
  cidr_block              = "${var.subnet_rds_b}"
  map_public_ip_on_launch = false

  tags {
    Name = "rds b"
  }
}

resource "aws_subnet" "rds_c" {
  vpc_id                  = "${aws_vpc.legacy.id}"
  availability_zone       = "${var.region}c"
  cidr_block              = "${var.subnet_rds_c}"
  map_public_ip_on_launch = false

  tags {
    Name = "rds c"
  }
}
