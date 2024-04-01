PORT := port
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
	kubectl port-forward svc/airflow-1711954329-webserver 8088:8080 --namespace airflow

postgres-port-forward-down:
	kill $(ps -ef | grep "kubectl port-forward" | grep -v grep | awk '{print $2}')

airflow-db-secret:
	kubectl apply -f k8s/airflow/airflow-secret.yml

airflow-k8s-up: 
	 helm install apache-airflow/airflow --values manifest/airflow-values.yml --generate-name --namespace airflow


gke-cluster:
	gcloud container clusters get-credentials adis-v2-primary --region=us-central1 --project=integrated-net-411608 --region=us-central1-a


# gcloud config set account ACCOUNT
# gcloud auth activate-service-account ACCOUNT
# gcloud auth activate-service-account terraform-datatalk@integrated-net-411608.iam.gserviceaccount.com --key-file=google-acc.json
# gcloud auth login
