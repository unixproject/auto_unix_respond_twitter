require 'yaml'
require 'twitter'
require 'thor'
require 'httparty'
require 'colorize'

puts '\|/|\|/'.red + ' Loading anti-troll tactical auto-canon! '.blue + '\|/|\|/'.red + "\n"

trollWords = ['Satan', 'Trump tower', 'libtard', 'nihilism', 'alt-right', 'feminazi', 'genocide', 'gulag', 'trigger-warning', 'special snowflake', 'privilege', 'ugly', 'moron', 'block-list', 'nazi', 'lefttards', 
'fakenews', 'antifa', 'DNC', 'russian bot']
quotes = ['black lives literally dont matter if we need more nibbers we can go back to africa and get more.', 'groyper live matters.', 'SUCK dick FOKING nibba.', 'kekmao.', 'ur mom is my hoe 
every night.', 'BUILD THE WALL FOR KEEP INSIDE SICK AND MASS MURDER SHOOTER AMERICANS.', 'stop invading arab nations and stealing oil.', 'lulzshit.', 'lolicaust.', 'fgts.', 'Michelle OBama has dick.', 'nerd ass bitch.', 
'jews did it.', 'dank bro.', 
'Ban the bomb.  Save the world for conventional warfare.', 'NSA is Watching You.', 'ur moron piece of nibba.', 'ROFLMFAOWPMACAATSTSHTIFAIIAGTBSTABHOL.', '911 meat.', 'tranny fat.', 'Suck dong in hell with ur mom.']
client = Twitter::REST::Client.new do |config|
  config.consumer_key = 'Z24VDHsr4dayLSQXAGsy0fqXl'
  config.consumer_secret = 'vinadangkhoE7YcLSL8Omxqg0ZWI5fHwmrDcvSBEXYrFAYLc1I'
  config.access_token = '1029254814-wwNqEM0tZGLqYjsX2UE2alL6WeDesSJjmbNwAJM'
  config.access_token_secret = 'orS4LUHPlp1p1n0D7xp46r9mLoqRuOpEGE5aC9PgDuIdW'
end

word = trollWords.sample
quote = quotes.sample

def output_init_string(word, quote)
   puts "Troll identification word: " + word + ".\n" + "Response quote: " + quote
end

client.search(word, count: 10).each do |t|
  quote = quotes.sample
  word = trollWords.sample
  replystring = "@" + t.user.screen_name + " " + quote
  puts "Found possible troll suspect: " + t.user.screen_name + "\nTweeting: " + t.text + "\nReplied with: " + replystring + "\n"
  client.update(replystring, in_reply_to_status_id: t.id)
  sleep(300)
end
