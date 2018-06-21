#! /bin/bash -e


#declare -A MYMAP=( ['ftgo-appi-gateway']=8087  )


doforward() {
    service=$1
    port=$2
    remotePort=$3
    pod=$(kubectl get pods --selector=svc=$service  -o jsonpath='{.items[*].metadata.name}')
    echo $service $pod $port
    kubectl port-forward $pod ${port}:${remotePort} &
    echo $! > port-forward-${service}.pid
}

#MVP stuff
fuser -k 8081/tcp || true
fuser -k 8082/tcp || true
fuser -k 8083/tcp || true
fuser -k 8084/tcp || true
fuser -k 8085/tcp || true
fuser -k 8086/tcp || true
fuser -k 8087/tcp || true
#MVP end

doforward 'ftgo-accounting-service' 8085 8080

doforward 'ftgo-consumer-service' 8081 8080
doforward 'ftgo-api-gateway' 8087 8080
doforward 'ftgo-order-service' 8082 8080
doforward 'ftgo-restaurant-service' 8084 8080
doforward 'ftgo-restaurant-order-service' 8083 8080

#MVP stuff
doforward 'ftgo-order-history-service' 8086 8080
#MVP end

exit 0



