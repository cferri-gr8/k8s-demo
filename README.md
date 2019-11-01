# k8s-demo

Prerequisites:

1. Docker
1. [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
2. [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

Steps:

1. Build docker container in minikube environment
    ```sh
    eval $(minikube docker-env)
    docker build -t k8s-demo-image .
    ```

1. Use `kubectl` to apply resources
    ```sh
    kubectl apply -f deployment.yaml
    kubectl apply -f service.yaml
    kubectl apply -f ingress.yaml
    kubectl apply -f configmap.yaml
    ```

1. Find minikube endpoint for service
    ```sh
    minikube ip
    minikube service list
    ```
