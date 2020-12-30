# require modules here
require 'yaml'
require 'pry'


def load_library(file_path)
  # code goes here
  
  #requirements
  # libary is hash of array key is name of emote and array is english then japanese emote
  # need to convert to hash of hash. First hash has key of sting name (no conversion needed) and items of :english and :japanese
  # second hash has key as defined above then item as string from the yaml Array
  
  #process
  # for each key and item (these are arrays) in libary hash
  # make new hash with new_key = key and two items :english and :japanese
  #   for each index in item array
  #   if index = 0
  #   newhash[new_key][:english] = item_array(0)
  #   if index = 1
  #   newhash[new_key][:japanese] = item_array(1)
  
  
  unformatted_libary = YAML.load_file(file_path)

  libary = unformatted_libary.each_with_object({}) do |(emote_name,emote_array),formatted_libary|
    if !formatted_libary[emote_name]
      formatted_libary[emote_name]={:english => nil, :japanese => nil}
    end
    emote_array.each_with_index do |emote,index|
      if index == 0
        formatted_libary[emote_name][:english] = emote
      elsif index == 1
        formatted_libary[emote_name][:japanese] = emote
      end
    end
  end
  libary
end

def get_japanese_emoticon(file_path, english_emote)
  # code goes here
  
  libary = load_library(file_path)
  answer=nil

  libary.each do |name,language|
    if language.key(english_emote)
      answer = language[:japanese]
      break
    end
    answer = "Sorry, that emoticon was not found"
  end

  answer
end

def get_english_meaning(file_path, japanese_emote)
  # code goes here
  
  libary = load_library(file_path)
  answer=nil

  libary.each do |name,language|
    if language.key(japanese_emote)
      answer = libary.key(language)
      break
    end
    answer = "Sorry, that emoticon was not found"
  end
  
  answer
end