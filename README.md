## kind-audit
Template setup to spin up kind clusters for auditing Kubernetes applications.

A [Custom Audit Policy](kind/audit-policy.yaml) is being used to reduce noise from Kubernetes/kind
components from the audit logs.
The logs reside on `kind/audit.log` and are cleared every time a new cluster
is created.

#### Requirements

- kind
- jq

#### How to use

1. Create a cluster using `make create-cluster`.
1. Deploy component to be assessed.
1. Check logs with `make group-logs` or analysing `kind/audit.log`.
