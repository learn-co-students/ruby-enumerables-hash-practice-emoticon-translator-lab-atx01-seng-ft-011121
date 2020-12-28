# require modules here
require 'yaml'

def load_library(file_path)
  emoticon_list = YAML.load(File.read(file_path))
  
  emoticon_hash = {}
  emoticon_list.each do |key, value|
    emoticon_hash[key] = {
      english: emoticon_list[key][0],
      japanese: emoticon_list[key][1]
    }
  end
  
  emoticon_hash
  
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  working_lib = load_library(file_path)
  
  working_lib.each do |key, value|
    if working_lib[key][:english] == emoticon
      return working_lib[key][:japanese]
    end
  end
  
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  working_lib = load_library(file_path)
  
  working_lib.each do |key, value|
    if working_lib[key][:japanese] == emoticon
      return key
    end
  end
  
  "Sorry, that emoticon was not found"
end