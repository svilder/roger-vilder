
class ExhibitionSeed
  def initialize(csv)
    @csv = csv
  end

  def call
    @csv.each do |exhibition|
      instance = Exhibition.new(
        year: exhibition["year"],
        title: exhibition["title"],
        place: exhibition["place"],
        city: exhibition["city"],
        category: exhibition["category"],
        associates: exhibition["associates"]
      )

      if instance.valid?
        instance.save
      else
        p "error: #{instance.errors&.messages}"
      end
    end
  end
end
