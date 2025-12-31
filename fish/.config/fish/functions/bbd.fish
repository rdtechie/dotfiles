function bbd -d "Dump installed taps, formulae and casks into Brewfile in current directory"
    printf "Dumping Installed Taps, Formulae and Casks into Brew file\n"
    brew bundle dump --force --file=$PULSTAR/Brewfile
    printf "Finished Dumping Installed Taps, Formulae and Casks into Brew file!\n"
end
