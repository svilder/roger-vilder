
class BibliographySeed
  def initialize(csv)
    @csv = csv
  end

  def call
    @csv.each do |bibliography|
      instance = Bibliography.new(
        author: bibliography["author"],
        title: bibliography["title"],
        year: bibliography["year"],
        month: bibliography["month"]
      )

      if instance.valid?
        instance.save
      else
        p "error: #{instance.errors&.messages}"
      end
    end
  end
end
