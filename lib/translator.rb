# require modules here
require "yaml"
require 'pry'

def load_library(path)
  #assign hash to receive data
  emoticon_hash={}
  
  #load file
  emoticon_lib = YAML.load_file(path)
  
  #iterate through loaded file and pull out key/value pairs
  emoticon_lib.each{|meaning, emoticon|
    emoticon_hash[meaning]={english: emoticon[0], japanese: emoticon[1]}
  }
  
  #return new hash
  emoticon_hash
end

def get_japanese_emoticon(file_path, given_emoticon)
  emoji=load_library(file_path)
  emoji.find {|meaning, hash|
    hash.find {|language, emoji_face|
      if given_emoticon==emoji_face
        #binding.pry
        return hash[:japanese]
      end
    }
  }
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, find_emoticon)
  emoji=load_library(file_path)
  emoji.find {|key, value|
    value.find {|inner_key, inner_value|
      if inner_value==find_emoticon
        return key
      end
    }
  }
  return "Sorry, that emoticon was not found"
end