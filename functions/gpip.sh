# global pip function for bypassing virtuel env obligation
gpip() {
    PIP_REQUIRE_VIRTUALENV="" "$@"
}
