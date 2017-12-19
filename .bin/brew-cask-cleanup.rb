$LOAD_PATH.unshift("#{HOMEBREW_LIBRARY_PATH}/cask/lib")
require 'hbc'

to_clean = Hbc.cache.children - Hbc.installed.map { |c| Hbc::Download.new(c).send(:downloader).cached_location }

exit if to_clean.empty?

if ARGV.include?('--force')
  to_clean.each do |item|
    ohai "Deleting: #{item}"
    item.rmtree
  end
else
  ohai 'Downloads to cleanup:'
  puts to_clean
  ohai 'Run with --force to delete'
end
