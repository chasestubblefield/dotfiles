function fish_prompt
    set -l last_pipestatus $pipestatus

    # cwd
    set_color brcyan
    echo -n (prompt_pwd)

    # Git status
    set_color normal
    echo -n (fish_git_prompt)

    # Last exit status
    echo -n (__fish_print_pipestatus " [" "]" "|" (set_color $fish_color_status) (set_color --bold $fish_color_status) $last_pipestatus)

    # Suffix
    set_color brgreen
    echo -n ' $ '
end
