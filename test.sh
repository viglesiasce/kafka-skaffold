#!/usr/bin/env bash

while true; do
  echo "Sending messages to Kafka..."
  kafka-console-producer.sh \
              --bootstrap-server kafka-0.kafka-headless:9092,kafka-1.kafka-headless:9092 \
              --topic test < ./input.txt

  echo "Reading messages from Kafka..."
  kafka-console-consumer.sh \
              --bootstrap-server kafka-0.kafka-headless:9092,kafka-1.kafka-headless:9092 \
              --topic test \
              --from-beginning \
              --max-messages 5
  echo "Deleting topic..."
  kafka-topics.sh --bootstrap-server kafka-0.kafka-headless:9092,kafka-1.kafka-headless:9092 \
                  --delete \
                  --topic test
  echo "Sleeping for 5 seconds..."
  sleep 5
done