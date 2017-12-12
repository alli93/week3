node {    
    checkout scm
    stage('Clean') {
        // Clean files from last build.
        sh 'git clean -dfxq'
    }
    stage('Setup') {
        // Prefer yarn over npm.
        sh 'yarn install || npm install'
        dir('client')
        {
            sh 'yarn install || npm install'
        }
    }
    stage('Test') {
        sh 'npm run test:nowatch'
    }
    stage('Deploy') {
        sh './dockerbuild.sh'
        dir('./provisioning')
        {
            sh "./provision-new-environment.sh"
        }
    }
    stage('job') {
    sh 'npm install -g nodemon'
    sh 'npm install -g create-react-app'
    sh 'npm run startpostgres && sleep 10 && npm run migratedb'
    sh 'npm run 'startserver'
    dir ('client') 
    {
        sh 'npm install'
        sh 'npm run start'
    }
    sh 'npm run apitest'
    sh 'npm run loadtest'
    }
}