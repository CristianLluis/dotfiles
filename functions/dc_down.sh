# short for docker-compose down args. But asks if you really want to stop an entire project (opendls as like a million container)
down() {
    if [ "$#" -eq 0 ]; then
        local response
        vared -p "Really want to stop the whole app? (y/N) " response
        if [[ "$response" =~ ^[yY](es)?$ ]]; then
            docker-compose down
        fi
    else
        docker-compose down "$@"
    fi
}
