resource "aws_vpc" "legacy" {
  cidr_block           = "${var.vpc_legacy_cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name = "legacy"
  }
}

resource "aws_internet_gateway" "legacy" {
  vpc_id = "${aws_vpc.legacy.id}"

  tags {
    Name = "legacy"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.legacy.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.legacy.id}"
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = "${aws_internet_gateway.legacy.id}"
  }

  tags {
    Name = "legacy-public"
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = "${aws_subnet.public_a.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = "${aws_subnet.public_b.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public_c" {
  subnet_id      = "${aws_subnet.public_c.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_subnet" "public_a" {
  vpc_id                  = "${aws_vpc.legacy.id}"
  availability_zone       = "${var.region}a"
  cidr_block              = "${var.subnet_public_a}"
  map_public_ip_on_launch = false

  tags {
    Name = "public a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = "${aws_vpc.legacy.id}"
  availability_zone       = "${var.region}b"
  cidr_block              = "${var.subnet_public_b}"
  map_public_ip_on_launch = false

  tags {
    Name = "public b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id                  = "${aws_vpc.legacy.id}"
  availability_zone       = "${var.region}c"
  cidr_block              = "${var.subnet_public_c}"
  map_public_ip_on_launch = false

  tags {
    Name = "public c"
  }
}
