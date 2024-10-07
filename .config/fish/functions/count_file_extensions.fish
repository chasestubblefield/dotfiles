function count_file_extensions
  find $argv -type f | path extension | sort | uniq -c
end
