pipeline {
   agent {
      docker {
         image "python"
      }
   }

   stages {
      stage('Build') {
         steps {
            sh "pip install -r requirements.txt"
         }
      }

      stage('Tests') {
         steps {
            echo "robot -d ./results specs/api"
         }
      }
   }
}