PORT := port
RELEASE := release
database-namespace:
	kubectl create namespace database

airflow-namespace:
	kubectl create namespace airflow
postgres-k8s-up:
	kubectl apply -f k8s/postgres/

postgres-k8s-down:
	kubectl delete -f k8s/postgres/

postgres-port-forward:
	kubectl port-forward svc/postgres-service 5432:5432 -n database

airflow-port-forward:
	kubectl port-forward svc/airflow-1712225942-webserver 8080:8080 --namespace airflow

postgres-port-forward-down:
	kill $(ps -ef | grep "kubectl port-forward" | grep -v grep | awk '{print $2}')

airflow-db-secret:
	kubectl apply -f k8s/airflow/airflow-secret.yml

airflow-k8s-up: 
	 helm install apache-airflow/airflow --generate-name --namespace airflow --values manifest/airflow-values.yml

airflow-k8s-upgrade:
	helm upgrade airflow-1712225942 apache-airflow/airflow --namespace airflow --values manifest/airflow-values.yml
# helm upgrade   airflow-1712225942 apache-airflow/airflow --namespace airflow --values manifest/airflow-values.yml
# gcloud container clusters get-credentials adis-v2-primary --region=us-central1 --project=integrated-net-411608 --region=us-central1-a


# gcloud config set account ACCOUNT
# gcloud auth activate-service-account ACCOUNT
# gcloud auth activate-service-account terraform-datatalk@integrated-net-411608.iam.gserviceaccount.com --key-file=google-acc.json
# gcloud auth login

# kubectl get pod airflow-1711988738-webserver -n airflow  --template='{{(index (index .spec.containers 0).ports 0).containerPort}}{{"\n"}}'

# helm repo add postgres oci://registry-1.docker.io/bitnamicharts/postgresql
# gcloud container clusters resize adis-v2-primary --num-nodes=0