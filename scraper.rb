#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'

sparq = <<EOQ
  SELECT DISTINCT ?item WHERE {
    ?item p:P39/ps:P39 [ wdt:P279 wd:Q21100241 ; wdt:P2937 ?term ] .
    ?term p:P31/pq:P1545 ?ordinal .
    FILTER (xsd:integer(?ordinal) >= 12)
  }
EOQ
ids = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids)
