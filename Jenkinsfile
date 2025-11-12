// This Jenkinsfile uses a declarative pipeline to build a Docker image
// and run the containerized Java application.

pipeline {
    // Agent 'any' means the pipeline can run on any available agent
    agent any

    // Environment variables can be defined here, e.g., for image naming
    environment {
        DOCKER_IMAGE = "my-java-hello-world:${env.BUILD_ID}"
    }

    stages {
        // Stage 1: Checkout (usually implicit, but good to name)
        stage('Checkout') {
            steps {
                // The source code management (SCM) block in the job configuration
                // handles the actual checkout. This step just confirms readiness.
                echo "Repository checked out successfully."
            }
        }

        // Stage 2: Build Docker Image
        stage('Build Docker Image') {
            // The tool is named 'docker' and should be pre-configured in Jenkins
            steps {
                // Build the Docker image using the Dockerfile in the current directory ('.')
                // The image tag uses the custom name and the Jenkins BUILD_ID for uniqueness
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                    echo "Docker image ${DOCKER_IMAGE} built successfully."
                }
            }
        }

        // Stage 3: Run Container
        stage('Run Container') {
            steps {
                // Run the built Docker image and print the output
                script {
                    echo "Running container..."
                    // -rm ensures the container is cleaned up immediately after execution
                    sh "docker run --rm ${DOCKER_IMAGE}"
                }
            }
        }

        // Stage 4: Clean Up (Optional but good practice)
        stage('Clean Up') {
            steps {
                script {
                    // Remove the local image to save space
                    sh "docker rmi -f ${DOCKER_IMAGE}"
                    echo "Clean up complete. Image ${DOCKER_IMAGE} removed."
                }
            }
        }
    }
}
