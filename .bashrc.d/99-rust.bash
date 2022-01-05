$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

if [ -f ~/.cargo/env ]; then
	$_bashrc_debug_echo "${BASH_SOURCE[0]}: add rustup/cargo to PATH"
	source ~/.cargo/env
fi

if [ -n "$(type -p rustup)" ]; then
	source <(rustup completions bash)
	_completion_dir=$(rustup  which cargo | sed 's#/bin/cargo#/etc/bash_completion.d#')
	if [ -d "$_completion_dir" ]; then
		for _f in $(find $_completion_dir -type f); do
			$_bashrc_debug_echo "${BASH_SOURCE[0]}: sourcing $_f"
			source $_f
		done
	fi

	unset _completion_dir

	# see https://github.com/rust-lang/cargo/issues/3624
	alias cargo_check='touch -cm src/main.rs src/lib.rs build.rs && cargo check'
	alias cargo_clippy='touch -cm src/main.rs src/lib.rs build.rs && cargo clippy'

fi

if [ -n "$(type -p sccache)" ]; then
	$_bashrc_debug_echo "${BASH_SOURCE[0]}: enabling sccache"
	export RUSTC_WRAPPER=sccache
fi
