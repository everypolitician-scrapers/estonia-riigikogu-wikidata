#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'

WikiData::Category.new('Kategooria:XIII_Riigikogu_liikmed', 'et').wikidata_ids.each do |id|
  data = WikiData::Fetcher.new(id: id).data('et') or next
  # puts data
  ScraperWiki.save_sqlite([:id], data)
end

require 'rest-client'
warn RestClient.post ENV['MORPH_REBUILDER_URL'], {} if ENV['MORPH_REBUILDER_URL']

