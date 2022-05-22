#!/usr/bin/env groovy


podTemplate(yaml: '''
    apiVersion: v1
    kind: Pod
    metadata:
      name: worker-pod
      namespace: jenkins
      labels:
        Environment: jenkins-iac-build
        Group: serverless-jobs
    spec:
      containers:
      - name: kaniko
        image: gcr.io/kaniko-project/executor:debug
        imagePullPolicy: Always
        command:
        - /busybox/cat
        tty: true
        volumeMounts:
          - name: kaniko-secret
            mountPath: /kaniko/.docker
      - name: worker-pod
        image: ubuntu
        command:
        - sleep
        args:
        - 99d
      volumes:
        - name: kaniko-secret
          secret:
            secretName: regcred
            items:
              - key: .dockerconfigjson
                path: config.json

''') {
  node(POD_LABEL) {
        container('worker-pod'){
            sh 'ls -l'
        }
        
        container('kaniko') {
          stage('build defined version') {
            sh "/kaniko/executor --dockerfile Dockerfile --context=git://github.com/ingomarlos/chal --destination=deninguem/build-apps:1.0.3"
          }
        }
  }
}
