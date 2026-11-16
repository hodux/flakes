function fish_prompt
    set -l last_status $status

    # Top line: corner symbol
    echo -n '┌ '

    # Current working directory (path)
    set -l cwd_color $fish_color_cwd
    test -n "$cwd_color"; or set cwd_color green
    set_color $cwd_color
    echo -n (prompt_pwd)
    set_color normal

    # Git branch information
    set -l git_info (fish_git_prompt)
    if test -n "$git_info"
        echo -n "$git_info"
    end

    # Error code indicator if previous command failed
    if test $last_status -ne 0
        set -l err_color $fish_color_error
        test -n "$err_color"; or set err_color brred
        set_color $err_color
        echo -n " $last_status"
        set_color normal
    end

    # Newline between prompt lines
    echo

    # Bottom line: user input prompt
    echo -n '└─ '
end
