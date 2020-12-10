MODEL_NAME=covid19
TEST_JSON="image_data2.json"
#TEST_JSON=$1

# Jupyter Notebook Terminal (K8s 내부)에서 실행 시
#INGRESS_HOST=kfserving-ingressgateway.istio-system
#INGRESS_PORT=80

# K8s 외부 실행 시
INGRESS_HOST=34.97.131.149
INGRESS_PORT=32380

SERVICE_HOSTNAME=$(kubectl get inferenceservice -n myspace $MODEL_NAME -o jsonpath='{.status.url}' | cut -d "/" -f 3)
SERVING_URL=http://${INGRESS_HOST}:${INGRESS_PORT}/v1/models/$MODEL_NAME:predict

echo ${SERVICE_HOSTNAME}
echo ${SERVING_URL}

curl -v -H "Host: ${SERVICE_HOSTNAME}" ${SERVING_URL} -d @${TEST_JSON}
