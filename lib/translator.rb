require "yaml"

def load_library(path)
path = YAML.load_file('./lib/emoticons.yml')
path.each do |name, emote|
path[name] = {}
path[name][:english] = emote[0]
path[name][:japanese] = emote[1]
end 
path 
end 

def get_japanese_emoticon(path, emote)
  emote_hash = load_library(path)
  emote_hash.each do |emote_name, e|
    if e[:english] == emote
      return e[:japanese]
    end
  end 
    "Sorry, that emoticon was not found"
end 

def get_english_meaning(path, emote)
 emote_hash = load_library(path)
  emote_hash.each do |emote_name, e|
    if e[:japanese] == emote
      return emote_name
    end
  end
  "Sorry, that emoticon was not found"
end 
