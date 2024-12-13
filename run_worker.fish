function run_worker
    argparse "e/event=" "env=" -- $argv

    if set -ql _flag_event

        if test -f $_flag_event
            if set -ql _flag_env
                sls invoke $_flag_env -f worker -p $_flag_event
            else
                sls invoke local -f worker -p $_flag_event
            end

        else
            echo "event not found - $_flag_event"
            return 121
        end

    else
        echo "event is required"
        return 121
    end
end
