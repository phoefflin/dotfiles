# nothing special here, main config is in bashrc
for _file in ~/.bash_profile.local \
	     ~/.bashrc \
	     ~/.bashrc.local; do
	if [ -f $_file ]; then
		echo "INFO: sourcing $_file"
		source $_file
	fi
done
unset _file

export PATH="$HOME/.cargo/bin:$PATH"
