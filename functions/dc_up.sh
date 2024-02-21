# short for docker-compose up args. But asks if you really want to boot an entire project (opendls as like a million container)
up() {
    if [ "$#" -eq 0 ]; then
        local response
        vared -p "Really want to boot the whole app? (y/N) " response
        if [[ "$response" =~ ^[yY](es)?$ ]]; then
            docker-compose up -d
        fi
    else
        docker-compose up "$@" -d
    fi
}
