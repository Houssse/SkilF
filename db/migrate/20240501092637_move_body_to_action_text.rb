class MoveBodyToActionText < ActiveRecord::Migration[7.1]
  def change
    Article.all.find_each do |article|
      artilce.update(content: article.body)
    end

    remove_column :articles, :body
  end
end
