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

1. Run `skaffold dev`. You can now update the Kafka config in [skaffold.yaml](./skaffold.yaml)
   or update the [test script](./test.sh).