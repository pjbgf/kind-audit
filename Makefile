CLUSTER_NAME?=audit-cluster
CONTEXT?=kind-$(CLUSTER_NAME)

create-cluster:
	# clean-up audit log from previous cluster	
	echo "" > kind/audit.log
	kind create cluster --config kind/kind-config.yaml --name $(CLUSTER_NAME)

delete-cluster:
	kind delete cluster --name $(CLUSTER_NAME)

group-logs:
	cat kind/audit.log | jq -c '(. | {serviceaccount: .user.username, verb: .verb, resourceType: .objectRef.resource, resourceNs: .objectRef.namespace, decision: .annotations."authorization.k8s.io/decision"})' | sort -u
