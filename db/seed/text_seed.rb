
class TextSeed
  def initialize(csv)
    @csv = csv
  end

  def call
    @csv.each do |text|
      instance = Text.new(
        title_fr: text["title_fr"],
        title_en: text["title_en"],
        author: text["author"],
        content_fr: text["content_fr"],
        content_en: text["content_en"],
        year: text["year"]
      )

      if instance.valid?
        instance.save
      else
        p "error: #{instance.errors&.messages}"
      end
    end
  end
end
