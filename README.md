# Use Kafka with Skaffold

This is an example of deploying a Kafka cluster with Skaffold.

It uses the Bitnami Kafka cluster charts and the Helm tool for deployment.

# Quick Start

1. [Install Helm](https://helm.sh/docs/intro/install/)

1. Add the bitnami Charts Repo

    ```shell
    helm repo add bitnami  https://charts.bitnami.com/bitnami
    ```

1. [Install Skaffold](https://skaffold.dev/docs/install/)

1. Run `skaffold dev`

1. Connect with a Kafka client in the cluster:

    ```shell
    kubectl run kafka-client --restart='Never' --image docker.io/bitnami/kafka:2.8.0-debian-10-r55 --namespace default --command -- sleep infinity
    kubectl exec --tty -i kafka-client --namespace default -- bash
    kafka-console-producer.sh \
            --broker-list kafka-0.kafka-headless.default.svc.cluster.local:9092,kafka-1.kafka-headless.default.svc.cluster.local:9092 \
            --topic test
    kafka-console-consumer.sh \
            --bootstrap-server kafka.default.svc.cluster.local:9092 \
            --topic test \
            --from-beginning
    ```