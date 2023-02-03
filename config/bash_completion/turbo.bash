_turbo() {
    local i cur prev opts cmd
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${cmd},${i}" in
            ",$1")
                cmd="turbo"
                ;;
            turborepo__lib,bin)
                cmd="turborepo__lib__bin"
                ;;
            turborepo__lib,completion)
                cmd="turborepo__lib__completion"
                ;;
            turborepo__lib,daemon)
                cmd="turborepo__lib__daemon"
                ;;
            turborepo__lib,link)
                cmd="turborepo__lib__link"
                ;;
            turborepo__lib,login)
                cmd="turborepo__lib__login"
                ;;
            turborepo__lib,logout)
                cmd="turborepo__lib__logout"
                ;;
            turborepo__lib,prune)
                cmd="turborepo__lib__prune"
                ;;
            turborepo__lib,run)
                cmd="turborepo__lib__run"
                ;;
            turborepo__lib,unlink)
                cmd="turborepo__lib__unlink"
                ;;
            turborepo__lib__daemon,restart)
                cmd="turborepo__lib__daemon__restart"
                ;;
            turborepo__lib__daemon,start)
                cmd="turborepo__lib__daemon__start"
                ;;
            turborepo__lib__daemon,status)
                cmd="turborepo__lib__daemon__status"
                ;;
            turborepo__lib__daemon,stop)
                cmd="turborepo__lib__daemon__stop"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        turbo)
            opts="-v -h --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --cache-dir --cache-workers --concurrency --continue --dry-run --single-package --filter --force --global-deps --graph --ignore --include-dependencies --no-cache --no-daemon --no-deps --output-logs --only --parallel --pkg-inference-root --profile --remote-only --scope --since --help [TASKS]... [PASS_THROUGH_ARGS]... bin completion daemon link login logout prune run unlink"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-workers)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --concurrency)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --dry-run)
                    COMPREPLY=($(compgen -W "text json" -- "${cur}"))
                    return 0
                    ;;
                --filter)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --global-deps)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --graph)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignore)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-logs)
                    COMPREPLY=($(compgen -W "full none hash-only new-only errors-only" -- "${cur}"))
                    return 0
                    ;;
                --pkg-inference-root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --profile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --scope)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --since)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        turbo__bin)
            opts="-v -h --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --single-package --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        turbo__completion)
            opts="-v -h --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --single-package --help bash elvish fish powershell zsh"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        turbo__daemon)
            opts="-v -h --idle-time --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --single-package --help restart start status stop"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --idle-time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        turbo__daemon__restart)
            opts="-v -h --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --single-package --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        turbo__daemon__start)
            opts="-v -h --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --single-package --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        turbo__daemon__status)
            opts="-v -h --json --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --single-package --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        turbo__daemon__stop)
            opts="-v -h --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --single-package --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        turbo__link)
            opts="-v -h --no-gitignore --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --single-package --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        turbo__login)
            opts="-v -h --sso-team --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --single-package --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --sso-team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        turbo__logout)
            opts="-v -h --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --single-package --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        turbo__prune)
            opts="-v -h --scope --docker --out-dir --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --single-package --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --scope)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        turbo__run)
            opts="-v -h --cache-dir --cache-workers --concurrency --continue --dry-run --single-package --filter --force --global-deps --graph --ignore --include-dependencies --no-cache --no-daemon --no-deps --output-logs --only --parallel --pkg-inference-root --profile --remote-only --scope --since --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --help [TASKS]... [PASS_THROUGH_ARGS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --cache-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-workers)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --concurrency)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --dry-run)
                    COMPREPLY=($(compgen -W "text json" -- "${cur}"))
                    return 0
                    ;;
                --filter)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --global-deps)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --graph)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignore)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-logs)
                    COMPREPLY=($(compgen -W "full none hash-only new-only errors-only" -- "${cur}"))
                    return 0
                    ;;
                --pkg-inference-root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --profile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --scope)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --since)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        turbo__unlink)
            opts="-v -h --version --skip-infer --api --color --cpuprofile --cwd --heap --login --no-color --preflight --team --token --trace --verbosity --check-for-update --__test-run --single-package --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --api)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cpuprofile)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --heap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --login)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --team)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verbosity)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

complete -F _turbo -o bashdefault -o default turbo
