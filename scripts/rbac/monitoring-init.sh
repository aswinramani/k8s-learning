BASE_DIR="$(dirname "$0")/../.."
MANIFESTS_DIR="$BASE_DIR/manifests/rbac"
RBAC_MONITORING_MANIFEST_FILE="$MANIFESTS_DIR/monitoring.yaml"
kubectl create namespace monitoring --dry-run=client -o yaml > "$RBAC_MONITORING_MANIFEST_FILE"
echo "---" >> "$RBAC_MONITORING_MANIFEST_FILE"
kubectl create serviceaccount prometheus -n monitoring --dry-run=client -o yaml >> "$RBAC_MONITORING_MANIFEST_FILE"
echo "---" >> "$RBAC_MONITORING_MANIFEST_FILE"
kubectl create clusterrole cluster-pod-reader \
  --verb=get,list,watch \
  --resource=pods \
  --dry-run=client -o yaml >> "$RBAC_MONITORING_MANIFEST_FILE"
echo "---" >> "$RBAC_MONITORING_MANIFEST_FILE"
kubectl create clusterrolebinding prometheus-pod-reader \
  --clusterrole=cluster-pod-reader \
  --serviceaccount=monitoring:prometheus \
  --dry-run=client -o yaml >> "$RBAC_MONITORING_MANIFEST_FILE"