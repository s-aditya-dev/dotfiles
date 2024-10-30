nvim() {
    kitty @ set-spacing padding=0
    command nvim "$@"
    kitty @ set-spacing padding=5
}
