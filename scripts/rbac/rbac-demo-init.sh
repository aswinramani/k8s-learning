BASE_DIR="$(dirname "$0")/../.."
MANIFESTS_DIR="$BASE_DIR/manifests/rbac"
RBAC_DEMO_MANIFEST_FILE="$MANIFESTS_DIR/rbac-demo.yaml"
kubectl create namespace rbac-demo --dry-run=client -o yaml > "$RBAC_DEMO_MANIFEST_FILE"
echo "---" >> "$RBAC_DEMO_MANIFEST_FILE"
kubectl create serviceaccount pod-reader-app -n rbac-demo --dry-run=client -o yaml >> "$RBAC_DEMO_MANIFEST_FILE"
echo "---" >> "$RBAC_DEMO_MANIFEST_FILE"
kubectl create role pod-reader \
  --verb=get,list,watch \
  --resource=pods \
  --namespace=rbac-demo \
  --dry-run=client -o yaml >> "$RBAC_DEMO_MANIFEST_FILE"
echo "---" >> "$RBAC_DEMO_MANIFEST_FILE"
kubectl create rolebinding pod-reader-binding \
  --role=pod-reader \
  --serviceaccount=rbac-demo:pod-reader-app \
  --namespace=rbac-demo \
  --dry-run=client -o yaml >> "$RBAC_DEMO_MANIFEST_FILE"