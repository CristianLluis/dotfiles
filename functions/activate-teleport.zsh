activate-teleport() {
    user=$1
    shift 1
    host=$1
    shift 1
    opitem=$1
    shift 1
    clusters=($@)
    export KUBECONFIG=${HOME}/.kube/config-$host.yaml
    export TELEPORT_PROXY=$host
    if ! kubectl get nodes 2>/dev/null >/dev/null; then
        op signin --account histify.1password.com
        op read $opitem | pbcopy
        echo tsh login --mfa-mode=otp --user=$user --proxy=$host:443 $host
        tsh login --mfa-mode=otp --user=$user --proxy=$host:443 $host
        for cluster in $clusters; do
            echo $cluster
            tsh kube --mfa-mode=otp --user=$user --proxy=$host:443 login $cluster
        done
    fi
    if typeset -f kubeon > /dev/null; then
        kubeon
    fi
}
kh() {
    activate-teleport cll ras.histify.net "op://Employee/x26jokm624trecm6socwo3oz4u/password" hf-k8s-ci3 hf-k8s-prod hf-k8s-test
}
