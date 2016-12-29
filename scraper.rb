#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'

query = <<-EOQ
  SELECT DISTINCT ?item {
    ?item p:P39 ?position_statement .
    ?position_statement ps:P39 ?position .
    ?position wdt:P279* wd:Q21100241 .
    ?position_statement pq:P2937 wd:Q20530392 .
  }
EOQ

ids = EveryPolitician::Wikidata.sparql(query)

names = WikiData::Category.new('Kategooria:XIII_Riigikogu_liikmed', 'et').member_titles |
        WikiData::Category.new('Kategooria:XIII Riigikogu liikmed, kes Riigikogu töös ei osalenud', 'et').member_titles |
        WikiData::Category.new('Kategooria:XII_Riigikogu_liikmed', 'et').member_titles

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { et: names })
