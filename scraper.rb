#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'

query = 'SELECT DISTINCT ?item { ?item wdt:P39 wd:Q33129158 }'
ids = EveryPolitician::Wikidata.sparql(query)

names = WikiData::Category.new('Kategooria:XIII_Riigikogu_liikmed', 'et').member_titles |
        WikiData::Category.new('Kategooria:XIII Riigikogu liikmed, kes Riigikogu töös ei osalenud', 'et').member_titles |
        WikiData::Category.new('Kategooria:XII_Riigikogu_liikmed', 'et').member_titles

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { et: names })
