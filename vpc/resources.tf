resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"

  tags {
      Name = "${var.project_name}"
  }
}


resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.main.id}"
  count                   = "1" 
  cidr_block              = "172.23.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = "true"

  tags {
    Name = "${var.project_name}_public_1"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = "${aws_vpc.main.id}"
 count                   = "1" 
  cidr_block              = "172.23.10.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = "false"

  tags {
    Name = "${var.project_name}_private_1"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.project_name}"
  }
}


resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "${var.project_name}_public"
  }
}


resource "aws_route_table_association" "rtap" {
  count          = "1"
  subnet_id      = "${aws_subnet.public.*.id[count.index]}"
  route_table_id = "${aws_route_table.public.id}"
}