# frozen_string_literal: true

# brew cask cache-pristine
# Fetches/verifies newest downloads of casks (by default only versioned casks, include all with `--all`)
# Deletes any file in the cache that is not the newest download of an installed cache
# By default does nothing, use `--force` to execute

class CachePristine
  def initialize(options={})
    @all = options[:all]
    @force = options[:force]
  end

  def run
    Hbc.installed.each do |cask|
      if cask.version.latest? && !@all
        ohai "Skipping unversioned cask `#{cask.token}`"
        next
      end
      if @force
        downloaded_path = Hbc::Download.new(cask).perform
        Hbc::Verify.all(cask, downloaded_path)
      else
        ohai "Would fetch and verify `#{cask.token}`"
      end
    end

    old_downloads.each do |item|
      if @force
        ohai "Deleting: #{item}"
        item.rmtree
      else
        ohai "Would delete: #{item}"
      end
    end

    ohai 'Run with --force to actually do things.' unless @force
  end

  def old_downloads
    @old_downloads ||= Hbc.cache.children - Hbc.installed.map { |c| Hbc::Download.new(c).send(:downloader).cached_location }
  end
end

CachePristine.new(force: ARGV.include?('--force'), all: ARGV.include?('--all')).run
