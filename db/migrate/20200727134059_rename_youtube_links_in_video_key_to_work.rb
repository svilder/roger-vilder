class RenameYoutubeLinksInVideoKeyToWork < ActiveRecord::Migration[5.2]
  def change
    rename_column :works, :youtube_link, :video_key
    rename_column :works, :category, :display_option
  end
end
