function convert_byml
  find $argv[1] -type f -name "*.bgyml" | xargs -n1 -P10 fish -c '~/dev/totk/python/bin/byml_to_yml $argv[1] (path change-extension gyml $argv[1])'
end
