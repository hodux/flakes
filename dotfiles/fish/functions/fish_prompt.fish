function fish_prompt
    set -l last_status $status

    # Top line: corner symbol
    echo -n '┌ '

    # Vi mode indicator (if vi key bindings are active)
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                echo -n '[N] '
            case insert
                echo -n '[I] '
            case replace-one
                echo -n '[R] '
            case visual
                echo -n '[V] '
        end
    end

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
