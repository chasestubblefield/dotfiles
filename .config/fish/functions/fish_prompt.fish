function fish_prompt
    set -l last_pipestatus $pipestatus

    # cwd
    set_color brcyan
    echo -n (prompt_pwd)

    # rbenv
    if type -q rbenv; and set -l rbenv_version (rbenv version-name); and test $rbenv_version != 'system'
        set_color blue
        echo -n " [ruby: $rbenv_version]"
    end

    # nodenv
    if type -q nodenv; and set -l nodenv_version (nodenv version-name); and test $nodenv_version != 'system'
        set_color blue
        echo -n " [node: $nodenv_version]"
    end

    # python venv
    if set -qgx VIRTUAL_ENV
        set_color blue
        echo -ns ' [' (basename $VIRTUAL_ENV) ']'
    end

    # git status
    set_color normal
    echo -n (fish_git_prompt)

    # exit status
    echo -n (__fish_print_pipestatus " [" "]" "|" (set_color --bold $fish_color_status) (set_color --bold $fish_color_status) $last_pipestatus)

    # prompt char
    set_color brgreen
    echo -n ' $ '
end
