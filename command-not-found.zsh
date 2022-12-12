command_not_found_handler() {
  local pkgs cmd="$1"

  pkgs=(${(f)"$(pkgfile -b -v -- "$cmd" 2>/dev/null)"})
  if [[ -n "$pkgs" ]]; then
    echo "Assistant: Sorry, I'm unable to run \`${cmd}\` beacause none of the following packages are installed."
    #printf 'The application %s is not installed. It may be found in the following packages:\n' "$cmd"
    printf '  %s\n' $pkgs[@]
    setopt shwordsplit
    pkg_array=($pkgs[@])
    pkgname="${${(@s:/:)pkg_array}[2]}"
    printf 'Would you like me to install \`%s\`? (y/N) ' $pkgname
    if read -q "choice? "; then
    		echo
    		echo "Installing \`$pkgname\` now."
            pamac install $pkgname && echo "Successfully installed ${pkgname}. You can now use \`${cmd}\`." || echo "Oups. Something went terribly wrong. I couldn\'t install ${pkgname}. Please excuse me for this disagreement and install the package manually to use \`${cmd}\`.\nType \`pamac install ${pkgname}\`"
    else
    		echo " "
        echo "As you wish, I will not install it."
    fi
  else
    printf 'zsh: command not found: %s\n' "$cmd"
    echo
    echo "Assistant: It looks like you just gave the shell a bad command."
    echo "It means \`${cmd}\` is not present anywhere in the \$PATH*."
    echo "* \$PATH: List of directory path that the shell uses to look for commands."
    echo "? Type \`echo \$PATH\` to see the list of currently used paths."
    echo
    echo "You have the following options:"
    echo "    1. Add ${cmd} to the \$PATH"
    echo "       Either by:"
    echo "       - installing the package that provides \`${cmd}\`"
    echo "           $    install \$PACKAGE_NAME*"
    echo "           * \$PACKAGE_NAME: Name of the package that provides \`${cmd}\` either from added repositories or the Arch User Repository (AUR) if enabled."
    echo "       - expanding \$PATH to inlcude the location of ${cmd}"
    echo "           $    PATH='\${PATH}:/path/to/${cmd}'"
    echo "    2. Re-type your command without any mistake"
    echo "       This is the likeliest senario since I already tried to lookup packages that could provide \`${cmd}\` but found none."
    echo "       Which means you probably, by inadvertence, made a mistake while typing your command."
    echo
    echo "If you are lost, you can always type \`help\` to get help."
  fi 1>&2

  return 127
}
