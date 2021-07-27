FROM docker.io/bitnami/kafka:2.8.0-debian-10-r55
ADD test.sh input.txt ./
CMD ["./test.sh"]
