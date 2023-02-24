
class WorkSeed
  def initialize(csv)
    @csv = csv
  end

  def call
    @csv.each do |work|
      instance = Work.new(
        name: work["name"],
        description: work["description"],
        dimensions: work["dimensions"],
        year: work["year"],
        image: work["image"],
        video_key: work["video_key"],
        display_option: work["display_option"],
        collection: work['collection']
      )

      if instance.valid?
        instance.save
      else
        p "error: #{instance.errors&.messages}"
      end
    end
  end
end

