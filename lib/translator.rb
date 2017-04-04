require "yaml"
require "pry"

def load_library(file_path)
  emoticons_file = YAML.load_file(file_path)
  japan_emo_library = {}

  emoticons_file.each { |meaning, emoticons|
    if japan_emo_library["get_emoticon"] && japan_emo_library["get_meaning"]
      japan_emo_library["get_emoticon"][emoticons[0]] = emoticons[1]
      japan_emo_library["get_meaning"][emoticons[1]] = meaning
    else
      japan_emo_library["get_emoticon"] = {emoticons[0] => emoticons[1]}
      japan_emo_library["get_meaning"] = {emoticons[1] => meaning}
    end
  }

  japan_emo_library
end

def get_japanese_emoticon (file_path, english_emoticon)
  library = load_library(file_path)
  japanese_equivalent_emoticon = library["get_emoticon"][english_emoticon]

  return "Sorry, that emoticon was not found" if japanese_equivalent_emoticon == nil
  japanese_equivalent_emoticon
end

def get_english_meaning (file_path, japanese_emoticon)
  library = load_library(file_path)
  english_meaning = library["get_meaning"][japanese_emoticon]

  return "Sorry, that emoticon was not found" if english_meaning == nil
  english_meaning
end
