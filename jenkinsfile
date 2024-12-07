pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-website:latest .'
                }
            }
        }
        stage('Push to Minikube') {
            steps {
                script {
                    sh '''
                    eval $(minikube docker-env)
                    docker build -t my-website:latest .
                    '''
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh '''
                    kubectl apply -f - <<EOF
                    apiVersion: v1
                    kind: Pod
                    metadata:
                      name: my-website
                    spec:
                      containers:
                      - name: my-website
                        image: my-website:latest
                        ports:
                        - containerPort: 80
                    EOF
                    '''
                }
            }
        }
    }
}
