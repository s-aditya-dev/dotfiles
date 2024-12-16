nvim() {
	kitty @ set-spacing padding=0
	command nvim "$@"
	kitty @ set-spacing padding=5
}

tmux() {
	kitty @ set-spacing padding=0
	command tmux "$@"
	kitty @ set-spacing padding=5
}
